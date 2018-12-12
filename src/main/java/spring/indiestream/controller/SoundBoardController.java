package spring.indiestream.controller;

import java.io.File;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.indiestream.domain.HashtagVO;
import spring.indiestream.domain.LikerVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.ReplyVO;
import spring.indiestream.domain.SoundBoardVO;
import spring.indiestream.service.HashtagService;
import spring.indiestream.service.LikerService;
import spring.indiestream.service.ReplyService;
import spring.indiestream.service.SoundBoardService;


@Controller
public class SoundBoardController {

	@Autowired
	private SoundBoardService soundBoardService;

	@Autowired
	private LikerService likerService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private HashtagService hashtagService;
	String audioPath ="C:\\hnc\\jwm\\finalProject\\eclipse\\finalWorkspace\\indieStream08_0718_2\\src\\main\\webapp\\upload_audio\\";
	String picturePath = "C:\\hnc\\jwm\\finalProject\\eclipse\\finalWorkspace\\indieStream08_0718_2\\src\\main\\webapp\\upload_picture\\";
	
	@RequestMapping("soundRegister.do")
	public ModelAndView SoundRegister(HttpServletRequest request, HttpServletResponse response,
			SoundBoardVO svo, HttpSession session)throws Exception{
		/*로그?�� 체크*/
		MemberVO checkLogin =(MemberVO)request.getSession().getAttribute("loginMvo");
		if(checkLogin==null){
			return new ModelAndView("redirect:index.jsp");
		}//로그?�� 체크
		/*로그?�� 체크*/
		svo.setSoundWriter(checkLogin.getMemberId());
		svo.setSoundGenre(request.getParameter("sounndGenre"));
		System.out.println(svo);
		MultipartFile mfile = svo.getUploadSoundUrl();
		System.out.println(mfile.getSize()+"=========="+mfile.isEmpty());
		if(mfile.isEmpty()==false){
			String fileName = mfile.getOriginalFilename();
			svo.setOrgfilename(fileName);

			String newFileName = System.currentTimeMillis()+"_"+fileName;
			svo.setNewfilename(newFileName);

			File copyFile = new File(audioPath+newFileName);
			mfile.transferTo(copyFile);
			System.out.println(copyFile.getName() +"upload complete!!");
			System.out.println(fileName+"_"+newFileName);
			svo.setSoundUrl(newFileName);
		}

		MultipartFile mfilePhoto = svo.getUploadFilePhoto();
		System.out.println(mfilePhoto.getSize()+"=========="+mfilePhoto.isEmpty());
		if(mfilePhoto.isEmpty()==false){
			String fileName = mfilePhoto.getOriginalFilename();
			svo.setOrgfilename(fileName);

			String newFileName = System.currentTimeMillis()+"_"+fileName;
			svo.setNewfilename(newFileName);

			File copyFile = new File(picturePath+newFileName);
			mfilePhoto.transferTo(copyFile);
			System.out.println(copyFile.getName() +"upload complete!!");
			System.out.println(fileName+"_"+newFileName);
			svo.setSoundPhoto(newFileName);
		}
		soundBoardService.SoundRegister(svo);
		svo.setSoundBoardNo(soundBoardService.SoundBoardNo());
		session.setAttribute("SoundBoardNo", svo.getSoundBoardNo());
		System.out.println(svo.getSoundBoardNo());

		/*?��?��?���?*/
		String hashtags=request.getParameter("hashtag");
		if(hashtags!=null){
			HashtagVO hashtagVO= new HashtagVO();
			hashtagVO.setSoundBoardNo(svo.getSoundBoardNo());
			hashtagVO.setSoundWriter(svo.getSoundWriter());	
			hashtagVO.setKeyword(hashtags);
			hashtagService.hashSoundInsert(hashtagVO);
			svo.setHashtagList(hashtagService.hashSoundSelectFromOnePost(svo.getSoundBoardNo()+""));
		}//?��?��?���? �??�� �?�?...
		/*?��?��?���?*/
		return new ModelAndView("soundboard/sound_view","svo",svo);
	}
	
	@RequestMapping("soundUpdate.do")
	public ModelAndView SoundUpdate(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, SoundBoardVO svo)throws Exception{
		String soundBoardNo= request.getParameter("soundBoardNo");
		String bungi=request.getParameter("bungi");
		System.out.println("bungi 출력::"+bungi);
		
		SoundBoardVO soundBoardVO=soundBoardService.ShowContent(Integer.parseInt(soundBoardNo));
		if(bungi!=null){
			System.out.println("분기출력");
			System.out.println("?��?��?��?��?��?���??��\n"+soundBoardVO);
			soundBoardVO.setHashtagList(hashtagService.hashSoundSelectFromOnePost(soundBoardNo));
			return new ModelAndView("soundboard/soundBoardUpdate","svo",soundBoardVO);
		}
		///////////////////////////////////////////
		System.out.println("soundUpdate?��?�� 번호 :: "+svo);
		//int soundNo = (Integer) session.getAttribute("SoundBoardNo");

		//svo.setSoundBoardNo(soundNo);   


		if(!svo.getUploadSoundUrl().isEmpty()){
			MultipartFile mfile = svo.getUploadSoundUrl();
			String fileName = mfile.getOriginalFilename();
			svo.setOrgfilename(fileName);

			String newFileName = System.currentTimeMillis()+"_"+fileName;
			svo.setNewfilename(newFileName);

			File copyFile = new File(audioPath+newFileName);
			mfile.transferTo(copyFile);
			soundBoardService.deleteFile(audioPath+soundBoardVO.getSoundUrl());
			svo.setSoundUrl(newFileName);
		}
		if(!svo.getUploadFilePhoto().isEmpty()){

			MultipartFile mfilePhoto = svo.getUploadFilePhoto();
			System.out.println(mfilePhoto.getSize()+"=========="+mfilePhoto.isEmpty());

			String fileName = mfilePhoto.getOriginalFilename();
			svo.setOrgfilename(fileName);

			String newFileName = System.currentTimeMillis()+"_"+fileName;
			svo.setNewfilename(newFileName);

			File copyFile = new File(picturePath+newFileName);
			mfilePhoto.transferTo(copyFile);
			soundBoardService.deleteFile(picturePath+soundBoardVO.getSoundPhoto());
			System.out.println(fileName+"_"+newFileName);
			svo.setSoundPhoto(newFileName);
		}
		soundBoardService.SoundUpdate(svo);
		svo.setSoundGenre(request.getParameter("soundGenre"));
		
		hashtagService.hashSoundDeleteAllFromOneBoard(
				new HashtagVO(Integer.parseInt(soundBoardNo), svo.getSoundWriter(), null));
		String hashtags=request.getParameter("hashtag");
		System.out.println("해쉬태그들::"+hashtags);
		if(hashtags!=null){
			HashtagVO hashtagVO= new HashtagVO();
			hashtagVO.setSoundBoardNo(Integer.parseInt(soundBoardNo));
			hashtagVO.setSoundWriter(svo.getSoundWriter());
			hashtagVO.setKeyword(hashtags);
			hashtagService.hashSoundInsert(hashtagVO);
		}//해시태그 관련 부분...
		
		System.out.println("?��?��?��?��?�� ?��?��?��?�� :"+svo.getSoundUrl());
		System.out.println("?��?��?��?��?�� ?��?��?��?�� :"+svo.getSoundPhoto());
		return new ModelAndView("soundboard/sound_view","svo",svo);
	}
	
	@RequestMapping("soundDelete.do")
	public ModelAndView SoundDelete(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, SoundBoardVO svo) throws Exception{
		String soundUrl = svo.getSoundUrl();
		String soundPhotoUrl = svo.getSoundPhoto();
		System.out.println(soundUrl);
		if(soundUrl!=null){
			soundBoardService.deleteFile(audioPath+soundUrl);
		}
		if(soundPhotoUrl!=null){
			soundBoardService.deleteFile(picturePath+soundPhotoUrl);
		}
		soundBoardService.SoundDelete(svo.getSoundBoardNo());

		List<SoundBoardVO> list = soundBoardService.SoundBoardList();
		return new ModelAndView("soundboard/soundBoardListView","list",list);
	}

	@RequestMapping("soundBoardList.do")
	public ModelAndView SoundBoardList(HttpServletRequest request, HttpServletResponse response,HttpSession session, SoundBoardVO svo)throws Exception{

		List<SoundBoardVO> list = soundBoardService.SoundBoardList();
		return new ModelAndView("soundboard/soundBoardListView","list",list);
	}
	
	@RequestMapping("showContent.do")
	public ModelAndView ShowContent(HttpServletRequest request, HttpServletResponse response,HttpSession session, SoundBoardVO svo)throws Exception{
		/*로그?�� 체크*/
		MemberVO checkLogin =(MemberVO)request.getSession().getAttribute("loginMvo");
		if(checkLogin==null){
			return new ModelAndView("redirect:index.jsp");
		}//로그?�� 체크
		/*로그?�� 체크*/

		//System.out.println("번호�? 보이?��?"+svo);
		SoundBoardVO rvo = soundBoardService.ShowContent(svo.getSoundBoardNo());
		System.out.println("글번호::"+svo.getSoundBoardNo());
		System.out.println(rvo+"\n"+svo.getSoundWriter());
		soundBoardService.SoundUpdateCount(rvo.getSoundBoardNo());
		String soundBoardNo = String.valueOf(svo.getSoundBoardNo());
		if(soundBoardNo!=null){//게시�? ?���??�� ?��?��?��경우

			request.setAttribute("soundLikerNo", likerService.selectSoundLikerNumber(soundBoardNo));
			//?��?��?��그�?�? vo?�� 주입?�� 보여주기
			//soundBoardVO.setHashtagList(hashtagService.hashsoundSelectFromOnePost(svo.getSoundBoardNo()));

			//?���? 불러?�� ?���?
			List<ReplyVO> replyList = replyService.soundGetAllReply(rvo.getSoundBoardNo()+"");
			if(replyList!=null){
				rvo.setReplyList(replyList);
			}//?���? 불러?�� ?���?

			//?��?��?���? 불러?�� ?���?

			List<HashtagVO> hashTagList = hashtagService.hashSoundSelectFromOnePost(soundBoardNo);
			rvo.setHashtagList(hashTagList);
			System.out.println(hashTagList);
			//?��?��?���? 불러?�� ?���?

			return new ModelAndView("soundboard/sound_view","svo",rvo);

		}else{//게시물을 ?��?��?�� ?��?��?�� 경우
			request.setAttribute("soundLikerNo", likerService.selectSoundLikerNumber(soundBoardNo));
			return new ModelAndView("soundboard/sound_view","svo",rvo);
		}
	}

	@RequestMapping("getSoundUrl.do")
	public ModelAndView getSoundUrl(HttpServletRequest request, HttpServletResponse response,
			HttpSession session)throws Exception{

		List<SoundBoardVO> list = soundBoardService.SoundBoardList();
		return new ModelAndView("player/playList","list",list);
	}

	@RequestMapping("addAndDeleteSoundLiker.do")
	public ModelAndView addAndDeletesoundLiker(HttpServletRequest request, HttpServletResponse response
			) throws Exception{
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginMvo");
		if(mvo==null){
			return new ModelAndView("redirect:index.html");
		}
		System.out.println("좋아?�� 기능 ?��?��?��?��?��");
		int soundBoardNo = Integer.parseInt(request.getParameter("soundBoardNo"));
		String soundWriter = request.getParameter("soundWriter");
		SoundBoardVO soundBoardVO = soundBoardService.ShowContent(soundBoardNo);
		LikerVO liker = new LikerVO(soundWriter, mvo.getMemberId(), soundBoardNo);
		LikerVO likerCheck = likerService.getSoundLiker(liker);

		if(likerCheck==null){
			System.out.println("?��?�� ?��?��?��?�� 좋아?���? ?��르�? ?��?�� 추�??��겠습?��?��.");
			likerService.insertSoundLiker(liker);
		} else{
			System.out.println("?��?�� ?��?��?��?�� 좋아?���? ?��?��?�� 취소?��겠습?��?��.");
			likerService.deleteSoundLiker(liker);
		}
		int soundLikerNo = likerService.selectSoundLikerNumber(String.valueOf(soundBoardNo));
		return new ModelAndView("JsonView","soundLikerNo", soundLikerNo);
	}//addAndDeleteLiker

	@RequestMapping("sortByTime.do")
	public ModelAndView sortByDate(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("최신?��?���? ?��?��!!");
		List<SoundBoardVO> list = soundBoardService.SoundSortByDate();
		for(SoundBoardVO s : list) System.out.println(s.getPostedTime()+"\n");
		return new ModelAndView("sortByPostedTime","list", list);
	}

	@RequestMapping("sortByLiker.do")
	public ModelAndView sortByLiker(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("좋아?�� ?��?���? ?��?��!!");
		List<SoundBoardVO> slist = soundBoardService.SoundBoardList();
		List<LikerVO> likerList = likerService.sortByLiker();
		List<SoundBoardVO> list = new ArrayList<SoundBoardVO>();
		System.out.println("좋아요 갯수 :: "+likerList.size());
		if(likerList.size()==0){
			return new ModelAndView("sortByTime.do");
		}
		else{
			for(int i=0 ; i<slist.size() ; i++){
				int cnt=0;
				for(int j=0 ; j<likerList.size() ; j++){
					if(likerList.get(j).getSoundBoardNo()==slist.get(i).getSoundBoardNo()){
						cnt++;
					}
				}
				slist.get(i).setLikeCount(cnt);
			}
			int[] check = new int [slist.size()];
			for(int i=0 ; i<slist.size() ; i++){
				int max=0;
				int index=0;
				for(int j=0 ; j<slist.size() ; j++){
					if(max<=slist.get(j).getLikeCount() && check[j]!=1){
						max=slist.get(j).getLikeCount();
						index=j;
					}
				}
				list.add(slist.get(index));
				check[index]=1;
			}
			for(SoundBoardVO s : slist) System.out.println(s+"\n");
		}
		System.out.println(list.size());
		for(SoundBoardVO s : list) System.out.println(s);
		return new ModelAndView("sortByLiker","list", list);
	}

	@RequestMapping("sortByCount.do")
	public ModelAndView sortByCount(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("조회 ?��?���? ?��?��!!");
		List<SoundBoardVO> list = soundBoardService.SoundSortByCount();
		for(SoundBoardVO s : list) System.out.println(s.getSoundTitle()+" :: "+s.getSoundCount()+"\n");
		return new ModelAndView("sortByCount","list", list);
	}

	@RequestMapping("soundInsertReply.do")
	public ModelAndView soundInsertReply(HttpServletRequest request, HttpServletResponse response
			) throws Exception{
		System.out.println("?���??��?��");
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginMvo");
		if(mvo==null){
			return new ModelAndView("redirect:index.html");
		}
		ReplyVO replyVo = new ReplyVO(mvo.getMemberId(), 
				request.getParameter("soundWriter"), 
				request.getParameter("replyComment"),
				Integer.parseInt(request.getParameter("soundBoardNo")));
		System.out.println(replyVo);
		replyService.soundInsertReply(replyVo);
		int no = Integer.parseInt(request.getParameter("soundBoardNo"));
		SoundBoardVO soundBoardVO = soundBoardService.ShowContent(no);
		soundBoardVO.setReplyList(replyService.soundGetAllReply(request.getParameter("soundBoardNo")));
		return new ModelAndView("JsonView","svo", soundBoardVO);		
	}

	//?���? ?��?��
	@RequestMapping("soundUpdateReply.do")
	public ModelAndView soundUpdateReply(HttpServletRequest request, HttpServletResponse response
			) throws Exception{

		MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginMvo");
		if(mvo==null){
			return new ModelAndView("redirect:index.html");
		}

		String soundBoardNo = request.getParameter("soundBoardNo");
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
		String replyComment = request.getParameter("replyComment");

		replyService.soundUpdateReply(new ReplyVO(replyComment,replyNo));

		SoundBoardVO svo = soundBoardService.ShowContent(Integer.parseInt(soundBoardNo));
		svo.setReplyList(replyService.soundGetAllReply(request.getParameter("soundBoardNo")));
		return new ModelAndView("JsonView","svo",svo);		
	}

	@RequestMapping("soundDeleteReply.do")
	public ModelAndView soundDeleteReply(HttpServletRequest request, HttpServletResponse response
			) throws Exception{

		MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginMvo");
		if(mvo==null){
			return new ModelAndView("redirect:index.jsp");
		}

		replyService.soundDeleteReply(request.getParameter("replyNo"));
		String soundBoardNo = request.getParameter("soundBoardNo");
		SoundBoardVO soundBoardVO = soundBoardService.ShowContent(Integer.parseInt(soundBoardNo));
		soundBoardVO.setReplyList(replyService.soundGetAllReply(soundBoardNo));
		//return new ModelAndView("JsonView","soundBoardVO",soundBoardVO);
		return new ModelAndView("JsonView","svo",soundBoardVO);
	}
	
	@RequestMapping("soundSearchByGenre.do")
	public ModelAndView soundSearchByGenre(HttpServletRequest request, HttpServletResponse response
			) throws Exception{
		
		String genre = request.getParameter("genre");
		System.out.println(genre+"리스트 출력!");
		List<SoundBoardVO> list = soundBoardService.searchByGenre(genre);
		
		return new ModelAndView("JsonView","list", list);
	}
}
