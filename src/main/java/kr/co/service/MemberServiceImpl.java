package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.MemberDAO;
import kr.co.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		return dao.login(vo);
	}
	
//	Controller에서 보내는 파라미터들을 memberUpdate(MemberVO vo)로 받음
	@Override
	public void memberUpdate(MemberVO vo) throws Exception{
		// 받은 vo 를 DAO로 보냄
		dao.memberUpdate(vo);
	}
	
	// 업데이트에서 처리한 내용과 같음.
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}
	
	// 패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception{
		int result = dao.passChk(vo);
		return result;
	}
	
	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception{
		int result = dao.idChk(vo);
		return result;
	}
	
	// 이메일 중복 체크
	@Override
	public int checkEmail(MemberVO vo) throws Exception{
		int result = dao.checkEmail(vo);
		return result;
	}
	//정보수정/패스워드 수정확인
	@Override
	   public boolean checkPw(String userId, String userPass) throws Exception {
	      return dao.checkPw(userId, userPass);
	   }
	
	
}
