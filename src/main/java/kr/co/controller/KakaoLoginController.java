package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonProcessingException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;

import kr.co.service.KakaoServiceImpl;
import kr.co.service.MemberService;
import kr.co.vo.MemberVO;

@Controller
public class KakaoLoginController {
	@Inject
	MemberService service;

    @RequestMapping("/oauth")
    public String login(@RequestParam("code") String code, Model model, HttpSession session,
    		MemberVO vo,RedirectAttributes rttr) throws JsonProcessingException, Exception{
    	System.out.println("kakao login-start");
        System.out.println("code : "+code);

        KakaoServiceImpl kakaoServiceImpl = new KakaoServiceImpl();
        JsonNode node = kakaoServiceImpl.getAccessToken(code); // 하면, JsonNode returnNode 나옴

        JsonNode accessToken = node.get("access_token"); //access_token 가져오기.

        //////session 에 담기
            session.setAttribute("token", accessToken.asText());

            JsonNode userInfo = kakaoServiceImpl.getUserInfo(accessToken); //access_token으로 정보가져오기_kakaoServiceImpl resultNode구하기

            String id = userInfo.get("id").toString();
            String nickname = null;
//            String thumbnailImage = null;
//            String profileImage = null;
            String email = null;

            JsonNode properties = userInfo.path("properties"); //porperties안에 있는 정보들 : nickname, thumnailImage, profileImage
            if (properties.isMissingNode()){
            	System.out.println("dddd");
            } else {
                nickname = properties.get("nickname").asText();
//                thumbnailImage = properties.get("thumbnail_image").asText();
//                profileImage = properties.get("profile_image").asText();
//                for(JsonNode properties : )
                System.out.println("nickname : " + nickname);
//                System.out.println("thumbnailImage : " + thumbnailImage);
//                System.out.println("profileImage : " + profileImage);
            }


            JsonNode kakao_account = userInfo.path("kakao_account");//email

            if (kakao_account.get("has_email").asBoolean())
            {
                email = kakao_account.get("email").asText();
                email = kakao_account.get("email").toString();
                System.out.println("has_email.asBoolean() is true : "+email);
            }
            else
            {
                email = "email 입력해주세요.";
                System.out.println("has_email.asBoolean() is false : "+email);
            }

            session.setAttribute("userId", id);
            session.setAttribute("username", nickname);
//            session.setAttribute("thumbnailImage",thumbnailImage);
//            session.setAttribute("profileImage",profileImage);
            session.setAttribute("Email",email);
            session.setAttribute("token", accessToken.asText());
            
            System.out.println("json 변화해야됨");
            
            vo.setUserId(id);
            vo.setUserName(nickname);
            vo.setVerify(1);
            session.getAttribute("member");
    		System.out.println(vo.getUserId() + ":" + vo.getUserName());


            MemberVO k_login = service.login(vo);
            System.out.println("service.login 완료");
         // DB에 유저확인.
    		if (k_login == null) {
    			System.out.println("-----------------------------");
    			service.register(vo);
    			System.out.println("-----------------------------");
    		}

    		if (k_login != null) {
    			session.setAttribute("member", k_login);
    			System.out.println("1end");
    		} else {
    			session.setAttribute("member", null);
    			rttr.addFlashAttribute("msg", false);
    			System.out.println("2end");
    		}
    		System.out.println("----klogin end-----");
            System.out.println("kakaoLogin-end");


        return "redirect:/";

    }
}
