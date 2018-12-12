package spring.indiestream.domain;

import java.util.List;

public class SearchVO {
	private List<SnsBoardVO> snsBoardList;
	private List<SoundBoardVO> soundBoardList;
	private List<HashtagVO> hashtagList;
	//수정 artist
	private List<MemberVO> memberList;
	


	public SearchVO(List<SnsBoardVO> snsBoardList, List<SoundBoardVO> soundBoardList, List<HashtagVO> hashtagList,
			List<MemberVO> memberList) {
		super();
		this.snsBoardList = snsBoardList;
		this.soundBoardList = soundBoardList;
		this.hashtagList = hashtagList;
		this.memberList = memberList;
	}

	public SearchVO() {
		super();
	}
	
	public List<SnsBoardVO> getSnsBoardList() {
		return snsBoardList;
	}
	public void setSnsBoardList(List<SnsBoardVO> snsBoardList) {
		this.snsBoardList = snsBoardList;
	}
	public List<SoundBoardVO> getSoundBoardList() {
		return soundBoardList;
	}
	public void setSoundBoardList(List<SoundBoardVO> soundBoardList) {
		this.soundBoardList = soundBoardList;
	}
	public List<HashtagVO> getHashtagList() {
		return hashtagList;
	}
	public List<MemberVO> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<MemberVO> memberList) {
		this.memberList = memberList;
	}

	public void setHashtagList(List<HashtagVO> hashtagList) {
		this.hashtagList = hashtagList;
	}
	
	@Override
	public String toString() {
		return "SearchVO [snsBoardList=" + snsBoardList + ", soundBoardList=" + soundBoardList + ", hashtagList="
				+ hashtagList + "]";
	}
}
