package first.login.sevice;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.login.dao.LoginDAO;
import first.login.model.User;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	

	public Map<String, Object> loginUser(String id, String pw) throws Exception{
		Map<String, Object> loginUser = loginDAO.login(id, pw);
		return loginUser;
	}
	
	public Map<String, Object> userInfo(Map<String, Object> info) throws Exception{
		System.out.println(info.get("userId"));
		Map<String, Object> userInfo = loginDAO.userInfo(info);
		return userInfo;
	}
	
}
