package kr.co.service;

import java.util.List;

import kr.co.vo.AllSearchVO;
import kr.co.vo.BoardVO;
import kr.co.vo.GoodsViewVO;
import kr.co.vo.QnaBoardVO;
import kr.co.vo.ReviewBoardVO;

public interface AllSearchService {
	//상점 등록 목록 조회
		public List<GoodsViewVO> goodslist(AllSearchVO allsearch) throws Exception;
		
		//상품 조회
		public GoodsViewVO goods_read(int gdsNum) throws Exception;
		
		//자유게시판 등록 목록 조회
		public List<BoardVO> boardlist(AllSearchVO allsearch) throws Exception;
		
		//자유게시판 게시물 조회
		public BoardVO free_read(int bno) throws Exception;
		
		//QNA게시판 등록 목록 조회
		public List<QnaBoardVO> qnalist(AllSearchVO allsearch) throws Exception;
		
		//QNA게시판 게시물 조회
		public QnaBoardVO qna_read(int bno) throws Exception;
		
		//후기 게시판 등록 목록 조회
		public List<ReviewBoardVO> reviewlist(AllSearchVO allsearch) throws Exception;
		
		//후기 게시판 게시물 조회
		public ReviewBoardVO rev_read(int bno) throws Exception;
		
		//분기처리
		//후기게시판 게시물 총겟수
		public int reviewCount() throws Exception;
		
		//자유게시판 총갯수
		public int boardCount() throws Exception;

		//QnA게시판 총갯수
		public int qnaCount() throws Exception;
		
		//상점 게시물 총갯수
		public int goodsCount() throws Exception;
		
		// 토탈 카운트
		// 상점카운트
		public List<GoodsViewVO> goodslistcount(AllSearchVO allsearch) throws Exception;

		// 자유게시판 카운트
		public List<BoardVO> boardlistcount(AllSearchVO allsearch) throws Exception;

		// QNA게시판 카운트
		public List<QnaBoardVO> qnalistcount(AllSearchVO allsearch) throws Exception;

		// 후기게시판 카운트
		public List<ReviewBoardVO> reviewlistcount(AllSearchVO allsearch) throws Exception;
		
		
}
