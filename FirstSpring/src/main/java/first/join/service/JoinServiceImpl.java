package first.join.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.common.CommandMap;
import first.join.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	public void joinMember(Map<String, Object> map) throws Exception{
		joinDAO.join(map);		
	}
}
