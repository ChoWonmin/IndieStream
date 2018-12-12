package spring.indiestream.domain;
import java.util.List;

public class ReplyVO {
	
	private int replyNo;
	private String replyWriter;
	private String snsWriter;
	private String soundWriter;
	private int snsBoardNo;
	private int soundBoardNo;
	private String replyComment;
	private String replyTime;
	private List<ReportVO> reportList;
	private List<NomalNoticeVO> nomalNoticeList;
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
	public String getSnsWriter() {
		return snsWriter;
	}
	public void setSnsWriter(String snsWriter) {
		this.snsWriter = snsWriter;
	}
	public String getSoundWriter() {
		return soundWriter;
	}
	public void setSoundWriter(String soundWriter) {
		this.soundWriter = soundWriter;
	}
	public int getSnsBoardNo() {
		return snsBoardNo;
	}
	public void setSnsBoardNo(int snsBoardNo) {
		this.snsBoardNo = snsBoardNo;
	}
	public int getSoundBoardNo() {
		return soundBoardNo;
	}
	public void setSoundBoardNo(int soundBoardNo) {
		this.soundBoardNo = soundBoardNo;
	}
	public String getReplyComment() {
		return replyComment;
	}
	public void setReplyComment(String replyComment) {
		this.replyComment = replyComment;
	}
	public String getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(String replyTime) {
		this.replyTime = replyTime;
	}
	public List<ReportVO> getReportList() {
		return reportList;
	}
	public void setReportList(List<ReportVO> reportList) {
		this.reportList = reportList;
	}
	public List<NomalNoticeVO> getNomalNoticeList() {
		return nomalNoticeList;
	}
	public void setNomalNoticeList(List<NomalNoticeVO> nomalNoticeList) {
		this.nomalNoticeList = nomalNoticeList;
	}
	// SNS Reply
	public ReplyVO(int replyNo, String replyWriter, String snsWriter, int snsBoardNo, String replyComment,
			String replyTime) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.snsWriter = snsWriter;
		this.snsBoardNo = snsBoardNo;
		this.replyComment = replyComment;
		this.replyTime = replyTime;
	}
	
	public ReplyVO(String replyWriter, String snsWriter, int snsBoardNo, String replyComment) {
		super();
		this.replyWriter = replyWriter;
		this.snsWriter = snsWriter;
		this.snsBoardNo = snsBoardNo;
		this.replyComment = replyComment;
	}
	
	
	public ReplyVO(int replyNo, String replyComment) {
		super();
		this.replyNo = replyNo;
		this.replyComment = replyComment;
	}
	
	// SOUND Reply
	public ReplyVO(String replyWriter, String soundWriter, int soundBoardNo, String replyComment,
			String replyTime, int replyNo) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.soundWriter = soundWriter;
		this.soundBoardNo = soundBoardNo;
		this.replyComment = replyComment;
		this.replyTime = replyTime;
	}
	
	public ReplyVO(String replyWriter, String soundWriter, String replyComment, int soundBoardNo) {
		super();
		this.replyWriter = replyWriter;
		this.soundWriter = soundWriter;
		this.soundBoardNo = soundBoardNo;
		this.replyComment = replyComment;
	}
	
	
	public ReplyVO(String replyComment, int replyNo){
		super();
		this.replyNo = replyNo;
		this.replyComment = replyComment;
	}
	
	public ReplyVO() {
		super();
	}
	
	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", replyWriter=" + replyWriter + ", snsWriter=" + snsWriter
				+ ", soundWriter=" + soundWriter + ", snsBoardNo=" + snsBoardNo + ", soundBoardNo=" + soundBoardNo
				+ ", replyComment=" + replyComment + ", replyTime=" + replyTime + "]";
	}
	
	
}
