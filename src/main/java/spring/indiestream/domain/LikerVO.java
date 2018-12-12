package spring.indiestream.domain;

public class LikerVO {
	private int snsBoardNo;
	private int soundBoardNo;
	private String soundWriter;
	private String snsWriter;
	private String liker;//좋아요를 누른사람
	//private List<LikerVO> likerList;
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
	public String getSoundWriter() {
		return soundWriter;
	}
	public void setSoundWriter(String soundWriter) {
		this.soundWriter = soundWriter;
	}
	public String getSnsWriter() {
		return snsWriter;
	}
	public void setSnsWriter(String snsWriter) {
		this.snsWriter = snsWriter;
	}
	public String getLiker() {
		return liker;
	}
	public void setLiker(String liker) {
		this.liker = liker;
	}
/*	public List<LikerVO> getLikerList() {
		return likerList;
	}
	public void setLikerList(List<LikerVO> likerList) {
		this.likerList = likerList;
	}*/
	@Override
	public String toString() {
		return "LikeVO [snsBoardNo=" + snsBoardNo + ", soundBoardNo=" + soundBoardNo + ", soundWriter=" + soundWriter
				+ ", snsWriter=" + snsWriter + ", liker=" + liker + "]";
	}
	public LikerVO(int snsBoardNo, String snsWriter, String liker) {
		super();
		this.snsBoardNo = snsBoardNo;
		this.snsWriter = snsWriter;
		this.liker = liker;
	}
	
	public LikerVO(String soundWriter, String liker, int soundBoardNo) {
		super();
		this.soundBoardNo = soundBoardNo;
		this.soundWriter = soundWriter;
		this.liker = liker;
	}
	public LikerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
