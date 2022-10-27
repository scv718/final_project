package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.user.UserVO;
import com.project.user.impl.UserDAOMybatis;


@Controller
public class IamportController {
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_PAYMENTLIST_URL = "https://api.iamport.kr/payments/status/all";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	public static final String IMPORT_CERTIFICATION_URL = "https://api.iamport.kr/certifications";
	//"아임포트 Rest Api key로 설정";
	public static final String KEY = "5772502836676770";
	//"아임포트 Rest Api Secret로 설정"; 
	public static final String SECRET = "8rO0EvmfinI84PbqQ42EuuK3WRO8CMqBzsgFVXEqHwMs5VeOQETqZo9EGQwuiJIpP3izMWJmCDiInrFB";  
	@Autowired
	private UserDAOMybatis userService;
	
	
	// 아임포트 인증(토큰)을 받아주는 함수 
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL); 
		Map<String,String> m =new HashMap<String,String>(); 
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET); 
		try { 
			post.setEntity( new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response"); 
			result = resNode.get("access_token").asText(); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return result;
	}
	
	
	@RequestMapping(value="/certification.wp" , method = RequestMethod.POST)
	@ResponseBody
	public int userCertification(@RequestBody HashMap<String, Object> param, HttpServletRequest request, HttpServletResponse response,HttpSession session, Model model, UserVO vo) throws IOException {
		Map<String, String> map = new HashMap<String, String>();
		String token = getImportToken();
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_CERTIFICATION_URL+"/"+param.get("imp_uid")); 
		System.out.println(IMPORT_CERTIFICATION_URL+"/"+param.get("imp_uid")+"?_token="+token);
		System.out.println(token);
		get.setHeader("Authorization", token);
	
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response"); 
			
			System.out.println("777: " + resNode);
			if(resNode.asText().equals("null")) {
				System.out.println("내역이 없습니다.");
				map.put("msg","내역이 없습니다." );
			}else {
				map.put("imp_uid",resNode.get("imp_uid").asText() );
				map.put("birth",resNode.get("birth").asText() );
				map.put("name",resNode.get("name").asText() );
				map.put("phone",resNode.get("phone").asText() );
				
				session.setAttribute("name", resNode.get("name").asText());
				session.setAttribute("phone", resNode.get("phone").asText());
				session.setAttribute("birthday", resNode.get("birthday").asText());
			
			    String birthday1 = mapper.treeToValue(resNode.path("birthday"), String.class);
			    Calendar now = Calendar.getInstance();
			    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
				Integer currentYear = now.get(Calendar.YEAR);
				 
			    Date start = dateFormat.parse(birthday1);
			    
			    String year = dateFormat.format(start);
			    
			    Integer birthYear = Integer.parseInt(year);
			    
			    int age = (currentYear - birthYear);
			    String outputAge = Integer.toString(age);
			    
			    System.out.println(birthday1);
			    System.out.println(outputAge);
			    System.out.println(age);
			    String m_phone = mapper.treeToValue(resNode.path("phone"), String.class);
				
				System.out.println(m_phone);
				vo.setM_phone(m_phone);
				
				int result = 0;
				System.out.println(userService.getPw(vo));
				result = userService.getPw(vo);
				
				if(result != 0) {
					System.out.println("이미 가입된 사용자 입니다.");
					return 2;
				}else {
					 if(age<19) {
					    	System.out.println("나이 제한됨");
							return -1;
					    
					    }else {
					    	System.out.println("나이 통과");
					    	return 1;
					    }
				}			
			}
			
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		
		return 0;
		
	}
	
	@RequestMapping(value="/forgotPw.wp" , method = RequestMethod.POST)
	@ResponseBody
	public int forgotPw(@RequestBody HashMap<String, Object> param, HttpServletRequest request, HttpServletResponse response,HttpSession session, Model model, UserVO vo) throws IOException {
		Map<String, String> map = new HashMap<String, String>();
		String token = getImportToken();
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_CERTIFICATION_URL+"/"+param.get("imp_uid")); 
		System.out.println(IMPORT_CERTIFICATION_URL+"/"+param.get("imp_uid")+"?_token="+token);
		System.out.println(token);
		get.setHeader("Authorization", token);
	
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response"); 
			
			System.out.println("777: " + resNode);
			if(resNode.asText().equals("null")) {
				System.out.println("내역이 없습니다.");
				
			}else {
				String m_phone = mapper.treeToValue(resNode.path("phone"), String.class);
				
				System.out.println(m_phone);
				vo.setM_phone(m_phone);
				
				int result = 0;
				System.out.println(userService.getPw(vo));
				result = userService.getPw(vo);
				
			    	
				System.out.println(result);
			    if(result != 1) {
			    	System.out.println("가입되지 않은 사용자");
					return -1;
			    
			    }else {
			    	session.setAttribute("phone", resNode.get("phone").asText());
			    	System.out.println("비밀번호찾기 실행");
			    	return 1;
			    }
			}
			
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		
		return 0;
		
	}
	
	
	//결제 진행 폼=> 이곳에서 DB저장 로직도 추가하기
		@RequestMapping(value="/pay", method=RequestMethod.POST)
		public void payment(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			String nm = request.getParameter("unm");
			String amount = request.getParameter("amount");
			String mid = request.getParameter("mid");
			String token = getImportToken();
			setHackCheck(amount, mid, token);
			
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<html>");
			out.println("<head><title>주문완료</title></head>");
			out.println("<body>");
			out.print(nm+"님의 주문이 완료 되었습니다.<br>");
			out.print("상점 거래ID: "+mid+"<br>");
			out.print("결제 금액: "+amount+"<br>");
			out.print("<a href='/pay'>쇼핑 계속하기</a>");
			out.print("<a href='javascript:(\"준비중입니다.\");'>나의 주문내역</a>");
			out.println("</body></html>");
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
	
	// 아임포트 결제금액 변조는 방지하는 함수 
		 public void setHackCheck(String amount,String mId,String token) { 
			HttpClient client = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
			Map<String,String> m =new HashMap<String,String>();
			post.setHeader("Authorization", token);
			m.put("amount", amount); 
			m.put("merchant_uid", mId);
			try { 
				post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
				HttpResponse res = client.execute(post);
				ObjectMapper mapper = new ObjectMapper();
				String body = EntityUtils.toString(res.getEntity());
				JsonNode rootNode = mapper.readTree(body);
				System.out.println(rootNode); 
			} catch (Exception e) {
				e.printStackTrace(); 
			} 
		} 
	 
	// 결제취소
	@RequestMapping(value="/paycan" , method = RequestMethod.POST)
	@ResponseBody
	public int cancelPayment(String mid) {
		String token = getImportToken();
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL); 
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", mid); 
		String asd = ""; 
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post); 
			ObjectMapper mapper = new ObjectMapper(); 
			String enty = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(enty); 
			asd = rootNode.get("response").asText(); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		if (asd.equals("null")) {
			System.err.println("환불실패");
			return -1;
		} else {
			System.err.println("환불성공");
			return 1; 
		} 
	}
	
	//상품결제 폼 호출
	@RequestMapping(value={"/pay", "/"}, method=RequestMethod.GET)
	public String pay(HttpServletRequest request, Model model) {
		String nm = request.getParameter("unm");
		// 값은 아임포트의 가맹점 식별코드 입력
		model.addAttribute("impKey", "imp86310263"); 
		return "pay";
	}
	
	
	 
	// 아임포트 결제완료건에 한하여 목록 반환 
	@RequestMapping(value="/payamount")
	@ResponseBody
	public Object getAmount(HttpServletRequest request) { 
		String mid = request.getParameter("mid");
		String token = getImportToken();
		System.out.println("토큰값: "+token);
		System.out.println("mid값: "+mid);
		Map<String, String> map = new HashMap<String, String>();
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + mid + "/paid");
		get.setHeader("Authorization", token); 
		try {
			HttpResponse res = client.execute(get); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response"); 
			System.out.println("777: " + resNode);
			if(resNode.asText().equals("null")) {
				System.out.println("내역이 없습니다.");
				map.put("msg","내역이 없습니다." );
			}else {
				map.put("imp_uid",resNode.get("imp_uid").asText() );
				map.put("merchant_uid",resNode.get("merchant_uid").asText() );
				map.put("name",resNode.get("name").asText() );
				map.put("buyer_name",resNode.get("buyer_name").asText() );
				map.put("amount",resNode.get("amount").asText() );
			}
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		return map; 
	} 
	
	// 아임포트 전체 목록 반환 
	@RequestMapping(value="/paylist")
	@ResponseBody
	public Object getlist() { 
		String token = getImportToken();
		System.out.println("토큰값: "+token);
		List<Object> list = new ArrayList<Object>();
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpGet get = new HttpGet(IMPORT_PAYMENTLIST_URL);
		get.setHeader("Authorization", token); 
		try {
			HttpResponse res = client.execute(get); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response").get("list"); 
			System.out.println("555: " + resNode);
			
			for(int i=0; i< resNode.size();i++) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("imp_uid",resNode.get(i).get("imp_uid").asText() );
				map.put("merchant_uid",resNode.get(i).get("merchant_uid").asText() );
				map.put("name",resNode.get(i).get("name").asText() );
				map.put("buyer_name",resNode.get(i).get("buyer_name").asText() );
				map.put("amount",resNode.get(i).get("amount").asText() );
				map.put("cancel_amount",resNode.get(i).get("cancel_amount").asText() );
				map.put("failed_at",resNode.get(i).get("failed_at").asText() );
				list.add(map);
			}
			
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		return list; 
	} 
	 
	 

}
