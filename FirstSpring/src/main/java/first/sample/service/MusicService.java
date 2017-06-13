package first.sample.service;

import java.util.*;

import first.common.common.CommandMap;

//인터페이스 - 공동 작업을 할 경우, 규약만 정해두면 큰 틀을 맞추어 사용할 수 있다
public interface MusicService {

	//	1. 악보 게시판 목록 불러오기 
	List<Map<String, Object>> selectMusicBoardList(Map<String, Object> commandMap) throws Exception;
	
	// 	2. 게시글 디테일 불러오기
	 Map<String, Object> selectMusicBoardDetail(Map<String, Object> map) throws Exception;
}
 