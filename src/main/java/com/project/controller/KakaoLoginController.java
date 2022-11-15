package com.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.UserService;
import com.project.user.UserVO;

@Controller
public class KakaoLoginController {
	
	public static final String KAKAO_AUTH_URL = "https://kauth.kakao.com/oauth/authorize";
	public static final String KAKAO_TOKEN_URL = "https://kauth.kakao.com/oauth/token";
	public static final String KAKAO_USER_INFO_URL = "https://kapi.kakao.com/v2/user/me";
	public static final String KAKAO_LOGOUT_URL = "https://kapi.kakao.com/v1/user/logout";
	public static final String KAKAO_UNLINK_URL = "https://kapi.kakao.com/v1/user/unlink";
	public static String REDIRECT_URI = "http://winerycop.tk";
//	public static String REDIRECT_URI = "http://localhost:8090";
	private static String id ;
	private String REST_API_KEY = "dc2fa6b3e7a1ed13915aa6e675bfc8a6";
	
	@Autowired
	SubscribeService subscribeService;
	@Autowired
	UserService userService;
	
	@RequestMapping("naverLogin.wp")
	public String naerLogin(@RequestBody HashMap<String, Object> param, HttpServletRequest request, HttpServletResponse response,HttpSession session, Model model, UserVO vo) {
		System.out.println("네이버로그인");
		System.out.println(param);
		System.out.println(param.get("email"));
		System.out.println(param.get("name"));
		System.out.println(param.get("mobile"));
		System.out.println(param.get("age"));
		
		
		
		return null;
	}
	
	@RequestMapping("navercollback.wp")
	public String navercollback() {
		System.out.println("네이버 콜백 실행");
		return "WEB-INF/view/user/collback.jsp";
		
	}
	@RequestMapping("/getAuthUrl.wp")
	@ResponseBody
	public String getToken() {
	
		REDIRECT_URI = REDIRECT_URI+"/getToken.wp";
		String result = KAKAO_AUTH_URL + "?response_type=code&scope=account_email,age_range,profile_nickname&client_id="+REST_API_KEY+"&redirect_uri="+REDIRECT_URI;
		
		return result;
	}
	
	
	@RequestMapping(value = "/getToken.wp")
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model, HttpSession session, UserVO vo, SubscribeVO svo) throws Exception {
		System.out.println("code: " + code);
        String access_Token = getAccessToken(code);
        
        
        
        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("access_Token : " + access_Token);
        System.out.println("userInfo : " + userInfo.get("email"));
        System.out.println("nickname : " + userInfo.get("nickname"));
        System.out.println("age_range : " + userInfo.get("age_range"));
        session.setAttribute("login", userInfo.get("email"));
        model.addAttribute("kakaoInfo", userInfo);
        String m_email = (String) userInfo.get("email");
        String m_name = (String) userInfo.get("nickname");
        String agestr = (String) userInfo.get("age_range");
        model.addAttribute("kakaoInfo", userInfo);
        agestr = agestr.substring(0,2);
        int age = Integer.parseInt(agestr);
        System.out.println(age);
        vo.setM_email(m_email);
        vo.setM_name(m_name);
        String id = null;

        REDIRECT_URI = "http://winerycop.tk";
//        REDIRECT_URI = "http://localhost:8090";
        if(userService.getId(vo) == null) {
        	if(age < 20) {
        		System.out.println("나이 제한");
        		return "redirect:/";
        	}else {
        		System.out.println("회원가입 후 로그인 진행");
        		vo.setM_pw(m_email);
        		vo.setId(m_email);
        		svo.setId(vo.getId());
        		userService.kakaoInsertUser(vo);
        		subscribeService.insertSubscribe0(svo);
        		session.setAttribute("login", m_email);
        		session.setAttribute("userName", m_name);
        		session.setAttribute("userID", m_email);
        		session.setAttribute("userType", "kakao");
        		
        		return "redirect:/preference.wp";
        	}
        
        }else {
        	id = userService.getId(vo).getId();
        	if(id.equals(m_email)) {
        		System.out.println("카카오 로그인 진행");
        		session.setAttribute("userID", m_email);
        		session.setAttribute("userName", m_name);
        		session.setAttribute("userType", "kakao");
        		
        		return "redirect:/";
        	}else {
        		System.out.println("자사 아이디로 로그인해주세요");
        		
        		return "redirect:signUp.wp";
        	}
        }
	}
	
	
	@RequestMapping("/logOutkakaoUrl.wp")
	@ResponseBody
	public String getLogout() {
		REDIRECT_URI = REDIRECT_URI+"/logoutkakao.wp";
		
		String result = KAKAO_AUTH_URL + "?response_type=code&client_id="+REST_API_KEY+"&redirect_uri="+REDIRECT_URI;
		return result;
	}
	
	@RequestMapping(value = "/logoutkakao.wp")
	public String logoutKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model, HttpSession session) throws Exception {
		System.out.println("code: " + code);
		session.invalidate();
        String access_Token = getAccessToken(code);
        String addURL = "?target_id_type=user_id&target_id="+id ;
        HttpClient client = HttpClientBuilder.create().build(); 
        HttpGet get = new HttpGet(KAKAO_UNLINK_URL+addURL);
		HashMap<String, Object> map = new HashMap<String, Object>();;
		get.setHeader("Authorization", "Bearer " + access_Token); 
		try {
			HttpResponse res = client.execute(get); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			System.out.println("body333: "+body);
		}catch (Exception e) { 
			e.printStackTrace(); 
		}
		REDIRECT_URI = "http://winerycop.tk";
//		REDIRECT_URI = "http://localhost:8090";
        return "redirect:/";
	}
	
	
	//토큰발급
	public String getAccessToken(String authorize_code) {
		System.out.println("authorize_code: " + authorize_code);
        
		String result = "";
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpPost post = new HttpPost(KAKAO_TOKEN_URL); 
		Map<String,String> m =new HashMap<String,String>(); 
		m.put("grant_type", "authorization_code");
		m.put("client_id", REST_API_KEY);
		m.put("redirect_uri", REDIRECT_URI); 
		m.put("code", authorize_code); 
		try { 
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			result = rootNode.get("access_token").asText();
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return result;
	}
	
	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private
	List<NameValuePair> convertParameter(Map<String,String> paramMap){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>(); 
		Set<Entry<String,String>> entries = paramMap.entrySet();
		for(Entry<String,String> entry : entries) {
		 paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue())); 
		} 
		return paramList; 
	} 
	
	//유저정보조회
    public HashMap<String, Object> getUserInfo(String access_Token) {
    	System.out.println("access_Token: "+access_Token);
    	HttpClient client = HttpClientBuilder.create().build(); 
		HttpGet get = new HttpGet(KAKAO_USER_INFO_URL);
		HashMap<String, Object> map = new HashMap<String, Object>();;
		get.setHeader("Authorization", "Bearer " + access_Token); 
		try {
			HttpResponse res = client.execute(get); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			
			System.out.println("body999: "+body);
			
			JsonNode rootNode = mapper.readTree(body); 
			if(rootNode.asText().equals("null")) {
				System.out.println("내역이 없습니다.");
				map.put("msg","내역이 없습니다." );
			}else {
				map.put("msg","ok" );
				map.put("id",rootNode.get("id").asText() );
				map.put("access_Token", access_Token );
				map.put("connected_at",rootNode.get("connected_at").asText() );
				map.put("nickname", rootNode.get("properties").get("nickname").asText() );
				map.put("email", rootNode.get("kakao_account").get("email").asText() );
				map.put("age_range", rootNode.get("kakao_account").get("age_range").asText() );
		
			}
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
    	return map; 
    }
	
	@RequestMapping(value = "/home.wp")
	public String home() {
		return "home.jsp";
	}
	
	
	
	
}
