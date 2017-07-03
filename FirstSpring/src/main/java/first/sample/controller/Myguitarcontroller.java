package first.sample.controller;

import java.util.Iterator;

import java.util.List;
import java.util.Map;
import java.text.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.dto.music.MusicDTO;
import first.dto.practice.PracDTO;
import first.dto.scraps.ScrapDTO;
import first.login.model.User;
import first.sample.service.MusicService;


//어노테이션 존나 중요
@Controller
public class Myguitarcontroller {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="musicService")
	private MusicService musicService;
	


	/*********************	 1.	게시판 목록 불러오기 **********************************/
	
	// 컨트롤러에서 찾아갈 로직이 있는 클래스를 사용하겠다는 선언
	
    @RequestMapping(value="/sample/openMainIndex.do")
    public ModelAndView openMainIndex(Map<String, Object> commandMap) throws Exception{
    	System.out.println("뭐람");
    	ModelAndView mv = new ModelAndView("/sample/mainIndex");  	
    	return mv;
    }
	

    /**************************** 게시글 작성 폼*******************************/
    @RequestMapping(value="/sample/openInsertBoardForm.do")
    public ModelAndView openMusicBoardWrite(Map<String, Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/music_write");
    	return mv;
    }
    
    /**********************************게시글 등록**************************************/
    @RequestMapping(value="/sample/insertMusic.do")
    public ModelAndView insertMusic(CommandMap map, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/sample/openMainIndex.do?#music");
    	musicService.insertMusic(map.getMap(), request);
    	return mv;
    }
    
    
    /***************************페이징 게시판 목록 불러오기 ********************************/
    
    @RequestMapping(value="/sample/openMusicBoardList.do")
    public ModelAndView openMusicBoardList(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/music_main");
    	return mv;
    }
    
    @RequestMapping(value="/sample/selectMusicBoardList.do")
    public ModelAndView selectMusicBoardList(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String, Object>> list = musicService.selectMusicBoardList(map.getMap());
    	mv.addObject("list", list);
    	System.out.println("list.get(0) :"+list.get(0));
    	if(list.size() > 0 ){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}else{
    		mv.addObject("TOTAL", 0);
    	}
    	return mv;
    }
    
    
    /*********************	 2.	게시판 상세 불러오기 **********************************/
    
    @RequestMapping(value="/sample/openMusicBoardDetail.do")
    public ModelAndView openMusicDetail(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/music_detail");
    	//여기서 두 개의 dao를 통해 받아온 결과값들을 받아서 mv 에 추가 해줘야해 
    	musicService.updateHitCnt(commandMap.getMap());
    	Map<String, Object> music = musicService.selectMusicBoardDetail(commandMap.getMap());
    	
    	mv.addObject("music", music.get("music"));
    	mv.addObject("music_content",music.get("music_content"));
    	mv.addObject("files", music.get("files"));
    	
    	return mv;
    }
    
    /*******************************************게시글 삭제하기 *****************************************************/
    @RequestMapping(value="/sample/deleteArticle.do")
    public ModelAndView deleteArticle(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/sample/openMainIndex.do?#music");
    	musicService.deleteArticle(map.getMap());
    	return mv;
    }
    
    
    /*******************************************댓글 입력 후 *****************************************************/
    @SuppressWarnings("null")
	@RequestMapping(value="/sample/ReopenMusicBoardDetail.do")
    public ModelAndView ReopenMusicDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/music_detail");
    	String board = request.getParameter("board");
    	String num = request.getParameter("mnum");
    	System.out.println("board :"+board+"   num:"+num);
    	
    	Map<String, Object> MNUM = null;
    	
    	
    	commandMap.put("MNUM", num);
    	//여기서 두 개의 dao를 통해 받아온 결과값들을 받아서 mv 에 추가 해줘야해 
    	Map<String, Object> music = musicService.selectMusicBoardDetail(commandMap.getMap());
    	
    	mv.addObject("music", music.get("music"));
    	mv.addObject("music_content",music.get("music_content"));
    	
    	return mv;
    }
    
    /*********************	 3.	로그인 화면 불러오기 **********************************/
    
    @RequestMapping(value="/sample/openLoginForm.do")
    public ModelAndView openLoginForm(Map<String, Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/LoginForm");
    	return mv;
    }

    /*********************	 4.	회원가입 화면 불러오기 **********************************/
    
    @RequestMapping(value="/sample/openJoinForm.do")
    public ModelAndView openJoinForm(Map<String, Object> cammandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/JoinForm");
    	return mv;
    }
    
    /*********************	 5.	개인정보 화면 불러오기 **********************************/
    
    @RequestMapping(value="/sample/MyPage_myInfo.do")
    public ModelAndView MyPage_myInfo(CommandMap map, HttpSession sess, User user) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/MyPage_main.jsp?item=MyPage_myInfo");
    	
    	return mv;
    }
    
    /*********************	 6. 작성한 글 목록 화면 불러오기 **********************************/
    @RequestMapping(value="/sample/MyPage_Iwritten.do")
    public ModelAndView MyPage_Iwritten(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/MyPage_main.jsp?item=MyPage_Iwritten");
    	String board="Music";
    	List<MusicDTO> list = musicService.selectMusicIwritten(map);
    	mv.addObject("list", list);
    	mv.addObject("board", board);
      	return mv;
    }
    
    /*********************	 7. 스크랩한 글 목록 화면 불러오기 **********************************/
    
    @RequestMapping(value="/sample/MyPage_scraps.do")
    public ModelAndView MyPage_scraps(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/MyPage_main.jsp?item=MyPage_scraps");
    	List<ScrapDTO> scraps = musicService.selectMusicScraps(map);
    	mv.addObject("scraps", scraps);
    	return mv;
    }
    
    /*********************	 8. 검색 화면 불러오기 **********************************/
    
    @RequestMapping(value="/sample/openSearchData.do")
    public ModelAndView openSearchData(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/Search_Data");
    	return mv;
    }
    /*********************	 9. 지도 화면 불러오기 **********************************/
    @RequestMapping(value="/sample/openSearchMap.do")
    public ModelAndView openSearchMap(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/Search_prac");
    	List<PracDTO> list = musicService.selectPracMap(map.getMap());
    	mv.addObject("list", list);
    	return mv;
    }
    

}
