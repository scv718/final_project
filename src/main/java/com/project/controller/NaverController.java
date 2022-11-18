package com.project.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

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
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.NaverVO;
import com.project.user.UserService;
import com.project.user.UserVO;



@Controller
public class NaverController {
	
	private static final String NAVER_AUTH_URL = "https://nid.naver.com/oauth2.0/authorize";
	private static final String NAVER_TOKEN_URL = "https://nid.naver.com/oauth2.0/token";
	private static final String NAVER_PROFIL_URL = "https://openapi.naver.com/v1/nid/me";
	private static final String NAVER_LOGOUT_URL = "https://nid.naver.com/nidlogin.logout";
	private String REDIRECT_URL = "";
	private static String tokenChk;
	@Autowired
	SubscribeService subscribeService;
	
	@Autowired
	UserService userService;
		
//	@RequestMapping("/naverlogin.wp")
//	public String naverLoginView(Model model, NaverVO vo) {
//		model.addAttribute("naver", vo);
//		return "/";
//	}
//	
	@RequestMapping("/naverLogout.wp")
	public String naverLoginOut(Model model, NaverVO vo, HttpSession session){
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpGet get = new HttpGet(NAVER_LOGOUT_URL);
		model.addAttribute("naverInfo", null);
		try {
			session.invalidate();
			HttpResponse res = client.execute(get); 
			res = client.execute(get); 
		}catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return "/";
	}
	@RequestMapping("/getNaverAuthUrl.wp")
	public String getAuthUrl(NaverVO vo) {
		REDIRECT_URL = vo.getCallback_url()+"/naverlogin.wp";
		String result = NAVER_AUTH_URL + "?state=success&response_type=code&client_id="+vo.getClient_id()+"&redirect_uri="+REDIRECT_URL;
		return "redirect:"+result;
	}
	
	@RequestMapping(value = "/naverlogin.wp")
	public String oauthKakao(NaverVO vo ,UserVO uvo, Model model, HttpSession session, SubscribeVO svo) throws Exception {
		vo.setAccess_token(getToken(vo));
        
        HashMap<String, Object> userInfo = getProfile(vo);
//        System.out.println("access_Token : " + access_Token);
//        System.out.println("userInfo : " + userInfo.get("email"));
//        System.out.println("nickname : " + userInfo.get("mobile"));
//        
//        model.addAttribute("naverInfo", userInfo);
        
        model.addAttribute("naver", vo);
        
        
        String m_email = (String) userInfo.get("email");
        String m_name = (String) userInfo.get("name");
        String agestr = (String) userInfo.get("age");
        String m_phone = (String) userInfo.get("mobile");
        model.addAttribute("naverInfo", userInfo);
        
        agestr = agestr.substring(0,2);
        int age = Integer.parseInt(agestr);
        System.out.println(age);
        System.out.println(m_name);
        System.out.println(m_phone);
        uvo.setM_email(m_email);
        uvo.setM_name(m_name);
        uvo.setM_phone(m_phone);
        String id = null;

        if(userService.getId(uvo) == null) {
        	if(age < 20) {
        		session.setAttribute("ageerror", 1);
        		return "redirect:/";
        	}else {
        		uvo.setM_pw(m_email);
        		uvo.setId(m_email);
        		svo.setId(uvo.getId());
        		userService.kakaoInsertUser(uvo);
        		subscribeService.insertSubscribe0(svo);
        		session.setAttribute("login", m_email);
        		session.setAttribute("userName", m_name);
        		session.setAttribute("userID", m_email);
        		session.setAttribute("userType", "naver");
        		
        		return "redirect:/preference.wp";
        	}
        
        }else {
        	id = userService.getId(uvo).getId();
        	if(id.equals(m_email)) {
        		session.setAttribute("login", m_email);
        		session.setAttribute("userID", m_email);
        		session.setAttribute("userName", m_name);
        		session.setAttribute("userType", "naver");
        		
        		return "redirect:/";
        	}else {
        		session.setAttribute("socialerror", 1);
        		return "redirect:signUp.wp";
        	}
        }
        
        
       
	}
	
	//접근토근 요청/응답정보
	public String getToken(NaverVO vo) throws Exception 
	{
		System.out.println(vo.toString());
		String apiUrl = NAVER_TOKEN_URL;
		String access_token = null;
		
        HttpClient client = HttpClientBuilder.create().build(); 
		
		HttpPost post = new HttpPost(NAVER_TOKEN_URL); 
		Map<String,String> m =new HashMap<String,String>(); 
		m.put("grant_type", "authorization_code");
		m.put("client_id", vo.getClient_id()); //애플리케이션 클라이언트 아이디값";
		m.put("client_secret", vo.getClient_secret());//애플리케이션 클라이언트 시크릿값";
		m.put("redirect_uri", URLEncoder.encode(vo.getCallback_url(), "UTF-8")); 
		m.put("code", vo.getCode()); 
		m.put("state", vo.getState()); 
		
		
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post); 
			
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
//			System.out.println("body333: "+body);
			JsonNode rootNode = mapper.readTree(body); 
			access_token = rootNode.get("access_token").asText();
			
		}catch (Exception e) { 
			e.printStackTrace(); 
		}    
       
         
//		REDIRECT_URL = "http://localhost:8090";		
		REDIRECT_URL = "http://winerycop.tk";		
	    return access_token;
	    
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
	
	//네이버 프로필 정보 가져오기
//	@RequestMapping(value="/getProfile")
//	@ResponseBody
	public HashMap<String, Object> getProfile(NaverVO vo) throws Exception {
        System.out.println("vo: "+vo);
        String header = "Bearer " + vo.getAccess_token(); // Bearer 다음에 공백 추가

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);
        
        HttpClient client = HttpClientBuilder.create().build(); 
		HttpGet get = new HttpGet(NAVER_PROFIL_URL);
		HashMap<String, Object> map = new HashMap<String, Object>();;
		get.setHeader("Authorization", header); 
		try {
			HttpResponse res = client.execute(get); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			
			System.out.println("body999: "+body);
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode response = rootNode.get("response"); 
			
			if(rootNode.asText().equals("null")) {
				map.put("msg","내역이 없습니다." );
			}else {
				//이곳에서 데이터베이스 연동로직 처리할 것
				System.out.println("id"+response.get("id").asText() );
				System.out.println("age"+response.get("age").asText() );
				System.out.println("email"+ response.get("email").asText() );
				System.out.println("mobile"+response.get("mobile").asText());
				
				map.put("msg","ok" );
				map.put("id",response.get("id").asText() );
				map.put("age",response.get("age").asText() );
				map.put("name",response.get("name").asText() );
				map.put("email", response.get("email").asText() );
				map.put("mobile",response.get("mobile").asText());
				
			}
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
    	return map; 
        
    }
	
}
