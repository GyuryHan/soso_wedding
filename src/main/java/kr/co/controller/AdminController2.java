package kr.co.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.QnaBoardService;
import kr.co.service.QnaReplyService;
import kr.co.service.ReplyService;
import kr.co.service.ReviewBoardService;
import kr.co.service.ReviewReplyService;
import kr.co.service.dminService;
import kr.co.vo.AdminNoticesVO;
import kr.co.vo.BoardVO;
import kr.co.vo.GoodsVO;
import kr.co.vo.GoodsViewVO;
import kr.co.vo.MemberVO;
import kr.co.vo.MoneyVO;
import kr.co.vo.PageMaker;
import kr.co.vo.QnaBoardVO;
import kr.co.vo.QnaReplyVO;
import kr.co.vo.ReplyVO;
import kr.co.vo.ReviewBoardVO;
import kr.co.vo.ReviewReplyVO;
import kr.co.vo.SearchCriteria;
import kr.co.vo.VisitorCountVO;

@Controller
@RequestMapping("/admin2/*")
public class AdminController2 {
   
   private static final Logger logger = LoggerFactory.getLogger(AdminController2.class);
   
   @Inject
   dminService dminService;
   @Inject
    ReplyService replyService;
   @Inject
   QnaBoardService qnaService;
   @Inject
   QnaReplyService qnaRService;
   
   @Inject
   ReviewBoardService reviewService;
   @Inject
   ReviewReplyService reviewRService;
      
   @Resource(name="uploadPath")
   private String uploadPath;
   
   // 관리자화면
   @RequestMapping(value = "/index", method = RequestMethod.GET)
   public void getIndex(Model model) throws Exception {
      logger.info("관리자페이지"); 
         int memberCount = dminService.memberCount();
         int companyCount = dminService.companyCount();
         int todayCount = dminService.todayCount();
         int totalMoneny = dminService.totalMoney();
         
         
         
         model.addAttribute("getTodayCount",todayCount);
         model.addAttribute("getMemberCount", memberCount);
         model.addAttribute("getCompanyCount", companyCount);
         model.addAttribute("getToalMoneyCount", totalMoneny);
         System.out.println("회원 수 " + memberCount);
         System.out.println("기업 수 " + companyCount);
         System.out.println("오늘 방문자 수" + todayCount);
         
   }

   
   // 상품 목록
   @RequestMapping(value = "/goods/list", method = RequestMethod.GET)
   public String getGoodsList(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception {
      logger.info("get goods list");
      model.addAttribute("list", dminService.goodslist(scri));  // 변수 list의 값을 list 세션에 부여
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(scri);
        pageMaker.setTotalCount(dminService.listCount2(scri));
        model.addAttribute("pageMaker", pageMaker);
        
      return "admin2/goods/list";
   }
   // 상품 조회
   @RequestMapping(value = "/goods/view", method = RequestMethod.GET)
   public String getGoodsview(@RequestParam("n") int gdsNum, Model model) throws Exception {
         logger.info("get goods view");
         
         GoodsViewVO goods = dminService.goodsView(gdsNum);
         System.out.println(goods.toString());
         model.addAttribute("goods", goods);
         
         return "admin2/goods/view";
         
   }
   
   // 승인 게시판 삭제
   @RequestMapping(value = "/goods/delete", method = RequestMethod.GET)
   public String delete(GoodsVO goodsVO) throws Exception {

      logger.info("게시글 허가   [삭제]");

      dminService.delete(goodsVO.getGdsNum());

      return "redirect:/admin2/goods/list";
   }

   // 게시판 수정
   @RequestMapping(value = "/goods/update2", method = RequestMethod.GET)
   public String update2(GoodsVO goodsVO) throws Exception {
      logger.info("update2");
      dminService.update2(goodsVO);

      return "redirect:/admin2/goods/view?n="+goodsVO.getGdsNum();
   }

   // 게시판 수정
   @RequestMapping(value = "/goods/update3", method = RequestMethod.GET)
   public String update3(GoodsVO goodsVO) throws Exception {
      logger.info("update3");
      dminService.update3(goodsVO);

      return "redirect:/admin2/goods/view?n="+goodsVO.getGdsNum();
   }

   // 공지사항 목록
   @RequestMapping(value = "/goods/notices", method = RequestMethod.GET)
   public String notices(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception {
      logger.info("관리자: 공지사항 목록");

      model.addAttribute("notices", dminService.notices(scri));
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(scri);
        pageMaker.setTotalCount(dminService.listCount3(scri));
        model.addAttribute("pageMaker", pageMaker);
        
      return "admin2/goods/notices";
   }

   // 공지사항 게시판 글 작성 이동
   @RequestMapping(value = "/goods/noticesS", method = RequestMethod.GET)
   public void noticesS() throws Exception {
      logger.info("관리자 : 공지사항 게시판 글 작성");
   }

   // 공지사항 게시판 글 작성
   @RequestMapping(value = "/goods/noticesW", method = RequestMethod.POST)
   public String noticesW(AdminNoticesVO adminNoticesVO, MultipartHttpServletRequest mpRequest) throws Exception {
      logger.info("관리자 : 공지사항 작성요청");
      
      dminService.noticesW(adminNoticesVO, mpRequest);
      return "redirect:/admin2/goods/notices";
      
   }
   // 공지사항 상세 조회
      @RequestMapping(value = "/goods/noticesR", method = RequestMethod.GET)
      public void noticesR(@RequestParam("no") int no, Model model) throws Exception {
         logger.info("관리자: 공지사항 상세 목록");
         
         AdminNoticesVO vo = dminService.noticesR(no);
         model.addAttribute("noticesR", vo);
      
         List<Map<String, Object>> fileList = dminService.selectFileList2(vo.getNo());
         model.addAttribute("file_1", fileList);
         dminService.noticesHit(no);
      }   
   // 공지사항 수정
   @RequestMapping(value = "/goods/noticesU", method = RequestMethod.GET)
   public String noticesU(AdminNoticesVO vo,@RequestParam("no")int no,Model model) throws Exception {
      model.addAttribute("noticesU", dminService.noticesR(no));
      
      List<Map<String, Object>> fileList = dminService.selectFileList2(vo.getNo());
      model.addAttribute("file_1", fileList);
      return "admin2/goods/noticesU";
   }
   // 공지사항 수정
   @RequestMapping(value = "/goods/noticesUE", method = RequestMethod.POST)
   public String noticesUE(AdminNoticesVO adminNoticesVO,@RequestParam(value = "fileNoDel[]") String[] files,
            @RequestParam(value = "fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
      dminService.noticesUE(adminNoticesVO, files, fileNames, mpRequest);
      return "redirect:noticesR?no="+adminNoticesVO.getNo();
   }
   
   // 공지사항 삭제
      @RequestMapping(value = "/goods/noticesD", method = RequestMethod.GET)
      public String noticesD(AdminNoticesVO adminNoticesVO) throws Exception {

         logger.info("공지사항    [삭제]");

         dminService.noticesD(adminNoticesVO.getNo());

         //return "redirect:boardListR?no="+boardVO.getBno();
         return "redirect:/admin2/goods/notices"; 
      }
   
//--------------------------------------------------------------------------------------
   // 기업리스트
   @RequestMapping(value = "/goods/company", method = RequestMethod.GET)
   public String companyList(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception {   
      logger.info("관리자 : 기업 목록");

      model.addAttribute("companyList", dminService.companyList(scri));
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(scri);
        pageMaker.setTotalCount(dminService.listCount4(scri));
        model.addAttribute("pageMaker", pageMaker);
        
      return "admin2/goods/company";
   }
   // 회원탈퇴
      @RequestMapping(value = "/goods/companyDelete", method = RequestMethod.GET)
      public String companydelete(MemberVO memberVO) throws Exception {
      dminService.memberDelete(memberVO.getUserId());
      return "redirect:/admin2/goods/company";
      }
//---------------------------------------------------------------------------------------   
   // 유저리스트
   @RequestMapping(value = "/goods/user", method = RequestMethod.GET)
   public String userList(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception {   
      logger.info("관리자 : 유저 목록");

      model.addAttribute("memberList", dminService.memberList(scri));
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(scri);
        pageMaker.setTotalCount(dminService.listCount1(scri));
        model.addAttribute("pageMaker", pageMaker);
        
      return "admin2/goods/user";
   }

   // 회원탈퇴
   @RequestMapping(value = "/goods/memberDelete", method = RequestMethod.GET)
   public String memberdelete(MemberVO memberVO) throws Exception {
      System.out.println("관리자 : 회원탈퇴 " + memberVO);
      dminService.memberDelete(memberVO.getUserId());

      return "redirect:/admin2/goods/user";
   }

   // -------------------------------------------------------------------
   // 게시판 목록 조회
   @RequestMapping(value = "/goods/boardList", method = RequestMethod.GET)
      public String boardList(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception {
         logger.info("관리자 : 자유게시판 목록");
         model.addAttribute("boardList", dminService.boardList(scri));
         
         PageMaker pageMaker = new PageMaker();
         pageMaker.setCri(scri);
           pageMaker.setTotalCount(dminService.listCount(scri));
           model.addAttribute("pageMaker", pageMaker);
         
         return "admin2/goods/boardList";
   }
   // 게시판 상세 조회   
   @RequestMapping(value = "/goods/boardListR", method = RequestMethod.GET)
   public String boardListR(BoardVO boardVO,@ModelAttribute("scri") SearchCriteria scri,@RequestParam("bno") int no, Model model) throws Exception {
      logger.info("관리자 : 자유게시판 상세 조회");
      BoardVO vo = dminService.boardListR(boardVO.getBno());
      
      // 상세조회
      model.addAttribute("boardListR", vo);
      model.addAttribute("scri", scri);
      
      //댓글 조회
      List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
       model.addAttribute("replyList", replyList);
       
       List<Map<String, Object>> fileList = dminService.selectFileList(boardVO.getBno());
       model.addAttribute("file", fileList);
       
       return "/admin2/goods/boardListR";
   }   

   // 게시글 삭제
   @RequestMapping(value = "/goods/boardListD", method = RequestMethod.GET)
   public String boardListD(BoardVO boardVO) throws Exception {

      logger.info("게시글 허가   [삭제]");

      dminService.boardListD(boardVO.getBno());

      //return "redirect:boardListR?no="+boardVO.getBno();
      return "redirect:/admin2/goods/boardList"; 
   }
   
     // 댓글 작성 
      @RequestMapping(value = "/goods/board/replyWrite", method = RequestMethod.POST)
      public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
         logger.info("reply Write");

         replyService.writeReply(vo);

         rttr.addAttribute("bno", vo.getBno());
         rttr.addAttribute("page", scri.getPage());
         rttr.addAttribute("perPageNum", scri.getPerPageNum());
         rttr.addAttribute("searchType", scri.getSearchType());
         rttr.addAttribute("keyword", scri.getKeyword());

//         return "redirect:/goods/boardListR";
         return "redirect:/admin2/goods/boardListR?bno="+vo.getBno();
      }
   // 댓글 삭제 GET
      @RequestMapping(value = "/goods/board/replyDeleteView", method = RequestMethod.GET)
      public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
         logger.info("reply Write");

         model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
         model.addAttribute("scri", scri);

         //
       return "admin2/goods/board/replyDeleteView";
   }

      // 댓글 삭제
      @RequestMapping(value = "/goods/board/replyDelete", method = RequestMethod.POST)
      public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
         logger.info("reply Write");

         replyService.deleteReply(vo);

         rttr.addAttribute("bno", vo.getBno());
         rttr.addAttribute("page", scri.getPage());
         rttr.addAttribute("perPageNum", scri.getPerPageNum());
         rttr.addAttribute("searchType", scri.getSearchType());
         rttr.addAttribute("keyword", scri.getKeyword());

         return "redirect:/admin2/goods/boardListR";
      }
      
      // 댓글 수정 GET
      @RequestMapping(value = "/goods/board/replyUpdateView", method = RequestMethod.GET)
      public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
         logger.info("reply Write");

         model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
         model.addAttribute("scri", scri);

         return "admin2/goods/board/replyUpdateView";
      }

      // 댓글 수정 POST
      @RequestMapping(value = "/goods/board/replyUpdate", method = RequestMethod.POST)
      public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
         logger.info("reply Write");

         replyService.updateReply(vo);

         rttr.addAttribute("bno", vo.getBno());
         rttr.addAttribute("page", scri.getPage());
         rttr.addAttribute("perPageNum", scri.getPerPageNum());
         rttr.addAttribute("searchType", scri.getSearchType());
         rttr.addAttribute("keyword", scri.getKeyword());

         return "redirect:/admin2/goods/boardListR?bno="+vo.getBno();
      }
      
      //파일다운
      @RequestMapping(value = "/fileDown")
      public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
         Map<String, Object> resultMap = dminService.selectFileInfo(map);
         String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
         String originalFileName = (String) resultMap.get("ORG_FILE_NAME");

         // 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
         byte fileByte[] = org.apache.commons.io.FileUtils
               .readFileToByteArray(new File("C:\\mp\\file\\" + storedFileName));

         response.setContentType("application/octet-stream");
         response.setContentLength(fileByte.length);
         response.setHeader("Content-Disposition",
               "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
         response.getOutputStream().write(fileByte);
         response.getOutputStream().flush();
         response.getOutputStream().close();

      }
   //-------------------------------------------------------------------------------------------
   
   // 관리자화면 방문자 그래프
   @RequestMapping(value = "/visitor", method = RequestMethod.GET,produces = "application/json; charset=UTF-8")
   @ResponseBody
   public Object visitor() throws Exception {
      List<VisitorCountVO> visitorCount = dminService.getVisitorCount();
      HashMap<String , Object> data = new HashMap<>();
      ArrayList<String> labels = new ArrayList<String>();
      for(int i= visitorCount.size() - 5; i < visitorCount.size(); i++) {
         VisitorCountVO count = visitorCount.get(i);
         labels.add(count.getIpdate().toString());
      }
      data.put("labels", labels);
      
      ArrayList<List<Integer>> seriesList = new ArrayList<>();
      ArrayList<Integer> series = new ArrayList<>();
      
      for(int i= visitorCount.size() - 6; i < visitorCount.size(); i++) {
         VisitorCountVO count = visitorCount.get(i);
         series.add(count.getCount());
      }
      seriesList.add(series);
      data.put("series", seriesList);
      System.out.println(seriesList.toString());
      
      return data; 
   }
   // 관리자화면 방문자 그래프
      @RequestMapping(value = "/gender", method = RequestMethod.GET,produces = "application/json; charset=UTF-8")
      @ResponseBody
      public Object gender() throws Exception {
         List<MemberVO> genderCount = dminService.getGenderCount();
         HashMap<String , Object> data = new HashMap<>();
         ArrayList<String> labels = new ArrayList<String>();
         ArrayList<Integer> series = new ArrayList<Integer>();
         
         System.out.println(genderCount.toString());
         
         for(int i= genderCount.size()-2; i < genderCount.size(); i++) {
            MemberVO count = genderCount.get(i);
            series.add(count.getCount());
         }
         data.put("series", series);
         System.out.println(data);
         
         for(int i= genderCount.size() -2; i < genderCount.size(); i++) {
            MemberVO count = genderCount.get(i);
            labels.add(count.getCount()+"명");
            
         }
         data.put("labels", labels);
         System.out.println(data.toString());
         
         return data; 
      }
      // 관리자화면 방문자 그래프
      @RequestMapping(value = "/money", method = RequestMethod.GET,produces = "application/json; charset=UTF-8")
      @ResponseBody
      public Object money() throws Exception {
         List<MoneyVO> moneyCount = dminService.getMoneyCount();
         HashMap<String , Object> data = new HashMap<>();
         ArrayList<String> labels = new ArrayList<String>();
         for(int i= moneyCount.size()-6; i < moneyCount.size(); i++) {
            MoneyVO count = moneyCount.get(i);
            labels.add(count.getOrderdate().toString());
         }
         data.put("labels", labels);
         
         ArrayList<List<Integer>> seriesList = new ArrayList<>();
         ArrayList<Integer> series = new ArrayList<>();
         
         for(int i= moneyCount.size()-6; i < moneyCount.size(); i++) {
            MoneyVO count = moneyCount.get(i);
            series.add(count.getMoney());
         }
         seriesList.add(series);
         data.put("series", seriesList);
         System.out.println(seriesList.toString());
         
         return data; 
      }
      
//------------------------------------------------------------------------------------------------------------------
      //qna 게시판 목록 조회
         @RequestMapping(value = "/qna/qnaList", method = RequestMethod.GET)
         public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
            logger.info("list");
      
            model.addAttribute("list", qnaService.list(scri));
           
            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(scri);
            pageMaker.setTotalCount(dminService.listCount(scri));
      
            model.addAttribute("pageMaker", pageMaker);
      
            return "admin2/qna/qnaList";

            }
         
         //qna 상세보기
         @RequestMapping(value = "/qna/readView", method = RequestMethod.GET)
         public String read(QnaBoardVO boardVO, HttpSession session, @ModelAttribute("scri") SearchCriteria scri, Model model, int bno) throws Exception {
            logger.info("read");
            model.addAttribute("mp_member", session.getAttribute("member"));
            QnaBoardVO bv = qnaService.read(boardVO.getBno());
            model.addAttribute("qna_board", bv);
            model.addAttribute("read", bv);
            model.addAttribute("scri", scri);
            qnaService.boardhit(bno);

            List<QnaReplyVO> replyList = qnaRService.readReply(boardVO.getBno());
            model.addAttribute("replyList", replyList);

            List<Map<String, Object>> fileList = qnaService.selectFileList(boardVO.getBno());
            model.addAttribute("file", fileList);
            return "admin2/qna/readView";
         }
         // qna 삭제
         @RequestMapping(value = "/qna/qnaDelete", method = RequestMethod.GET)
         public String qnaDelete(QnaBoardVO boardVO) throws Exception {
         dminService.qnaDelete(boardVO.getBno());
         return "admin2/qna/qnaList";
         }
         // 댓글 작성 
            @RequestMapping(value = "/qna/replyWrite", method = RequestMethod.POST)
            public String replyWrite(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
               logger.info("reply Write");
               qnaRService.writeReply(vo);
               rttr.addAttribute("bno", vo.getBno());
               rttr.addAttribute("page", scri.getPage());
               rttr.addAttribute("perPageNum", scri.getPerPageNum());
               rttr.addAttribute("searchType", scri.getSearchType());
               rttr.addAttribute("keyword", scri.getKeyword());
               return "redirect:/admin2/qna/readView";
         }
         // 댓글 수정 GET
            @RequestMapping(value = "/qna/replyUpdateView", method = RequestMethod.GET)
            public String replyUpdateView(QnaReplyVO vo, SearchCriteria scri, Model model) throws Exception {
               logger.info("reply Write");

               model.addAttribute("replyUpdate", qnaRService.selectReply(vo.getRno()));
               model.addAttribute("scri", scri);

               return "admin2/qna/replyUpdateView";
            }

            // 댓글 수정 POST
            @RequestMapping(value = "/qna/replyUpdate", method = RequestMethod.POST)
            public String replyUpdate(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
               logger.info("reply Write");

               qnaRService.updateReply(vo);

               rttr.addAttribute("bno", vo.getBno());
               rttr.addAttribute("page", scri.getPage());
               rttr.addAttribute("perPageNum", scri.getPerPageNum());
               rttr.addAttribute("searchType", scri.getSearchType());
               rttr.addAttribute("keyword", scri.getKeyword());

               return "redirect:/admin2/qna/readView";
            }

            // 댓글 삭제 GET
            @RequestMapping(value = "/qna/replyDeleteView", method = RequestMethod.GET)
            public String replyDeleteView(QnaReplyVO vo, SearchCriteria scri, Model model) throws Exception {
               logger.info("reply Write");

               model.addAttribute("replyDelete", qnaRService.selectReply(vo.getRno()));
               model.addAttribute("scri", scri);

               return "admin2/qna/replyDeleteView";
            }

            // 댓글 삭제
            @RequestMapping(value = "/qna/replyDelete", method = RequestMethod.POST)
            public String replyDelete(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
               logger.info("reply Write");
               
               qnaRService.deleteReply(vo);
               
               rttr.addAttribute("bno", vo.getBno());
               rttr.addAttribute("page", scri.getPage());
               rttr.addAttribute("perPageNum", scri.getPerPageNum());
               rttr.addAttribute("searchType", scri.getSearchType());
               rttr.addAttribute("keyword", scri.getKeyword());
               
               return "redirect:/admin2/qna/readView";
            }  
            
            
   // ------------------------------------------------------------------------------------
   //후기게시판
   @RequestMapping(value = "/review", method = RequestMethod.GET)
   public String review(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
      logger.info("list");

      model.addAttribute("list", reviewService.list(scri));

      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(scri);
      pageMaker.setTotalCount(reviewService.listCount(scri));

      model.addAttribute("pageMaker", pageMaker);

      return "admin2/review/reviewList";

   }      
   
   @RequestMapping(value = "/review/readView", method = RequestMethod.GET)
   public String read(ReviewBoardVO boardVO, HttpSession session, @ModelAttribute("scri") SearchCriteria scri, Model model, int bno) throws Exception {
      logger.info("read");
      model.addAttribute("mp_member", session.getAttribute("member"));
      ReviewBoardVO bv = reviewService.read(boardVO.getBno());
      model.addAttribute("review_board", bv);
      model.addAttribute("read", bv);
      model.addAttribute("scri", scri);
      reviewService.boardhit(bno);

      List<ReviewReplyVO> replyList = reviewRService.readReply(boardVO.getBno());
      model.addAttribute("replyList", replyList);

      List<Map<String, Object>> fileList = reviewService.selectFileList(boardVO.getBno());
      model.addAttribute("file", fileList);
      return "admin2/review/reviewView";
   }
   //  게시판 삭제
   @RequestMapping(value = "/review/delete", method = RequestMethod.GET)
   public String delete(ReviewBoardVO boardVO) throws Exception {

      logger.info("게시글 허가   [삭제]");

      reviewService.delete(boardVO.getBno());

      return "redirect:/admin2/review";
   }
   // 댓글 작성 
      @RequestMapping(value = "/review/replyWrite", method = RequestMethod.POST)
      public String replyWrite(ReviewReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
         logger.info("reply Write");

         reviewRService.writeReply(vo);

         rttr.addAttribute("bno", vo.getBno());
         rttr.addAttribute("page", scri.getPage());
         rttr.addAttribute("perPageNum", scri.getPerPageNum());
         rttr.addAttribute("searchType", scri.getSearchType());
         rttr.addAttribute("keyword", scri.getKeyword());

         return "redirect:/admin2/review/readView";
      }

      // 댓글 수정 GET
      @RequestMapping(value = "/review/replyUpdateView", method = RequestMethod.GET)
      public String replyUpdateView(ReviewReplyVO vo, SearchCriteria scri, Model model) throws Exception {
         logger.info("reply Write");

         model.addAttribute("replyUpdate", reviewRService.selectReply(vo.getRno()));
         model.addAttribute("scri", scri);

         return "admin2/review/replyUpdateView";
      }

      // 댓글 수정 POST
      @RequestMapping(value = "/review/replyUpdate", method = RequestMethod.POST)
      public String replyUpdate(ReviewReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
         logger.info("reply Write");

         reviewRService.updateReply(vo);

         rttr.addAttribute("bno", vo.getBno());
         rttr.addAttribute("page", scri.getPage());
         rttr.addAttribute("perPageNum", scri.getPerPageNum());
         rttr.addAttribute("searchType", scri.getSearchType());
         rttr.addAttribute("keyword", scri.getKeyword());

         return "redirect:/admin2/review";
      }

      // 댓글 삭제 GET
      @RequestMapping(value = "/review/replyDeleteView", method = RequestMethod.GET)
      public String replyDeleteView(ReviewReplyVO vo, SearchCriteria scri, Model model) throws Exception {
         logger.info("reply Write");

         model.addAttribute("replyDelete", reviewRService.selectReply(vo.getRno()));
         model.addAttribute("scri", scri);

         return "admin2/review/replyDeleteView";
      }

      // 댓글 삭제
      @RequestMapping(value = "/review/replyDelete", method = RequestMethod.POST)
      public String replyDelete(ReviewReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
         logger.info("reply Write");

         reviewRService.deleteReply(vo);

         rttr.addAttribute("bno", vo.getBno());
         rttr.addAttribute("page", scri.getPage());
         rttr.addAttribute("perPageNum", scri.getPerPageNum());
         rttr.addAttribute("searchType", scri.getSearchType());
         rttr.addAttribute("keyword", scri.getKeyword());

         return "redirect:/admin2/review/readView";
      }


}