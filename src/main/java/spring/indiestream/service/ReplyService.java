package spring.indiestream.service;

import java.util.List;

import spring.indiestream.dao.ReplyDAO;
import spring.indiestream.domain.ReplyVO;

public interface ReplyService {
	
	public void setReplyDAO(ReplyDAO replyDao);
	public List<ReplyVO> snsGetAllReply(String snsBoardNo);
	public ReplyVO snsGetOneReply(String replyNo);
	public void snsInsertReply(ReplyVO replyVo);
	public void snsUpdateReply(ReplyVO replyVo);
	public void snsDeleteReply(String replyNo);
	
	public List<ReplyVO> soundGetAllReply(String snsBoardNo);
	public ReplyVO soundGetOneReply(String replyNo);
	public void soundInsertReply(ReplyVO replyVo);
	public void soundUpdateReply(ReplyVO replyVo);
	public void soundDeleteReply(String replyNo);
}
