package first.login.sevice;

import java.util.Map;

import first.login.model.User;

public interface LoginService {
	
	Map<String, Object> loginUser(String id, String pw) throws Exception;
	Map<String, Object> userInfo(Map<String, Object> info) throws Exception;
}
