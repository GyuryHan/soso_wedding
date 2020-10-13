package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.ReviewBoardVO;
import kr.co.vo.SearchCriteria;

public interface ReviewBoardDAO {

   // 게시글 작성
   public void write(ReviewBoardVO ReviewboardVO) throws Exception;
   
   // 게시물 목록 조회
   public List<ReviewBoardVO> list(SearchCriteria scri) throws Exception;

   // 게시물 총 갯수
   public int listCount(SearchCriteria scri) throws Exception;
   
   // 게시물 조회
   public ReviewBoardVO read(int bno) throws Exception;
   // 홈 에서 불러올 게시물  정보 조회
   public List<ReviewBoardVO> homelist() throws Exception;
   
   // 게시물 수정
   public void update(ReviewBoardVO ReviewboardVO) throws Exception;
   
   // 게시물 삭제
   public void delete(int bno) throws Exception;
   
   // 첨부파일 업로드
   public void insertFile(Map<String, Object> map) throws Exception;
   
   // 첨부파일 조회
   public List<Map<String, Object>> selectFileList(int bno) throws Exception;
   
   // 첨부파일 다운
   public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
   
   // 첨부파일 수정
   public void updateFile(Map<String, Object> map) throws Exception;
   
    // 게시판 조회수
    public ReviewBoardVO boardHit(int bno) throws Exception;
   
   // 댓글 count
   public void updateReplyCnt(Integer bno, int amount) throws Exception;
}