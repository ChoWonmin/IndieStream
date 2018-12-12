package spring.indiestream.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SnsBoardVO {
	private int snsBoardNo;
	private String snsWriter;
	private String postedTime;
	private String snsContent;
	private String videoUrl;
	private List<ImageVO> imageList;
	private List<LikerVO> likerList;
	
	private int likeCount;
	private MemberVO member;

	private List<ReplyVO> replyList;
	private List<HashtagVO> hashtagList;
	private List<ReportVO> reportList;
	private MultipartFile uploadFile;
	private MultipartFile uploadFileVideo;
	
	private int checkDone;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getSnsBoardNo() {
		return snsBoardNo;
	}
	public void setSnsBoardNo(int snsBoardNo) {
		this.snsBoardNo = snsBoardNo;
	}
	public MemberVO getMember() {
		return member;
	}
	public void setMember(MemberVO member) {
		this.member = member;
	}
	public String getSnsWriter() {
		return snsWriter;
	}
	public void setSnsWriter(String snsWriter) {
		this.snsWriter = snsWriter;
	}
	public String getPostedTime() {
		return postedTime;
	}
	public void setPostedTime(String postedTime) {
		this.postedTime = postedTime;
	}
	public String getSnsContent() {
		return snsContent;
	}
	public void setSnsContent(String snsContent) {
		this.snsContent = snsContent;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	public List<ImageVO> getImageList() {
		return imageList;
	}
	public void setImageList(List<ImageVO> imageList) {
		this.imageList = imageList;
	}
	public int getCheckDone() {
		return checkDone;
	}
	public void setCheckDone(int checkDone) {
		this.checkDone = checkDone;
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
	public MultipartFile getUploadFileVideo() {
		return uploadFileVideo;
	}
	public void setUploadFileVideo(MultipartFile uploadFileVideo) {
		this.uploadFileVideo = uploadFileVideo;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public SnsBoardVO(int snsBoardNo, String snsWriter, String postedTime, String snsContent, String videoUrl) {
		super();
		this.snsBoardNo = snsBoardNo;
		this.snsWriter = snsWriter;
		this.postedTime = postedTime;
		this.snsContent = snsContent;
		this.videoUrl = videoUrl;
	}
	
	public SnsBoardVO(int snsBoardNo, String snsWriter, String postedTime, String snsContent, String videoUrl,
			List<ImageVO> imageList, List<LikerVO> likerList, MultipartFile uploadFile, int checkDone) {
		super();
		this.snsBoardNo = snsBoardNo;
		this.snsWriter = snsWriter;
		this.postedTime = postedTime;
		this.snsContent = snsContent;
		this.videoUrl = videoUrl;
		this.imageList = imageList;
		this.likerList = likerList;
		this.uploadFile = uploadFile;
		this.checkDone = checkDone;
	}
	
	
	public SnsBoardVO(int snsBoardNo, String snsWriter, String postedTime, String snsContent, String videoUrl,
			List<ImageVO> imageList, List<LikerVO> likerList, List<ReplyVO> replyList, List<HashtagVO> hashtagList,
			List<ReportVO> reportList, MultipartFile uploadFile, int checkDone) {
		super();
		this.snsBoardNo = snsBoardNo;
		this.snsWriter = snsWriter;
		this.postedTime = postedTime;
		this.snsContent = snsContent;
		this.videoUrl = videoUrl;
		this.imageList = imageList;
		this.likerList = likerList;
		this.replyList = replyList;
		this.hashtagList = hashtagList;
		this.reportList = reportList;
		this.uploadFile = uploadFile;
		this.checkDone = checkDone;
	}
	public SnsBoardVO() {
		super();
	}
	
	
}
