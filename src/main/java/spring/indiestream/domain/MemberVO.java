package spring.indiestream.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String memberId;
	private String password;
	private String profilePhoto;
	private String introduction;
	private String phoneNumber;
	private List<String> genreList;
   
	private int messageNoticeCount;
	private int reportCount;
   
	private MultipartFile uploadFile;
	
	private List<MemberVO> followList;
   	private List<MemberVO> followingList;
	private List<SnsBoardVO> snsBoardList;
	private List<SoundBoardVO> soundBoardList;
   	
   	
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfilePhoto() {
		return profilePhoto;
	}
	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public List<String> getGenreList() {
		return genreList;
	}
	public void setGenreList(List<String> genreList) {
		this.genreList = genreList;
	}
	public int getMessageNoticeCount() {
		return messageNoticeCount;
	}
	public void setMessageNoticeCount(int messageNoticeCount) {
		this.messageNoticeCount = messageNoticeCount;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public List<MemberVO> getFollowList() {
		return followList;
	}
	public void setFollowList(List<MemberVO> followList) {
		this.followList = followList;
	}
	public List<MemberVO> getFollowingList() {
		return followingList;
	}
	public void setFollowingList(List<MemberVO> followingList) {
		this.followingList = followingList;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
}