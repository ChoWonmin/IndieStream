package spring.indiestream.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import spring.indiestream.domain.HashtagVO;
import spring.indiestream.domain.ImageVO;
import spring.indiestream.domain.LikerVO;
import spring.indiestream.domain.MemberVO;
import spring.indiestream.domain.ReplyVO;
import spring.indiestream.domain.SnsBoardVO;
import spring.indiestream.service.HashtagService;
import spring.indiestream.service.ImageService;
import spring.indiestream.service.LikerService;
import spring.indiestream.service.ListService;
import spring.indiestream.service.MemberService;
import spring.indiestream.service.ReplyService;
import spring.indiestream.service.SnsBoardService;

@Controller
public class SnsBoardController {
   
   @Autowired
   private SnsBoardService snsBoardService;
   @Autowired
   private ImageService imageService;
   @Autowired
   private HashtagService hashtagService;
   @Autowired
   private LikerService likerService;
   @Autowired
   private ReplyService replyService;
   @Autowired
   private ListService listService;
   @Autowired
   private MemberService memberService;

   
   private String path = 
		   "C:\\hnc\\jwm\\finalProject\\eclipse\\finalWorkspace\\indieStream08_0718_2\\src\\main\\webapp\\snsupload\\";
   //글 목록 보기
   @RequestMapping("snsSelectAll.do")
   public ModelAndView snsSelectAll(HttpServletRequest request, HttpServletResponse response, HttpSession session) 
         throws Exception{
      snsBoardService.snsDeleteUnchecked();
      MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
      if(loginMvo==null){
         return new ModelAndView("redirect:view/login_test.jsp");
      }
      int page =1;
      if(request.getParameter("page")!=null)
         page = Integer.parseInt(request.getParameter("page"));
      
      
      page = (page!=0)?page:1;
      
      List<SnsBoardVO> snsBoardList = listService.selectFollowSnsBoard(loginMvo.getMemberId(), page);
      for(int i =0; i<snsBoardList.size(); i++){
         snsBoardList.get(i).setImageList(imageService.imageSelectAll(snsBoardList.get(i).getSnsBoardNo()+""));
      }
      
      for(SnsBoardVO i:snsBoardList)
            i.setLikeCount(likerService.selectSnsLikerNumber(i.getSnsBoardNo()+""));
      
      return new ModelAndView("snsboard/snsBoardListView","snsBoardList",snsBoardList);
   }//snsSelectAll
   
   @RequestMapping("MasonSnsSelectAll.do")
   public ModelAndView MasonSnsSelectAll(HttpServletRequest request, HttpServletResponse response, HttpSession session) 
         throws Exception{
      
      snsBoardService.snsDeleteUnchecked();
      MemberVO loginMvo = (MemberVO) session.getAttribute("loginMvo");
      if(loginMvo==null){
         return new ModelAndView("redirect:view/login_test.jsp");
      }
      int page = Integer.parseInt(request.getParameter("page"));
      
      List<SnsBoardVO> snsBoardList = listService.selectFollowSnsBoard(loginMvo.getMemberId(), page);
      for(int i =0; i<snsBoardList.size(); i++){
         snsBoardList.get(i).setImageList(imageService.imageSelectAll(snsBoardList.get(i).getSnsBoardNo()+""));
      }
      
      for(SnsBoardVO i:snsBoardList)
            i.setLikeCount(likerService.selectSnsLikerNumber(i.getSnsBoardNo()+""));
      
      return new ModelAndView("JsonView","snsBoardList",snsBoardList);
   }//MasonSnsSelectAll
   
   //글 자세히 보기
   @RequestMapping("snsSelectOne.do")
   public ModelAndView snsSelectOne(HttpServletRequest request, HttpServletResponse response) 
         throws Exception{
      MemberVO memberVO =(MemberVO)request.getSession().getAttribute("loginMvo");
      if(memberVO==null){//로그인 체크
         return new ModelAndView("login_test");
      }//로그인 체크
      
      
      String snsBoardNo = request.getParameter("snsBoardNo");
      if(snsBoardNo!=null){//게시물 클릭해 들어올경우
         SnsBoardVO snsBoardVO = snsBoardService.snsSelectOne(snsBoardNo);
         snsBoardVO.setImageList(imageService.imageSelectAll(snsBoardNo));
         request.setAttribute("snsLikerNo", likerService.selectSnsLikerNumber(snsBoardNo));
         //해쉬태그부분 보여주기
         snsBoardVO.setHashtagList(hashtagService.hashSnsSelectFromOnePost(snsBoardNo));
         
         snsBoardVO.setMember(memberService.findById(snsBoardVO.getSnsWriter()));
         
         //댓글 불러서 넣기
         List<ReplyVO> replyList = replyService.snsGetAllReply(snsBoardVO.getSnsBoardNo()+"");
         if(replyList!=null){
            //request.setAttribute("replyList",replyList);
            snsBoardVO.setReplyList(replyList);
         }
         return new ModelAndView("snsboard/snsBoardView","snsBoardVO",snsBoardVO);
         
      }else{//게시물을 작성해 들어올 경우
         SnsBoardVO snsBoardVO=(SnsBoardVO)request.getAttribute("snsBoardVO");
         request.setAttribute("snsLikerNo", likerService.selectSnsLikerNumber(snsBoardNo));
         snsBoardVO.setMember(memberService.findById(snsBoardVO.getSnsWriter()));
         return new ModelAndView("snsboard/snsBoardView","snsBoardVO",snsBoardVO);
      }
   }//snsSelectOne
      
   //글쓰기 1 (처음 글쓰기 버튼 클릭시)
   @RequestMapping("snsInsert.do")
   public ModelAndView snsInsert(HttpServletRequest request, HttpServletResponse response) 
         throws Exception{

      MemberVO memberVO =(MemberVO)request.getSession().getAttribute("loginMvo");
      if(memberVO==null){//로그인 체크
         return new ModelAndView("redirect:view/login_test.jsp");
      }      
      
      SnsBoardVO snsBoardVO = new SnsBoardVO();
      snsBoardVO.setSnsWriter(memberVO.getMemberId());
      snsBoardVO.setSnsContent("asd");
      //snsBoardVO.setVideoUrl("");
      
      snsBoardService.snsInsert(snsBoardVO);
      snsBoardVO.setSnsBoardNo(snsBoardService.snsCurrentNo());
      return new ModelAndView("snsboard/snsBoardWrite","snsBoardVO",snsBoardVO);
   }//snsInsert
   
   
   //글쓰기 2 (글쓰기 버튼 마지막에 누를때까지)
   @RequestMapping("snsUpdate.do")
   public ModelAndView snsUpdate(HttpServletRequest request, 
                               HttpServletResponse response, SnsBoardVO snsBoardVO) 
         throws Exception{
      System.out.println("snsBoardVO.getUploadFile()"+snsBoardVO.getUploadFile());
      System.out.println(1);
      MemberVO rvo = (MemberVO)request.getSession().getAttribute("loginMvo");
      snsBoardVO.setSnsContent((request.getParameter("snsContent")));//
      //페이지에서  넘겨받은것
      if(rvo==null) //로그인 상태가 아니라 글쓰기 할 수 없다
         return new ModelAndView("redirect:view/login_test.jsp");//
      
      String uploadOrSave=request.getParameter("uploadOrSave");
        if(uploadOrSave.equals("true")){
           //업로드 누르면 check_done이 0에서 1로 변경
           snsBoardService.snsUpdateToChecked(snsBoardVO.getSnsBoardNo()+"");
           
          //해시태그 관련 부분...
          String hashtags=request.getParameter("text");
          if(hashtags!=null && !(hashtags.equals(""))){
             HashtagVO hashtagVO= new HashtagVO();
             hashtagVO.setSnsBoardNo(snsBoardVO.getSnsBoardNo());
             System.out.println(snsBoardVO.getSnsBoardNo());
             hashtagVO.setSnsWriter(snsBoardVO.getSnsWriter());
             System.out.println(snsBoardVO.getSnsWriter());
             hashtagVO.setKeyword(hashtags);
             System.out.println(hashtagVO);
             hashtagService.hashSnsInsert(hashtagVO);
          }//해시태그 관련 부분...
           snsBoardService.snsUpdate(snsBoardVO);
         request.setAttribute("snsBoardVO", snsBoardVO);
           return new ModelAndView("snsSelectOne.do");
        }else{
           System.out.println("else last");
           return new ModelAndView("JsonView","snsBoardVO",snsBoardVO);
        }
   }//snsUpdate
   
   
   //글, 이미지 삭제
   @RequestMapping("snsDelete.do")
   public ModelAndView snsDelete(HttpServletRequest request, HttpServletResponse response) 
         throws Exception{
      snsBoardService.snsDelete(request.getParameter("snsBoardNo"));
      return new ModelAndView("snsSelectAll.do");
   }//snsDelete
   
   @RequestMapping("imageDelete.do")
   public ModelAndView imageDelete(HttpServletRequest request, HttpServletResponse response) 
         throws Exception{
      
      //String url = request.getParameter("url");
      ImageVO imageVO = new ImageVO(Integer.parseInt(request.getParameter("snsImageNo")), 
                             Integer.parseInt(request.getParameter("snsBoardNo")));
      
      imageService.imageDeleteOne(imageVO);

      //이미지 리스트에 변경ㅇ 왔으니 snsBoardVO 에 갱신을 해줘야한다.
      //SnsBoardVO snsBoardVO=(SnsBoardVO)request.getAttribute("snsBoardVO");
      SnsBoardVO snsBoardVO=snsBoardService.snsSelectOne(request.getParameter("snsBoardNo"));   

      snsBoardVO.setImageList(imageService.imageSelectAll(snsBoardVO.getSnsBoardNo()+""));
      request.setAttribute("snsBoardVO", snsBoardVO);
      return new ModelAndView("JsonView");
   }
   
   
   //수정 중 이미지 삭제
   @RequestMapping("imageDeleteinUpdate.do")
   public ModelAndView imageDeleteinUpdate(HttpServletRequest request, HttpServletResponse response) 
         throws Exception{
      
      //String url = request.getParameter("url");
      ImageVO imageVO = new ImageVO(Integer.parseInt(request.getParameter("snsImageNo")), 
                             Integer.parseInt(request.getParameter("snsBoardNo")));
      
      imageService.imageDeleteOne(imageVO);
      //이미지 리스트에 변경ㅇ 왔으니 snsBoardVO 에 갱신을 해줘야한다.
      SnsBoardVO snsBoardVO=snsBoardService.snsSelectOne(request.getParameter("snsBoardNo"));   
      //SnsBoardVO snsBoardVO=(SnsBoardVO)request.getAttribute("snsBoardVO");
      snsBoardVO.setImageList(imageService.imageSelectAll(snsBoardVO.getSnsBoardNo()+""));
      request.setAttribute("snsBoardVO", snsBoardVO);
      
      return new ModelAndView("snsboard/snsBoardWriteUpdate");
   }
   
   //수정
   @RequestMapping("snsRealUpdate.do")
   public ModelAndView snsRealUpdate(HttpServletRequest request, 
                               HttpServletResponse response, SnsBoardVO snsBoardVO) throws Exception {
      
      MemberVO rvo = (MemberVO)request.getSession().getAttribute("loginMvo");
      if(rvo==null) //로그인 상태가 아니라 글쓰기 할 수 없다
         return new ModelAndView("redirect:view/login_test.jsp");
      
      //처음 수정버튼 눌러 받은 번호로 db에서 값받아올 dbSnsBoardVO생성
      SnsBoardVO dbSnsBoardVO=snsBoardService.snsSelectOne(snsBoardVO.getSnsBoardNo()+"");//
      snsBoardVO.setSnsWriter(dbSnsBoardVO.getSnsWriter());
      snsBoardVO.setVideoUrl(dbSnsBoardVO.getVideoUrl());//
      snsBoardVO.setImageList(imageService.imageSelectAll(snsBoardVO.getSnsBoardNo()+""));
      System.out.println(snsBoardVO.getVideoUrl());
      //해쉬태그부분 보여주기
      snsBoardVO.setHashtagList(hashtagService.hashSnsSelectFromOnePost(snsBoardVO.getSnsBoardNo()+""));
         
      
      snsBoardVO.setImageList(imageService.imageSelectAll(snsBoardVO.getSnsBoardNo()+""));
      request.setAttribute("snsBoardVO", snsBoardVO);
      
      //분기점 save or upload  : 자바 스크립트에서 히든 값을 ture 냐 false에 따라 달라짐
      String uploadOrSave=request.getParameter("uploadOrSave");
      System.out.println("uploadOrSave"+uploadOrSave);
      snsBoardService.snsUpdate(snsBoardVO);
      request.setAttribute("snsBoardVO", snsBoardVO);
      if(uploadOrSave!=null){
         if(uploadOrSave.equals("true")){
            //해시태그 관련 부분...
            System.out.println("hashtagService ddddd1");
            hashtagService.hashSnsDeleteAllFromOneBoard(
                  new HashtagVO(snsBoardVO.getSnsWriter(), null, snsBoardVO.getSnsBoardNo()));
            String hashtags=request.getParameter("text");
            System.out.println("snsBoardVO.getSnsWriter()::"+snsBoardVO.getSnsWriter());
            System.out.println("snsBoardVO.getSnsBoardNo()::"+snsBoardVO.getSnsBoardNo());
            System.out.println("해쉬태그들::"+hashtags);
            if(hashtags!=null){
               HashtagVO hashtagVO= new HashtagVO();
               hashtagVO.setSnsBoardNo(snsBoardVO.getSnsBoardNo());
               System.out.println(snsBoardVO.getSnsBoardNo());
               hashtagVO.setSnsWriter(snsBoardVO.getSnsWriter());
               System.out.println(snsBoardVO.getSnsWriter());
               hashtagVO.setKeyword(hashtags);
               System.out.println(hashtagVO);
               hashtagService.hashSnsInsert(hashtagVO);
            }//해시태그 관련 부분...
            snsBoardService.snsUpdate(snsBoardVO);
            request.setAttribute("snsBoardVO", snsBoardVO);
            return new ModelAndView("snsSelectOne.do");
           }else{
              System.out.println("else last");
              /*           JSONObject json = new JSONObject();
                         json.put("snsBoardVO", snsBoardVO);*/
              return new ModelAndView("JsonView","snsBoardVO",snsBoardVO);
           }
      }//uploadOrSave!=null
      System.out.println("수정버튼으로 들어옴");
      return new ModelAndView("snsboard/snsBoardWriteUpdate", "snsBoardVO", snsBoardVO);
           //return new ModelAndView("snsboard/snsBoardWriteUpdate");
      //return new ModelAndView("","snsBoardVO",snsBoardVO);
   }//snsRealUpdate
   
   
   //해시태그 삭제 및 삭제취소 기능
   @RequestMapping("keywordDelete.do")
   public ModelAndView keywordDelete(HttpServletRequest request, HttpServletResponse response) 
         throws Exception{
      //get방식으로 받는데 주소값으로 보낼 때 한계가 있을까봐 key값을 최대한 줄였다.
      String snsBoardNo=request.getParameter("snsBoardNo");
      SnsBoardVO snsBoardVO = snsBoardService.snsSelectOne(snsBoardNo);
      System.out.println(snsBoardVO);
      String snsWriter=snsBoardVO.getSnsWriter();
      System.out.println(snsWriter);
      String keyword=request.getParameter("keyword");
      System.out.println(keyword);
      HashtagVO hashtagVO = new HashtagVO(snsWriter, keyword, Integer.parseInt(snsBoardNo));
      hashtagService.hashSnsDeleteFromOneBoard(hashtagVO);
      
      
      snsBoardVO.setHashtagList(hashtagService.hashSnsSelectFromOnePost(snsBoardNo));
      snsBoardVO.setImageList(imageService.imageSelectAll(snsBoardNo));
      
      return new ModelAndView("JsonView","snsBoardVO", snsBoardVO);
   }//keywordDelete
   
   @RequestMapping("keywordDeleteCancel.do")
   public ModelAndView keywordDeleteCancel(HttpServletRequest request, HttpServletResponse response) 
         throws Exception{
      String snsBoardNo=request.getParameter("snsBoardNo");
      SnsBoardVO snsBoardVO = snsBoardService.snsSelectOne(snsBoardNo);

      String[] hashtags=request.getParameterValues("backUpHashtag");
      //전부 지우고 // 새로 삽입하는 로직
      if(hashtags!= null){
         HashtagVO hashtagVO= new HashtagVO();
         hashtagVO.setSnsBoardNo(snsBoardVO.getSnsBoardNo());
         hashtagVO.setSnsWriter(snsBoardVO.getSnsWriter());
         hashtagService.hashSnsDeleteAllFromOneBoard(hashtagVO);
         for(int i=0;i<hashtags.length;i++){
            hashtagVO.setKeyword(hashtags[i]);
            hashtagService.snsBackUpHashtagInsert(hashtagVO);
         }//for
      }//if
      return new ModelAndView("snsSelectAll.do");
   }//keywordDeleteCancel
   
   //좋아요 
   @RequestMapping("addAndDeleteSnsLiker.do")
   public ModelAndView addAndDeleteSnsLiker(HttpServletRequest request, HttpServletResponse response
         ) throws Exception{
      MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginMvo");
      if(mvo==null){
         return new ModelAndView("redirect:view/login_test.jsp");
      }
      System.out.println(request.getParameter("snsBoardNo"));
      int snsBoardNo = Integer.parseInt(request.getParameter("snsBoardNo"));
      String snsWriter = request.getParameter("snsWriter");
      SnsBoardVO snsBoardVO = snsBoardService.snsSelectOne(snsBoardNo+"");
      LikerVO liker = new LikerVO(snsBoardNo, snsWriter, mvo.getMemberId());
      LikerVO likerCheck = likerService.getSnsLiker(liker);

      if(likerCheck==null){
         System.out.println("해당 사용자는 좋아요를 누르지 않아 추가하겠습니다.");
         likerService.insertSnsLiker(liker);
      } else{
         System.out.println("해당 사용자는 좋아요를 눌러서 취소하겠습니다.");
         likerService.deleteSnsLiker(liker);
      }
      int snsLikerNo=likerService.selectSnsLikerNumber(snsBoardNo+"");
      return new ModelAndView("JsonView","snsLikerNo", snsLikerNo);
   }//addAndDeleteLiker

   //댓글작성
   @RequestMapping("snsInsertReply.do")
   public ModelAndView snsInsertReply(HttpServletRequest request, HttpServletResponse response
         ) throws Exception{
      System.out.println("댓글작성");
      MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginMvo");
      if(mvo==null){
         return new ModelAndView("redirect:view/login_test.jsp");
      }
      ReplyVO replyVo = new ReplyVO(mvo.getMemberId(), 
                           request.getParameter("snsWriter"), 
                           Integer.parseInt(request.getParameter("snsBoardNo")), 
                           request.getParameter("replyComment"));
      System.out.println(replyVo);
      replyService.snsInsertReply(replyVo);
      SnsBoardVO snsBoardVO=snsBoardService.snsSelectOne(request.getParameter("snsBoardNo"));
      snsBoardVO.setReplyList(replyService.snsGetAllReply(request.getParameter("snsBoardNo")));
      return new ModelAndView("JsonView","snsBoardVO", snsBoardVO);      
   }
   
   //댓글 수정
   @RequestMapping("snsUpdateReply.do")
   public ModelAndView snsUpdateReply(HttpServletRequest request, HttpServletResponse response
         ) throws Exception{
      
      MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginMvo");
      if(mvo==null){
         return new ModelAndView("redirect:view/login_test.jsp");
      }
      
         String snsBoardNo = request.getParameter("snsBoardNo");
         int replyNo = Integer.parseInt(request.getParameter("replyNo"));
         String replyComment = request.getParameter("replyComment");
         
         replyService.snsUpdateReply(new ReplyVO(replyNo, replyComment));
         
         SnsBoardVO snsBoardVO = snsBoardService.snsSelectOne(snsBoardNo);
         snsBoardVO.setReplyList(replyService.snsGetAllReply(request.getParameter("snsBoardNo")));
         return new ModelAndView("JsonView","snsBoardVO",snsBoardVO);      
   }
   
   @RequestMapping("snsDeleteReply.do")
   public ModelAndView snsDeleteReply(HttpServletRequest request, HttpServletResponse response
         ) throws Exception{
      
      MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginMvo");
      if(mvo==null){
         return new ModelAndView("redirect:view/login_test.jsp");
      }
      
      replyService.snsDeleteReply(request.getParameter("replyNo"));
      String snsBoardNo = request.getParameter("snsBoardNo");
      SnsBoardVO snsBoardVO = snsBoardService.snsSelectOne(snsBoardNo);
      snsBoardVO.setReplyList(replyService.snsGetAllReply(snsBoardNo));
      return new ModelAndView("JsonView","snsBoardVO",snsBoardVO);      
   }
   
   //비디오 삭제
   @RequestMapping("deleteVideo.do")
   public ModelAndView deleteVideo(HttpServletRequest request, HttpServletResponse response
         ) throws Exception{
      MemberVO mvo = (MemberVO)request.getSession().getAttribute("loginMvo");
      if(mvo==null){
         return new ModelAndView("redirect:view/login_test.jsp");
      }
      SnsBoardVO snsBoardVO=snsBoardService.snsSelectOne((request.getParameter("snsBoardNo")));
      
      snsBoardVO.setVideoUrl(null);
      snsBoardService.snsBoardVideoUrlUpdate(snsBoardVO); //db에 url 넣어줌
      return new ModelAndView("JsonView","snsBoardVO", snsBoardVO);      
   }

   
   @RequestMapping("snsUpload.do")
   public ModelAndView snsUpload(HttpServletRequest request, HttpServletResponse response)
         throws Exception{
      System.out.println("=============snsUploadsnsUploadsnsUpload===");
      String snsBoardNo= request.getParameter("snsBoardNo");
      String uploadFileCheck= request.getParameter("uploadFileCheck");
      String uploadFileVideoCheck= request.getParameter("uploadFileVideoCheck");
      SnsBoardVO snsBoardVO=snsBoardService.snsSelectOne(snsBoardNo);
      
      System.out.println("uploadFileCheck::"+uploadFileCheck);
      System.out.println("uploadFileVideoCheck::"+uploadFileVideoCheck);
      System.out.println("snsBoardNo:: "+snsBoardNo);
      if(uploadFileCheck.equals("true") || uploadFileVideoCheck.equals("true")){
         System.out.println("first==== if");
         if(uploadFileCheck.equals("true")){
            System.out.println("uploadFileCheck.equals");
            MultipartHttpServletRequest req =(MultipartHttpServletRequest) request;
            MultipartFile pFile=req.getFile("uploadFile");
            if(pFile!=null){
               System.out.println("pFile!=null");
               if(pFile.isEmpty()==false){
                  System.out.println("pFile.isEmpty()==false");
                  String saveFileName = System.currentTimeMillis()+"_"+pFile.getOriginalFilename();

                  ImageVO imageVO = new ImageVO(0, snsBoardVO.getSnsBoardNo(), 
                                             snsBoardVO.getSnsWriter(), saveFileName);

                  File copyFile = new File(path+saveFileName);
                  pFile.transferTo(copyFile);
                  imageService.imageInsert(imageVO);

                  //board 객체에 board No에 해당하는 이미지를 DB에서 받아, 그 객체의 imageList에 받아 객체에 집어넣는다.
                  snsBoardVO.setImageList(imageService.imageSelectAll(snsBoardVO.getSnsBoardNo()+""));
               }//pFile.isEmpty()==false
            }//pFile==null
         }//uploadFileCheck

         if(uploadFileVideoCheck.equals("true")){
            System.out.println("uploadFileVideoCheck.equals");
            MultipartHttpServletRequest req =(MultipartHttpServletRequest) request;
            MultipartFile vFile=req.getFile("uploadFileVideo");
            if(vFile!=null){
               System.out.println("vFile!=null");
               if(vFile.isEmpty()==false){
                  System.out.println("vFile.isEmpty()==false");
                  String saveFileName = System.currentTimeMillis()+"_"+vFile.getOriginalFilename();
         
                  File copyFile = new File(path+saveFileName);
                  vFile.transferTo(copyFile);
                  snsBoardVO.setVideoUrl(saveFileName);
                  snsBoardService.snsBoardVideoUrlUpdate(snsBoardVO); //db에 url 넣어줌
               }//pFile.isEmpty()==false
            }//pFile==null
         }//profilePhotoCheck
         return new ModelAndView("JsonView","snsBoardVO",snsBoardVO);
      }
      //자바스크립트 에러 발생
      System.out.println("//자바스크립트 에러 발생");
      return new ModelAndView("redirect:view/login_test.jsp");
   }
   
}//class