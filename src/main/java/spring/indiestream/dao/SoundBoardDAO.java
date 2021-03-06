package spring.indiestream.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.SoundBoardVO;
import spring.indiestream.domain.SoundSearchVO;

public interface SoundBoardDAO {
	
	public void setSqlSession(SqlSession sqlSession);
	public void SoundRegister(SoundBoardVO vo)throws SQLException;
	public void SoundUpdate(SoundBoardVO vo)throws SQLException;
	public void SoundDelete(int soundBoardNo)throws SQLException;
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
