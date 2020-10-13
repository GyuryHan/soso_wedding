package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.service.AllSearchService;
import kr.co.vo.AllSearchCriteria;
import kr.co.vo.AllSearchPageMaker;
import kr.co.vo.AllSearchVO;
import kr.co.vo.BoardVO;
import kr.co.vo.GoodsViewVO;
import kr.co.vo.QnaBoardVO;
import kr.co.vo.ReviewBoardVO;
import kr.co.vo.SearchCriteria;

@Controller
@RequestMapping("/mainsearch/*")
@SessionAttributes({ "goodslist", "goodspaging", "boardlist", "boardpaging", "qnaboardlist", "qnapaging",
		"reviewboardlist", "reviewpaging", "search", "count" })
public class AllSearchController {
	private static final Logger logger = LoggerFactory.getLogger(AllSearchController.class);

	@Inject
	AllSearchService allService;

	// 전체 조회
	@RequestMapping(value = "/totalsearch", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("keyword") AllSearchVO allsearch,
			@ModelAttribute("scri") SearchCriteria scri, AllSearchCriteria allcri,
			HttpSession session,@RequestParam("category") String category) throws Exception {
		logger.info("main_allSearch");
		System.out.println("--------------------------------");
		System.out.println(allsearch.getKeyword());
		System.out.println("---------------------------------");

		// 상점부분
		if (category.equals("store")) {
			List<GoodsViewVO> goodslist = allService.goodslist(allsearch);
			System.out.println("상점리스트");
			System.out.println(goodslist);
			model.addAttribute("goodslist", goodslist);

			// 상점 페이징
			AllSearchPageMaker goodspaging = new AllSearchPageMaker();
			goodspaging.setAllcri(allcri);
			goodspaging.setTotalCount(allService.goodsCount());
			model.addAttribute("goodspaging", goodspaging);
		}

		// 자유게시판 부분
		if (category.equals("free")) {
			List<BoardVO> boardlist = allService.boardlist(allsearch);
			System.out.println("자유게시판 리스트");
			System.out.println(boardlist);
			model.addAttribute("boardlist", boardlist);

			// 자유게시판 페이징
			AllSearchPageMaker boardpaging = new AllSearchPageMaker();
			boardpaging.setAllcri(allcri);
			boardpaging.setTotalCount(allService.boardCount());
			model.addAttribute("boardpaging", boardpaging);
		}

		// QnA게시판 부분
		if (category.equals("qna")) {
			List<QnaBoardVO> qnaboardlist = allService.qnalist(allsearch);
			System.out.println("qna게시판 리스트");
			System.out.println(qnaboardlist);
			model.addAttribute("qnaboardlist", qnaboardlist);

			// qna페이징
			AllSearchPageMaker qnapaging = new AllSearchPageMaker();
			qnapaging.setAllcri(allcri);
			qnapaging.setTotalCount(allService.qnaCount());
			model.addAttribute("qnapaging", qnapaging);
		}

		if (category.equals("reviewboard")) {
			// 후기 게시판 부분
			List<ReviewBoardVO> reviewboardlist = allService.reviewlist(allsearch);
			System.out.println("후기게시판 리스트");
			System.out.println(reviewboardlist);
			model.addAttribute("reviewboardlist", reviewboardlist);

			// 후기 페이징
			AllSearchPageMaker reviewpaging = new AllSearchPageMaker();
			reviewpaging.setAllcri(allcri);
			reviewpaging.setTotalCount(allService.reviewCount());
			model.addAttribute("reviewpaging", reviewpaging);
		}
		// 검색어

		System.out.println("검색어");
		model.addAttribute("search", allsearch);

		
		

		return "mainsearch/totalsearch";
	}

	// 전체 조회
	@RequestMapping(value = "/totalsearch", method = RequestMethod.POST)
	public String listpage(Model model, @ModelAttribute("keyword") AllSearchVO allsearch,
			@ModelAttribute("scri") SearchCriteria scri, AllSearchCriteria allcri, HttpSession session)
			throws Exception {
		logger.info("main_allSearch");
		System.out.println("--------------------------------");
		System.out.println(allsearch.getKeyword());
		System.out.println("---------------------------------");

		int count = 0;

		// 상점부분
		List<GoodsViewVO> goodslist = allService.goodslist(allsearch);
		System.out.println("상점리스트");
		System.out.println(goodslist);
		model.addAttribute("goodslist", goodslist);

		// 상점 페이징
		AllSearchPageMaker goodspaging = new AllSearchPageMaker();
		goodspaging.setAllcri(allcri);
		goodspaging.setTotalCount(allService.goodsCount());
		model.addAttribute("goodspaging", goodspaging);

		// 자유게시판 부분
		List<BoardVO> boardlist = allService.boardlist(allsearch);
		System.out.println("자유게시판 리스트");
		System.out.println(boardlist);
		model.addAttribute("boardlist", boardlist);

		// 자유게시판 페이징
		AllSearchPageMaker boardpaging = new AllSearchPageMaker();
		boardpaging.setAllcri(allcri);
		boardpaging.setTotalCount(allService.boardCount());
		model.addAttribute("boardpaging", boardpaging);

		// QnA게시판 부분
		List<QnaBoardVO> qnaboardlist  = allService.qnalist(allsearch);
		System.out.println("qna게시판 리스트");
		System.out.println(qnaboardlist);
		model.addAttribute("qnaboardlist", qnaboardlist);

		// qna페이징
		AllSearchPageMaker qnapaging = new AllSearchPageMaker();
		qnapaging.setAllcri(allcri);
		qnapaging.setTotalCount(allService.qnaCount());
		model.addAttribute("qnapaging", qnapaging);

		// 후기 게시판 부분
		List<ReviewBoardVO> reviewboardlist = allService.reviewlist(allsearch);
		System.out.println("후기게시판 리스트");
		System.out.println(reviewboardlist);
		model.addAttribute("reviewboardlist", reviewboardlist);

		// 후기 페이징
		AllSearchPageMaker reviewpaging = new AllSearchPageMaker();
		reviewpaging.setAllcri(allcri);
		reviewpaging.setTotalCount(allService.reviewCount());
		model.addAttribute("reviewpaging", reviewpaging);

		// 검색어
		System.out.println("검색어");
		model.addAttribute("search", allsearch);

		//토탈 카운트
		List<GoodsViewVO> goodslistcount = allService.goodslistcount(allsearch);
		model.addAttribute("goodslistcount",goodslistcount);
		count += goodslistcount.size();
		System.out.println("상점 리스트 카운트"+goodslistcount.size());
		
		List<ReviewBoardVO> reviewlistcount = allService.reviewlistcount(allsearch);
		model.addAttribute("reviewlistcount",reviewlistcount);
		count += reviewlistcount.size();
		System.out.println("review게시판 리스트 카운트"+reviewlistcount.size());

		List<BoardVO> boardlistcount = allService.boardlistcount(allsearch);
		model.addAttribute("boardlistcount",boardlistcount);
		count += boardlistcount.size();
		System.out.println("자유게시판 리스트 카운트"+boardlistcount.size());
		
		List<QnaBoardVO> qnalistcount = allService.qnalistcount(allsearch);
		model.addAttribute("qnalistcount",qnalistcount);
		count += qnalistcount.size();
		System.out.println("QNA게시판 리스트 카운트"+qnalistcount.size());
		
		System.out.println("토탈카운트"+count);
		
		model.addAttribute("count", count);

		return "mainsearch/totalsearch";
	}

}
