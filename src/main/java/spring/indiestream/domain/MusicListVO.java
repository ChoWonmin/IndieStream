package spring.indiestream.domain;

public class MusicListVO {
	private int musicListNo;
	private String memberId;
	private String listName;
	
	public int getMusicListNo() {
		return musicListNo;
	}
	public void setMusicListNo(int musicListNo) {
		this.musicListNo = musicListNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getListName() {
		return listName;
	}
	public void setListName(String listName) {
		this.listName = listName;
	}
	
	@Override
	public String toString() {
		return "MusicListVO [musicListNo=" + musicListNo + ", memberId=" + memberId + ", listName=" + listName + "]";
	}
	
}
