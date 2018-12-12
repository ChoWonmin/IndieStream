package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.ReplyDAO;
import spring.indiestream.domain.ReplyVO;
@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> snsGetAllReply(String snsBoardVO) {
		return sqlSession.selectList("replyMapper.snsGetAllReply",snsBoardVO);
	}

	@Override
	public ReplyVO snsGetOneReply(String replyNo) {
		return sqlSession.selectOne("replyMapper.snsGetOneReply",replyNo);
	}

	@Override
	public void snsInsertReply(ReplyVO replyVo) {
		sqlSession.insert("replyMapper.snsInsertReply",replyVo);		
	}

	@Override
	public void snsUpdateReply(ReplyVO replyVo) {
		sqlSession.update("replyMapper.snsUpdateReply",replyVo);
	}

	@Override
	public void snsDeleteReply(String replyNo) {
		sqlSession.delete("replyMapper.snsDeleteReply",replyNo);
	}

	@Override
	public List<ReplyVO> soundGetAllReply(String soundBoardVO) {
		return sqlSession.selectList("replyMapper.soundGetAllReply",soundBoardVO);
	}

	@Override
	public ReplyVO soundGetOneReply(String replyNo) {
		return sqlSession.selectOne("replyMapper.soundGetOneReply",replyNo);
	}

	@Override
	public void soundInsertReply(ReplyVO replyVo) {
		sqlSession.insert("replyMapper.soundInsertReply",replyVo);		
	}

	@Override
	public void soundUpdateReply(ReplyVO replyVo) {
		sqlSession.update("replyMapper.soundUpdateReply",replyVo);
	}

	@Override
	public void soundDeleteReply(String replyNo) {
		sqlSession.delete("replyMapper.soundDeleteReply",replyNo);
	}

}
