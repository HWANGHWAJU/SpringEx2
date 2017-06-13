package first.join.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{

	public void join(Map<String, Object> joinInfo) throws Exception{
		 insert("join.joinMember", joinInfo);
	}
}
