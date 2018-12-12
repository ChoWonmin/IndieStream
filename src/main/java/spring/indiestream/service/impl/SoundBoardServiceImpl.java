package spring.indiestream.service.impl;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.SoundBoardDAO;
import spring.indiestream.domain.SoundBoardVO;
import spring.indiestream.domain.SoundSearchVO;
import spring.indiestream.service.SoundBoardService;

@Service
public class SoundBoardServiceImpl implements SoundBoardService{
	
	@Autowired
	private SoundBoardDAO soundBoardDAO; 
	
	
	
	@Override
	public void SoundRegister(SoundBoardVO vo) throws SQLException {
		
		soundBoardDAO.SoundRegister(vo);
		//vo.setSoundBoardNo(soundBoardDAO.SoundBoardNo());
		
	}

	@Override
	public void SoundUpdate(SoundBoardVO vo) throws SQLException {
		soundBoardDAO.SoundUpdate(vo);
		
	}

	@Override
	public void SoundDelete(int soundBoardNo) throws SQLException {
		soundBoardDAO.SoundDelete(soundBoardNo);
		
	}

	@Override
	public List<SoundBoardVO> SoundSortByDate() throws SQLException {
		
		return soundBoardDAO.SoundSortByDate();
	}
	@Override
	public List<SoundBoardVO> SoundSortByCount() throws SQLException {
		return soundBoardDAO.SoundSortByCount();
	}

	@Override
	public List<SoundBoardVO> SoundBoardList() throws SQLException {
		
		return soundBoardDAO.SoundBoardList();
	}

	@Override
	public int SoundBoardNo() throws SQLException {
		return soundBoardDAO.SoundBoardNo();
	}

	@Override
	public void setSoundBoardDAO(SoundBoardDAO soundBoardDAO) {
		this.soundBoardDAO=soundBoardDAO;
		
	}
	
	@Override
	public void deleteFile(String fileName) {
		File f = new File(fileName);
		System.out.println(fileName+"....File Delete OK!! : "+f.delete());

	}

	@Override
	public SoundBoardVO ShowContent(int soundBoardNo) throws SQLException {
		
		return soundBoardDAO.ShowContent(soundBoardNo);
	}
	
	@Override
	public void SoundUpdateCount(int soundBoardNo) throws SQLException {
		soundBoardDAO.SoundUpdateCount(soundBoardNo);
		
	}

	@Override
	public List<SoundBoardVO> SoundBoardSearchSelect(SoundSearchVO soundSearch) throws SQLException {
		return soundBoardDAO.SoundBoardSearchSelect(soundSearch);
	}

	@Override
	public List<SoundBoardVO> SoundSortByNo() throws SQLException{
		
		return soundBoardDAO.SoundSortByNo();
	}

	@Override
	public List<SoundBoardVO> FindSoundBoardById(String memberId) {
		return soundBoardDAO.FindSoundBoardById(memberId);
	}

	@Override
	public List<SoundBoardVO> soundSelectAllFromWriter(String soundWriter) {
		// TODO Auto-generated method stub
		return soundBoardDAO.soundSelectAllFromWriter(soundWriter);
	}

	@Override
	public List<SoundBoardVO> searchByGenre(String genre) throws SQLException {
		// TODO Auto-generated method stub
		return soundBoardDAO.searchByGenre(genre);
	}


}
