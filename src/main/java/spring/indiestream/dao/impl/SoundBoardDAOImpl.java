package spring.indiestream.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.SoundBoardDAO;
import spring.indiestream.domain.SoundBoardVO;
import spring.indiestream.domain.SoundSearchVO;

@Repository
public class SoundBoardDAOImpl implements SoundBoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	@Override
	public void SoundRegister(SoundBoardVO vo) throws SQLException {
		sqlSession.insert("soundBoardMapper.SoundRegister",vo);
		
	}
	@Override
	public void SoundUpdate(SoundBoardVO vo) throws SQLException {
		sqlSession.update("soundBoardMapper.SoundUpdate",vo);
		
		
	}
	@Override
	public void SoundDelete(int soundBoardNo) throws SQLException {
		sqlSession.delete("soundBoardMapper.SoundDelete",soundBoardNo);
		
	}

	@Override
	public List<SoundBoardVO> SoundSortByDate() throws SQLException {
		
		return sqlSession.selectList("soundBoardMapper.SoundSortByDate");
	}
	@Override
	public List<SoundBoardVO> SoundSortByCount() throws SQLException {
		return sqlSession.selectList("soundBoardMapper.SoundSortByCount");
	}
	@Override
	public List<SoundBoardVO> SoundBoardList() throws SQLException {
		
		return sqlSession.selectList("soundBoardMapper.SoundBoardList");
	}
	@Override
	public int SoundBoardNo() throws SQLException {
		int no = sqlSession.selectOne("soundBoardMapper.SoundBoardNo");
		return no;
	}
	@Override
	public SoundBoardVO ShowContent(int soundBoardNo) throws SQLException {
		
		return sqlSession.selectOne("soundBoardMapper.ShowContent",soundBoardNo);
	}
	
	@Override
	public void SoundUpdateCount(int soundBoardNo) throws SQLException {
		sqlSession.update("soundBoardMapper.SoundUpdateCount",soundBoardNo);		
	}
	@Override
	public List<SoundBoardVO> SoundBoardSearchSelect(SoundSearchVO soundSearch) throws SQLException {
		return sqlSession.selectList("soundBoardMapper.SoundBoardSearchSelect");
	}
	@Override
	public List<SoundBoardVO> SoundSortByNo() throws SQLException {

		return sqlSession.selectList("soundBoardMapper.SoundSortByNo");
	}
	@Override
	public List<SoundBoardVO> FindSoundBoardById(String memberId) {
		return sqlSession.selectList("soundBoardMapper.FindSoundBoardById", memberId);
	}
	@Override
	public List<SoundBoardVO> soundSelectAllFromWriter(String soundWriter) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("soundBoardMapper.soundSelectAllFromWriter",soundWriter);
	}
	
	@Override
	public List<SoundBoardVO> searchByGenre(String genre) throws SQLException {
		
		return sqlSession.selectList("soundBoardMapper.SoundBoardSearchSelect",genre);
	}
	
}
