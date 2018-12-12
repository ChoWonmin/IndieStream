package spring.indiestream.dao;

import java.util.List;

import spring.indiestream.domain.message.MemberMessageRoomVO;
import spring.indiestream.domain.message.MessageRoomVO;
import spring.indiestream.domain.message.MessageVO;

public interface MessageDAO {
	int writeMessage(MessageVO message); // 占쌨쇽옙占쏙옙 占쌜쇽옙
	int deleteMessage(String messageNo); // 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占�
	List<MessageVO> selectMessage(MemberMessageRoomVO memberMessageRoom); 
	
	int insertMessageRoom(MessageRoomVO messageRoomVO); // 占쏙옙占싸울옙 占쏙옙 占쏙옙占쏙옙占�
	int deleteMessageRoom(String messageRoomNo); // 占썸에 占쌍댐옙 占쏙옙占쏙옙占� 占쏙옙 占쌕곤옙占쏙옙 占쏙옙占�
	int changeMultiple(int messageRoomNo); // 占십댐옙 占쏙옙튼
	boolean isMultiple(int messageRoomNo); // multiple 확占쏙옙
	int selectLastMessageRoomNo();
	
	
	
}	
