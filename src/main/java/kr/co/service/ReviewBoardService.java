package kr.co.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.ReviewBoardVO;
import kr.co.vo.SearchCriteria;

public interface ReviewBoardService {

   // 게시글 작성
   public void write(ReviewBoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception;

   // 게시물 목록 조회
   public List<ReviewBoardVO> list(SearchCriteria scri) throws Exception;
   
   // 홈 에서 띄울 게시판정보 목록 조회
   public List<ReviewBoardVO> homelist() throws Exception;
   
   // 게시물 총 갯수
   public int listCount(SearchCriteria scri) throws Exception;
   
    // 게시물 조회
   public ReviewBoardVO boardhit(Integer bno) throws Exception;
   
   // 게시물 조회
   public ReviewBoardVO read(Integer bno) throws Exception;
   
   // 게시물 수정
   public void update(ReviewBoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
                          
   // 게시물 삭제
   public void delete(int bno) throws Exception;

   // 첨부파일 조회
   public List<Map<String, Object>> selectFileList(int bno) throws Exception;
   
   // 첨부파일 다운
   public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;

   
   
}