package spring.indiestream.domain;

public class ReportVO {
	
	private int reportNo;
	private String memberId;
	private String reporterComment;
	private String reportTime;
	private int snsBoardNo;
	private String snsWriter;
	private int soundBoardNo;
	private String soundWriter;
	private int replyNo;
	private String replyWriter;
	private int reported; // 신고 횟수 카운트 셀려고 추가함
	//private List<SnsBoardVO> snsBoardList;
	//private List<MemberVO> memberList;
	//private List<SoundBoardVO> oundBoardList;
	//List<replyVO> replyList;
	
	public ReportVO(){}
	
	
	
	
	
	public ReportVO(int reportNo, String memberId, String reporterComment, String reportTime, int snsBoardNo,
			String snsWriter, int soundBoardNo, String soundWriter, int replyNo, String replyWriter, int reported) {
		super();
		this.reportNo = reportNo;
		this.memberId = memberId;
		this.reporterComment = reporterComment;
		this.reportTime = reportTime;
		this.snsBoardNo = snsBoardNo;
		this.snsWriter = snsWriter;
		this.soundBoardNo = soundBoardNo;
		this.soundWriter = soundWriter;
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.reported = reported;
	}





	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReporterComment() {
		return reporterComment;
	}

	public void setReporterComment(String reporterComment) {
		this.reporterComment = reporterComment;
	}

	public String getReportTime() {
		return reportTime;
	}

	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}

	public int getSnsBoardNo() {
		return snsBoardNo;
	}

	public void setSnsBoardNo(int snsBoardNo) {
		this.snsBoardNo = snsBoardNo;
	}

	public String getSnsWriter() {
		return snsWriter;
	}

	public void setSnsWriter(String snsWriter) {
		this.snsWriter = snsWriter;
	}

	public int getSoundBoardNo() {
		return soundBoardNo;
	}

	public void setSoundBoardNo(int soundBoardNo) {
		this.soundBoardNo = soundBoardNo;
	}

	public String getSoundWriter() {
		return soundWriter;
	}

	public void setSoundWriter(String soundWriter) {
		this.soundWriter = soundWriter;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public int getReported() {
		return reported;
	}

	public void setReported(int reported) {
		this.reported = reported;
	}





	@Override
	public String toString() {
		return "ReportVO [reportNo=" + reportNo + ", memberId=" + memberId + ", reporterComment=" + reporterComment
				+ ", reportTime=" + reportTime + ", snsBoardNo=" + snsBoardNo + ", snsWriter=" + snsWriter
				+ ", soundBoardNo=" + soundBoardNo + ", soundWriter=" + soundWriter + ", replyNo=" + replyNo
				+ ", replyWriter=" + replyWriter + ", reported=" + reported + "]";
	}
	
	
	
}
