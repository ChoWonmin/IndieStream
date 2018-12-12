package spring.indiestream.domain;

public class ImageVO {
	private int snsImageNo;
	private int snsBoardNo;
	private String snsWriter;
	private String snsImageUrl;
	
	
	public ImageVO(int snsImageNo, int snsBoardNo) {
		super();
		this.snsImageNo = snsImageNo;
		this.snsBoardNo = snsBoardNo;
	}



	public ImageVO(int snsImageNo, int snsBoardNo, String snsWriter, String snsImageUrl) {
		super();
		this.snsImageNo = snsImageNo;
		this.snsBoardNo = snsBoardNo;
		this.snsWriter = snsWriter;
		this.snsImageUrl = snsImageUrl;
	}
	
	

	public ImageVO() {
		super();
	}

	public int getSnsImageNo() {
		return snsImageNo;
	}

	public void setSnsImageNo(int snsImageNo) {
		this.snsImageNo = snsImageNo;
	}

	public int getSnsBoardNo() {
		return snsBoardNo;
	}

	public void setSnsBoardNo(int snsBoardNo) {
		this.snsBoardNo = snsBoardNo;
	}

	public String getSnsWriter() {
		return snsWriter;
	}

	public void setSnsWriter(String snsWriter) {
		this.snsWriter = snsWriter;
	}

	public String getSnsImageUrl() {
		return snsImageUrl;
	}

	public void setSnsImageUrl(String snsImageUrl) {
		this.snsImageUrl = snsImageUrl;
	}

	@Override
	public String toString() {
		return "ImageVO [snsImageNo=" + snsImageNo + ", snsBoardNo=" + snsBoardNo + ", snsWriter=" + snsWriter
				+ ", snsImageUrl=" + snsImageUrl + "]";
	}
	
	
	
}
