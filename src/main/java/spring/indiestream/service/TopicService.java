package spring.indiestream.service;

import java.util.List;

public interface TopicService {
	List<String> selectTopic();
	int insertTopic(String topic);
	int deleteTopic(String topic);
}
