package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.ListDAO;
import spring.indiestream.domain.SnsBoardVO;
import util.page.PageModel;

@Repository
public class ListDAOImpl implements ListDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SnsBoardVO> selectFollowSnsBoard(PageModel pageModel) {
		return sqlSession.selectList("snsMapper.selectFollowSnsBoard", pageModel);
	}

}
