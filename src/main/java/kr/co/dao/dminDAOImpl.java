package kr.co.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

@Repository
public class dminDAOImpl implements dminDAO {

   @Inject
   private SqlSession sql;
   
   // 매퍼 
   private static String namespace = "adminMapper";
   private static String namespace2 = "countMapper";
   private static String namespace3 = "boardMapper";

   // 카테고리
   @Override
   public List<CategoryVO> category() throws Exception {
      return sql.selectList("adminMapper.category");
   }

   // 상품등록
   @Override
   public void register2(GoodsVO vo) throws Exception {
      sql.insert(namespace + ".register2", vo);
   }

   // 상품목록
   @Override
   public List<GoodsViewVO> goodslist(SearchCriteria scri) throws Exception {
      return sql.selectList(namespace + ".goodslist", scri);
   }

   // 상품조회 + 카테고리 조인
   @Override
   public GoodsViewVO goodsView(int gdsNum) throws Exception {
      return sql.selectOne(namespace + ".goodsView", gdsNum);
   }

   // 상품 수정
   @Override
   public void goodsModify(GoodsVO vo) throws Exception {
      sql.update(namespace + ".goodsModify", vo);
   }

   // 상품 삭제
   @Override
   public void goodsDelete(int gdsNum) throws Exception {
      sql.delete(namespace + ".goodsDelete", gdsNum);
   }
   
   // 주문 목록
   @Override
   public List<OrderVO> orderList() throws Exception {
      return sql.selectList(namespace + ".orderList");
   }

   // 특정 주문 목록 
   @Override
   public List<OrderListVO> orderView(OrderVO order) throws Exception {
      return sql.selectList(namespace + ".orderView", order);
   }

   // 배송 상태
   @Override
   public void delivery(OrderVO order) throws Exception {
      sql.update(namespace + ".delivery", order);
   }
   
   // 상품 수량 조절
   @Override
   public void changeStock(GoodsVO goods) throws Exception {      
      sql.update(namespace + ".changeStock", goods);
   }
/*
   // 모든 소감(댓글)
   @Override
   public List<ReplyListVO> allReply() throws Exception {
      return sql.selectList(namespace + ".allReply");
   }
*/
   // 소감(댓글) 삭제
   @Override
   public void deleteReply(int repNum) throws Exception {
      sql.delete(namespace + ".deleteReply", repNum);
   }
	// 상품 삭제
	@Override
	public void delete(int gdsNum) throws Exception {
		sql.delete(namespace + ".delete", gdsNum);
		}
	// 상품 승인
	@Override
	public void update2(GoodsVO goodsVO) throws Exception {
		sql.update(namespace + ".update2", goodsVO);
	}
	// 상품 취소
	@Override
	public void update3(GoodsVO goodsVO) throws Exception {
		sql.update(namespace + ".update3", goodsVO);
	}
	// 상품 총 갯수
	@Override
	public int listCount2(SearchCriteria scri) throws Exception {
	return sql.selectOne(namespace + ".listCount2", scri);
	}

	
	// 공지사항  목록
	@Override
	public List<AdminNoticesVO> notices(SearchCriteria scri) throws Exception {
		return sql.selectList(namespace + ".notices",scri);
	}
	// 공지사항 등록
	@Override
	public void noticesW(AdminNoticesVO adminNoticesVO) throws Exception {
		sql.insert(namespace + ".noticesS", adminNoticesVO);
	}
	// 공지사항 첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sql.insert(namespace +".insertFile", map);
	}
	// 공지사항 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList2(int no) throws Exception {
		return sql.selectList(namespace +".selectFileList", no);
	}
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo2(Map<String, Object> map) throws Exception {
		return sql.selectOne(namespace+".selectFileInfo", map);
	}
	// 다중 첨부파일
	@Override
	public void updateFile2(Map<String, Object> map) throws Exception {
		sql.update(namespace + ".updateFile", map);
	}
	// 공지사항 상세 조회
	@Override
	public AdminNoticesVO noticesR(int no) throws Exception {

		return sql.selectOne(namespace + ".noticesR", no);
	}
	// 공지사항 상세 수정
	@Override
	public void noticesUE(AdminNoticesVO adminNoticesVO) throws Exception {
		sql.update(namespace + ".noticesUE", adminNoticesVO);
	}
	// 공지사항 총 갯수
	@Override
	public int listCount3(SearchCriteria scri) throws Exception {
		return sql.selectOne(namespace + ".listCount3", scri);
	}
	// 조회수 기능
		@Override
		public AdminNoticesVO noticesHit(int no) throws Exception {
			sql.update(namespace + ".noticesHit", no);
			return null;
		}
	// 공지사항 삭제
	   @Override
	   public void noticesD(int no) throws Exception {
	      sql.delete(namespace + ".noticesD", no);
	   }
	//----------------------------------------------------------------------------
	// 기업 목록
	@Override
	public List<MemberVO> companyList(SearchCriteria scri) throws Exception {
		return sql.selectList(namespace + ".companyList",scri);
	}
	// 기업 삭제
	@Override
	public void companyDelete(String userId) throws Exception {
		sql.delete(namespace + ".companyDelete", userId);
	}
	// 기업 총 갯수
	@Override
	public int listCount4(SearchCriteria scri) throws Exception {
		return sql.selectOne(namespace + ".listCount4", scri);
	}
	//-----------------------------------------------------------------------------
	// 유저 목록
	@Override
	public List<MemberVO> memberList(SearchCriteria scri) throws Exception {
		return sql.selectList(namespace + ".memberList",scri);
	}
	// 유저 삭제
	@Override
	public void memberDelete(String userId) throws Exception {
		sql.delete(namespace + ".memberDelete", userId);
	}
	// 유저 총 갯수
	@Override
	public int listCount1(SearchCriteria scri) throws Exception {
		return sql.selectOne(namespace + ".listCount1", scri);
	}
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
	return sql.selectOne(namespace + ".listCount", scri);
	}

	// 게시판 목록 조회
	@Override
	public List<BoardVO> boardList(SearchCriteria scri) throws Exception {
		return sql.selectList(namespace + ".boardList",scri);
	}
	// 게시물 상세 조회
	@Override
	public BoardVO boardListR(Integer bno) throws Exception {
		return sql.selectOne(namespace + ".boardListR", bno);
	}
	// 게시글 삭제
   @Override
   public void boardListD(int bno) throws Exception {
      sql.delete(namespace + ".boardListD", bno);
   }
	// 조회수 기능
	@Override
	public BoardVO boardHit(int bno) throws Exception {
		sql.update(namespace3 + ".boardHit", bno);
		return null;
	}
	
	// 댓글 숫자
	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception{
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		sql.update(namespace3 + ".updateReplyCnt", paramMap);
	}
	// 첨부파일 조회
		@Override
		public List<Map<String, Object>> selectFileList(int bno) throws Exception {
			return sql.selectList("boardMapper.selectFileList", bno);
		}

		// 첨부파일 다운로드
		@Override
		public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
			return sql.selectOne("boardMapper.selectFileInfo", map);
		}
		
   //------------------------------------------------
   //방문자 통계

   	@Override
	public List<VisitorCountVO> getVisitorCount() throws Exception {
   		return sql.selectList(namespace2 + ".getVisitorCount");
   	}
   	@Override
   	public List<MoneyVO> getMoneyCount() throws Exception {
   		return sql.selectList(namespace2 + ".getMoneyCount");
   	}
   	@Override
   	public void insertVisitor(VisitorCountVO vo) throws Exception{
   		 sql.insert(namespace2 + ".insertVisitor", vo);
   	}
   	@Override
	public int memberCount() throws Exception {
   		return sql.selectOne(namespace2 + ".getMemberCount");
   	}
   	@Override
   	public int companyCount() throws Exception{
   		return sql.selectOne(namespace2 + ".getCompanyCount");
   	}
   	@Override
   	public List<MemberVO> getGenderCount() throws Exception{
   		return sql.selectList(namespace2 + ".getGenderCount");
   	}
   	@Override
   	public int todayCount() throws Exception{
   		return sql.selectOne(namespace2 + ".getTodayCount");
   	}
   	@Override
   	public int totalMoney() throws Exception{
   		return sql.selectOne(namespace2 + ".getToalMoneyCount");
   	}
   	
   	
   	//-----------------------------------------------------------------
 	//qna 게시글 삭제
 	@Override
 	public void qnaDelete(int bno) throws Exception {
 		sql.delete(namespace + ".qnaDelete", bno);
 	}
} 