package first.reply.service;

import java.util.List;

import first.common.common.CommandMap;
import first.reply.model.ReplyDTO;

public interface ReplyService {
	//1.댓글
	List<ReplyDTO> selectReplyList(CommandMap map) throws Exception;
	
	//2. 댓글 등록
	void insertReply(CommandMap map) throws Exception;
}
