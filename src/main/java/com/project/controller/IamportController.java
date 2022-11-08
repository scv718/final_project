package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import com.project.cart.CartService;
import com.project.cart.CartVO;
import com.project.order.OrderService;
import com.project.order.OrderVO;
import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.AddressService;
import com.project.user.AddressVO;
import com.project.user.UserService;
import com.project.user.UserVO;
import com.project.wine.ProductService;
import com.project.wine.WineVO;


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
	ProductService productService;
	
	@Autowired
	AddressService addressService;
	@Autowired
	CartService cartService;
	@Autowired
	UserService userService;
	@Autowired
	OrderService orderService;
	@Autowired
	private SubscribeService subscribeService;
	
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
	
	@RequestMapping(value="/phoneCertification.wp" , method = RequestMethod.POST)
	@ResponseBody
	public int userPhoneCertification(@RequestBody HashMap<String, Object> param , HttpServletRequest request, HttpServletResponse response,HttpSession session, Model model, UserVO vo) throws IOException {
		System.out.println("휴대폰 번호 변경");
		
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
				
				session.setAttribute("name", resNode.get("name").asText());
				session.setAttribute("phone", resNode.get("phone").asText());
				session.setAttribute("birthday", resNode.get("birthday").asText());
			    String import_phone = mapper.treeToValue(resNode.path("phone"), String.class);
				String m_phone = (String) param.get("m_phone");
			    System.out.println(m_phone); // 회원정보 수정폼 휴대폰번호
			    System.out.println(import_phone); // 아임포트 휴대폰번호
			    import_phone.replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]", "");
			    
			    if(m_phone.equals(import_phone)) {
			    	return 1;
			    }else {
			    	return 2;
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
	
	
		@RequestMapping(value="/pay.wp", method=RequestMethod.POST)
		public String payment(HttpServletRequest request, HttpServletResponse response, Model model, OrderVO ovo, AddressVO avo, CartVO voList,WineVO vo, UserVO uvo, HttpSession session) throws IOException {
			System.out.println("결제완료폼");
			String nm = request.getParameter("unm");
			String amount = request.getParameter("amount");
			String mid = request.getParameter("merchant_uid");
			String imp = request.getParameter("imp_uid");
			String token = getImportToken();
			System.out.println("정보출력");
			System.out.println(mid);
			System.out.println(imp);
			System.out.println(amount);
			setHackCheck(amount, mid, token);
			uvo.setId((String) session.getAttribute("userID"));
			LocalDateTime  now = LocalDateTime.now();
			 
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
	        String formatedNow = now.format(formatter);
	        
	        
	        StringBuilder stringBuilder = new StringBuilder();
	        StringBuilder stringBuilder1 = new StringBuilder();
	        StringBuilder stringBuilder2 = new StringBuilder();
	        System.out.println(ovo);
	        if(ovo.getW_noList() != null) {
	        	 for (int i = 0; i < ovo.getW_noList().length; i++) {
		        	  stringBuilder.append(ovo.getW_noList()[i]+ " ");
		        	}
		        String w_no = stringBuilder.toString();
		        ovo.setW_no(w_no);
	        }
	       
	        
	       
			model.addAttribute("user", userService.getUser(uvo));
			voList.setId(uvo.getId());
			avo.setId(uvo.getId());
			ovo.setOrd_code(imp);
			ovo.setMerchant_uid(mid);
			ovo.setId((String) session.getAttribute("userID"));
			int price = Integer.parseInt(amount);
			ovo.setProd_price(price);
			ovo.setOrd_t_price(price);
			ovo.setProd_p_price(price);
			ovo.setOrd_stat("상품준비중");
			ovo.setOrd_date(formatedNow);
			
			List<CartVO> listVo = new ArrayList();
			for(int i = 0; i < voList.getOrd_cart_noList().length; i++) {
				voList.setOrd_cart_no(voList.getOrd_cart_noList()[i]);
				listVo.add(cartService.getCartpay(voList));
				System.out.println(voList.getW_no());
				cartService.deleteCart(voList);
			}
			orderService.insertOrder(ovo);
			System.out.println(nm);
			System.out.println(amount);
			System.out.println(mid);	
			
			return "redirect:myorderList.wp";
		}
		//구독 결제
		@RequestMapping(value="/pay1.wp", method=RequestMethod.POST)
		public String payment1(HttpServletRequest request, HttpServletResponse response, Model model, OrderVO ovo, AddressVO avo, SubscribeVO svo ,WineVO vo, UserVO uvo, HttpSession session) throws IOException {
			System.out.println("구독 결제 완료");
			String nm = request.getParameter("unm");
			String amount = request.getParameter("amount");
			String mid = request.getParameter("merchant_uid");
			String imp = request.getParameter("imp_uid");
			String token = getImportToken();
			int price = Integer.parseInt(amount);
			setHackCheck(amount, mid, token);
			uvo.setId((String) session.getAttribute("userID"));
			svo.setId((String) session.getAttribute("userID"));
			
			LocalDateTime  now = LocalDateTime.now();
			 
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");        
	        String formatedNow = now.format(formatter);

	        int W = vo.getW_no(); 
	        if(W == 999) {
	        	ovo.setW_nm_k("와인 마스터 패키지");
	        	subscribeService.insertSubscribe3(svo);
				subscribeService.liset_deli_price(svo);
				userService.updateuserle3(uvo);
	        }else if(W == 998){
	        	ovo.setW_nm_k("와인 마니아 패키지");
	        	subscribeService.insertSubscribe2(svo);
				subscribeService.liset_deli_price(svo);
				userService.updateuserle2(uvo);
	        }else if(W == 997){
	        	ovo.setW_nm_k("와인 입문자 패키지");
	        	subscribeService.insertSubscribe1(svo);
				subscribeService.liset_deli_price(svo);
				userService.updateuserle1(uvo);
				System.out.println();
				System.out.println(nm);
				System.out.println(nm);
	        }
	        	
	        
			model.addAttribute("user", userService.getUser(uvo));
			svo.setId(uvo.getId());
			avo.setId(uvo.getId());
			ovo.setOrd_code(imp);
			ovo.setMerchant_uid(mid);
			ovo.setId((String) session.getAttribute("userID"));
			ovo.setProd_price(price);
			ovo.setOrd_t_price(price);
			ovo.setProd_p_price(price);
			ovo.setOrd_stat("구독 완료");
			ovo.setOrd_date(formatedNow);
			
			System.out.println(ovo.getW_nm_k() + "패키지 명");
		    System.out.println(ovo.getW_no()+"와인");
		    System.out.println(ovo.getW_nm_k()+"와인이름");
		    System.out.println(ovo.getW_nm_e()+"와인이름 영어");
		    
			orderService.subscribeOrder(ovo);
			return "index.wp";		
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
	@RequestMapping(value="/paycan.wp" , method = RequestMethod.POST)
	@ResponseBody
	public int cancelPayment(String mid, String imp, OrderVO ovo, HttpSession session) {
		String token = getImportToken();
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL); 
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", mid); 
		String asd = ""; 
		ovo.setOrd_code(imp);
		ovo.setMerchant_uid(mid);
		ovo.setId((String)session.getAttribute("userID"));
		System.out.println(imp +",," +mid);
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
			System.out.println("환불실패");
//			return "redirect:myorderList.wp";
			return 0;
		} else {
			orderService.cancleOrder(ovo);
			System.out.println("환불성공");
//			return "redirect:myorderList.wp"; 
			return 1;
		}
	}
	// 구독 취소
		@RequestMapping(value="/paycan1.wp" , method = RequestMethod.POST)
		@ResponseBody
		public int cancelPayment1(String mid, UserVO uvo,SubscribeVO svo , String imp, OrderVO ovo, HttpSession session) {
			String token = getImportToken();
			HttpClient client = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost(IMPORT_CANCEL_URL); 
			Map<String, String> map = new HashMap<String, String>();
			post.setHeader("Authorization", token);
			map.put("merchant_uid", mid); 
			String asd = ""; 
			ovo.setOrd_code(imp);
			ovo.setMerchant_uid(mid);
			ovo.setId((String)session.getAttribute("userID"));
			svo.setId((String)session.getAttribute("userID"));
			uvo.setId((String)session.getAttribute("userID"));
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

				orderService.cancleOrder(ovo);
				subscribeService.updateSubscribe(svo);
				subscribeService.liset_deli_price_up(svo);
				userService.updateuserle0(uvo);
				return 1; 
			} 
		}
		
	//상품결제 폼 호출
	@RequestMapping(value={"/pay"}, method=RequestMethod.GET)
	public String pay(HttpServletRequest request, Model model) {
		String nm = request.getParameter("unm");
		// 값은 아임포트의 가맹점 식별코드 입력
		model.addAttribute("impKey", "imp86310263"); 
		return "pay.wp";
	}
	
	
	 
	// 아임포트 결제완료건에 한하여 목록 반환 
	@RequestMapping(value="/payamount.wp")
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
	@RequestMapping(value="/paylist.wp")
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
