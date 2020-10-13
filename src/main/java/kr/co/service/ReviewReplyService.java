package kr.co.service;

import java.util.List;

import kr.co.vo.ReviewReplyVO;

public interface ReviewReplyService {

	//댓글 조회
	public List<ReviewReplyVO> readReply(int bno) throws Exception;
	
	//댓글 작성
	public void writeReply(ReviewReplyVO vo) throws Exception;
	
	//댓글 수정
	public void updateReply(ReviewReplyVO vo) throws Exception;
	
	//댓글 삭제
	public void deleteReply(ReviewReplyVO vo) throws Exception;
		
	//선택된 댓글 조회
	public ReviewReplyVO selectReply(int rno) throws Exception;
}
