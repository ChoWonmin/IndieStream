package spring.indiestream.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.indiestream.domain.MemberVO;
import spring.indiestream.service.FollowService;
import spring.indiestream.service.ListService;
import spring.indiestream.service.MemberService;

@Controller
public class ListController {
	
	@Autowired
	private ListService listService;
	
	@RequestMapping("selectFollowSnsBoard.do")
	public ModelAndView selectFollowSnsBoard(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws SQLException{
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		int page = Integer.parseInt(request.getParameter("page"));
		
		listService.selectFollowSnsBoard(loginId, page);
		
		return new ModelAndView();
	}
	
	
	
}
