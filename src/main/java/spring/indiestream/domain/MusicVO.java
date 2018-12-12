package spring.indiestream.domain;

public class MusicVO {
	private int musicNo;
	private String memberId;
	private String soundWriter;
	private int misucListNo;
	private int soundBoardNo;
	
	public int getMusicNo() {
		return musicNo;
	}
	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getSoundWriter() {
		return soundWriter;
	}
	public void setSoundWriter(String soundWriter) {
		this.soundWriter = soundWriter;
	}
	public int getMisucListNo() {
		return misucListNo;
	}
	public void setMisucListNo(int misucListNo) {
		this.misucListNo = misucListNo;
	}
	public int getSoundBoardNo() {
		return soundBoardNo;
	}
	public void setSoundBoardNo(int soundBoardNo) {
		this.soundBoardNo = soundBoardNo;
	}
	
	@Override
	public String toString() {
		return "MusicVO [musicNo=" + musicNo + ", memberId=" + memberId + ", soundWriter=" + soundWriter
				+ ", misucListNo=" + misucListNo + ", soundBoardNo=" + soundBoardNo + "]";
	}
	
	
	
}
