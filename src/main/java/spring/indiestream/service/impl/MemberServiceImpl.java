package spring.indiestream.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.MemberDAO;
import spring.indiestream.dao.impl.GenreDAOImpl;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{
    @Autowired
	private MemberDAO memberDAO;
   
   @Override
   public void deleteMember(String memberId) throws SQLException {
      memberDAO.deleteMember(memberId);
   }

   @Override
   public void registerMember(MemberVO vo) throws SQLException {
      memberDAO.registerMember(vo);
   }

   @Override
   public MemberVO login(MemberVO vo) throws SQLException {
      
      MemberVO loginMvo = memberDAO.login(vo);
      if(loginMvo!=null)
      loginMvo.setGenreList(memberDAO.selectGenreByMemberId(vo.getMemberId()));
      
      return loginMvo;
   }

   @Override
   public MemberVO findById(String memberId) throws SQLException {

      return memberDAO.findById(memberId);
   }

   @Override
   public void updateMember(MemberVO vo) throws SQLException {
      
      memberDAO.updateMember(vo);
   }

   @Override
   public MemberVO findByPhoneNumber(String phoneNumber) throws SQLException {
      
      return memberDAO.findByPhoneNumber(phoneNumber);
   }

   @Override
   public boolean idCheck(String id) throws SQLException {
      boolean duplicated = false;
      
      if(memberDAO.idCheck(id)>0) duplicated = true;
      return duplicated;
   }

   @Override
   public boolean phoneNumberCheck(String phoneNumber) throws SQLException {
      boolean duplicated = false;
      
      if(memberDAO.phoneNumberCheck(phoneNumber)>0) duplicated = true;
      return duplicated;
   }
   
   @Override
   public int selectMessageNoticeCount(String receiveId) {
		return memberDAO.selectMessageNoticeCount(receiveId);
   }

	@Override
	public List<String> selectGenreByMemberId(String memverId) {
		return memberDAO.selectGenreByMemberId(memverId);
	}

	@Override
	public int memberProfilePhotoUpload(MemberVO vo) throws SQLException {
	      
	   return memberDAO.memberProfilePhotoUpload(vo);
	}

	@Override
	public void memberintroductionUpdate(MemberVO vo) throws SQLException {
	   memberDAO.memberintroductionUpdate(vo);
	   
	}

	@Override
	public void memberReportCount(String memberId) throws SQLException {
		memberDAO.memberReportCount(memberId);
	}

	@Override
	public List<MemberVO> memberSearchArtist(String memberId) throws SQLException {
		return memberDAO.memberSearchArtist(memberId);
	}	
   
}