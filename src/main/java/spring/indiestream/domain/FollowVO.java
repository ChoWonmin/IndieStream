package spring.indiestream.domain;

public class FollowVO {
	private String followId;
	private String followedId;
	private boolean checking;
	
	public String getFollowId() {
		return followId;
	}
	public void setFollowId(String followId) {
		this.followId = followId;
	}
	public String getFollowedId() {
		return followedId;
	}
	public void setFollowedId(String followedId) {
		this.followedId = followedId;
	}
	public boolean isChecking() {
		return checking;
	}
	public void setChecking(boolean checking) {
		this.checking = checking;
	}
	
}
