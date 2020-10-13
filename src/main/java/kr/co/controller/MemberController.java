package kr.co.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.MemberService;
import kr.co.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");
		int result = service.idChk(vo);
		try {
			if(result == 1) {
				return "/member/register";
			}else if(result == 0) {
				String inputPass = vo.getUserPass();
				String pwd = pwdEncoder.encode(inputPass);
				vo.setUserPass(pwd);
				
				service.register(vo);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	
	   @RequestMapping(value = "/signin", method = RequestMethod.GET)
	   public void getSignin() throws Exception {
	      logger.info("get signin");
	   }
	
	// 로그인 post
	   @RequestMapping(value = "/signin", method = RequestMethod.POST)
	   public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
	      logger.info("post login");
	   
	      session.getAttribute("member");
	      System.out.println("vo : " + vo);
	      MemberVO login = service.login(vo);
	      if(login!=null) {
	         boolean pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
	         if(pwdMatch==true) {
	            session.setAttribute("member", login);
	         } else {
		         session.setAttribute("member", null);  // member 세션에 null 부여  
		         rttr.addFlashAttribute("msg", false);
		         return "redirect:/member/signin";
	         }
	      }
	      else {
	         session.setAttribute("member", null);  // member 세션에 null 부여  
	         rttr.addFlashAttribute("msg", false);
	         return "redirect:/member/signin";
	      }
	      
	      
//	      boolean pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
	//
//	      if(login != null && pwdMatch==true) {
//	         session.setAttribute("member", login);
//	      } else {
//	         session.setAttribute("member", null);  // member 세션에 null 부여  
//	         rttr.addFlashAttribute("msg", false);
//	         return "redirect:/member/signin";
//	      }
	      
	      
	      return "redirect:/";
	   }
	
	// 로그아웃 post
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원정보 수정 get
	@RequestMapping(value="/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
		return "member/memberUpdateView";
	}
	
	// 회원정보 수정  post
	@RequestMapping(value="/memberUpdateView", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
		String inputPass = vo.getUserPass();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setUserPass(pwd);
		service.memberUpdate(vo);
		session.invalidate();
		return "redirect:/";
	}
	   // 회원정보수정전 비밀번호확인 get
	   @RequestMapping(value="/memberPassChkView", method = RequestMethod.GET)
	   public String memberPassChkView() throws Exception{
	      return "member/memberPassChkView";
	   }
	   
	   // 회원정보수정전 비밀번호확인  post
	   @RequestMapping(value="/memberPassChkView", method = RequestMethod.POST)
	   public String memberPassChkView(MemberVO vo, HttpSession session) throws Exception{
	      String inputPass = vo.getUserPass();
	      String pwd = pwdEncoder.encode(inputPass);
	      vo.setUserPass(pwd);
	      return "redirect:/";
	   }
	
	// 회원 탈퇴 get
	@RequestMapping(value="/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		return "member/memberDeleteView";
	}
	
	// 회원 탈퇴 post
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		service.memberDelete(vo);
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public boolean passChk(MemberVO vo) throws Exception {

		MemberVO login = service.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
		return pwdChk;
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk( MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}
	
	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/checkEmail", method = RequestMethod.POST)
	public int checkEmail(MemberVO vo) throws Exception{
		int result = service.checkEmail(vo);
		return result;
	}
	
}