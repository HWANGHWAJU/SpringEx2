package first.common.loginout;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import first.common.logger.LoggerInterceptor;

public class LoginoutInterceptor extends HandlerInterceptorAdapter{
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
	
		try{
			//user 이라는 세션 key를 가진 정보가 null 일 경우 로그인 페이지로 이동
			if(req.getSession().getAttribute("loginUser")==null){
				res.sendRedirect("sample/openMainIndex.do");
				//로그인 세션 정보 없음
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		//로그인 세션 존재함
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	 public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	     super.afterCompletion(request, response, handler, ex);
	}


}
