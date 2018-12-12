package spring.indiestream.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.LikerDAO;
import spring.indiestream.domain.LikerVO;
import spring.indiestream.domain.SnsBoardVO;
import spring.indiestream.domain.SoundBoardVO;
import spring.indiestream.service.LikerService;
@Service
public class LikerServiceImpl implements LikerService{
	@Autowired
	private LikerDAO likerDAO;
	
	@Override
	public LikerVO getSnsLiker(LikerVO liker) {
		
		return likerDAO.getSnsLiker(liker);
	}
	@Override
	public void insertSnsLiker(LikerVO liker) {
		likerDAO.insertSnsLiker(liker);
	}
	@Override
	public void deleteSnsLiker(LikerVO liker) {
		likerDAO.deleteSnsLiker(liker);
	}
	@Override
	public int selectSnsLikerNumber(String snsBoardNo) {
		return likerDAO.selectSnsLikerNumber(snsBoardNo);
	}
	
	public LikerVO getSoundLiker(LikerVO liker) {
		return likerDAO.getSoundLiker(liker);
	}
	@Override
	public void insertSoundLiker(LikerVO liker) {
		likerDAO.insertSoundLiker(liker);
	}
	@Override
	public void deleteSoundLiker(LikerVO liker) {
		likerDAO.deleteSoundLiker(liker);
	}
	@Override
	public int selectSoundLikerNumber(String soundBoardNo) {
		return likerDAO.selectSoundLikerNumber(soundBoardNo);
	}
	@Override
	public List<LikerVO> sortByLiker() {
		return likerDAO.sortByLiker();
	}
}
