package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.HashtagDAO;
import spring.indiestream.domain.HashtagVO;

@Repository
public class HashtagDAOImpl implements HashtagDAO{
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlsession = sqlSession;
	}

	@Override
	public int hashSnsInsert(HashtagVO hashtagVO) {
		
		return sqlsession.insert("hashMapper.hashSnsInsert", hashtagVO);
	}

	@Override
	public List<HashtagVO> hashSnsSelectFromOnePost(String no) {
		
		return sqlsession.selectList("hashMapper.hashSnsSelectFromOnePost", no);
	}

	@Override
	public int hashSnsDeleteFromOneBoard(HashtagVO hashtagVO) {
		return sqlsession.delete("hashMapper.hashSnsDeleteFromOneBoard", hashtagVO);
	}

	@Override
	public int hashSoundInsert(HashtagVO hashtagVO) {
		return sqlsession.insert("hashMapper.hashSoundInsert", hashtagVO);
	}

	@Override
	public List<HashtagVO> hashSoundSelectFromOnePost(String no) {
		return sqlsession.selectList("hashMapper.hashSoundSelectFromOnePost", no);
	}

	@Override
	public int hashSoundDeleteFromOneBoard(HashtagVO hashtagVO) {
		return sqlsession.delete("hashMapper.hashSoundDeleteFromOneBoard", hashtagVO);
	}

	@Override
	public int hashSnsDeleteAllFromOneBoard(HashtagVO hashtagVO) {
		return sqlsession.delete("hashMapper.hashSnsDeleteAllFromOneBoard", hashtagVO);
	}

	@Override
	public int hashSoundDeleteAllFromOneBoard(HashtagVO hashtagVO) {
		return sqlsession.delete("hashMapper.hashSoundDeleteAllFromOneBoard", hashtagVO);
	}

	@Override
	public List<HashtagVO> hashtagCountSelect() {
		// hashtagCountSelect
		return sqlsession.selectList("hashMapper.hashtagCountSelect");
	}

}
