package spring.indiestream.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.MemberDAO;
import spring.indiestream.dao.SnsBoardDAO;
import spring.indiestream.domain.SnsBoardVO;
import spring.indiestream.service.SnsBoardService;

@Service
public class SnsBoardServiceImpl implements SnsBoardService{
	@Autowired
	private SnsBoardDAO snsBoardDAO;
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List<SnsBoardVO> snsSelectAll() throws SQLException {
		List<SnsBoardVO> result = snsBoardDAO.snsSelectAll();
		
		for(SnsBoardVO sns:result)
			sns.setMember(memberDAO.findById(sns.getSnsWriter()));
			
		return result;
	}

	@Override
	public SnsBoardVO snsSelectOne(String no) {
		return snsBoardDAO.snsSelectOne(no);
	}

	@Override
	public int snsInsert(SnsBoardVO snsVO) {
		return snsBoardDAO.snsInsert(snsVO);
	}

	@Override
	public int snsUpdate(SnsBoardVO snsVO) {
		return snsBoardDAO.snsUpdate(snsVO);
	}

	@Override
	public int snsDelete(String no) {
		int noo = snsBoardDAO.snsDelete(no);
		return noo;
	}

	@Override
	public int snsCurrentNo() {
		return snsBoardDAO.snsCurrentNo();
	}

	@Override
	public void snsDeleteUnchecked() {
		snsBoardDAO.snsDeleteUnchecked();		
	}

	@Override
	public void snsUpdateToChecked(String snsBoardNo) {
		snsBoardDAO.snsUpdateToChecked(snsBoardNo);		
	}

	@Override
	public void snsBoardVideoUrlUpdate(SnsBoardVO snsVO) {
		snsBoardDAO.snsBoardVideoUrlUpdate(snsVO);
		
	}

	@Override
	public List<SnsBoardVO> snsSelectAllFromWriter(String snsWriter) {
		// TODO Auto-generated method stub
		return snsBoardDAO.snsSelectAllFromWriter(snsWriter);
	}
	
}
