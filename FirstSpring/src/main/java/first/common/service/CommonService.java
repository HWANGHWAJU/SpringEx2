package first.common.service;

import java.util.Map;

import first.dto.file.FileDTO;

public interface CommonService {
	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	Map<String, Object> selectOneFile(String fileName) throws Exception;
}
