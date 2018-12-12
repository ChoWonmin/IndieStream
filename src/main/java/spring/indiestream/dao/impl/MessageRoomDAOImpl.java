	package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.MessageRoomDAO;
import spring.indiestream.domain.message.MemberMessageRoomVO;

@Repository
public class MessageRoomDAOImpl implements MessageRoomDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMemberMessageRoom(MemberMessageRoomVO memberMessageRoom) {
		return sqlSession.insert("messageMapper.insertMemberMessageRoom", memberMessageRoom);
	} 

	@Override
	public int deleteMemberMessageRoom(MemberMessageRoomVO memberMessageRoom) {
		return sqlSession.delete("messageMapper.deleteMemberMessageRoom", memberMessageRoom);
	}

	@Override
	public int updateMemberMessageRoomName(MemberMessageRoomVO memberMessageRoom) {
		return sqlSession.update("messageMapper.updateMemberMessageRoomName", memberMessageRoom);
	}

	@Override
	public int initMemberMessageRoomNotice(MemberMessageRoomVO memberMessageRoom) {
		return sqlSession.update("messageMapper.initMemberMessageRoomNotice", memberMessageRoom);
	}

	@Override
	public int increaseMemberMessageRoomNotice(int messageRoomNo) {
		return sqlSession.update("messageMapper.increaseMemberMessageRoomNotice", messageRoomNo);
	}

	@Override
	public List<MemberMessageRoomVO> selectMessageRoomById(String loginId) {
		return sqlSession.selectList("messageMapper.selectMessageRoomById", loginId);
	}

	@Override
	public List<String> selectIdByMessageRoomNo(int messageRoomNo) {
		return sqlSession.selectList("messageMapper.selectIdByMessageRoomNo", messageRoomNo);
	}

	@Override
	public List<MemberMessageRoomVO> selectMessageRoom(String messageRoomNo) {
		return sqlSession.selectList("messageMapper.selectMessageRoom", messageRoomNo);
	}

	@Override
	public MemberMessageRoomVO findMessageRoom(String loginId, int messageRoomNo) {
		MemberMessageRoomVO mmr = new MemberMessageRoomVO();
		
		mmr.setMemberId(loginId);
		mmr.setMessageRoomNo(messageRoomNo);
		
		System.out.println(loginId + " --  " + messageRoomNo);
		
		return sqlSession.selectOne("messageMapper.findMessageRoom", mmr);
	}

}
