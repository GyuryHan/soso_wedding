package kr.co.service;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.dminDAO;
import kr.co.util.AdminFileUtils;
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
 
@Service
public class dminServiceImpl implements dminService {

	@Resource(name="AdminfileUtils")
	private AdminFileUtils fileUtils;
	
	@Inject
	private dminDAO dao;

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

	// 상품등록
	@Override
	public void register2(GoodsVO vo) throws Exception {
		dao.register2(vo);
	}

	// 상품목록
	@Override
	public List<GoodsViewVO> goodslist(SearchCriteria scri) throws Exception {
		return dao.goodslist(scri);
	}

	// 상품조회  + 카테고리 조인
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}

	// 상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		dao.goodsModify(vo);
	}

	// 상품 삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		dao.goodsDelete(gdsNum);
	}
	// 상품 총 갯수
	@Override
	public int listCount2(SearchCriteria scri) throws Exception {
		return dao.listCount2(scri);
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception {
		return dao.orderList();
	}

	// 특정 주문
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	// 배송 상태
//	@Override
//	public void delivery(OrderVO order) throws Exception {
//		dao.delivery(order);
//	}

	// 상품 수량 조절
	@Override
	public void changeStock(GoodsVO goods) throws Exception {		
		dao.changeStock(goods);
	}
/*
	// 모든 소감(댓글)
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return dao.allReply();
	}
*/
	// 소감(댓글) 삭제
	@Override
	public void deleteReply(int repNum) throws Exception {
		dao.deleteReply(repNum);
	}
	//-----------------------------------------------------------
	// 게시글 승인 삭제
	@Override
	public void delete(int gdsNum) throws Exception {
		dao.delete(gdsNum);
	}
	// 게시글 승인
	@Override
	public void update2(GoodsVO goodsVO) throws Exception {
		dao.update2(goodsVO);
	}
	// 게시글 취소
	@Override
	public void update3(GoodsVO goodsVO) throws Exception {
		dao.update3(goodsVO);
	}
	// 상품 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}
	// 공지사항 목록
	@Override
	public List<AdminNoticesVO> notices(SearchCriteria scri) throws Exception {
			return dao.notices(scri);
	}
	// 공지사항  등록
	@Override
	public void noticesW(AdminNoticesVO adminNoticesVO,MultipartHttpServletRequest mpRequest ) throws Exception {
		dao.noticesW(adminNoticesVO);
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(adminNoticesVO, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			dao.insertFile(list.get(i));
		}
	}
	// 공지사항 상세 조회
	@Override
	public AdminNoticesVO noticesR(int no) throws Exception {
		return dao.noticesR(no);
	}
	// 게시물 수정
	@Override
	public void noticesUE(AdminNoticesVO adminNoticesVO , String[] files, 
			String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception {
		 dao.noticesUE(adminNoticesVO);
		 List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(adminNoticesVO, files, fileNames, mpRequest);
			Map<String, Object> tempMap = null;
			int size = list.size();
			for(int i = 0; i<size; i++) {
				tempMap = list.get(i);
				if(tempMap.get("IS_NEW").equals("Y")) {
					dao.insertFile(tempMap);
				}else {
					dao.updateFile2(tempMap);
				}
			}
	}
	// 상품 총 갯수
	@Override
	public int listCount3(SearchCriteria scri) throws Exception {
		return dao.listCount3(scri);
	}


	//공지사항 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList2(int no) throws Exception {
		return dao.selectFileList2(no);
	}
	@Override
	public Map<String, Object> selectFileInfo2(Map<String, Object> map) throws Exception {
		return dao.selectFileInfo2(map);
	}
	// 공지사항 조회수
		@Transactional(isolation = Isolation.READ_COMMITTED)
		@Override
		public AdminNoticesVO noticesHit(Integer no) throws Exception {
			return  dao.noticesHit(no);
		}
		
	// 게시글 삭제
	@Override
	public void noticesD(int no) throws Exception {
		dao.noticesD(no);
	}
//--------------------------------------------------------------------------------
	// 기업 목록
	@Override
	public List<MemberVO> companyList(SearchCriteria scri) throws Exception {
		return dao.companyList(scri);
	}

	// 기업 총 갯수
	@Override
	public int listCount4(SearchCriteria scri) throws Exception {
		return dao.listCount4(scri);
	}
	// 기업 탈퇴
	@Override
	public void companyDelete(String userId) throws Exception {
		dao.companyDelete(userId);
	}
//------------------------------------------------------------------------------------
	// 유저 목록
	@Override
	public List<MemberVO> memberList(SearchCriteria scri) throws Exception {
		return dao.memberList(scri);
	}

	// 유저 탈퇴
	@Override
	public void memberDelete(String userId) throws Exception {
		dao.memberDelete(userId);
	}
	// 유저 총 갯수
	@Override
	public int listCount1(SearchCriteria scri) throws Exception {
		return dao.listCount1(scri);
	}

	// 게시판 목록
	@Override
	public List<BoardVO> boardList(SearchCriteria scri) throws Exception {
			return dao.boardList(scri);
	}
	// 게시물 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO boardListR(Integer bno) throws Exception {
		return dao.boardListR(bno);
	}
	// 게시글 조회수
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO boardhit(Integer bno) throws Exception {
		return  dao.boardHit(bno);
	}
	// 게시글 삭제
	@Override
	public void boardListD(int bno) throws Exception {
		dao.boardListD(bno);
	}
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return dao.selectFileList(bno);
	}
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return dao.selectFileInfo(map);
	}
	//-------------------------------------------------
	//방문자기록

	@Override
	public List<VisitorCountVO> getVisitorCount() throws Exception {
		return dao.getVisitorCount();
	}
	@Override
	public List<MoneyVO> getMoneyCount() throws Exception {
		return dao.getMoneyCount();
	}
	@Override
	public void insertVisitor(VisitorCountVO vo) throws Exception{
		  dao.insertVisitor(vo);
	}
	@Override
	public int memberCount() throws Exception {
		return dao.memberCount();
	}
	@Override
	public int companyCount() throws Exception {
		return dao.companyCount();
	}
	@Override
	public List<MemberVO> getGenderCount() throws Exception {
		return dao.getGenderCount();
	}
	@Override
	public int todayCount() throws Exception {
		return dao.todayCount();
	}
	@Override
	public int totalMoney() throws Exception {
		return dao.totalMoney();
	}
	//-------------------------------------------------------------
	// qna 게시글 삭제
	@Override
	public void qnaDelete(int bno) throws Exception {
		dao.qnaDelete(bno);
	}
}