package spring.indiestream.domain.message;

import java.util.List;

import spring.indiestream.domain.MemberVO;

public class MessageVO {

	private int messageNo;
	private int messageRoomNo;
	private String sendId;
	private String messageComment;
	private String messageTime;
	private MemberVO member;
	
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public int getMessageRoomNo() {
		return messageRoomNo;
	}
	public void setMessageRoomNo(int messageRoomNo) {
		this.messageRoomNo = messageRoomNo;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getMessageComment() {
		return messageComment;
	}
	public void setMessageComment(String messageComment) {
		this.messageComment = messageComment;
	}
	public String getMessageTime() {
		return messageTime;
	}
	public void setMessageTime(String messageTime) {
		this.messageTime = messageTime;
	}
	public MemberVO getMember() {
		return member;
	}
	public void setMember(MemberVO member) {
		this.member = member;
	}
	
}
