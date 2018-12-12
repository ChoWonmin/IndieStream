package spring.indiestream.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.HashtagVO;


public interface HashtagDAO {

	public void setSqlSession(SqlSession sqlSession);
	public int hashSnsInsert(HashtagVO hashtagVO);
	public int hashSoundInsert(HashtagVO hashtagVO);
	public List<HashtagVO> hashSnsSelectFromOnePost(String no);
	public int hashSnsDeleteFromOneBoard(HashtagVO hashtagVO);
	public int hashSoundDeleteFromOneBoard(HashtagVO hashtagVO);
	public List<HashtagVO> hashSoundSelectFromOnePost(String no);
	public int hashSnsDeleteAllFromOneBoard(HashtagVO hashtagVO);
	public int hashSoundDeleteAllFromOneBoard(HashtagVO hashtagVO);
	public List<HashtagVO> hashtagCountSelect();
	
}
