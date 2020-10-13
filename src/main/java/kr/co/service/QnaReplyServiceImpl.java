package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.QnaBoardDAO;
import kr.co.dao.QnaReplyDAO;
import kr.co.vo.QnaReplyVO;

@Service
public class QnaReplyServiceImpl implements	QnaReplyService {
	
	@Inject
	private QnaReplyDAO dao;
	
	@Inject
	private QnaBoardDAO bdao;

	// 댓글 목록
	@Override
	public List<QnaReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}
	
	// 댓글 작성
	@Override
	public void writeReply(QnaReplyVO vo) throws Exception {
		dao.writdReply(vo);
		bdao.updateReplyCnt(vo.getBno(), 1);
	}

	// 댓글 수정
	@Override
	public void updateReply(QnaReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(QnaReplyVO vo) throws Exception {
		dao.deleteReply(vo);
		bdao.updateReplyCnt(vo.getBno(), -1);
	}

	// 선택된 댓글 조회
	@Override
	public QnaReplyVO selectReply(int rno) throws Exception {
		return dao.selectReply(rno);
	}

}
