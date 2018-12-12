package spring.indiestream.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.ReportVO;

public interface ReportDAO {

	public void setSqlSession(SqlSession sqlSession);
	public List<ReportVO> reportSnsSelect();
	public List<ReportVO> reportSoundSelect();
	public List<ReportVO> reportReplySelect();
	public List<ReportVO> reportSnsOneDetailSelect(String no);
	public List<ReportVO> reportSoundOneDetailSelect(String no);
	public List<ReportVO> reportReplyDetailSelect(String no);
	int reportSnsInsert(ReportVO reportVO);
	int reportSoundInsert(ReportVO reportVO);
	int reportReplyInsert(ReportVO reportVO);
	public void reportSnsCount(String snsWriter);
	public void reportSoundCount(String soundWriter);
	public void reportReplyCount(String replyWriter);
}
