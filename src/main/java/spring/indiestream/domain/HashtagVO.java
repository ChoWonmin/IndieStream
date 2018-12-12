package spring.indiestream.domain;


public class HashtagVO {
	private int snsBoardNo;
	private int soundBoardNo;
	private String snsWriter;
	private String soundWriter;
	private String keyword;
	private int hcount;


	public int getHcount() {
		return hcount;
	}
	public void setHcount(int hcount) {
		this.hcount = hcount;
	}
	public HashtagVO(int soundBoardNo, String soundWriter, String keyword) {
		super();
		this.soundBoardNo = soundBoardNo;
		this.soundWriter = soundWriter;
		this.keyword = keyword;
	}
	public HashtagVO(String snsWriter, String keyword , int snsBoardNo) {
		super();
		this.snsBoardNo = snsBoardNo;
		this.snsWriter = snsWriter;
		this.keyword = keyword;
	}
	public HashtagVO(int snsBoardNo, int soundBoardNo, String snsWriter, String soundWriter, String keyword) {
		super();
		this.snsBoardNo = snsBoardNo;
		this.soundBoardNo = soundBoardNo;
		this.snsWriter = snsWriter;
		this.soundWriter = soundWriter;
		this.keyword = keyword;
	}
	public HashtagVO() {}
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "HashtagVO [snsBoardNo=" + snsBoardNo + ", soundBoardNo=" + soundBoardNo + ", snsWriter=" + snsWriter
				+ ", soundWriter=" + soundWriter + ", keyword=" + keyword + ", hcount=" + hcount + "]";
	}
	



}