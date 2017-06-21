package first.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
 
@Component("fileUtils")
public class FileUtils {
    private static final String filePath = "C:\\dev\\file\\";
//	private static final String filePath ="D://portable/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/FirstSpring/file/";
    Logger log = Logger.getLogger(this.getClass());
     
    public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
       
    	System.out.println("FileUilts 으로 들어왔습니다앙아아");
    
    	MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         
        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;

        
        System.out.println("1");
        
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         
       // String boardIdx = (String)map.get("IDX"); 오라클인 경우 (블로그 따라하면 됨 이렇게)
        String boardIdx = String.valueOf(map.get("IDX"));
        String requestName = null;
        String idx=null;
        String uploader = String.valueOf(map.get("writer"));
        
        File file = null;
       
         String isnew=null;
         System.out.println("2");
         
        while(iterator.hasNext()){
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false){
                originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = CommonUtils.getRandomString() + originalFileExtension;
                
                
                System.out.println("3");   
                file = new File(filePath + storedFileName);
                multipartFile.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
                listMap.put("IS_NEW", "Y");
                listMap.put("board_num", boardIdx);
                listMap.put("original_name", originalFileName);
                listMap.put("stored_name", storedFileName);
                listMap.put("file_size", multipartFile.getSize());
                listMap.put("writer", uploader);
                list.add(listMap);
           
                isnew = "y";
            }
            else{
            	requestName = multipartFile.getName();
            	idx = "IDX_"+requestName.substring(requestName.indexOf("_")+1);
            	
            	if(map.containsKey(idx) == true && map.get(idx) != null){
            		listMap = new HashMap<String, Object>();
            		listMap.put("IS_NEW", "N");
            		listMap.put("FILE_IDX", map.get(idx));
            		list.add(listMap);
            		isnew="n";
            	}
            }
            log.debug("----------------------------파일 수정 디버그 시작 ----------------------------");
            log.debug("첨부 파일 이름 : "+requestName);
            log.debug(" IS_NEW :"+isnew);
            log.debug("----------------------------파일 수정 디버그 종료 ----------------------------");
        }
        return list;
    }
}

