package spring.indiestream.domain;

import java.util.List;

public class ManagerVO {
	private String managerId;
	private String password;
	private List<ReportVO> reportList;
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<ReportVO> getReportList() {
		return reportList;
	}
	public void setReportList(List<ReportVO> reportList) {
		this.reportList = reportList;
	}
	public ManagerVO(String managerId, String password, List<ReportVO> reportList) {
		super();
		this.managerId = managerId;
		this.password = password;
		this.reportList = reportList;
	}
	public ManagerVO(){}
	@Override
	public String toString() {
		return "ManagerVO [managerId=" + managerId + ", password=" + password + ", reportList=" + reportList + "]";
	}
	
	
	
	
}
