package spring.indiestream.service;

import java.sql.SQLException;
import java.util.List;

import spring.indiestream.dao.impl.GenreDAOImpl;
import spring.indiestream.domain.MemberVO;

public interface MemberService {
   
   void deleteMember(String memberId) throws SQLException;
   void registerMember(MemberVO vo) throws SQLException;
   MemberVO login(MemberVO vo) throws SQLException;
   MemberVO findById(String memberId)throws SQLException;
   void updateMember(MemberVO vo)throws SQLException;
   MemberVO findByPhoneNumber(String phoneNumber)throws SQLException;
   boolean idCheck(String id) throws SQLException;
   boolean phoneNumberCheck(String phoneNumber) throws SQLException;
  
   //message
   int selectMessageNoticeCount(String receiveId);
   //genre
   List<String> selectGenreByMemberId(String memverId);
   
   int memberProfilePhotoUpload(MemberVO vo) throws SQLException;
   void memberintroductionUpdate(MemberVO vo)throws SQLException;
 //memberReportCount
   void memberReportCount(String memberId)throws SQLException;
   
   List<MemberVO> memberSearchArtist(String memberId) throws SQLException;
}