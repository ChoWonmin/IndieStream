package spring.indiestream.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.FollowDAO;
import spring.indiestream.domain.FollowVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.service.FollowService;

@Service
public class FollowServiceImpl implements FollowService {
	
	@Autowired
	private FollowDAO followDAO;
	
	@Override
	public void insertFollow(FollowVO followVO) {
		followDAO.insertFollow(followVO);
	}

	@Override
	public List<MemberVO> selectFollowIdByMemberId(String memberId) {
		return followDAO.selectFollowIdByMemberId(memberId);
	}

	@Override
	public List<MemberVO> selectFollowedIdByMemberId(String memberId) {
		return followDAO.selectFollowedIdByMemberId(memberId);
	}

	@Override
	public void deleteFollow(FollowVO followVO) {
		followDAO.deleteFollow(followVO);
	}

	@Override
	public void checkFollow(FollowVO followVO) {
		followDAO.checkFollow(followVO);
	}

	@Override
	public List<MemberVO> selectFollowCheckList(String memberId) {
		return followDAO.selectFollowCheckList(memberId);
	}

}
