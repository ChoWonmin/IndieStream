package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.TopicDAO;

@Repository
public class TopicDAOImpl implements TopicDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<String> selectTopic() {
		return sqlsession.selectList("topicMapper.selectTopic");
	}

	@Override
	public int insertTopic(String topic) {
		return sqlsession.insert("topicMapper.insertTopic", topic);
	}

	@Override
	public int deleteTopic(String topic) {
		return sqlsession.delete("topicMapper.deleteTopic", topic);
	}

}
