package spring.indiestream.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.FollowVO;
import spring.indiestream.domain.MemberVO;

public interface TopicDAO {
	List<String> selectTopic();
	int insertTopic(String topic);
	int deleteTopic(String topic);
}
