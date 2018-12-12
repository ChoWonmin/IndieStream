package spring.indiestream.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.ReportDAO;
import spring.indiestream.domain.ManagerVO;
import spring.indiestream.domain.ReportVO;
import spring.indiestream.service.ReportService;
@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDAO reportDAO;
	
	@Override
	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO=reportDAO;
	}

	@Override
	public List<ReportVO> reportSnsSelect() {
		return reportDAO.reportSnsSelect();
	}

	@Override
	public List<ReportVO> reportSoundSelect() {
		return reportDAO.reportSoundSelect();
	}

	@Override
	public List<ReportVO> reportReplySelect() {
		return reportDAO.reportReplySelect();
	}

	@Override
	public List<ReportVO> reportSnsOneDetailSelect(String no) {
		return reportDAO.reportSnsOneDetailSelect(no);
	}

	@Override
	public List<ReportVO> reportSoundOneDetailSelect(String no) {
		return reportDAO.reportSoundOneDetailSelect(no);
	}

	@Override
	public List<ReportVO> reportReplyDetailSelect(String no) {
		return reportDAO.reportReplyDetailSelect(no);
	}

	@Override
	public List<ManagerVO> reportSelectAll() {
		List<ManagerVO> listOfReportList=new ArrayList<ManagerVO>();
		/*Map<String, ManagerVO> mapOfReportList = new HashMap<String, ManagerVO>();
		
		mapOfReportList.put("reportSnsSelect", new ManagerVO(null, null, reportSnsSelect()));
		mapOfReportList.put("reportSoundSelect", new ManagerVO(null, null, reportSoundSelect()));
		mapOfReportList.put("reportReplySelect", new ManagerVO(null, null, reportReplySelect()));*/
		
		listOfReportList.add(new ManagerVO(null, null, reportSnsSelect()));
		listOfReportList.add(new ManagerVO(null, null, reportSoundSelect()));
		listOfReportList.add(new ManagerVO(null, null, reportReplySelect()));
		
		return listOfReportList;
	}
	@Override
	public int reportSnsInsert(ReportVO reportVO) {
		return reportDAO.reportSnsInsert(reportVO);
	}

	@Override
	public int reportSoundInsert(ReportVO reportVO) {
		return reportDAO.reportSoundInsert(reportVO);
	}

	@Override
	public int reportReplyInsert(ReportVO reportVO) {
		return reportDAO.reportReplyInsert(reportVO);
	}

	@Override
	public void reportSnsCount(String snsWriter) {
		reportDAO.reportSnsCount(snsWriter);
		
	}

	@Override
	public void reportSoundCount(String soundWriter) {
		reportDAO.reportSoundCount(soundWriter);
		
	}

	@Override
	public void reportReplyCount(String replyWriter) {
		reportDAO.reportReplyCount(replyWriter);
		
	}

}
