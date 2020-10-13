package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.ReviewBoardDAO;
import kr.co.dao.ReviewReplyDAO;
import kr.co.vo.ReviewReplyVO;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService {
	
	@Inject
	private ReviewReplyDAO dao;
	
	@Inject
	private ReviewBoardDAO bdao;

	// 댓글 목록
	@Override
	public List<ReviewReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}
	
	// 댓글 작성
	@Override
	public void writeReply(ReviewReplyVO vo) throws Exception {
		dao.writdReply(vo);
		bdao.updateReplyCnt(vo.getBno(), 1);
	}

	// 댓글 수정
	@Override
	public void updateReply(ReviewReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(ReviewReplyVO vo) throws Exception {
		dao.deleteReply(vo);
		bdao.updateReplyCnt(vo.getBno(), -1);
	}

	// 선택된 댓글 조회
	@Override
	public ReviewReplyVO selectReply(int rno) throws Exception {
		return dao.selectReply(rno);
	}

}
