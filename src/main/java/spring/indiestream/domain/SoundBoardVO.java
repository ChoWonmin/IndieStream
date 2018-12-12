package spring.indiestream.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SoundBoardVO {
	private int soundBoardNo;
	private String soundTitle;
	private String soundWriter;
	private String soundUrl;
	private String soundContent;
	private String soundPhoto;
	private String soundGenre;
	private String postedTime;
	private int soundCount;
	private int likeCount;
	

	private List<LikerVO> likerList;
	private List<ReplyVO> replyList;
	private List<HashtagVO> hashtagList;
	private List<ReportVO> reportList;
	
	private String orgfilename;
	private String newfilename;
	private MultipartFile uploadSoundUrl;
	private MultipartFile uploadFilePhoto;

	public MultipartFile getUploadSoundUrl() {
		return uploadSoundUrl;
	}

	public void setUploadSoundUrl(MultipartFile uploadSoundUrl) {
		this.uploadSoundUrl = uploadSoundUrl;
	}

	public SoundBoardVO() {
	}
	
	public SoundBoardVO(String soundWriter, String soundUrl, String soundContent, String soundPhoto) {
		this.soundWriter = soundWriter;
		this.soundUrl = soundUrl;
		this.soundContent = soundContent;
		this.soundPhoto = soundPhoto;
	}
	
	public int getSoundBoardNo() {
		return soundBoardNo;
	}
	
	public void setSoundBoardNo(int soundBoardNo) {
		this.soundBoardNo = soundBoardNo;
	}
	
	
	
	public String getSoundTitle() {
		return soundTitle;
	}

	public void setSoundTitle(String soundTitle) {
		this.soundTitle = soundTitle;
	}

	public String getSoundWriter() {
		return soundWriter;
	}
	
	public void setSoundWriter(String soundWriter) {
		this.soundWriter = soundWriter;
	}
	
	public String getSoundUrl() {
		return soundUrl;
	}
	
	public void setSoundUrl(String soundUrl) {
		this.soundUrl = soundUrl;
	}
	
	public String getSoundContent() {
		return soundContent;
	}
	
	public void setSoundContent(String soundContent) {
		this.soundContent = soundContent;
	}
	
	public String getSoundPhoto() {
		return soundPhoto;
	}
	
	public void setSoundPhoto(String soundPhoto) {
		this.soundPhoto = soundPhoto;
	}
	
	
	
	public String getSoundGenre() {
		return soundGenre;
	}

	public void setSoundGenre(String soundGenre) {
		this.soundGenre = soundGenre;
	}

	public String getPostedTime() {
		return postedTime;
	}
	
	public void setPostedTime(String postedTime) {
		this.postedTime = postedTime;
	}
	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	

	public int getSoundCount() {
		return soundCount;
	}

	public void setSoundCount(int soundCount) {
		this.soundCount = soundCount;
	}

	public List<LikerVO> getLikerList() {
		return likerList;
	}
	
	public void setLikerList(List<LikerVO> likerList) {
		this.likerList = likerList;
	}
	
	public List<ReplyVO> getReplyList() {
		return replyList;
	}
	
	public void setReplyList(List<ReplyVO> replyList) {
		this.replyList = replyList;
	}
	
	public List<HashtagVO> getHashtagList() {
		return hashtagList;
	}
	
	public void setHashtagList(List<HashtagVO> hashtagList) {
		this.hashtagList = hashtagList;
	}
	
	public List<ReportVO> getReportList() {
		return reportList;
	}
	
	public void setReportList(List<ReportVO> reportList) {
		this.reportList = reportList;
	}
	
	public String getOrgfilename() {
		return orgfilename;
	}

	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}

	public String getNewfilename() {
		return newfilename;
	}

	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}
	

	public MultipartFile getUploadFilePhoto() {
		return uploadFilePhoto;
	}

	public void setUploadFilePhoto(MultipartFile uploadFilePhoto) {
		this.uploadFilePhoto = uploadFilePhoto;
	}

	@Override
	public String toString() {
		return "SoundBoardVO [soundBoardNo=" + soundBoardNo + ", soundTitle=" + soundTitle + ", soundWriter="
				+ soundWriter + ", soundUrl=" + soundUrl + ", soundContent=" + soundContent + ", soundPhoto="
				+ soundPhoto + ", soundGenre=" + soundGenre + ", postedTime=" + postedTime + ", soundCount="
				+ soundCount + ", likerList=" + likerList + ", replyList=" + replyList + ", hashtagList=" + hashtagList
				+ ", reportList=" + reportList + ", orgfilename=" + orgfilename + ", newfilename=" + newfilename
				+ ", uploadSoundUrl=" + uploadSoundUrl + ", uploadFilePhoto=" + uploadFilePhoto + "]";
	}

	

	
	
	
	
}
