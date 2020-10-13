package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.AllSearchDAO;
import kr.co.vo.AllSearchVO;
import kr.co.vo.BoardVO;
import kr.co.vo.GoodsViewVO;
import kr.co.vo.QnaBoardVO;
import kr.co.vo.ReviewBoardVO;

@Service
public class AllSearchServiceImpl implements AllSearchService{
	@Inject
	private AllSearchDAO alldao;
	
	@Override
	public List<GoodsViewVO> goodslist(AllSearchVO allsearch) throws Exception {
		return alldao.goodslist(allsearch);
	}

	@Override
	public GoodsViewVO goods_read(int gdsNum) throws Exception {
		return alldao.goods_read(gdsNum);
	}

	@Override
	public List<BoardVO> boardlist(AllSearchVO allsearch) throws Exception {
		return alldao.boardlist(allsearch);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO free_read(int bno) throws Exception {
		return alldao.free_read(bno);
	}

	@Override
	public List<QnaBoardVO> qnalist(AllSearchVO allsearch) throws Exception {
		return alldao.qnalist(allsearch);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public QnaBoardVO qna_read(int bno) throws Exception {
		return alldao.qna_read(bno);
	}

	@Override
	public List<ReviewBoardVO> reviewlist(AllSearchVO allsearch) throws Exception {
		return alldao.reviewlist(allsearch);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ReviewBoardVO rev_read(int bno) throws Exception {
		return alldao.rev_read(bno);
	}

	@Override
	public int reviewCount() throws Exception {
		return alldao.reviewCount();
	}

	@Override
	public int boardCount() throws Exception {
		return alldao.boardCount();
	}

	@Override
	public int qnaCount() throws Exception {
		return alldao.qnaCount();
	}

	@Override
	public int goodsCount() throws Exception {
		return alldao.goodsCount();
	}

	@Override
	public List<GoodsViewVO> goodslistcount(AllSearchVO allsearch) throws Exception {
		return alldao.goodslistcount(allsearch);
	}

	@Override
	public List<BoardVO> boardlistcount(AllSearchVO allsearch) throws Exception {
		return alldao.boardlistcount(allsearch);
	}

	@Override
	public List<QnaBoardVO> qnalistcount(AllSearchVO allsearch) throws Exception {
		return alldao.qnalistcount(allsearch);
	}

	@Override
	public List<ReviewBoardVO> reviewlistcount(AllSearchVO allsearch) throws Exception {
		return alldao.reviewlistcount(allsearch);
	}



}
