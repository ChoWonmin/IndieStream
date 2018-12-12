package spring.indiestream.service;

import java.sql.SQLException;
import java.util.List;

import spring.indiestream.domain.message.MemberMessageRoomVO;
import spring.indiestream.domain.message.MessageVO;

public interface MessageService {
	int writeMessage(MessageVO message);
	List<MessageVO> selectMessage(String loginId, String messageRoomNo) throws SQLException;
	
	int createMessageRoom(String loginId, String targetId) throws SQLException;
	int inviteMember(MemberMessageRoomVO memberMessageRoom);
	
	void exitMessageRoom(String loginId, String messageRoomNo);
	int updateMemberMessageRoomName(MemberMessageRoomVO memberMessageRoom);
	int initMemberMessageRoomNotice(MemberMessageRoomVO memberMessageRoom);
	List<MemberMessageRoomVO> selectMessageRoomById(String loginId) throws SQLException;
	List<String> selectIdByMessageRoomNo(int messageRoomNo);
	MemberMessageRoomVO findMessageRoom(String loginId, int messageRoomNo) throws SQLException;
	
}
