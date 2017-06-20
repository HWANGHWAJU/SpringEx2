package first.sample.service;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import first.common.common.CommandMap;
import first.dto.file.FileDTO;
import first.dto.music.MusicDTO;
import first.dto.practice.PracDTO;
import first.dto.scraps.ScrapDTO;

//인터페이스 - 공동 작업을 할 경우, 규약만 정해두면 큰 틀을 맞추어 사용할 수 있다
public interface MusicService {

	//	1. 악보 게시판 목록 불러오기 
	List<Map<String, Object>> selectMusicBoardList(Map<String, Object> commandMap) throws Exception;
	
	// 	2. 게시글 디테일 불러오기
	 Map<String, Object> selectMusicBoardDetail(Map<String, Object> map) throws Exception;
	 
	 //3. 내가 쓴 글 불러오기(악보)
	 List<MusicDTO> selectMusicIwritten(CommandMap map) throws Exception;
	 
	 //4. 내가 스크랩한 글 목록 불러오기(악보)
	 List<ScrapDTO> selectMusicScraps(CommandMap map) throws Exception;
	 
	 //5. 게시글 등록
	 void insertMusic(Map<String, Object> map, HttpServletRequest request) throws Exception;
	 
	 //삭제
	 void deleteArticle(Map<String, Object> map) throws Exception;
	 
	 List<PracDTO> selectPracMap(Map<String, Object> map) throws Exception;
}
 