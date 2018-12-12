package spring.indiestream.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.FollowVO;
import spring.indiestream.domain.MemberVO;

public interface FollowDAO {
	void insertFollow(FollowVO followVO);
	List<MemberVO> selectFollowIdByMemberId(String memberId);
	void deleteFollow(FollowVO followVO);
	List<MemberVO> selectFollowCheckList(String memberId);
	void checkFollow(FollowVO followVO);
	List<MemberVO> selectFollowedIdByMemberId(String memberId);
}
