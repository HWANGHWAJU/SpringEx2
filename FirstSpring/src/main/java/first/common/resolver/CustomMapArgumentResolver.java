package first.common.resolver;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
 
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
 
import first.common.common.CommandMap;
 
/*
 * 	이 클래스에서 작성한 ArgumentResolver를 적용시키기 위해선, Map을 상속받아그대로 사용해선 안 된다. 
 * 
 * 	==> 이게 클래스가 적용 되려면 root context에 등록되어야 한다. ->action-servlet.xml 에 등록되어야 함. 
 * 
 * 
 * */

public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver{
 
	
		//Resolver 가 적용 가능한지를 확인 
			//		=> 컨트롤러의 파라미터가 CommandMap 클래스인지 검사 
	
	@Override
    public boolean supportsParameter(MethodParameter parameter) {
        return CommandMap.class.isAssignableFrom(parameter.getParameterType());
    }
 
		//파라미터와 그 외의 다른 정보드를 받아서 실제 객체를 반환함.
		
    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        
    	CommandMap commandMap = new CommandMap();
    								
        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        Enumeration<?> enumeration = request.getParameterNames();
         
        String key = null;
        String[] values = null;
        
        while(enumeration.hasMoreElements()){
        	//request에 있는 값을 iterator를 이용하여 하나씩 가져오는 로직
            key = (String) enumeration.nextElement();
            values = request.getParameterValues(key);
            
            if(values != null){
            		//request에 있는 모든 key와 value를 commandMap 에 저장
                commandMap.put(key, (values.length > 1) ? values:values[0] );
            }
        }
        return commandMap;
        //모든 파라미터가 담겨 있는 commandMap을 반환
    }
}
