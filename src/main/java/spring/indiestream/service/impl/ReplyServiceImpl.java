package spring.indiestream.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.ReplyDAO;
import spring.indiestream.domain.ReplyVO;
import spring.indiestream.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO replyDao;
	
	@Override
	public void setReplyDAO(ReplyDAO replyDao) {
		this.replyDao = replyDao;
	}
	
	@Override
	public List<ReplyVO> snsGetAllReply(String snsBoardNo) {		
		return replyDao.snsGetAllReply(snsBoardNo);
	}

	@Override
	public ReplyVO snsGetOneReply(String replyNo) {

		return replyDao.snsGetOneReply(replyNo);
	}

	@Override
	public void snsInsertReply(ReplyVO replyVo) {
		replyDao.snsInsertReply(replyVo);
	}

	@Override
	public void snsUpdateReply(ReplyVO replyVo) {
		replyDao.snsUpdateReply(replyVo);
	}

	@Override
	public void snsDeleteReply(String replyNo) {
		replyDao.snsDeleteReply(replyNo);
	}
	
	// SoundReply
	@Override
	public List<ReplyVO> soundGetAllReply(String soundBoardNo) {		
		return replyDao.soundGetAllReply(soundBoardNo);
	}

	@Override
	public ReplyVO soundGetOneReply(String replyNo) {
		return replyDao.soundGetOneReply(replyNo);
	}

	@Override
	public void soundInsertReply(ReplyVO replyVo) {
		replyDao.soundInsertReply(replyVo);
	}

	@Override
	public void soundUpdateReply(ReplyVO replyVo) {
		replyDao.soundUpdateReply(replyVo);
	}

	@Override
	public void soundDeleteReply(String replyNo) {
		replyDao.snsDeleteReply(replyNo);
	}
}
