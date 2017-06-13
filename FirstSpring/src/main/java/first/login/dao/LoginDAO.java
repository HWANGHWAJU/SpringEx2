package first.login.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import first.login.model.User;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{
	

	@SuppressWarnings({ "null", "unchecked" })
	public Map<String, Object> login(String id, String pw) throws Exception{
			Map<String, Object> loginuser = new HashMap<String, Object>();
		loginuser.put("id", id);
		loginuser.put("pw", pw);
		return (Map<String, Object>)selectOne("login.loginUser", loginuser);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> userInfo(Map<String, Object> info) throws Exception{
		return (Map<String, Object>)selectOne("login.userInfo", info);		
	}
}	
