package spring.indiestream.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.HashtagVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.SnsBoardVO;
import spring.indiestream.domain.SoundBoardVO;

public interface SearchDAO {

	public void setSqlSession(SqlSession sqlSession);
	public List<SnsBoardVO> snsBoardWriterSearchSelect(String search);
	public List<SnsBoardVO> snsBoardContentSearchSelect(String search);
	public List<MemberVO> soundBoardWriterSearchSelect(String search);
	public List<SoundBoardVO> soundBoardContentSearchSelect(String search);
	public List<SoundBoardVO> soundBoardTitleSearchSelect(String search);
	public List<HashtagVO> hashtagSnsSearchSelect(String search);
	public List<HashtagVO> hashtagSoundSearchSelect(String search);
	
	List<MemberVO> searchMemberById(String search);
	
}
