package spring.indiestream.service;

import java.sql.SQLException;
import java.util.List;

import spring.indiestream.dao.SnsBoardDAO;
import spring.indiestream.domain.SnsBoardVO;

public interface SnsBoardService {

	public List<SnsBoardVO> snsSelectAll() throws SQLException;
	public SnsBoardVO snsSelectOne(String no);
	public int snsInsert(SnsBoardVO snsVO);
	public int snsUpdate(SnsBoardVO snsVO);
	public int snsDelete(String no);
	public int snsCurrentNo();
	public void snsDeleteUnchecked();
	public void snsUpdateToChecked(String snsBoardNo);
	public void snsBoardVideoUrlUpdate (SnsBoardVO snsVO);
	public List<SnsBoardVO> snsSelectAllFromWriter(String snsWriter);
}
