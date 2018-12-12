package spring.indiestream.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.SnsBoardVO;

public interface SnsBoardDAO {

	public void setSqlSession(SqlSession sqlSession);
	public List<SnsBoardVO> snsSelectAll();
	public SnsBoardVO snsSelectOne(String no);
	public int snsInsert(SnsBoardVO snsVO);
	public int snsUpdate(SnsBoardVO snsVO);
	public int snsDelete(String no);
	public int snsCurrentNo();
	public void snsDeleteUnchecked();
	public void snsUpdateToChecked(String snsBoardNo);
	public void snsBoardVideoUrlUpdate (SnsBoardVO snsVO);
	public List<SnsBoardVO> snsBoardByIdSelect(String memberId);
	public List<SnsBoardVO> snsSelectAllFromWriter(String snsWriter);
}
