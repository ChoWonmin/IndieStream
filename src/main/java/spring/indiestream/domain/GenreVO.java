package spring.indiestream.domain;

public class GenreVO {
	private String memberId;
	private String topic;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	@Override
	public String toString() {
		return "GenreVO [memberId=" + memberId + ", topic=" + topic + "]";
	}
	
}
