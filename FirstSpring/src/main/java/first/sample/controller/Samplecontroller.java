package first.sample.controller;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.sample.service.MusicService;
import first.sample.service.SampleService;

//웹 클라이언트에서 들어온 요청을 해당 비지니스 로직을 호출하고, 수행 결과와 함께 응답하는
//Dispatcher역할, 어노테이션을 이용하여 Controller 객체임을 선언 
@Controller
public class Samplecontroller {
    Logger log = Logger.getLogger(this.getClass());
     
    //Service 영역의 접근
    @Resource(name="sampleService")
    private SampleService sampleService;
    
    @Resource(name="musicService")
    private MusicService musicService;
    
    
   //요청 URL을 위미. 우리가 value 값을 호출하게 되면 RequestMapping 어노테이션과 
    //매핑되어, 해당 메서드가 실행된다. + 페이징 처리를 위한 수정
/*    @RequestMapping(value="/sample/openBoardList.do")
    public ModelAndView openSampleBoardList(Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/boardList");
        //위는 화면에 보여줄 jsp 파일을 의미. 
        
        //Map 형식(string키,object값)를 연결하여 list에 저장, 페이징 처리 전 
        List<Map<String, Object>> list = sampleService.selectBoardList(commandMap);
        										//여러 로직이 작성된 곳에서 해당 비지니스 로직을 호출      
       
        mv.addObject("list", list);
        //mv에 서비스로직의 결과를 ModelAndView 객체에 담아서 jsp 에서 그 값을 
        //이용할 수 있도록 저장. 
        return mv;
    }*/
    
/*    @RequestMapping(value="/sample/openMainIndex.do")
    public ModelAndView openMainIndex(Map<String, Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/mainIndex");
    	
    	//여기에 리턴만 들어오면 돼
    	System.out.println("============================>samplecontroller");
    	List<Map<String, Object>> music = musicService.selectMusicBoardList(commandMap);
    	System.out.println("============================>samplecontroller 끝");
    	mv.addObject("music", music);
    	
    	return mv;
    }
*/
    @RequestMapping(value="/sample/openBoardList.do")
    public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/boardList");
    	

    	return mv;
    }
    
    @RequestMapping(value="/sample/selectBoardList.do")
    public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String, Object>> list = sampleService.selectBoardList(commandMap.getMap());
    	mv.addObject("list", list);
    	
    	if(list.size() > 0){
    		mv.addObject("TOTAL",  list.get(0).get("TOTAL_COUNT"));
    	}else{
    		mv.addObject("TOTAL",0);
    	}
    	return mv;
    }
    
    /*
     * 	ArgumentResolver test
     * 
     * */
    @RequestMapping(value="/sample/testMapArgumentResolver.do")
    public ModelAndView testMapArgumentResolver( CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("");
    	
    	if(commandMap.isEmpty()==false){
    		//Iterator가 list 보다 느림 
    		Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
    		Entry<String, Object> entry = null;
    	
    		while(iterator.hasNext()){
    			entry = iterator.next();
    			log.debug("key :"+entry.getKey()+", value : "+entry.getValue());
    		}
    	}
    	return mv;
    }
    
    
    /*
     * 작성폼 불러내는 컨트롤러 0601
     * 
     * */
    
    @RequestMapping(value="/sample/openBoardWrite.do")
    public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/boardWrite");
    	return mv;
    }
    
    
    //아래 레퍼런스에 서블릿 리퀘스트 부분이 있는 이유는 그 업로드 한 파일을 저장하기 위해서, 첨부 파일은 CommandMap 에서 처리하지 않음
    @RequestMapping(value="/sample/insertBoard.do")
    public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
    	
    	sampleService.insertBoard(commandMap.getMap(), request);
    	return mv;
    }
    
    @RequestMapping(value="/sample/openBoardDetail.do")
    public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/boardDetail");
    	
    	Map<String, Object> map = sampleService.selectBoardDetail(commandMap.getMap());
    	mv.addObject("map", map.get("map"));
    	mv.addObject("list",map.get("list"));
    	return mv;
    }
    
    
    
    
 
    @RequestMapping(value="/sample/openBoardUpdate.do")
    public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/boardUpdate");
    
    	

    	Map<String, Object> map = sampleService.selectBoardDetail(commandMap.getMap());
    	mv.addObject("map",map.get("map"));
    	mv.addObject("list", map.get("list"));
    	
    	return mv;
    }
    
   
    //파일에 대한 수정을 함께 하기 위해 HttpServletRequest 추가 
    @RequestMapping(value="/sample/updateBoard.do")
    public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");
    	

    	sampleService.updateBoard(commandMap.getMap(), request);
    	
    	mv.addObject("IDX", commandMap.get("IDX"));
    	return mv;
    }
    
    @RequestMapping(value="/sample/deleteBoard.do")
    public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
         
        sampleService.deleteBoard(commandMap.getMap());
         
        return mv;
    }

    
    
}
