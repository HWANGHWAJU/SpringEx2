package first.sample.dao;

import java.util.*;

import org.springframework.stereotype.Repository;

import first.common.common.CommandMap;
import first.common.dao.AbstractDAO;
import first.dto.music.MusicDTO;
import first.dto.scraps.ScrapDTO;

// 클래스 AbstractDAO를 참조하고 있다. AbstractDAO 에 선언되어 있는 함수 사용 가능. 
// AstractDAO에 있는 함수를 사용하며, 표면적 DAO 함수를 만들기 위해 현재 클래스 생성.

@Repository("musicDAO")
public class MusicDAO extends AbstractDAO{


	// 	=> 1. 게시판 목록 불러오기
	
	@SuppressWarnings("unchecked")	// 경고 제외 어노테이션, 검증되지 않은 연산자에 대한 경고 억제	
	public List<Map<String, Object>> selectMusicBoardList(Map<String, Object> commandMap) throws Exception{
		
		System.out.println("============================>MusicDAO");
										//AbstractDAO 에 선언된 함수. selectPagingList(String queryId, Object params) 
										// SQL 문에서 실행시킬 해당 쿼리 아이디를 입력하고, 결과를 담아올 객체 생성
		return (List<Map<String, Object>>)selectPagingList("music.selectMusicBoardList",commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMusicBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("music.selectMusicBoardDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMusicContent(Map<String, Object>map) throws Exception{
		return(Map<String, Object>) selectOne("music.selectMusicContent", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<MusicDTO> selectMusicIwritten(CommandMap map) throws Exception{
		System.out.println(map.get("UserId"));
		return (List<MusicDTO>)selectList("music.selectMusicIwritten", map.get("UserId"));
	}
	
	@SuppressWarnings("unchecked")
	public List<ScrapDTO> selectScraps(CommandMap map) throws Exception{
		return (List<ScrapDTO>)selectList("music.selectScraps", map.get("UserId"));
	}
}

