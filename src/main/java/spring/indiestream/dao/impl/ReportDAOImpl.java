package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.ReportDAO;
import spring.indiestream.domain.ReportVO;

@Repository
public class ReportDAOImpl implements ReportDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public List<ReportVO> reportSnsSelect() {
		return sqlSession.selectList("reportMapper.reportSnsSelect");
	}

	@Override
	public List<ReportVO> reportSoundSelect() {
		return sqlSession.selectList("reportMapper.reportSoundSelect");
	}

	@Override
	public List<ReportVO> reportReplySelect() {
		return sqlSession.selectList("reportMapper.reportReplySelect");
	}

	@Override
	public List<ReportVO> reportSnsOneDetailSelect(String no) {
		return sqlSession.selectList("reportMapper.reportSnsOneDetailSelect",no);
	}

	@Override
	public List<ReportVO> reportSoundOneDetailSelect(String no) {
		return sqlSession.selectList("reportMapper.reportSoundOneDetailSelect",no);
	}

	@Override
	public List<ReportVO> reportReplyDetailSelect(String no) {
		return sqlSession.selectList("reportMapper.reportReplyDetailSelect",no);
	}
	@Override
	public int reportSnsInsert(ReportVO reportVO) {
		return sqlSession.insert("reportMapper.reportSnsInsert",reportVO);
	}
	
	@Override
	public int reportSoundInsert(ReportVO reportVO) {
		return sqlSession.insert("reportMapper.reportSoundInsert",reportVO);
	}
	
	@Override
	public int reportReplyInsert(ReportVO reportVO) {
		return sqlSession.insert("reportMapper.reportReplyInsert",reportVO);
	}

	@Override
	public void reportSnsCount(String snsWriter) {
		sqlSession.update("reportMapper.reportSnsCount",snsWriter);
		
	}

	@Override
	public void reportSoundCount(String soundWriter) {
		sqlSession.update("reportMapper.reportSoundCount",soundWriter);
		
	}

	@Override
	public void reportReplyCount(String replyWriter) {
		sqlSession.update("reportMapper.reportReplyCount",replyWriter);
		
	}

}
