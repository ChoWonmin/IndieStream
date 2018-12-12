package spring.indiestream.service;

import java.util.List;
import java.util.Map;

import spring.indiestream.dao.ReportDAO;
import spring.indiestream.domain.ManagerVO;
import spring.indiestream.domain.ReportVO;

public interface ReportService {
	public void setReportDAO(ReportDAO reportDAO);
	public List<ReportVO> reportSnsSelect();
	public List<ReportVO> reportSoundSelect();
	public List<ReportVO> reportReplySelect();
	public List<ReportVO> reportSnsOneDetailSelect(String no);
	public List<ReportVO> reportSoundOneDetailSelect(String no);
	public List<ReportVO> reportReplyDetailSelect(String no);
	public List<ManagerVO> reportSelectAll();
	int reportSnsInsert(ReportVO reportVO);
	int reportSoundInsert(ReportVO reportVO);
	int reportReplyInsert(ReportVO reportVO);
	public void reportSnsCount(String snsWriter);
	public void reportSoundCount(String soundWriter);
	public void reportReplyCount(String replyWriter);
}
