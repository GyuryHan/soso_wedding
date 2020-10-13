package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.co.vo.AllSearchVO;
import kr.co.vo.BoardVO;
import kr.co.vo.GoodsViewVO;
import kr.co.vo.QnaBoardVO;
import kr.co.vo.ReviewBoardVO;

@Service
public class AllSearchDAOImpl implements AllSearchDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "allsearchMapper";

	//상품 게시물 목록 조회
	@Override
	public List<GoodsViewVO> goodslist(AllSearchVO allsearch) throws Exception {
		return sqlSession.selectList(namespace+".goodsSearch", allsearch);
	}

	//상품 게시물 조회
	@Override
	public GoodsViewVO goods_read(int gdsNum) throws Exception {
		return sqlSession.selectOne(namespace + ".goodsread", gdsNum);
	}

	//자유게시판 게시물 목록 조회
	@Override
	public List<BoardVO> boardlist(AllSearchVO allsearch) throws Exception {
		return sqlSession.selectList(namespace+".boardSearch",allsearch);
	}
	
	//자유게시판 게시물 조회
	@Override
	public BoardVO free_read(int bno) throws Exception {
		return sqlSession.selectOne(namespace+".boardread",bno);
	}

	//qna 게시물 목록 조회
	@Override
	public List<QnaBoardVO> qnalist(AllSearchVO allsearch) throws Exception {
		return sqlSession.selectList(namespace+".qnaboardSearch",allsearch);
	}
	
	//qna 게시물조회
	@Override
	public QnaBoardVO qna_read(int bno) throws Exception {
		return sqlSession.selectOne(namespace+".qnaread",bno);
	}

	//후기 게시판 게시물 목록 조회
	@Override
	public List<ReviewBoardVO> reviewlist(AllSearchVO allsearch) throws Exception {
		return sqlSession.selectList(namespace+".reviewboardSearch", allsearch);
	}

	//후기 게시판 게시물 조회
	@Override
	public ReviewBoardVO rev_read(int bno) throws Exception {
		return sqlSession.selectOne(namespace+".reviewread",bno);
	}
	
	//후기게시판 총겟수
	public int reviewCount()throws Exception{
		return sqlSession.selectOne(namespace+".reviewcount");
	}
	
	//자유게시판 총갯수
	public int boardCount() throws Exception {
		return  sqlSession.selectOne(namespace+".boardcount");
	}

	//QnA게시판 총갯수
	public int qnaCount() throws Exception {
		return sqlSession.selectOne(namespace+".qnacount");
	}
	
	//상점 게시물 총갯수
	public int goodsCount() throws Exception {
		return sqlSession.selectOne(namespace+".goodscount");
	}
	
	//토탈카운트
	//상점카운트
	@Override
	public List<GoodsViewVO> goodslistcount(AllSearchVO allsearch) throws Exception {
		return sqlSession.selectList(namespace+".goodslistcount",allsearch);
	}

	//자유게시판 카운트
	@Override
	public List<BoardVO> boardlistcount(AllSearchVO allsearch) throws Exception {
		return sqlSession.selectList(namespace+".boardlistcount",allsearch);
	}

	//QnA게시판 카운트
	@Override
	public List<QnaBoardVO> qnalistcount(AllSearchVO allsearch) throws Exception {
		return sqlSession.selectList(namespace+".qnalistcount",allsearch);
	}

	//후기게시판 카운트
	@Override
	public List<ReviewBoardVO> reviewlistcount(AllSearchVO allsearch) throws Exception {
		return sqlSession.selectList(namespace+".reviewlistcount",allsearch);
	}


}
