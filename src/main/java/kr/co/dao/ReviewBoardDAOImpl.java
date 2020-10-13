package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.ReviewBoardVO;
import kr.co.vo.SearchCriteria;

@Repository
public class ReviewBoardDAOImpl implements ReviewBoardDAO {

   @Inject
   private SqlSession sqlSession;
   
   // 게시글 작성
   @Override
   public void write(ReviewBoardVO ReviewboardVO) throws Exception {
      sqlSession.insert("reviewboardMapper.insert", ReviewboardVO);
   }
   // 홈 에서 불러올 게시물  정보 조회
      @Override
      public List<ReviewBoardVO> homelist() throws Exception {
         // TODO Auto-generated method stub
         return sqlSession.selectList("reviewboardMapper.homelist");
      }
   // 게시물 목록 조회
   @Override
   public List<ReviewBoardVO> list(SearchCriteria scri) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.selectList("reviewboardMapper.listPage", scri);
   }

   // 게시물 총 갯수
   @Override
   public int listCount(SearchCriteria scri) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("reviewboardMapper.listCount", scri);
   }

   // 게시물 조회
   @Override
   public ReviewBoardVO read(int bno) throws Exception {

      return sqlSession.selectOne("reviewboardMapper.read", bno);
   }

   // 게시물 수정
   @Override
   public void update(ReviewBoardVO ReviewboardVO) throws Exception {

      sqlSession.update("reviewboardMapper.update", ReviewboardVO);
   }

   // 게시물 삭제
   @Override
   public void delete(int bno) throws Exception {

      sqlSession.delete("reviewboardMapper.delete", bno);
   }

   // 첨부파일 업로드
   @Override
   public void insertFile(Map<String, Object> map) throws Exception {
      sqlSession.insert("reviewboardMapper.insertFile", map);
   }

   // 첨부파일 조회
   @Override
   public List<Map<String, Object>> selectFileList(int bno) throws Exception {
      return sqlSession.selectList("reviewboardMapper.selectFileList", bno);
   }

   // 첨부파일 다운로드
   @Override
   public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
      return sqlSession.selectOne("reviewboardMapper.selectFileInfo", map);
   }
   
   // 다중 첨부파일
   @Override
   public void updateFile(Map<String, Object> map) throws Exception {
      sqlSession.update("reviewboardMapper.updateFile", map);
   }
   
   // 조회수 기능
     @Override
      public ReviewBoardVO boardHit(int bno) throws Exception {
         sqlSession.update("reviewboardMapper.boardHit", bno);
         return null;
      }
   
   // 댓글 숫자
   @Override
   public void updateReplyCnt(Integer bno, int amount) throws Exception{
      Map<String, Object> paramMap = new HashMap<>();
      paramMap.put("bno", bno);
      paramMap.put("amount", amount);
      
      sqlSession.update("reviewboardMapper.updateReplyCnt", paramMap);
   }
   
   
}