package kr.co.dao;
import java.util.List;
import java.util.Map;

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

public interface dminDAO {
   
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
   public void delivery(OrderVO order) throws Exception;

   // 상품 수량 조절
   public void changeStock(GoodsVO goods) throws Exception;
   /*
   // 모든 소감(댓글)
   public List<ReplyListVO> allReply() throws Exception;
   */
   // 소감(댓글) 삭제
   public void deleteReply(int repNum) throws Exception;

   //--------------------------------------------------------------------------
   // 상품승인 삭제
  	public void delete(int gdsNum) throws Exception;
  	// 상품승인 승인
  	public void update2(GoodsVO goodsVO) throws Exception;
  	// 상품승인 취소
  	public void update3(GoodsVO goodsVO) throws Exception;
  	// 상품 총 갯수
   	public int listCount2(SearchCriteria scri) throws Exception;
  	//--------------------------------------------------------------------------
  	// 공지사항
  	public List<AdminNoticesVO> notices(SearchCriteria scri) throws Exception;
  	// 공지사항 등록
  	public void noticesW(AdminNoticesVO adminNoticesVO) throws Exception;
  	// 공지사항 첨부파일 업로드
  	public void insertFile(Map<String, Object> map) throws Exception;
  	// 공지사항 첨부파일 조회
  	public List<Map<String, Object>> selectFileList2(int no) throws Exception;
  	// 공지사항 상세 조회
  	public AdminNoticesVO noticesR(int no) throws Exception;
  	// 공지사항 수정
 	public void noticesUE(AdminNoticesVO adminNoticesVO) throws Exception;
 	// 공지사항 총 갯수
 	public int listCount3(SearchCriteria scri) throws Exception;
 	// 게시판 삭제
   	public void noticesD(int no) throws Exception;
   	//공지사항 조회수
   	public AdminNoticesVO noticesHit(int no) throws Exception;
   	// 첨부파일 다운
 	public Map<String, Object> selectFileInfo2(Map<String, Object> map) throws Exception;
 	// 첨부파일 수정
 	public void updateFile2(Map<String, Object> map) throws Exception;
 	
  	//--------------------------------------------------------------------------
   	// 기업 리스트
   	public List<MemberVO> companyList(SearchCriteria scri) throws Exception;
   	// 기업 탈퇴 
   	public void companyDelete(String userId) throws Exception;
   	// 기업 총 갯수
	public int listCount4(SearchCriteria scri) throws Exception;
   	//-------------------------------------------------------------------------
  	// 유저리스트
  	public List<MemberVO> memberList(SearchCriteria scri) throws Exception;
  	// 유저 탈퇴 
  	public void memberDelete(String userId) throws Exception;
  	// 유저 총 갯수
   	public int listCount1(SearchCriteria scri) throws Exception;
  	
  	//--------------------------------------------------------------------------
  	// 게시판 조회
  	public List<BoardVO> boardList(SearchCriteria scri) throws Exception;
  	// 게시판 상세 조회
  	public BoardVO boardListR(Integer bno) throws Exception;
 	// 게시판 삭제
    public void boardListD(int bno) throws Exception;
    // 게시판 총 갯수
  	public int listCount(SearchCriteria scri) throws Exception;
  	// 게시판 조회수
 	public BoardVO boardHit(int bno) throws Exception;
 	// 댓글 count
 	public void updateReplyCnt(Integer bno, int amount) throws Exception;
 	// 첨부파일 조회
 	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
 	// 첨부파일 다운
 	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
 	
    //----------------------------------------------------------------------------------
    //일별 방문자통게
    public List<VisitorCountVO> getVisitorCount() throws Exception;
    public List<MoneyVO> getMoneyCount() throws Exception;
    //일별 방문자통계
    public void insertVisitor(VisitorCountVO vo) throws Exception;
    //유저 통게
    public int memberCount() throws Exception;
    //기업 통게
    public int companyCount() throws Exception;
    //남녀 비율
    public List<MemberVO> getGenderCount() throws Exception;
    //하루 방문자
    public int todayCount() throws Exception;
    //총 수입
    public int totalMoney() throws Exception;
    
    //qna 게시글 삭제
  	public void qnaDelete(int bno) throws Exception;
} 