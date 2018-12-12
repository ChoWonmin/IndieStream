package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.LikerDAO;
import spring.indiestream.domain.LikerVO;
import spring.indiestream.domain.SnsBoardVO;
import spring.indiestream.domain.SoundBoardVO;
@Repository
public class LikerDAOImpl implements LikerDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public LikerVO getSnsLiker(LikerVO liker) {
		
		return sqlSession.selectOne("likerMapper.getSnsLiker", liker);
	}

	@Override
	public void insertSnsLiker(LikerVO liker) {
		sqlSession.insert("likerMapper.insertSnsLiker",liker);
	}

	@Override
	public void deleteSnsLiker(LikerVO liker) {
		sqlSession.delete("likerMapper.deleteSnsLiker",liker);
	}

	@Override
	public int selectSnsLikerNumber(String snsBoardNo) {
		return sqlSession.selectOne("likerMapper.selectSnsLikerNumber", snsBoardNo);
	}
	
	@Override
	public LikerVO getSoundLiker(LikerVO liker) {
		return sqlSession.selectOne("likerMapper.getSoundLiker", liker);
	}
	@Override
	public void insertSoundLiker(LikerVO liker) {
		sqlSession.insert("likerMapper.insertSoundLiker",liker);
	}
	@Override
	public void deleteSoundLiker(LikerVO liker) {
		sqlSession.delete("likerMapper.deleteSoundLiker",liker);
	}
	@Override
	public int selectSoundLikerNumber(String soundBoardNo) {
		return sqlSession.selectOne("likerMapper.selectSoundLikerNumber", soundBoardNo);
	}
	@Override
	public List<LikerVO> sortByLiker() {
		return sqlSession.selectList("likerMapper.sortByLiker");
	}
}
