package spring.indiestream.domain.message;

import java.util.ArrayList;
import java.util.List;

import spring.indiestream.domain.MemberVO;

public class MemberMessageRoomVO {
	private int messageRoomNo;
	private String memberId;
	private int messageRoomNotice;
	private String messageRoomName;
	private String messageRoomTime;
	private boolean multiple;
	
	private List<MemberVO> memberList;
	
	public int getMessageRoomNo() {
		return messageRoomNo;
	}
	public void setMessageRoomNo(int messageRoomNo) {
		this.messageRoomNo = messageRoomNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getMessageRoomNotice() {
		return messageRoomNotice;
	}
	public void setMessageRoomNotice(int messageRoomNotice) {
		this.messageRoomNotice = messageRoomNotice;
	}
	public String getMessageRoomName() {
		return messageRoomName;
	}
	public void setMessageRoomName(String messageRoomName) {
		this.messageRoomName = messageRoomName;
	}
	public String getMessageRoomTime() {
		return messageRoomTime;
	}
	public void setMessageRoomTime(String messageRoomTime) {
		this.messageRoomTime = messageRoomTime;
	}
	public boolean isMultiple() {
		return multiple;
	}
	public void setMultiple(boolean multiple) {
		this.multiple = multiple;
	}
	public List<MemberVO> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<MemberVO> memberList) {
		this.memberList = memberList;
	}
	@Override
	public String toString() {
		return "MemberMessageRoomVO [messageRoomNo=" + messageRoomNo + ", memberId=" + memberId + ", messageRoomNotice="
				+ messageRoomNotice + ", messageRoomName=" + messageRoomName + ", messageRoomTime=" + messageRoomTime
				+ ", multiple=" + multiple + ", memberList=" + memberList + "]";
	}
	
	
}
