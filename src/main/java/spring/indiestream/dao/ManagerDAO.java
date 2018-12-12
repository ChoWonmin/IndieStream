package spring.indiestream.dao;


import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.ManagerVO;

public interface ManagerDAO {
	void setSqlSession(SqlSession sqlSession);
	
	ManagerVO selectOneManager(ManagerVO managerVO);
	int insertOneManager(ManagerVO managerVO);
	
}
