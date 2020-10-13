package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.ReviewReplyVO;

@Repository
public class ReviewReplyDAOImpl implements ReviewReplyDAO{

	@Inject SqlSession sql;
	
	// 댓글 조회
	@Override
	public List<ReviewReplyVO> readReply(int bno) throws Exception {
		return sql.selectList("reviewreplyMapper.readReply", bno);
	}

	// 댓글 작성
	@Override
	public void writdReply(ReviewReplyVO vo) throws Exception {
		sql.insert("reviewreplyMapper.writeReply", vo);
	}

	// 댓글 수정
	@Override
	public void updateReply(ReviewReplyVO vo) throws Exception {
		sql.update("reviewreplyMapper.updateReply", vo);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(ReviewReplyVO vo) throws Exception {
		sql.delete("reviewreplyMapper.deleteReply", vo);
	}

	// 선택된 댓글 조회
	@Override
	public ReviewReplyVO selectReply(int rno) throws Exception {
		return sql.selectOne("reviewreplyMapper.selectReply", rno);
	}

	// 댓글 갯수 갱신
	@Override
	public int getbno(Integer rno) throws Exception{
		return sql.selectOne("reviewreplyMapper.getbno", rno);
	}
	
}

