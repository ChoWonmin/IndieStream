package spring.indiestream.dao;

import java.util.List;

import spring.indiestream.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> snsGetAllReply(String snsBoardVO);
	public ReplyVO snsGetOneReply(String replyNo);
	public void snsInsertReply(ReplyVO replyVo);
	public void snsUpdateReply(ReplyVO replyVo);
	public void snsDeleteReply(String replyNo);
	
	public List<ReplyVO> soundGetAllReply(String soundBoardVO);
	public ReplyVO soundGetOneReply(String replyNo);
	public void soundInsertReply(ReplyVO replyVo);
	public void soundUpdateReply(ReplyVO replyVo);
	public void soundDeleteReply(String replyNo);
}
