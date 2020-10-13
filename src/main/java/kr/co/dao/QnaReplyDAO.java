package kr.co.dao;

import java.util.List;

import kr.co.vo.QnaReplyVO;

public interface QnaReplyDAO {

	// 댓글 조회
	public List<QnaReplyVO> readReply(int bno) throws Exception;
	
	// 댓글 작성
	public void writdReply(QnaReplyVO vo) throws Exception;
	
	// 댓글 수정
	public void updateReply(QnaReplyVO vo) throws Exception;
	
	// 댓글 삭제
	public void deleteReply(QnaReplyVO vo) throws Exception;
	
	// 선택된 댓글 조회
	public QnaReplyVO selectReply(int rno) throws Exception;
	
	// 댓글 갯수
	public int getbno(Integer rno) throws Exception;
}
