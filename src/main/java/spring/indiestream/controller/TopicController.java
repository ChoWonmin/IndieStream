package spring.indiestream.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.indiestream.domain.GenreVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.service.GenreService;
import spring.indiestream.service.TopicService;

@Controller
public class TopicController {
	
	@Autowired
	private TopicService topicService;
	@Autowired
	private GenreService genreService;
	
	@RequestMapping("settiongTopic.do")
	public ModelAndView settiongTopic(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception{
		
		String[] selectlist = request.getParameter("topic").split(",");
		
		
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		String loginId = request.getParameter("memberId");
		
		if(loginMvo!=null)
			loginId = loginMvo.getMemberId();

		GenreVO genreVO = new GenreVO();
		
		genreService.deleteGenre(loginId);
		
		List<String> genreList = new ArrayList<String>();
		for(String topic:selectlist){
			if(!topic.equals("")){
				System.out.println(topic);
				genreVO.setMemberId(loginId);
				genreVO.setTopic(topic);
				genreService.addGenre(genreVO);
				
				genreList.add(topic);
			}
		}
		
		if(loginMvo!=null){
			loginMvo.setGenreList(genreList);
			session.setAttribute("loginMvo", loginMvo);
		}
		
		return new ModelAndView("mainpage.do");
	}
	
	@RequestMapping("selectTopic.do")
	public ModelAndView selectTopic(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		return new ModelAndView("topic/selectTopic","topicList",topicService.selectTopic());
	}
	
}
