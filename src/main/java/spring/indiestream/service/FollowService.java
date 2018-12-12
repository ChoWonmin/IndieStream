package spring.indiestream.service;

import java.util.List;

import spring.indiestream.domain.FollowVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.SoundBoardVO;

public interface FollowService {
	void insertFollow(FollowVO followVO);
	List<MemberVO> selectFollowIdByMemberId(String memberId);
	void deleteFollow(FollowVO followVO);
	List<MemberVO> selectFollowCheckList(String memberId);
	void checkFollow(FollowVO followVO);
	List<MemberVO> selectFollowedIdByMemberId(String memberId);
}
