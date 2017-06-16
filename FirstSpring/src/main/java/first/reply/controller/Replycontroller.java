package first.reply.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


import first.common.common.CommandMap;
import first.reply.model.ReplyDTO;
import first.reply.service.ReplyService;
import first.sample.service.MusicService;

@Controller
public class Replycontroller {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="replyService")
	private ReplyService replyService;
	
	@Resource(name="musicService")
	private MusicService musicService;
	
	
	/***************************1. 댓글 목록 보기*********************************************/
	
	@RequestMapping(value="/reply/viewReply.do")
	public ModelAndView viewReply(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/Reply");
		System.out.println(map.get("BOARD")+"글 번호 :"+map.get("ANUM"));
	   	List<ReplyDTO> replylist = replyService.selectReplyList(map);
    	
    	mv.addObject("reply",replylist);
    	mv.addObject("BOARD", map.get("BOARD"));
    	mv.addObject("ANUM", map.get("ANUM"));
    	
    	if(replylist.size() > 0){
    		mv.addObject("TOTAL", replylist.size());
    	}else{
    		mv.addObject("TOTAL", 0);
    	}
    	return mv;
	}
	
/*	@RequestMapping(value="/reply/openReplyList.do")
	public ModelAndView openReplyList(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println(map.get("BOARD")+"글 번호 :"+map.get("ANUM"));
	   	List<ReplyDTO> replylist = replyService.selectReplyList(map);
    	
    	mv.addObject("replylist",replylist);
    	mv.addObject("BOARD", map.get("BOARD"));
    	mv.addObject("ANUM", map.get("ANUM"));
    	
    	if(replylist.size() > 0){
    		mv.addObject("TOTAL", replylist.size());
    	}else{
    		mv.addObject("TOTAL", 0);
    	}
    	return mv;
	}*/
	
	/***************************2. 댓글 작성 폼*********************************************/
	
	@RequestMapping(value="/reply/ReplyForm.do")
	public ModelAndView ReplyForm(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/ReplyForm");
    	mv.addObject("BOARD", map.get("BOARD"));
    	mv.addObject("ANUM", map.get("ANUM"));
		return mv;
	}
	
	
	/***************************3. 댓글 작성 하기*********************************************/
	
	@RequestMapping(value="/reply/insertReply.do")
	public ModelAndView insertReply(CommandMap map, HttpServletResponse response, HttpServletRequest request) throws Exception{
		System.out.println("board :"+map.get("board")+"    ANUM :"+map.get("anum"));
			replyService.insertReply(map);
			String board = (String)map.get("board");
			String mnum = (String)map.get("anum");
	
			ModelAndView mv = new ModelAndView("forward:/sample/ReopenMusicBoardDetail.do?board="+board+"&mnum="+mnum);

		mv.addObject("BOARD", map.get("board"));
		mv.addObject("MNUM", map.get("anum"));
		return mv;
	}
	
}
