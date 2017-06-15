package first.reply.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.common.CommandMap;
import first.reply.dao.ReplyDAO;
import first.reply.model.ReplyDTO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="replyDAO")
	private ReplyDAO replyDAO;
	
	public List<ReplyDTO> selectReplyList(CommandMap map) throws Exception{
		return replyDAO.selectReplyList(map.getMap());
	}

	public void insertReply(CommandMap map) throws Exception{
		replyDAO.insertReply(map.getMap());
	}
}
