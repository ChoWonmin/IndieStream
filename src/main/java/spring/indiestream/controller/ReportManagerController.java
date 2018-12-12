package spring.indiestream.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.indiestream.domain.ManagerVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.ReportVO;
import spring.indiestream.service.ManagerService;
import spring.indiestream.service.MemberService;
import spring.indiestream.service.ReplyService;
import spring.indiestream.service.ReportService;
import spring.indiestream.service.SnsBoardService;
import spring.indiestream.service.SoundBoardService;

@Controller
public class ReportManagerController {
	@Autowired
	private ReportService reportService;
	@Autowired
	private ManagerService managerService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SnsBoardService snsBoardService;
	@Autowired
	private SoundBoardService soundBoardService;
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("managerLogin.do")
	public ModelAndView managerLogin(HttpServletRequest request,HttpServletResponse response,ManagerVO managerVO)throws Exception{
		ManagerVO returnManagerVO=managerService.selectOneManager(managerVO);
		if(returnManagerVO!=null){
			System.out.println("매니저 로그인 성공");
			request.getSession().setAttribute("managerVO", returnManagerVO);
		}else{
			System.out.println("매니저 로그인 실패");
			return new ModelAndView("redirect:/index.jsp");
		}
		return new ModelAndView("redirect:/view/manage/manager.jsp");
	}
	
	@RequestMapping("managerRegister.do")
	public ModelAndView managerRegister(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String managerId=request.getParameter("managerId");
		String password=request.getParameter("password");
		String quest=request.getParameter("quest");
		if(quest!=null){
			if(!quest.equals("kosta")){
				System.out.println("manager quest 틀림");
				return new ModelAndView("redirect:/index.jsp");
			}//equals비교
		}else
			return new ModelAndView("redirect:/index.jsp");
		
		ManagerVO managerVO=new ManagerVO();
		managerVO.setManagerId(managerId);
		managerVO.setPassword(password);
		managerService.insertOneManager(managerVO);
		System.out.println("매니저 계정 등록완료");
		return new ModelAndView("redirect:/view/manage/manager.jsp");
	}
	@RequestMapping("managerLogout.do")
	public ModelAndView managerLogout(HttpServletRequest request,HttpServletResponse response,
			HttpSession session)throws Exception{
		ManagerVO managerVO=(ManagerVO)session.getAttribute("managerVO");

		if(managerVO != null){
			session.invalidate();
			System.out.println("manager Logout Session invalidate Success!!");       
		}
		//return new ModelAndView("redirect:/index.jsp");
		return new ModelAndView("redirect:/index.jsp");
	}
	@RequestMapping("ReportSelectAll.do")
	public ModelAndView reportSelectAll(HttpServletRequest request,HttpServletResponse response,
			HttpSession session)throws Exception{
		ManagerVO managerVO=(ManagerVO)session.getAttribute("managerVO");

		if(managerVO == null){//주소 입력해 들어올경우
			return new ModelAndView("redirect:/index.jsp");    
		}
		List<ManagerVO> listOfReportList=reportService.reportSelectAll();
		//Map<String, ManagerVO> mapOfReportList = reportService.reportSelectAll();
		return new ModelAndView("manage/managerReportView","listOfReportList",listOfReportList); //리포트 처리 게시판
	}
	@RequestMapping("ReportSnsOneDetailSelect.do")
	public ModelAndView reportSnsOneDetailSelect(HttpServletRequest request,HttpServletResponse response,
			HttpSession session)throws Exception{
		ManagerVO managerVO=(ManagerVO)session.getAttribute("managerVO");
		if(managerVO == null){//주소 입력해 들어올경우
			return new ModelAndView("redirect:/view/login_test.jsp");    
		}
		///////
		String snsBoardNo=request.getParameter("snsBoardNo");
		String reported=request.getParameter("reported");
		List<ReportVO> detailOfSnsList=reportService.reportSnsOneDetailSelect(snsBoardNo);
		request.setAttribute("detailOfSnsList", detailOfSnsList);

		return new ModelAndView("manage/managerReportDetail","reported",reported); //리포트 처리 게시판
	}
	@RequestMapping("ReportSoundOneDetailSelect.do")
	public ModelAndView reportSoundOneDetailSelect(HttpServletRequest request,HttpServletResponse response,
			HttpSession session)throws Exception{
		ManagerVO managerVO=(ManagerVO)session.getAttribute("managerVO");
		if(managerVO == null){//주소 입력해 들어올경우
			return new ModelAndView("redirect:/index.jsp");    
		}
		///////
		String soundBoardNo=request.getParameter("soundBoardNo");
		String reported=request.getParameter("reported");
		List<ReportVO> detailOfSoundList=reportService.reportSoundOneDetailSelect(soundBoardNo);
		request.setAttribute("detailOfSoundList", detailOfSoundList);

		return new ModelAndView("managerReportDetail","reported",reported); //리포트 처리 게시판
	}
	@RequestMapping("ReportReplyDetailSelect.do")
	public ModelAndView reportReplyDetailSelect(HttpServletRequest request,HttpServletResponse response,
			HttpSession session)throws Exception{
		ManagerVO managerVO=(ManagerVO)session.getAttribute("managerVO");
		if(managerVO == null){//주소 입력해 들어올경우
			return new ModelAndView("redirect:/index.jsp");    
		}
		///////
		String replyNo=request.getParameter("replyNo");
		String reported=request.getParameter("reported");
		List<ReportVO> detailOfReplyList=reportService.reportReplyDetailSelect(replyNo);
		request.setAttribute("detailOfReportlist", detailOfReplyList);

		return new ModelAndView("managerReportDetail","reported",reported); //리포트 처리 게시판
	}
	
	/////////////////////
	@RequestMapping("reportSnsInsert.do")
	public ModelAndView reportSnsInsert(HttpServletRequest request,HttpServletResponse response)throws Exception{
		MemberVO rvo = (MemberVO)request.getSession().getAttribute("loginMvo");
		if(rvo==null) //로그인 상태가 아니라 글쓰기 할 수 없다
			return new ModelAndView("redirect:/index.jsp");
		///////
		
		String snsBoardNo=request.getParameter("snsBoardNo");
		String snsWriter=request.getParameter("snsWriter");
		String reporterComment=request.getParameter("reporterComment");
		//snsWriter
		ReportVO reportVO=new ReportVO();
		reportVO.setSnsBoardNo(Integer.parseInt(snsBoardNo));
		reportVO.setSnsWriter(snsWriter);
		reportVO.setMemberId(rvo.getMemberId());
		if(reporterComment==null){
			return new ModelAndView("report","reportVOsns",reportVO); 
		}else{//내용이 이제 작성될 경우 리포트테이블에 insert 되고 다시 아까 그 게시물 봣던 지점으로 간다.
			reportVO.setReporterComment(reporterComment);
			reportService.reportSnsInsert(reportVO);
			//추가
			//게시글 신고횟수 증가
			reportService.reportSnsCount(snsWriter);
			
			System.out.println("게시물 리포트 숫자 증가");
			
			return new ModelAndView("redirect:snsSelectAll.do"); 
		}
	}//
	
	@RequestMapping("reportSoundInsert.do")
	public ModelAndView reportSoundInsert(HttpServletRequest request,HttpServletResponse response)throws Exception{
		MemberVO rvo = (MemberVO)request.getSession().getAttribute("loginMvo");
		if(rvo==null) //로그인 상태가 아니라 글쓰기 할 수 없다
			return new ModelAndView("redirect:/index.jsp");
		///////
		String soundBoardNo=request.getParameter("soundBoardNo");
		String soundWriter=request.getParameter("soundWriter");
		String reporterComment=request.getParameter("reporterComment");
		//snsWriter
		ReportVO reportVO=new ReportVO();
		reportVO.setSoundBoardNo(Integer.parseInt(soundBoardNo));
		reportVO.setSoundWriter(soundWriter);
		reportVO.setMemberId(rvo.getMemberId());
		if(reporterComment==null){
			return new ModelAndView("report","reportVOsound",reportVO); 
		}else{//내용이 이제 작성될 경우 리포트테이블에 insert 되고 다시 아까 그 게시물 봣던 지점으로 간다.
			reportVO.setReporterComment(reporterComment);
			reportService.reportSnsInsert(reportVO);
			//추가
			//게시글 신고횟수 증가
			reportService.reportSoundCount(soundWriter);
			return new ModelAndView("soundBoardList.do"); //바꿈
		}
	}
	@RequestMapping("reportSnsReplyInsert.do")
	public ModelAndView reportSnsReplyInsert(HttpServletRequest request,HttpServletResponse response)throws Exception{
		MemberVO rvo = (MemberVO)request.getSession().getAttribute("loginMvo");
		if(rvo==null) //로그인 상태가 아니라 글쓰기 할 수 없다
			return new ModelAndView("redirect:/index.jsp");
		///////
		
		String replyNo=request.getParameter("replyNo");
		String replyWriter=request.getParameter("replyWriter");
		String reporterComment=request.getParameter("reporterComment");
		//snsWriter
		ReportVO reportVO=new ReportVO();
		reportVO.setReplyNo(Integer.parseInt(replyNo));
		reportVO.setReplyWriter(replyWriter);
		reportVO.setMemberId(rvo.getMemberId());
		if(reporterComment==null){
			return new ModelAndView("report","reportVOreply",reportVO); 
		}else{//내용이 이제 작성될 경우 리포트테이블에 insert 되고 다시 아까 그 게시물 봣던 지점으로 간다.
			reportVO.setReporterComment(reporterComment);
			reportService.reportSnsInsert(reportVO);
			//추가
			//게시글 신고횟수 증가
			reportService.reportReplyCount(replyWriter);
			return new ModelAndView("snsSelectOne.do");
		}
	}
	@RequestMapping("reportSoundReplyInsert.do")
	public ModelAndView reportSoundReplyInsert(HttpServletRequest request,HttpServletResponse response)throws Exception{
		MemberVO rvo = (MemberVO)request.getSession().getAttribute("loginMvo");
		if(rvo==null) //로그인 상태가 아니라 글쓰기 할 수 없다
			return new ModelAndView("redirect:/index.jsp");
		///////
		String replyNo=request.getParameter("replyNo");
		String replyWriter=request.getParameter("replyWriter");
		String reporterComment=request.getParameter("reporterComment");
		//snsWriter
		ReportVO reportVO=new ReportVO();
		reportVO.setReplyNo(Integer.parseInt(replyNo));
		reportVO.setReplyWriter(replyWriter);
		reportVO.setMemberId(rvo.getMemberId());
		if(reporterComment==null){
			return new ModelAndView("report","reportVOreply",reportVO); 
		}else{//내용이 이제 작성될 경우 리포트테이블에 insert 되고 다시 아까 그 게시물 봣던 지점으로 간다.
			reportVO.setReporterComment(reporterComment);
			reportService.reportSnsInsert(reportVO);
			//추가
			//게시글 신고횟수 증가
			reportService.reportReplyCount(replyWriter);
			return new ModelAndView("showContent.do");
		}
	}
	
	
	/////////////추가
	@RequestMapping("snsReport.do")
	public ModelAndView snsReport(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String snsWriter=request.getParameter("snsWriter");
		System.out.println(snsWriter);
		memberService.memberReportCount(snsWriter);
		System.out.println("성공");
		return new ModelAndView("JsonView");
	}
	@RequestMapping("soundReport.do")
	public ModelAndView soundReport(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String soundWriter=request.getParameter("soundWriter");
		System.out.println(soundWriter);
		memberService.memberReportCount(soundWriter);
		System.out.println("성공");
		//List<ManagerVO> listOfReportList=reportService.reportSelectAll();
		return new ModelAndView("JsonView");
	}
	@RequestMapping("replyReport.do")
	public ModelAndView replyReport(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String replyWriter=request.getParameter("replyWriter");
		System.out.println(replyWriter);
		memberService.memberReportCount(replyWriter);
		System.out.println("성공");
		//List<ManagerVO> listOfReportList=reportService.reportSelectAll();
		return new ModelAndView("JsonView");
	}
	//snsBoardService
	@RequestMapping("snsDeleteReport.do")
	public ModelAndView snsDeleteReport(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println(request.getParameter("snsBoardNo"));
		snsBoardService.snsDelete(request.getParameter("snsBoardNo"));
		
		System.out.println("성공");
		return new ModelAndView("JsonView");
	}
	@RequestMapping("soundDeleteReport.do")
	public ModelAndView soundDeleteReport(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println(request.getParameter("soundBoardNo"));
		int soundBoardNo = Integer.parseInt(request.getParameter("soundBoardNo"));
		System.out.println(soundBoardNo);
		soundBoardService.SoundDelete(soundBoardNo);
		System.out.println("성공");
		//List<ManagerVO> listOfReportList=reportService.reportSelectAll();
		return new ModelAndView("JsonView");
	}
	@RequestMapping("snsReplyDeleteReport.do")
	public ModelAndView snsReplyDeleteReport(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println(request.getParameter("replyNo"));
		String replyNo =request.getParameter("replyNo");
		System.out.println(replyNo);
		replyService.snsDeleteReply(replyNo);
		System.out.println("성공");
		//List<ManagerVO> listOfReportList=reportService.reportSelectAll();
		return new ModelAndView("JsonView");
	}
	@RequestMapping("soundReplyDeleteReport.do")
	public ModelAndView soundReplyDeleteReport(HttpServletRequest request,HttpServletResponse response)throws Exception{
		System.out.println(request.getParameter("replyNo"));
		String replyNo =request.getParameter("replyNo");
		System.out.println(replyNo);
		replyService.snsDeleteReply(replyNo);
		System.out.println("성공");
		//List<ManagerVO> listOfReportList=reportService.reportSelectAll();
		return new ModelAndView("JsonView");
	}
}
