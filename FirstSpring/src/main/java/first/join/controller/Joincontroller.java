package first.join.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.join.service.JoinService;

@Controller
public class Joincontroller {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinService")
	private JoinService joinService;

	/*********************	 1.	회원 가입 진행 **********************************/
	
	@RequestMapping(value="/join/doJoin.do")
	public ModelAndView doJoin(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/joincheck");
				
		joinService.joinMember(map.getMap());
		return mv;
	}
}
