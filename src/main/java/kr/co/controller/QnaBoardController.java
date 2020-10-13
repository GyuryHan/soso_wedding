package kr.co.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.QnaBoardService;
import kr.co.service.QnaReplyService;
import kr.co.vo.PageMaker;
import kr.co.vo.QnaBoardVO;
import kr.co.vo.QnaReplyVO;
import kr.co.vo.SearchCriteria;

@Controller
@RequestMapping("/qnaboard/*")
public class QnaBoardController {

   private static final Logger logger = LoggerFactory.getLogger(QnaBoardController.class);

   @Inject
   QnaBoardService service;

   @Inject
   QnaReplyService replyService;

   // 게시판 글 작성 화면
   @RequestMapping(value = "/writeView", method = RequestMethod.GET)
   public void writeView() throws Exception {
      logger.info("writeView");

   }
   
// 보드메인
   @RequestMapping(value = "/comunity", method = RequestMethod.GET)
   public void board() throws Exception {
      logger.info("comunity");

   }

   // 게시판 글 작성
   @RequestMapping(value = "/write", method = RequestMethod.POST)
   public String write(QnaBoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
      logger.info("write");
      service.write(boardVO, mpRequest);

      return "redirect:/qnaboard/list";
   }

// 게시판 목록 조회
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public String list(Model model, @ModelAttribute("scri") SearchCriteria scri, @ModelAttribute("sort") String sort) throws Exception {
      logger.info("list");
      try {
         if(sort.equals("") || sort== null) {
            sort="a";
            scri.setSort(sort);
         }
      }
      catch(Exception e) {
         sort="a";
         scri.setSort(sort);
      }
      if(sort.equals("bno"))
         scri.setSort("bno");
      else if(sort.equals("regdate"))
         scri.setSort("regdate");
      else if(sort.equals("hit"))
         scri.setSort("hit");
      
      model.addAttribute("list", service.list(scri));
     
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(scri);
      pageMaker.setTotalCount(service.listCount(scri));

      model.addAttribute("pageMaker", pageMaker);

      return "qnaboard/list";

   }
   


   @RequestMapping(value = "/readView", method = RequestMethod.GET)
   public String read(QnaBoardVO boardVO, HttpSession session, @ModelAttribute("scri") SearchCriteria scri, Model model, int bno) throws Exception {
      logger.info("read");
      model.addAttribute("mp_member", session.getAttribute("member"));
      QnaBoardVO bv = service.read(boardVO.getBno());
      model.addAttribute("qna_board", bv);
      model.addAttribute("read", bv);
      model.addAttribute("scri", scri);
      service.boardhit(bno);

      List<QnaReplyVO> replyList = replyService.readReply(boardVO.getBno());
      model.addAttribute("replyList", replyList);

      List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
      model.addAttribute("file", fileList);
      return "qnaboard/readView";
   }

   // 게시판 수정뷰
   @RequestMapping(value = "/updateView", method = RequestMethod.GET)
   public String updateView(QnaBoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
         throws Exception {
      logger.info("updateView");

      model.addAttribute("update", service.read(boardVO.getBno()));
      model.addAttribute("scri", scri);

      List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
      model.addAttribute("file", fileList);
      return "qnaboard/updateView";
   }

   // 게시판 수정
   @RequestMapping(value = "/update", method = RequestMethod.POST)
   public String update(QnaBoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr,
         @RequestParam(value = "fileNoDel[]") String[] files,
         @RequestParam(value = "fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest)
         throws Exception {
      logger.info("update");
      service.update(boardVO, files, fileNames, mpRequest);

      rttr.addAttribute("page", scri.getPage());
      rttr.addAttribute("perPageNum", scri.getPerPageNum());
      rttr.addAttribute("searchType", scri.getSearchType());
      rttr.addAttribute("keyword", scri.getKeyword());

      return "redirect:/qnaboard/list";
   }

   // 게시판 삭제
   @RequestMapping(value = "/delete", method = RequestMethod.POST)
   public String delete(QnaBoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)
         throws Exception {
      logger.info("delete");

      service.delete(boardVO.getBno());

      rttr.addAttribute("page", scri.getPage());
      rttr.addAttribute("perPageNum", scri.getPerPageNum());
      rttr.addAttribute("searchType", scri.getSearchType());
      rttr.addAttribute("keyword", scri.getKeyword());

      return "redirect:/qnaboard/list";
   }

   // 댓글 작성 
   @RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
   public String replyWrite(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
      logger.info("reply Write");

      replyService.writeReply(vo);

      rttr.addAttribute("bno", vo.getBno());
      rttr.addAttribute("page", scri.getPage());
      rttr.addAttribute("perPageNum", scri.getPerPageNum());
      rttr.addAttribute("searchType", scri.getSearchType());
      rttr.addAttribute("keyword", scri.getKeyword());

      return "redirect:/qnaboard/readView";
   }

   // 댓글 수정 GET
   @RequestMapping(value = "/replyUpdateView", method = RequestMethod.GET)
   public String replyUpdateView(QnaReplyVO vo, SearchCriteria scri, Model model) throws Exception {
      logger.info("reply Write");

      model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
      model.addAttribute("scri", scri);

      return "qnaboard/replyUpdateView";
   }

   // 댓글 수정 POST
   @RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
   public String replyUpdate(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
      logger.info("reply Write");

      replyService.updateReply(vo);

      rttr.addAttribute("bno", vo.getBno());
      rttr.addAttribute("page", scri.getPage());
      rttr.addAttribute("perPageNum", scri.getPerPageNum());
      rttr.addAttribute("searchType", scri.getSearchType());
      rttr.addAttribute("keyword", scri.getKeyword());

      return "redirect:/qnaboard/readView";
   }

   // 댓글 삭제 GET
   @RequestMapping(value = "/replyDeleteView", method = RequestMethod.GET)
   public String replyDeleteView(QnaReplyVO vo, SearchCriteria scri, Model model) throws Exception {
      logger.info("reply Write");

      model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
      model.addAttribute("scri", scri);

      return "qnaboard/replyDeleteView";
   }

   // 댓글 삭제
   @RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
   public String replyDelete(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
      logger.info("reply Write");

      replyService.deleteReply(vo);

      rttr.addAttribute("bno", vo.getBno());
      rttr.addAttribute("page", scri.getPage());
      rttr.addAttribute("perPageNum", scri.getPerPageNum());
      rttr.addAttribute("searchType", scri.getSearchType());
      rttr.addAttribute("keyword", scri.getKeyword());

      return "redirect:/qnaboard/readView";
   }

   @RequestMapping(value = "/fileDown")
   public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
      Map<String, Object> resultMap = service.selectFileInfo(map);
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
   
   // 로그인 
   @RequestMapping(value = "/needLogin", method = RequestMethod.GET)
   public void needLogin() throws Exception{
      logger.info("needLogin");
   }
   
}