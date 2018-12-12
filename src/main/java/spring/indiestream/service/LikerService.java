package spring.indiestream.service;

import java.util.List;

import spring.indiestream.domain.LikerVO;

public interface LikerService {
	
	//public void setLikerDAO(LikerDAO likerDao);
	
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
