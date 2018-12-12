package spring.indiestream.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.MemberDAO;
import spring.indiestream.dao.MessageDAO;
import spring.indiestream.dao.MessageRoomDAO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.message.MemberMessageRoomVO;
import spring.indiestream.domain.message.MessageRoomVO;
import spring.indiestream.domain.message.MessageVO;
import spring.indiestream.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService{
   
   @Autowired
   private MessageDAO messageDAO;
   @Autowired
   private MessageRoomDAO MessageRoomDAO;
   @Autowired
   private MemberDAO memberDAO;
   
   @Override
   public int writeMessage(MessageVO message) {
      System.out.println(MessageRoomDAO.increaseMemberMessageRoomNotice(message.getMessageRoomNo())+ "increase row");
      return messageDAO.writeMessage(message);
   }

   @Override
   public List<MessageVO> selectMessage(String loginId, String messageRoomNo) throws SQLException {
      List<MessageVO> messageResult = new ArrayList<MessageVO>();
      
      MemberMessageRoomVO memberMessageRoomVO = new MemberMessageRoomVO();
      memberMessageRoomVO.setMemberId(loginId);
      memberMessageRoomVO.setMessageRoomNo(Integer.parseInt(messageRoomNo));
      
      messageResult = messageDAO.selectMessage(memberMessageRoomVO);
      
      for(int i=0;i<messageResult.size();i++){
         MemberVO member = memberDAO.findById(messageResult.get(i).getSendId());
         messageResult.get(i).setMember(member);
      }
      
      return messageResult;
   }

   @Override
   public int createMessageRoom(String loginId, String targetId) throws SQLException {
      List<MemberMessageRoomVO> messageRoomList = selectMessageRoomById(loginId);
      
      int messageRoomNo = -1;
      
      for(MemberMessageRoomVO messageRoom:messageRoomList)
         if(!messageRoom.isMultiple())
            for(String id:MessageRoomDAO.selectIdByMessageRoomNo(messageRoom.getMessageRoomNo()))
               if(id.equals(targetId))
                  messageRoomNo = messageRoom.getMessageRoomNo();

      if(messageRoomNo==-1){
         MemberMessageRoomVO messageRoomVO = new MemberMessageRoomVO();
         messageRoomVO.setMemberId(loginId);
         
         messageDAO.insertMessageRoom(new MessageRoomVO());
         
         messageRoomNo = messageDAO.selectLastMessageRoomNo();
         messageRoomVO.setMessageRoomNo(messageRoomNo); // messageRoomNo
         
         MessageRoomDAO.insertMemberMessageRoom(messageRoomVO);
         messageRoomVO.setMemberId(targetId);
         MessageRoomDAO.insertMemberMessageRoom(messageRoomVO);
      }
      
      return messageRoomNo;
   }

   @Override
   public int inviteMember(MemberMessageRoomVO memberMessageRoom) {
      messageDAO.changeMultiple(memberMessageRoom.getMessageRoomNo());
      return MessageRoomDAO.insertMemberMessageRoom(memberMessageRoom);
   }

   @Override
   public void exitMessageRoom(String loginId, String messageRoomNo) {
      
      int existCount = MessageRoomDAO.selectIdByMessageRoomNo(Integer.parseInt(messageRoomNo)).size();
      
      MemberMessageRoomVO memberMessageRoom = new MemberMessageRoomVO();
      memberMessageRoom.setMemberId(loginId);
      memberMessageRoom.setMessageRoomNo(Integer.parseInt(messageRoomNo));
      
      MessageRoomDAO.deleteMemberMessageRoom(memberMessageRoom);
      
      if(existCount==1){
         messageDAO.deleteMessage(messageRoomNo);
         messageDAO.deleteMessageRoom(messageRoomNo);
      }
         
   }

   @Override
   public int updateMemberMessageRoomName(MemberMessageRoomVO memberMessageRoom) {
      return MessageRoomDAO.updateMemberMessageRoomName(memberMessageRoom);
   }

   @Override
   public int initMemberMessageRoomNotice(MemberMessageRoomVO memberMessageRoom) {
      return MessageRoomDAO.initMemberMessageRoomNotice(memberMessageRoom);
   }

   @Override
   public List<MemberMessageRoomVO> selectMessageRoomById(String loginId) throws SQLException {
      List<MemberMessageRoomVO> result = MessageRoomDAO.selectMessageRoomById(loginId);
      
      for(int i=0;i<result.size();i++){
         boolean multiple = messageDAO.isMultiple(result.get(i).getMessageRoomNo());
         result.get(i).setMultiple(multiple);
         
         List<String> idList = MessageRoomDAO.selectIdByMessageRoomNo(result.get(i).getMessageRoomNo());
         ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
         
         if(idList!=null)
            for(String id:idList)
               if(!id.equals(loginId)){
                  memberList.add(memberDAO.findById(id));
               }
         
         result.get(i).setMemberList(memberList);
      }
      
      return result;
   }
   
   @Override
   public List<String> selectIdByMessageRoomNo(int messageRoomNo){
      return MessageRoomDAO.selectIdByMessageRoomNo(messageRoomNo);
   }

	@Override
	public MemberMessageRoomVO findMessageRoom(String loginId, int messageRoomNo) throws SQLException {
		MemberMessageRoomVO result = MessageRoomDAO.findMessageRoom(loginId, messageRoomNo);
		
		List<String> idList = MessageRoomDAO.selectIdByMessageRoomNo(messageRoomNo);
        ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
        
        if(idList!=null)
           for(String id:idList)
              if(!id.equals(loginId)){
                 memberList.add(memberDAO.findById(id));
              }
        
        result.setMemberList(memberList);
		
		return result;
	}

}