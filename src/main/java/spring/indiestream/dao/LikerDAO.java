package spring.indiestream.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.LikerVO;

public interface LikerDAO {
	
	void setSqlSession(SqlSession sqlSession);
	public LikerVO getSnsLiker(LikerVO liker);
	public void insertSnsLiker(LikerVO liker);
	public void deleteSnsLiker(LikerVO liker);
	public int selectSnsLikerNumber(String snsBoardNo);
	
	public LikerVO getSoundLiker(LikerVO liker);
	public void insertSoundLiker(LikerVO liker);
	public void deleteSoundLiker(LikerVO liker);
	public int selectSoundLikerNumber(String soundBoardNo);
	public List<LikerVO> sortByLiker();

}
