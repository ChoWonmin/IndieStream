package spring.indiestream.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import spring.indiestream.dao.FollowDAO;
import spring.indiestream.dao.SnsBoardDAO;
import spring.indiestream.domain.HashtagVO;
import spring.indiestream.domain.LikerVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.SnsBoardVO;
import spring.indiestream.domain.SoundBoardVO;
import spring.indiestream.service.FollowService;
import spring.indiestream.service.GenreService;
import spring.indiestream.service.HashtagService;
import spring.indiestream.service.ImageService;
import spring.indiestream.service.LikerService;
import spring.indiestream.service.MemberService;
import spring.indiestream.service.SnsBoardService;
import spring.indiestream.service.SoundBoardService;
import spring.indiestream.service.TopicService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private FollowDAO followDAO;
	@Autowired
	private SoundBoardService soundBoardService;
	@Autowired
	private LikerService likerService;
	@Autowired
	private SnsBoardService snsBoardService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private FollowService followservice;
	@Autowired
	private GenreService genreService;
	@Autowired
	private HashtagService hashtagService;

	@RequestMapping("login.do")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response)
			throws Exception{        
		
		//추가1
 		MemberVO pvo = new MemberVO();
		
		String memberId = request.getParameter("loginId");
		String password = request.getParameter("loginPassword");
		pvo.setMemberId(memberId);
		pvo.setPassword(password);
		//추가1end
		
		if(pvo.getMemberId().equals("indie@stream.com")&&pvo.getPassword().equals("indiestream")){
			return new ModelAndView("redirect:/view/manage/manager.jsp"); 
		}//관리자 계정 체크 
		System.out.println(pvo.getMemberId()+"===="+pvo.getPassword());
		MemberVO rvo= memberService.login(pvo);
		
		//경로 변경
		if(rvo != null && rvo.getReportCount()<=2){
			System.out.println("rvo.getMemberId() :: " + rvo.getMemberId());
			rvo.setGenreList(genreService.selectBymemberId(rvo.getMemberId()));
			
			request.getSession().setAttribute("loginMvo", rvo);
			System.out.println("Login Session setAttribute Success!!"); 

			return new ModelAndView("redirect:/index.jsp"); 
		}else
			return new ModelAndView("login_test"); 
	}

	@RequestMapping("logout.do")
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response
			,HttpSession session)throws Exception{
		MemberVO loginMvo=(MemberVO)session.getAttribute("loginMvo");

		if(loginMvo != null){
			session.invalidate();
			System.out.println("Logout Session invalidate Success!!");       
		}
		return new ModelAndView("login_test");
	}

	@RequestMapping("registerMember.do")
	   public ModelAndView registerMember(HttpServletRequest request,HttpServletResponse response,
	         MemberVO vo)throws Exception{
	 
	      
	      String userId = vo.getMemberId();
	      String email = request.getParameter("emailSelect"); 
	      System.out.println(userId+email);
	      vo.setMemberId(userId+email);
	      
	      MemberVO rmvo = memberService.findById(userId+email);
	      MemberVO rpn = memberService.findByPhoneNumber(vo.getPhoneNumber());

	      if(rmvo!=null){
	         return new ModelAndView("redirect:./view/register.jsp?check=1"); 
	      }else if(rpn !=null){
	         return new ModelAndView("redirect:./view/register.jsp?check=2"); 
	      }else{
	         memberService.registerMember(vo); 
	         return new ModelAndView("login_test"); 
	      }
	}

	@RequestMapping("deleteMember.do")
	public ModelAndView deleteMember(HttpServletRequest request,HttpServletResponse response,
			HttpSession session)throws Exception{

		MemberVO loginMvo = (MemberVO) request.getSession().getAttribute("loginMvo");
		String id = loginMvo.getMemberId();

		System.out.println(id+" get getMemberId "); 


		memberService.deleteMember(id);

		if(loginMvo != null)
			session.invalidate();

		return new ModelAndView("redirect:./view/delete_result.jsp?memberId="+id); 
	}

	@RequestMapping("findByPhoneNumber.do")
	public ModelAndView findByPhoneNumber(HttpServletRequest request,HttpServletResponse response)throws Exception{
		MemberVO phoneNumber = null;
		String userEmail = null;
		String rp = request.getParameter("phoneNumber");

		phoneNumber = memberService.findByPhoneNumber(rp);

		if(phoneNumber!=null){
			userEmail = phoneNumber.getMemberId();
			System.out.println(userEmail);
		}

		return new ModelAndView("JsonView", "data", userEmail); 
	}


	@RequestMapping("updateMember.do")
	public ModelAndView updateMember(HttpServletRequest request, HttpServletResponse response, MemberVO vo)
			throws Exception{
		memberService.updateMember(vo);
		request.getSession().setAttribute("loginMvo", vo);
		return new ModelAndView("update_result");
	}

	@RequestMapping("findById")
	public ModelAndView findById(HttpServletRequest request, HttpServletResponse response,MemberVO vo)
			throws Exception{
		memberService.findById(request.getParameter("id"));
		return new ModelAndView("findByid_result");
	}

	@RequestMapping("idCheck.do")
	   public ModelAndView idcheck(HttpServletRequest request, HttpServletResponse response)
	         throws Exception{
	      String idEmail = request.getParameter("idEmail");
	      boolean flag = memberService.idCheck(idEmail);
	      
	      String[] idCheck = idEmail.split("@", 2);
	      
	      
	      if(idCheck[0].equals("")){
	         flag = true; 
	      }
	      
	      if(idEmail.indexOf(".")==-1 && idEmail.indexOf("@")==-1){
	         flag = true;
	      }
	      
	      if(idEmail.indexOf("@")!=-1){
	         if(idCheck[1].equals("") || idCheck[1] ==null )
	            flag = true;
	         else if(idCheck==null)
	            flag = true;
	      }
	      
	      return new ModelAndView("JsonView","flag", flag);
	      
	   }

	@RequestMapping("phoneNumberCheck.do")
	public ModelAndView phoneNumberCheck(HttpServletRequest request, HttpServletResponse response)
			throws Exception{

		boolean flag = memberService.phoneNumberCheck(request.getParameter("phoneNumber"));
		System.out.println(flag + " phoneNumberCheck ");

		return new ModelAndView("JsonView", "flag", flag);
	}

	@RequestMapping("showSoundBoardRegister.do")
	   public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response)
	         throws Exception{
	      MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginMvo");
	      return new ModelAndView("soundboard/soundBoardRegister","mvo",mvo);
	   }

	   
	   @RequestMapping("introductionUpdate.do")
	   public ModelAndView introductionUpdate(HttpServletRequest request, HttpServletResponse response, MemberVO mvo) throws Exception{
	      memberService.memberintroductionUpdate(mvo);
	      MemberVO loginMvo = (MemberVO) request.getSession().getAttribute("loginMvo");
	      loginMvo.setIntroduction(mvo.getIntroduction());
	      
	      request.getSession().setAttribute("loginMvo",loginMvo);
	      return new ModelAndView("profile/profile");
	   }	
	
	   @RequestMapping("getMemberInfo.do")
	   public ModelAndView getMemberInfo(HttpServletRequest request, HttpServletResponse response, MemberVO mvo) throws Exception{
	       System.out.println("getMemberInfo");
		   
		   String memberId = request.getParameter("memberId");
		   MemberVO member = memberService.findById(memberId);
		   int followedNumber = followDAO.selectFollowedIdByMemberId(memberId).size();
		   List<SoundBoardVO> soundBoardList = soundBoardService.FindSoundBoardById(memberId);
		   
		   Map<String, Object> memberInfo = new HashMap<String, Object>();
		   memberInfo.put("member", member);
		   memberInfo.put("followedNumber", followedNumber);
		   memberInfo.put("soundBoardList", soundBoardList);
		   
		   return new ModelAndView("profile/memberInfo","memberInfo",memberInfo);
	  }
	   
		@RequestMapping("profileUpload.do")
		public ModelAndView upload(HttpServletRequest request, HttpServletResponse response) throws Exception{
			String path=
				      "C:\\hnc\\jwm\\finalProject\\eclipse\\finalWorkspace\\indieStream08_0718_2\\src\\main\\webapp\\profilePhoto\\";
			
			MemberVO memberVO =(MemberVO)request.getSession().getAttribute("loginMvo");
			if(memberVO==null){//로그인 체크
				return new ModelAndView("redirect:index.jsp");
			}//로그인 체크	
			
			String profilePhotoCheck=request.getParameter("profilePhotoCheck");
			String introductionCheck=request.getParameter("introductionCheck");
			System.out.println(profilePhotoCheck);
			System.out.println(introductionCheck);

			
			//프로필 아이디와 들어온 아이디가 같을 경우 할 수 있는 선택지.
			if(profilePhotoCheck.equals("true") || introductionCheck.equals("true")){
				if(profilePhotoCheck.equals("true")){
					MultipartHttpServletRequest req =(MultipartHttpServletRequest) request;
					MultipartFile pFile=req.getFile("uploadFile");
					if(pFile!=null){
						if(pFile.isEmpty()==false){
							String saveFileName = System.currentTimeMillis()+"_"+pFile.getOriginalFilename();
							System.out.println(saveFileName);

							memberVO.setProfilePhoto(saveFileName); //memberVO에 프로필 사진 교체
							memberService.memberProfilePhotoUpload(memberVO); // db에 업로드

							File copyFile = new File(path+saveFileName);
							pFile.transferTo(copyFile);
						}//pFile.isEmpty()==false
					}//pFile==null
				}//profilePhotoCheck

				if(introductionCheck.equals("true")){
					String introduction=request.getParameter("introduction");
					System.out.println(introduction);
					memberVO.setIntroduction(introduction);
					memberService.memberintroductionUpdate(memberVO);
				}//introductionCheck 
				return new ModelAndView("JsonView","jsonMemberVO",memberVO);
			}
			//자바스크립트 에러 발생
			System.out.println("//자바스크립트 에러 발생");
			return new ModelAndView("login_test");
		}

		@RequestMapping("goProfile.do")
	      public ModelAndView goProfile(HttpServletRequest request, HttpServletResponse response) throws Exception{
	         MemberVO memberVO =(MemberVO)request.getSession().getAttribute("loginMvo");
	         if(memberVO==null){//로그인 체크
	            return new ModelAndView("login_test");
	         }//로그인 체크   
	         
	         if(request.getParameter("viewId")!=null){
	            if(!memberVO.getMemberId().equals(request.getParameter("viewId"))){
	               //프로필 아이디와 들어온 아이디가 다를 경우
	               String viewId=request.getParameter("viewId");
	               //findById
	               memberVO = memberService.findById(viewId);
	               memberVO.setSnsBoardList(snsBoardService.snsSelectAllFromWriter(memberVO.getMemberId()));
	               for(SnsBoardVO i: memberVO.getSnsBoardList()){
	                  i.setImageList(imageService.imageSelectAll(String.valueOf(i.getSnsBoardNo())));;
	               }
	               memberVO.setSoundBoardList(soundBoardService.soundSelectAllFromWriter(memberVO.getMemberId()));
	               /*for(SoundBoardVO i: memberVO.getSoundBoardList()){
	                  i.set
	               }*/
	               memberVO.setFollowList(followservice.selectFollowedIdByMemberId(viewId));
	               
	               List<MemberVO> followingList = followservice.selectFollowIdByMemberId(((MemberVO)request.getSession().getAttribute("loginMvo")).getMemberId());
	               memberVO.setFollowingList(followservice.selectFollowIdByMemberId(viewId));
	               
	               boolean following = false;
	               
	               for(MemberVO member:followingList)
	            	   if(member.getMemberId().equals(viewId)){
	            		   following = true;
	            		   break;
	            	   }
	               
	               Map<String, Object> profile = new HashMap<String, Object>();
	               profile.put("memberVO", memberVO);
	               profile.put("following", following);
	               profile.put("followingNum", memberVO.getFollowingList().size());
	               
	               System.out.println(following + " ===========");
	               return new ModelAndView("profile/profile","profile",profile);
	            }////프로필 아이디와 들어온 아이디가 다를 경우
	         }
	            //자기꺼 들어온 경우
	         
	         memberVO.setSnsBoardList(snsBoardService.snsSelectAllFromWriter(memberVO.getMemberId()));
	         for(SnsBoardVO i: memberVO.getSnsBoardList())
	            i.setImageList(imageService.imageSelectAll(String.valueOf(i.getSnsBoardNo())));;
	         
	         memberVO.setSoundBoardList(soundBoardService.soundSelectAllFromWriter(memberVO.getMemberId()));
	         memberVO.setFollowList(followservice.selectFollowedIdByMemberId(memberVO.getMemberId()));
             memberVO.setFollowingList(followservice.selectFollowIdByMemberId(memberVO.getMemberId()));

             
             Map<String, Object> profile = new HashMap<String, Object>();
             profile.put("memberVO", memberVO);
             profile.put("following", false);
             profile.put("followingNum", memberVO.getFollowingList().size());
	         
	         return new ModelAndView("profile/profile", "profile", profile);
	      }


		@RequestMapping("mainpage.do")
		public ModelAndView mainpage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
			List<SoundBoardVO> svoList = new ArrayList<SoundBoardVO>();
			List<LikerVO>lvo = likerService.sortByLiker();
			List<HashtagVO> hashList = hashtagService.hashtagCountSelect();
	         request.setAttribute("hashList", hashList);
			
			for(int i=0; i<lvo.size(); i++){
				System.out.println(lvo.get(i).getSoundBoardNo());
					if(lvo.get(i).getSoundWriter()!=null){
						svoList.add(soundBoardService.ShowContent(lvo.get(i).getSoundBoardNo()));
					}
			}
			List<SnsBoardVO> svoLatestList= snsBoardService.snsSelectAll();
			for(int i =0; i<svoLatestList.size(); i++){
				svoLatestList.get(i).setImageList(imageService.imageSelectAll(svoLatestList.get(i).getSnsBoardNo()+""));
			}
			
			List<SoundBoardVO> soundList = soundBoardService.SoundSortByNo();
			
			request.setAttribute("svoLatestList",svoLatestList);
			request.setAttribute("soundList",soundList);
			
			return new ModelAndView("mainpage","svoList",svoList);
		}
	
	
}