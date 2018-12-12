package spring.indiestream.domain;

public class NomalNoticeVO {

	private int nomalNoticeNo;
	private String memberId;
	private boolean checking;
	private int replyNo;
	private String replyWriter;
	private int snsBoardNo;
	private int soundBoardNo;
	private String snsWriter;
	private String soundWriter;
	private String followingId;
	private String followId;
	public int getNomalNoticeNo() {
		return nomalNoticeNo;
	}
	public void setNomalNoticeNo(int nomalNoticeNo) {
		this.nomalNoticeNo = nomalNoticeNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public boolean isChecking() {
		return checking;
	}
	public void setChecking(boolean checking) {
		this.checking = checking;
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
	public String getFollowingId() {
		return followingId;
	}
	public void setFollowingId(String followingId) {
		this.followingId = followingId;
	}
	public String getFollowId() {
		return followId;
	}
	public void setFollowId(String followId) {
		this.followId = followId;
	}
	@Override
	public String toString() {
		return "NomalNoticeVO [nomalNoticeNo=" + nomalNoticeNo + ", memberId=" + memberId + ", checking=" + checking
				+ ", replyNo=" + replyNo + ", replyWriter=" + replyWriter + ", snsBoardNo=" + snsBoardNo
				+ ", soundBoardNo=" + soundBoardNo + ", snsWriter=" + snsWriter + ", soundWriter=" + soundWriter
				+ ", followingId=" + followingId + ", followId=" + followId + "]";
	}
	
	
}
