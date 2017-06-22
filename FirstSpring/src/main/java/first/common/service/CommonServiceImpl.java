package first.common.service;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.dao.CommonDAO;


// 졸라 중요 골뱅이 하고, 받아올 서비스 이름 적어주는 게 중요 컨트롤러랑 연결됨.  
@Service("commonService")
public class CommonServiceImpl implements CommonService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="commonDAO")
	private CommonDAO commonDAO;
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception{
		return commonDAO.selectFileInfo(map);
	}

	public void selectMOneFile(String fileName, HttpServletResponse response) throws Exception{	
		Map<String, Object> file = null;
	
	    byte[] fileByte = FileUtils.readFileToByteArray(new File("C:\\dev\\file\\"+fileName));
		
	    OutputStream output = response.getOutputStream();
	    output.write(fileByte);
	    output.flush();

	}
	
	public void selectVOneFile(String fileName, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
			//progressbar에 의한 이동
		
		RandomAccessFile randomFile = new RandomAccessFile(new File("C:\\dev\\file\\"+fileName),"r");
		
		long rangeStart =0;
		long rangeEnd = 0;
		boolean isPart = false;
		
		try{
			long fileSize = randomFile.length();
			String range = request.getHeader("range");
			
			
			if(range != null){
				// range 요청 값에 end가 없을 때 넣어줌
				if(range.endsWith("-")){
					range = range+(fileSize-1);
				}
				
				int idxm = range.trim().indexOf("-");
				rangeStart = Long.parseLong(range.substring(6, idxm));
				rangeEnd = Long.parseLong(range.substring(idxm+1));
				
				if(rangeStart>0){
					isPart = true;
				}
			}else {
				rangeStart = 0;
				rangeEnd = fileSize -1;
			}
			
			long partSize = rangeEnd - rangeStart +1;
			
			response.reset();
			
			response.setStatus(isPart ? 206 : 200);
			
			response.setContentType("video/mp4");
			
			response.setHeader("Content-Range", "bytes "+rangeStart+"-"+rangeEnd+"/"+fileSize);
			response.setHeader("Accept-Ranges", "bytes");
			response.setHeader("Content-Length",""+partSize);
			
			OutputStream out = response.getOutputStream();
			randomFile.seek(rangeStart);
			
			int bufferSize = 8*1024;
			byte[] buf = new byte[bufferSize];
			
			do{
				int block = partSize > bufferSize ? bufferSize : (int)partSize;
				int len = randomFile.read(buf, 0, block);
				out.write(buf, 0, len);
				partSize -= block;
			}while(partSize > 0);
		}catch(IOException e){
			
		}finally{
			randomFile.close();
		}
		
	}
}
