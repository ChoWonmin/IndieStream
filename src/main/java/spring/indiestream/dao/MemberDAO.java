package spring.indiestream.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.dao.impl.GenreDAOImpl;
import spring.indiestream.domain.MemberVO;

public interface MemberDAO {
   
	MemberVO login(MemberVO vo) throws SQLException;
	
   void deleteMember(String memberId) throws SQLException;
   void registerMember(MemberVO vo) throws SQLException;
   void updateMember(MemberVO vo)throws SQLException;

   MemberVO findById(String memberId)throws SQLException;
   MemberVO findByPhoneNumber(String phoneNumber)throws SQLException;
   
   int idCheck(String id) throws SQLException;
   int phoneNumberCheck(String phoneNumber) throws SQLException;
   
   //message
   int selectMessageNoticeCount(String receiveId);
   //genre
   List<String> selectGenreByMemberId(String memverId);
   
   //memberProfilePhotoUpload
   int memberProfilePhotoUpload(MemberVO vo) throws SQLException;
   
   //memberintroductionUpdate
   void memberintroductionUpdate(MemberVO vo) throws SQLException;
   
 //memberReportCount
   void memberReportCount(String memberId)throws SQLException;
   
   List<MemberVO> memberSearchArtist(String memberId) throws SQLException;
}