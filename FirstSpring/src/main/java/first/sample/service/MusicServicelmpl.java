package first.sample.service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.common.CommandMap;
import first.sample.dao.MusicDAO;

import java.util.*;

import javax.annotation.Resource;

@Service("musicService")
public class MusicServicelmpl implements MusicService{
	Logger log = Logger.getLogger(this.getClass());
	
	//	공통 변수 
	@Resource(name="musicDAO") //이런 어노테이션이 존나 중요 
	private MusicDAO musicDAO;
	

	public List<Map<String, Object>> selectMusicBoardList(Map<String, Object> commandMap) throws Exception{
		
		System.out.println("============================>MusicServiceImpl");
		return musicDAO.selectMusicBoardList(commandMap);
	}

	public Map<String, Object> selectMusicBoardDetail(Map<String, Object> map) throws Exception{
		
		//글의 큰 정보
		Map<String, Object> tempMap = musicDAO.selectMusicBoardDetail(map); 
		//글의 내용 정보
		Map<String, Object> content = musicDAO.selectMusicContent(map);	
		Map<String, Object> resultMap = new HashMap<String, Object>();
		

		System.out.println("content 내용 ");
		
		resultMap.put("music", tempMap);
		resultMap.put("music_content", content);
		
		
		return resultMap;
	}
}
