package spring.indiestream.dao;

import java.util.List;

import spring.indiestream.domain.message.MemberMessageRoomVO;

public interface MessageRoomDAO {
	int insertMemberMessageRoom(MemberMessageRoomVO memberMessageRoom);
	int deleteMemberMessageRoom(MemberMessageRoomVO memberMessageRoom);
	int updateMemberMessageRoomName(MemberMessageRoomVO memberMessageRoom);
	int initMemberMessageRoomNotice(MemberMessageRoomVO memberMessageRoom);
	int increaseMemberMessageRoomNotice(int messageRoomNo);
	
	List<MemberMessageRoomVO> selectMessageRoomById(String loginId);
	List<String> selectIdByMessageRoomNo(int messageRoomNo);
	List<MemberMessageRoomVO> selectMessageRoom(String messageRoomNo);
	MemberMessageRoomVO findMessageRoom(String loginId, int messageRoomNo);
}
