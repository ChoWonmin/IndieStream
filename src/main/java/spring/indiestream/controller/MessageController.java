package spring.indiestream.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.message.MemberMessageRoomVO;
import spring.indiestream.domain.message.MessageVO;
import spring.indiestream.service.MemberService;
import spring.indiestream.service.MessageService;
import spring.indiestream.service.SearchService;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;
	@Autowired
	private SearchService searchService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("selectMessageRoomById.do")
	public ModelAndView selectMessageRoomById(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		MemberVO loginMvo = (MemberVO)session.getAttribute("loginMvo");
		System.out.println("selectMessageRoomById");
		return new ModelAndView("message/messageHome", "messageRoomList", messageService.selectMessageRoomById(loginMvo.getMemberId())); 
	}
	
	@RequestMapping("createMessageRoom.do")
	public ModelAndView createRoom(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		MemberVO loginMvo = (MemberVO)session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		String targetId = request.getParameter("targetId");
		
		String	messageRoomNo = messageService.createMessageRoom(loginId, targetId)+"";
		
		return new ModelAndView("redirect:selectMessage.do?messageRoomNo="+messageRoomNo);
	}
	
	@RequestMapping("selectMessage.do")
	public ModelAndView selectMessage(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		String messageRoomNo = request.getParameter("messageRoomNo");
		MemberVO loginMvo = (MemberVO)session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		
		List<MessageVO> messageList = messageService.selectMessage(loginId, messageRoomNo);
		List<MemberMessageRoomVO> mmrList = messageService.selectMessageRoomById(loginId);
		
		MemberMessageRoomVO roomInfo = null;
		
		for(MemberMessageRoomVO mmr:mmrList)
			if(mmr.getMessageRoomNo()==Integer.parseInt(messageRoomNo))
				roomInfo = mmr;
			
		MemberMessageRoomVO memberMessageRoomVO = new MemberMessageRoomVO();
		memberMessageRoomVO.setMemberId(loginId);
		memberMessageRoomVO.setMessageRoomNo(Integer.parseInt(messageRoomNo));
		
		messageService.initMemberMessageRoomNotice(memberMessageRoomVO);
		
		Map<String, Object> messageRoom = new HashMap<String, Object>();
		
		messageRoom.put("messageList", messageList);
		messageRoom.put("roomInfo", roomInfo);
		
		return new ModelAndView("message/messageRoom", "messageRoom", messageRoom);
	}
		
	@RequestMapping("writeMessage.do")
	public ModelAndView writeMessage(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		MemberVO loginMvo = (MemberVO)session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		
		String messageComment = request.getParameter("messageComment");
		String messageRoomNo = request.getParameter("messageRoomNo");
		
		MessageVO messageVO = new MessageVO();
		messageVO.setMessageComment(messageComment);
		messageVO.setMessageRoomNo(Integer.parseInt(messageRoomNo));
		messageVO.setSendId(loginId);
		
		messageService.writeMessage(messageVO);
		
		return new ModelAndView("redirect:selectMessage.do?messageRoomNo="+messageRoomNo);
	}
	
	@RequestMapping("updateMemberMessageRoomName.do")
	public ModelAndView updateMemberMessageRoomName(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		MemberVO loginMvo = (MemberVO)session.getAttribute("loginMvo");
		String messageRoomNo = request.getParameter("messageRoomNo");
		String messageRoomName = request.getParameter("messageRoomName");
		
		MemberMessageRoomVO memberMessageRoomVO = new MemberMessageRoomVO();
		memberMessageRoomVO.setMemberId(loginMvo.getMemberId());
		memberMessageRoomVO.setMessageRoomNo(Integer.parseInt(messageRoomNo));
		memberMessageRoomVO.setMessageRoomName(messageRoomName);
		
		messageService.updateMemberMessageRoomName(memberMessageRoomVO);
		
		return new ModelAndView("redirect:selectMessage.do?messageRoomNo="+messageRoomNo);
	}
	
	@RequestMapping("inviteMember.do")
	public ModelAndView inviteMember(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		String messageRoomNo = request.getParameter("messageRoomNo");
		String targetId = request.getParameter("memberId");
		
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		
		
		MemberMessageRoomVO memberMessageRoomVO = new MemberMessageRoomVO();
		memberMessageRoomVO.setMessageRoomNo(Integer.parseInt(messageRoomNo));
		memberMessageRoomVO.setMemberId(targetId);
		
		messageService.inviteMember(memberMessageRoomVO);
		
		MessageVO message = new MessageVO();
		
		message.setSendId("indie@stream.com");
		message.setMessageRoomNo(Integer.parseInt(messageRoomNo));
		message.setMessageComment(loginMvo.getMemberId()+" invited "+ targetId);
		messageService.writeMessage(message);
		
		return new ModelAndView("redirect:selectMessage.do?messageRoomNo="+messageRoomNo);
	}
	
	@RequestMapping("ajaxSelectMessage.do")
	public ModelAndView ajaxSelectMessage(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		String messageRoomNo = request.getParameter("messageRoomNo");
		MemberVO loginMvo = (MemberVO)session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		
		List<MessageVO> messageList = messageService.selectMessage(loginId, messageRoomNo);
		List<MemberMessageRoomVO> mmrList = messageService.selectMessageRoomById(loginId);
		
		MemberMessageRoomVO roomInfo = null;
		
		for(MemberMessageRoomVO mmr:mmrList)
			if(mmr.getMessageRoomNo()==Integer.parseInt(messageRoomNo))
				roomInfo = mmr;
			
		MemberMessageRoomVO memberMessageRoomVO = new MemberMessageRoomVO();
		memberMessageRoomVO.setMemberId(loginId);
		memberMessageRoomVO.setMessageRoomNo(Integer.parseInt(messageRoomNo));
		
		messageService.initMemberMessageRoomNotice(memberMessageRoomVO);
		
		Map<String, Object> messageRoom = new HashMap<String, Object>();
		
		messageRoom.put("messageList", messageList);
		messageRoom.put("roomInfo", roomInfo);
		
		return new ModelAndView("message/messageRoom_result", "messageRoom", messageRoom);
	}
	
	@RequestMapping("searchInviteList.do")
	public ModelAndView searchInviteList(HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception{
		
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		String searchId = request.getParameter("searchId");
		String messageRoomNo = request.getParameter("messageRoomNo");
		
		List<MemberVO> searchFollowList = searchService.searchFollowById(loginId, searchId);
		List<String> existIdList = messageService.selectIdByMessageRoomNo(Integer.parseInt(messageRoomNo));
		List<MemberVO> existList = new ArrayList<MemberVO>();
		
		for(int i=0;i<existIdList.size();i++)
			if(!existIdList.get(i).equals(loginId))
				existList.add(memberService.findById(existIdList.get(i)));
		
		List<MemberVO> inviteList = new ArrayList<MemberVO>();
		
		boolean duplicated = false;
		
		for(MemberVO member:searchFollowList){
			duplicated = false;
			for(String existId:existIdList)
				if(member.getMemberId().equals(existId)){
					duplicated=true;
					break;
				}//if
			
			if(!duplicated)
				inviteList.add(member);
		}//for
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("messageRoomNo", messageRoomNo);
		model.put("inviteList", inviteList);
		model.put("existList", existList);
		
		return new ModelAndView("message/inviteList","model",model);
	}
	
	@RequestMapping("ajaxInviteList.do")
	public ModelAndView ajaxInviteList(HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception{
		
		System.out.println("searchFollowById");
		
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		String searchId = request.getParameter("searchId");
		String messageRoomNo = request.getParameter("messageRoomNo");
		
		List<MemberVO> memberSearchList = searchService.searchFollowById(loginId, searchId);
		
		List<String> existList = messageService.selectIdByMessageRoomNo(Integer.parseInt(messageRoomNo));
		
		for(int i=0;i<existList.size();i++)
			if(existList.get(i).equals(loginId))
				existList.remove(i);
		
		List<MemberVO> inviteList = new ArrayList<MemberVO>();
		
		boolean duplicated = false;
		
		for(MemberVO member:memberSearchList){
			duplicated = false;
			for(String existId:existList)
				if(member.getMemberId().equals(existId)){
					duplicated=true;
					break;
				}//if
			
			if(!duplicated)
				inviteList.add(member);
		}//for
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("messageRoomNo", messageRoomNo);
		model.put("inviteList", inviteList);
		
		return new ModelAndView("message/inviteList_result","model",model);
	}
	
	@RequestMapping("exitMessageRoom.do")
	public ModelAndView exitMessageRoom(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		MemberVO loginMvo = (MemberVO)session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		String messageRoomNo = request.getParameter("messageRoomNo");
		
		messageService.exitMessageRoom(loginId, messageRoomNo);
		
		MessageVO message = new MessageVO();
		
		message.setSendId("indie@stream.com");
		message.setMessageRoomNo(Integer.parseInt(messageRoomNo));
		message.setMessageComment(loginMvo.getMemberId()+"has left the chat");
		messageService.writeMessage(message);
		
		return new ModelAndView("redirect:selectMessageRoomById.do?messageRoomNo="+messageRoomNo); 
	}
}
	












	
