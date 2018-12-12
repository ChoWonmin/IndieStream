package spring.indiestream.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.MemberDAO;
import spring.indiestream.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
   @Autowired
   private SqlSession sqlSession;

@Override
   public void registerMember(MemberVO vo) throws SQLException {
      sqlSession.insert("memberMapper.registerMember",vo);
   }
   
   @Override
   public MemberVO login(MemberVO vo)throws SQLException{
      return sqlSession.selectOne("memberMapper.login", vo);
   }
   
   @Override
   public void deleteMember(String memberId)throws SQLException{
      sqlSession.delete("memberMapper.deleteMember", memberId);
   }
   
   @Override
   public void updateMember(MemberVO vo)throws SQLException{
      sqlSession.update("memberMapper.updateMember", vo);
   }
   
   
   @Override
   public MemberVO findById(String memberId)throws SQLException{
      return sqlSession.selectOne("memberMapper.findById", memberId);
      
   }
   

   @Override //phoneNumber
   public MemberVO findByPhoneNumber(String phoneNumber)throws SQLException{
     return sqlSession.selectOne("memberMapper.findByPhoneNumber", phoneNumber);
         
   }
   
   @Override  //id check
   public int idCheck(String id) throws SQLException {
     return sqlSession.selectOne("memberMapper.idCheck", id);
   }
   
   @Override  //phoneNumber check
   public int phoneNumberCheck(String phoneNumber) throws SQLException {
     return sqlSession.selectOne("memberMapper.phoneNumberCheck", phoneNumber);
   }
   
   @Override
	public int selectMessageNoticeCount(String receiveId) {
		return sqlSession.selectOne("messageMapper.selectMessageNoticeCount",receiveId);
	}
   
   @Override
   public List<String> selectGenreByMemberId(String memverId){
	   return sqlSession.selectList("genreMapper.selectGenreByMemberId",memverId);
   }
   @Override //memberProfilePhotoUpload
   public int memberProfilePhotoUpload(MemberVO vo) throws SQLException {
        return sqlSession.update("memberMapper.memberProfilePhotoUpload",vo);
        
   }
   @Override //memberintroductionUpdate
   public void memberintroductionUpdate(MemberVO vo) throws SQLException {
       sqlSession.update("memberMapper.memberintroductionUpdate", vo);
   
   }

	@Override
	public void memberReportCount(String memberId) throws SQLException {
		sqlSession.update("memberMapper.memberReportCount", memberId);
	}

	@Override
	public List<MemberVO> memberSearchArtist(String memberId) throws SQLException {
		return sqlSession.selectList("memberMapper.memberSearchArtist", memberId);
	}
}