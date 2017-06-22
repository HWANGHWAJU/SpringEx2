package first.common.controller;

import java.io.File;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import first.common.common.CommandMap;
import first.common.service.CommonService;


@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonService")
	private CommonService commonService;

	
	@RequestMapping(value="/common/downloadFile.do")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception{

		Map<String,Object> map = commonService.selectFileInfo(commandMap.getMap());

			String storedFileName = String.valueOf(map.get("stored_name"));
		    String originalFileName =String.valueOf(map.get("original_name"));
		    
		    log.debug("storedFileName :"+storedFileName);
		    log.debug("originalFileName :"+originalFileName);
		     
		    byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\dev\\file\\"+storedFileName));
		     
		    response.setContentType("application/octet-stream");
		    response.setContentLength(fileByte.length);
		    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
		    response.setHeader("Content-Transfer-Encoding", "binary");
		    response.getOutputStream().write(fileByte);
		     
		    response.getOutputStream().flush();
		    response.getOutputStream().close();

	}
	
	@RequestMapping(value="/common/{fileName}.do")
	public void getFile(@PathVariable String fileName, @RequestParam String board, CommandMap map, HttpServletResponse response, HttpServletRequest request) throws Exception{
		System.out.println("들오오긴 햇니");
		System.out.println(board);
//		Map<String, Object> filemap = commonService.selectFileInfo(map.getMap());
		
		Map<String, Object> afile=null;
		if(board.equals("music")){
			commonService.selectMOneFile(fileName,response);
		}else if(board.equals("video")){
		commonService.selectVOneFile(fileName, response, request);
		}
		
		System.out.println("PathVariable :"+fileName);


	}
}
