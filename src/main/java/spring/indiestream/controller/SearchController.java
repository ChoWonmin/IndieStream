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

import spring.indiestream.domain.HashtagVO;
import spring.indiestream.domain.ImageVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.SearchVO;
import spring.indiestream.domain.SnsBoardVO;
import spring.indiestream.domain.SoundBoardVO;
import spring.indiestream.domain.message.MemberMessageRoomVO;
import spring.indiestream.service.ImageService;
import spring.indiestream.service.SearchService;
import spring.indiestream.service.SnsBoardService;
import spring.indiestream.service.SoundBoardService;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	@Autowired
	private SnsBoardService snsBoardService;
	@Autowired
	private SoundBoardService soundBoardService;
	@Autowired
	private ImageService imageService;
	
	@RequestMapping("totalSearchToMap.do")
	public ModelAndView totalSearchToMap(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		
		String searchTextInput = request.getParameter("searchTextInput");
		//Map<String, List> totalSearchToMap = searchService.totalSearchToMap(searchTextInput);
		//return new ModelAndView("searchTest","totalSearchToMap",totalSearchToMap);
		
		List<SearchVO> totalSearchList =searchService.totalSearch(searchTextInput);
		
		return new ModelAndView("search_result_view","totalSearchList",totalSearchList);
	}
	
	@RequestMapping("hashtagSearch.do")
	public ModelAndView hashtagSearch(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		
		String searchTextInput = request.getParameter("searchTextInput");
		System.out.println("이뒤에머가 뜰까?::"+searchTextInput);
		
		List<HashtagVO> snsList=  searchService.hashtagSnsSearchSelect(searchTextInput);
		List<SnsBoardVO> snsHashList = new ArrayList<SnsBoardVO>();
		for(HashtagVO i:snsList){
			SnsBoardVO snsBoardVO=snsBoardService.snsSelectOne(i.getSnsBoardNo()+"");
			snsBoardVO.setImageList(imageService.imageSelectAll(i.getSnsBoardNo()+""));
			snsHashList.add(snsBoardVO);
		}
		request.setAttribute("snsHashList", snsHashList);
		
		List<HashtagVO> soundList=  searchService.hashtagSoundSearchSelect(searchTextInput);
		List<SoundBoardVO> soundHashList = new ArrayList<SoundBoardVO>();
		for(HashtagVO i:soundList){
			soundHashList.add(soundBoardService.ShowContent(i.getSoundBoardNo()));
					
		}
		request.setAttribute("soundHashList", soundHashList);
		
		return new ModelAndView("search_result_view");
	}
	
	@RequestMapping("searchMemberById.do")
	public ModelAndView searchMemberById(HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception{
		
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		String searchId = request.getParameter("searchId");
		
		List<MemberVO> memberSearchList =searchService.searchMemberById(loginId, searchId);
		
		return new ModelAndView("JsonView","memberSearchList",memberSearchList);
	}
	
	@RequestMapping("searchMemberMessageRommById.do")
	public ModelAndView searchMemberMessageRommById(HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception{
		
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		String searchId = request.getParameter("searchId");
		
		List<MemberVO> memberSearchList =searchService.searchFollowById(loginId, searchId);
		List<MemberMessageRoomVO> messageRoomList = searchService.searchMessageRoom(loginId, searchId);
		
		System.out.println(messageRoomList);
		
		Map<String, Object> modal = new HashMap<String, Object>();
		
		modal.put("memberSearchList", memberSearchList);
		modal.put("messageRoomList", messageRoomList);
		
		return new ModelAndView("message/searchMessage","modal",modal);
	}
	
	@RequestMapping("searchFollowById.do")
	public ModelAndView searchFollowById(HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception{
		
		System.out.println("searchFollowById");
		
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		String searchId = request.getParameter("searchId");
		
		List<MemberVO> memberSearchList = null;
		memberSearchList = searchService.searchFollowById(loginId, searchId);
		
		return new ModelAndView("message/followList","memberSearchList",memberSearchList);
	}
	
	@RequestMapping("searchMessageRoom.do")
	public ModelAndView searchMessageRoom(HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception{
		
		MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
		String loginId = loginMvo.getMemberId();
		String searchId = request.getParameter("searchId");
		
		List<MemberMessageRoomVO> messageRoomList =searchService.searchMessageRoom(loginId, searchId);
		
		return new ModelAndView("message/searchMessage","memberSearchList",messageRoomList);
	}
	
}
