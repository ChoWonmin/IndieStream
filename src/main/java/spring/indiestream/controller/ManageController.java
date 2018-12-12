package spring.indiestream.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.indiestream.service.TopicService;

@Controller
public class ManageController {
	
	@Autowired
	private TopicService topicService;
	
	@RequestMapping("manageInsertTopic.do")
	public ModelAndView insertTopic(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		topicService.insertTopic(request.getParameter("topic"));
		return new ModelAndView("redirect:manageSelectTopic.do");
	}
	@RequestMapping("manageDeleteTopic.do")
	public ModelAndView deleteTopic(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		System.out.println("deleteTopic  " + request.getParameter("topic"));
		topicService.deleteTopic(request.getParameter("topic"));
		return new ModelAndView("redirect:manageSelectTopic.do");
	}
	@RequestMapping("manageSelectTopic.do")
	public ModelAndView selectTopic(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		return new ModelAndView("manage/manageTopic","topicList",topicService.selectTopic());
	}
}
