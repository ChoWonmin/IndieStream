package spring.indiestream.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.TopicDAO;
import spring.indiestream.service.TopicService;

@Service
public class TopicServiceImpl implements TopicService{
	
	@Autowired
	private TopicDAO topicDAO;
	
	@Override
	public List<String> selectTopic() {
		return topicDAO.selectTopic();
	}

	@Override
	public int insertTopic(String topic) {
		return topicDAO.insertTopic(topic);
	}

	@Override
	public int deleteTopic(String topic) {
		return topicDAO.deleteTopic(topic);
	}

}
