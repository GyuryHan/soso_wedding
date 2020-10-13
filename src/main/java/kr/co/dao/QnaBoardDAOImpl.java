package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.QnaBoardVO;
import kr.co.vo.SearchCriteria;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(QnaBoardVO QnaBoardVO) throws Exception {
		sqlSession.insert("qnaboardMapper.insert", QnaBoardVO);
	}
	// 게시물 목록 조회
	@Override
	public List<QnaBoardVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaboardMapper.listPage", scri);
	}

	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaboardMapper.listCount", scri);
	}

	// 게시물 조회
	@Override
	public QnaBoardVO read(int bno) throws Exception {

		return sqlSession.selectOne("qnaboardMapper.read", bno);
	}

	// 게시물 수정
	@Override
	public void update(QnaBoardVO QnaBoardVO) throws Exception {

		sqlSession.update("qnaboardMapper.update", QnaBoardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {

		sqlSession.delete("qnaboardMapper.delete", bno);
	}

	// 첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("qnaboardMapper.insertFile", map);
	}

	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return sqlSession.selectList("qnaboardMapper.selectFileList", bno);
	}

	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("qnaboardMapper.selectFileInfo", map);
	}
	
	// 다중 첨부파일
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		sqlSession.update("qnaboardMapper.updateFile", map);
	}
	

	
	// 댓글 숫자
	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception{
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		sqlSession.update("qnaboardMapper.updateReplyCnt", paramMap);
	}
	@Override
	public QnaBoardVO boardHit(int bno) throws Exception {
		sqlSession.update("qnaboardMapper.boardHit", bno);
		return null;
	}
	
	
}
