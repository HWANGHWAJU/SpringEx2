package first.login.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.apache.log4j.Logger;
import org.aspectj.org.eclipse.jdt.core.dom.ThisExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.login.model.User;
import first.login.sevice.LoginService;
import first.sample.service.MusicService;
import first.sample.service.SampleService;

@Controller
public class Logincontroller {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="loginService")
	private LoginService loginService;
	
	@Resource(name="musicService")
	private MusicService musicService;
	
	/*********************	 1.	세션으로 로그인 처리  **********************************/
    
	@RequestMapping(value="/login/doLogin.do")
	public ModelAndView doLogin(User user, HttpSession sess, HttpServletRequest req, Map<String, Object> commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/sample/mainIndex");
			
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
			
		Map<String, Object> loginuser = loginService.loginUser(id, pw);
		
		user.setId((String)loginuser.get("Mem_id"));
		user.setPassword((Integer)loginuser.get("Mem_pw"));
		user.setName((String)loginuser.get("Mem_name"));
		
    	List<Map<String, Object>> music = musicService.selectMusicBoardList(commandMap);
    	System.out.println("============================>samplecontroller 끝");
    	mv.addObject("music", music);
		
		
		if(user != null){
			sess.setAttribute("loginUser", user);
			mv.addObject("user", user);
		}
		return mv;
	}

	/*********************	 2.	세션으로 로그아웃 처리  **********************************/
	
	@RequestMapping(value="/login/logOut.do")
	public ModelAndView logOut(HttpSession sess, Map<String, Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/mainIndex");
    	List<Map<String, Object>> music = musicService.selectMusicBoardList(commandMap);
    	System.out.println("============================>samplecontroller 끝");
    	mv.addObject("music", music);
		sess.setAttribute("loginUser", null);
		return mv;
	}
	
	/*********************	 3.	MyPage   **********************************/
	/*CommandMap commandMap의 역할 : 
	 * 	Map<String, Object> Hash 배열 형태로 선언된 객체로, 
	 * 하나 이상의 객체를 받아 Map에 저장하고, 그와 관련된 함수들을 
	 * 모아 놓아 변수에 종속된 함수로 사용할 수 있게 선언되어 있음.*/
	
	@RequestMapping(value="/login/openMyPage.do")
	public ModelAndView openMyPage(CommandMap userInfo) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/MyPage");
		
		Map<String, Object> info =  loginService.userInfo(userInfo.getMap());
			
	
		mv.addObject("info", info);
		
		return mv;
	}
}
