package spring.indiestream.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.ListDAO;
import spring.indiestream.dao.MemberDAO;
import spring.indiestream.dao.SnsBoardDAO;
import spring.indiestream.domain.SnsBoardVO;
import spring.indiestream.service.ListService;
import util.page.PageModel;

@Service
public class ListServiceImpl implements ListService {

	@Autowired
	private ListDAO listDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List<SnsBoardVO> selectFollowSnsBoard(String loginId, int page) throws SQLException {
		PageModel pageModel = new PageModel();
		
		pageModel.setContetnNumber(10);
		pageModel.setKey(loginId);
		pageModel.setPage(page);
		
		List<SnsBoardVO> result = listDAO.selectFollowSnsBoard(pageModel);
		
		for(SnsBoardVO sns:result)
			sns.setMember(memberDAO.findById(sns.getSnsWriter()));
			
		
		return result;
	}

}
