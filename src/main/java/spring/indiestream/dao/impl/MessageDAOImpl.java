package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.MessageDAO;
import spring.indiestream.domain.message.MemberMessageRoomVO;
import spring.indiestream.domain.message.MessageRoomVO;
import spring.indiestream.domain.message.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int writeMessage(MessageVO message) {
		return sqlSession.insert("messageMapper.writeMessage", message);
	}

	@Override
	public int deleteMessage(String messageNo) {
		return sqlSession.delete("messageMapper.deleteMessage", messageNo);
	}

	@Override
	public List<MessageVO> selectMessage(MemberMessageRoomVO memberMessageRoom) {
		return sqlSession.selectList("messageMapper.selectMessage", memberMessageRoom);
	}

	@Override
	public int insertMessageRoom(MessageRoomVO messageRoomVO) {
		return sqlSession.insert("messageMapper.insertMessageRoom", messageRoomVO);
	}

	@Override
	public int deleteMessageRoom(String messageRoomNo) {
		return sqlSession.delete("messageMapper.deleteMessageRoom", messageRoomNo);
	}

	@Override
	public int changeMultiple(int messageRoomNo) {
		return sqlSession.update("messageMapper.changeMultiple", messageRoomNo);
	}

	@Override
	public boolean isMultiple(int messageRoomNo) {
		return sqlSession.selectOne("messageMapper.isMultiple", messageRoomNo);
	}

	@Override
	public int selectLastMessageRoomNo() {
		return sqlSession.selectOne("messageMapper.selectLastMessageRoomNo");
	}

}
