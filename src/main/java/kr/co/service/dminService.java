package kr.co.service;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.AdminNoticesVO;
import kr.co.vo.BoardVO;
import kr.co.vo.CategoryVO;
import kr.co.vo.GoodsVO;
import kr.co.vo.GoodsViewVO;
import kr.co.vo.MemberVO;
import kr.co.vo.MoneyVO;
import kr.co.vo.OrderListVO;
import kr.co.vo.OrderVO;
import kr.co.vo.SearchCriteria;
import kr.co.vo.VisitorCountVO;

public interface dminService {

	// 카테고리 
	public List<CategoryVO> category() throws Exception;
	
	// 상품등록
	public void register2(GoodsVO vo) throws Exception;

	// 상품목록
	public List<GoodsViewVO> goodslist(SearchCriteria scri) throws Exception;

	// 상품조회  + 카테고리 조인
	public GoodsViewVO goodsView(int gdsNum) throws Exception;

	// 상품 수정
	public void goodsModify(GoodsVO vo) throws Exception;
	
	// 상품 삭제
	public void goodsDelete(int gdsNum) throws Exception;
	
	// 주문 목록
	public List<OrderVO> orderList() throws Exception;
	
	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	// 배송 상태
//	public void delivery(OrderVO order) throws Exception;
	
	// 상품 수량 조절
	public void changeStock(GoodsVO goods) throws Exception;
/*
	// 모든 소감(댓글)
	public List<ReplyListVO> allReply() throws Exception;
	*/
	// 소감(댓글) 삭제
	public void deleteReply(int repNum) throws Exception;
	//------------------------------------------------------------
	// 상품 승인 삭제
	public void delete(int gdsNum) throws Exception;
	// 상품 승인 확인
	public void update2(GoodsVO goodsVO) throws Exception;
	// 상품 승인 취소
	public void update3(GoodsVO goodsVO) throws Exception;
	// 상품 총 갯수
	public int listCount2(SearchCriteria scri) throws Exception;
	
	//-----------------------------------------------------------------------------------
	
	// 공지사항
	public List<AdminNoticesVO> notices(SearchCriteria scri) throws Exception;
	// 공지사항 등록
	public void noticesW(AdminNoticesVO adminNoticesVO,MultipartHttpServletRequest mpRequest) throws Exception;
	// 공지사항 조회
	public AdminNoticesVO noticesR(int no) throws Exception;
	// 공지사항 수정
	public void noticesUE(AdminNoticesVO adminNoticesVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	// 공지사항 총 갯수
	public int listCount3(SearchCriteria scri) throws Exception;	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList2(int no) throws Exception;
	// 첨부파일 다운
	 Map<String, Object> selectFileInfo2(Map<String, Object> map) throws Exception;
	// 공지사항 조회 수
	public AdminNoticesVO noticesHit(Integer bno) throws Exception;
	// 공지사항 삭제
		public void noticesD(int no) throws Exception;
	//---------------------------------------------------------------------------
	
	//기업리스트
	public List<MemberVO> companyList(SearchCriteria scri) throws Exception;
	//기업 총 갯수
	public int listCount4(SearchCriteria scri) throws Exception;	
	//기업 탈퇴
	public void companyDelete(String userId) throws Exception;
	
	//-----------------------------------------------------------------------------
	
	//유저리스트
	public List<MemberVO> memberList(SearchCriteria scri) throws Exception;
	//유저 탈퇴
	public void memberDelete(String userId) throws Exception;
	// 유저 총 갯수
	public int listCount1(SearchCriteria scri) throws Exception;
	
	//----------------------------------------------------------------------------
	
	//게시판 리스트
	public List<BoardVO> boardList(SearchCriteria scri) throws Exception;
	// 게시판 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	// 게시물 상세 조회
	public BoardVO boardListR(Integer bno) throws Exception;
	// 게시물 조회 수
	public BoardVO boardhit(Integer bno) throws Exception;
	// 게시물 삭제
	public void boardListD(int bno) throws Exception;
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
	//-------------------------------------------------------------------------
	//방문자 기록
	public List<VisitorCountVO> getVisitorCount() throws Exception;
	public List<MoneyVO> getMoneyCount() throws Exception;
	public void insertVisitor(VisitorCountVO vo) throws Exception;
	public int memberCount() throws Exception;
	public int companyCount() throws Exception;
	public List<MemberVO> getGenderCount() throws Exception;
	public int todayCount() throws Exception;
	public int totalMoney() throws Exception;
	
	//------------------------------------------------------------
	//qna 게시글 삭제
		public void qnaDelete(int bno) throws Exception;
} 