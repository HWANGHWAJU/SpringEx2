package first.common.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import first.dto.file.FileDTO;

public interface CommonService {
	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
//	Map<String, Object> selectOneFile(String fileName, String board) throws Exception;
	void selectMOneFile(String fileName, HttpServletResponse response) throws Exception;
	void selectVOneFile(String fileName, HttpServletResponse response, HttpServletRequest request) throws Exception;
}
