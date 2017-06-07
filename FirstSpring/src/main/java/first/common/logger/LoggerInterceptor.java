package first.common.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 * 로그 인터셉터 
 * client-> controller 로 요청할 때, 그 요청을 처리할 메서드 (전처리기)
 * 
 * controller -> client 로 요청할 떄, 그 요청을 처리할 메서드 하나 (후처리기) 
 * 
 * */
public class LoggerInterceptor extends HandlerInterceptorAdapter{
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	//전처리기 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		if(log.isDebugEnabled()){
			log.debug("========================== DEBUG START ==========================");
			log.debug(" Request URI \t : "+request.getRequestURI());
		}
		return super.preHandle(request, response, handler);
		
	}
	
	//후처리기
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{

		if(log.isDebugEnabled()){
			log.debug("========================== DEBUG END ==========================");
		}
	}
}
