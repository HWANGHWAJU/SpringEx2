package first.reply.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.common.CommandMap;
import first.common.dao.AbstractDAO;
import first.reply.model.ReplyDTO;

@Repository("replyDAO")
public class ReplyDAO extends AbstractDAO{
	//SQL에 parameterType 이 hashmap 이면 여기 이 함수들의 매개변수가 map으로 일치해야 한다;
	@SuppressWarnings("unchecked")
	public List<ReplyDTO> selectReplyList(Map<String, Object> map) throws Exception{
		return (List<ReplyDTO>)selectPagingList("reply.selectReplyList",map);
	}

	public void insertReply(Map<String, Object> map) throws Exception{
		System.out.println(map.get("board"));
		insert("reply.insertReply", map);
	}
}
