package spring.indiestream.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.indiestream.domain.FollowVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.service.FollowService;

@Controller
public class FollowController {

	@Autowired
	private FollowService followService;
	
	@RequestMapping("insertFollow.do")
	public ModelAndView insertFollow(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		
		String followId = request.getParameter("followId");
		
		FollowVO followVO = new FollowVO();
		followVO.setFollowedId(loginId);
		followVO.setFollowId(followId);
		
		
		if(loginId!=followId)
			followService.insertFollow(followVO);
		
		return new ModelAndView("redirect:goProfile.do?viewId="+followId); 
	}
	
	@RequestMapping("deleteFollow.do")
	public ModelAndView deleteFollow(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		
		String followId = request.getParameter("followId");
		
		FollowVO followVO = new FollowVO();
		followVO.setFollowedId(loginMvo.getMemberId());
		followVO.setFollowId(followId);
		
		followService.deleteFollow(followVO);
		
		return new ModelAndView("redirect:goProfile.do?viewId="+followId); 
	}
	
	@RequestMapping("selectFollowCheckList.do")
	public ModelAndView selectFollowCheckList(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		
		return new ModelAndView("follow/followHome","followCheckList",followService.selectFollowCheckList(loginMvo.getMemberId())); 
	}
	
	@RequestMapping("selectFollowIdByMemberId.do")
	public ModelAndView selectFollowIdByMemberId(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		
		return new ModelAndView("follow/followList","followList",followService.selectFollowIdByMemberId(loginMvo.getMemberId())); 
	}
	
	@RequestMapping("selectFollowedIdByMemberId.do")
	public ModelAndView selectFollowedIdByMemberId(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception{        
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		
		return new ModelAndView("follow/followedList","followedList",followService.selectFollowedIdByMemberId(loginMvo.getMemberId())); 
	}
   
}