package spring.indiestream.service;

import java.sql.SQLException;
import java.util.List;

import spring.indiestream.dao.SoundBoardDAO;
import spring.indiestream.domain.SoundBoardVO;
import spring.indiestream.domain.SoundSearchVO;

public interface SoundBoardService {

	public void setSoundBoardDAO(SoundBoardDAO soundBoardDAO);
	public void SoundRegister(SoundBoardVO vo)throws SQLException;
	public void SoundUpdate(SoundBoardVO vo)throws SQLException;
	public void SoundDelete(int soundBoardNo)throws SQLException;
	public void deleteFile(String fileName);
	public List<SoundBoardVO> SoundSortByDate()throws SQLException;
	public List<SoundBoardVO> SoundSortByCount()throws SQLException;
	public List<SoundBoardVO> SoundBoardList()throws SQLException;
	public int SoundBoardNo()throws SQLException;
	public SoundBoardVO ShowContent(int soundBoardNo)throws SQLException;
	public void SoundUpdateCount(int soundBoardNo)throws SQLException;
	public List<SoundBoardVO> SoundBoardSearchSelect(SoundSearchVO soundSearch) throws SQLException;
	public List<SoundBoardVO> SoundSortByNo()throws SQLException;
	public List<SoundBoardVO> FindSoundBoardById(String memberId);
	public List<SoundBoardVO> soundSelectAllFromWriter(String soundWriter);
	public List<SoundBoardVO> searchByGenre(String genre) throws SQLException;
}
