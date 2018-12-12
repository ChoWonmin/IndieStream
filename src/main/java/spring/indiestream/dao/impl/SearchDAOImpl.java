package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.SearchDAO;
import spring.indiestream.domain.HashtagVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.SnsBoardVO;
import spring.indiestream.domain.SoundBoardVO;

@Repository
public class SearchDAOImpl implements SearchDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;		
	}

	@Override
	public List<SnsBoardVO> snsBoardWriterSearchSelect(String search) {
		return sqlSession.selectList("snsMapper.snsBoardWriterSearchSelect", search);
	}

	@Override
	public List<SnsBoardVO> snsBoardContentSearchSelect(String search) {
		return sqlSession.selectList("snsMapper.snsBoardContentSearchSelect", search);
	}

	//수정 artist
	@Override
	public List<MemberVO> soundBoardWriterSearchSelect(String search) {
		return sqlSession.selectList("memberMapper.memberSearchArtist", search);
	}

	@Override
	public List<SoundBoardVO> soundBoardContentSearchSelect(String search) {
		return sqlSession.selectList("soundBoardMapper.soundBoardContentSearchSelect", search);
	}

	@Override
	public List<SoundBoardVO> soundBoardTitleSearchSelect(String search) {
		
		return sqlSession.selectList("soundBoardMapper.soundBoardTitleSearchSelect", search);

	}

	@Override
	public List<HashtagVO> hashtagSnsSearchSelect(String search) {
		return sqlSession.selectList("hashMapper.hashtagSnsSearchSelect", search);
	}

	@Override
	public List<HashtagVO> hashtagSoundSearchSelect(String search) {
		return sqlSession.selectList("hashMapper.hashtagSoundSearchSelect", search);
	}

	@Override
	public List<MemberVO> searchMemberById(String search) {
		return sqlSession.selectList("memberMapper.searchMemberById", search);
	}

}








