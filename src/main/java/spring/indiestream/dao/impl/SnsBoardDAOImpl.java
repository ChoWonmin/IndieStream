package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.SnsBoardDAO;
import spring.indiestream.domain.SnsBoardVO;

@Repository
public class SnsBoardDAOImpl implements SnsBoardDAO{

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlsession = sqlSession;
	}

	@Override
	public List<SnsBoardVO> snsSelectAll() {
		
		return sqlsession.selectList("snsMapper.snsSelectAll");
	}

	@Override
	public SnsBoardVO snsSelectOne(String no) {
		
		return sqlsession.selectOne("snsMapper.snsSelectOne",no);
	}

	@Override
	public int snsInsert(SnsBoardVO snsVO) {
		
		return sqlsession.insert("snsMapper.snsInsert", snsVO);
	}

	@Override
	public int snsUpdate(SnsBoardVO snsVO) {
		
		return sqlsession.update("snsMapper.snsUpdate",snsVO);
	}

	@Override
	public int snsDelete(String no) {
		return sqlsession.delete("snsMapper.snsDelete",no);
	}

	@Override
	public int snsCurrentNo() {
		return sqlsession.selectOne("snsMapper.snsCurrentNo");
	}

	@Override
	public void snsDeleteUnchecked() {
		sqlsession.delete("snsMapper.snsDeleteUnchecked");		
	}

	@Override
	public void snsUpdateToChecked(String snsBoardNo) {
		sqlsession.update("snsMapper.snsUpdateToChecked",snsBoardNo);	
	}

	@Override
	public void snsBoardVideoUrlUpdate(SnsBoardVO snsVO) {
		sqlsession.update("snsMapper.snsBoardVideoUrlUpdate",snsVO);	
		
	}

	@Override
	public List<SnsBoardVO> snsBoardByIdSelect(String memberId) {
		return sqlsession.selectList("snsMapper.snsBoardByIdSelect",memberId);
	}

	@Override
	public List<SnsBoardVO> snsSelectAllFromWriter(String snsWriter) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("snsMapper.snsSelectAllFromWriter",snsWriter);
	}

}
