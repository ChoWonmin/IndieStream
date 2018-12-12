package spring.indiestream.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.ManagerDAO;
import spring.indiestream.domain.ManagerVO;

@Repository
public class ManagerDAOImpl implements ManagerDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public ManagerVO selectOneManager(ManagerVO managerVO) {
		return sqlSession.selectOne("managerMapper.selectOneManager", managerVO);
	}

	@Override
	public int insertOneManager(ManagerVO managerVO) {
		return sqlSession.insert("managerMapper.insertOneManager", managerVO);
	}

}
