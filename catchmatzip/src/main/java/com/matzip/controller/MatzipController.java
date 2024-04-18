package com.matzip.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import java.util.List;

//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.matzip.domain.Address;
import com.matzip.domain.MatzipUser;
//import com.matzip.domain.Matzip;
import com.matzip.service.MatzipService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/matzip/*")
@AllArgsConstructor
public class MatzipController {
	private MatzipService service;
	
	@GetMapping("/index")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("mList",service.getList());
	}
	
	@GetMapping("/matzipinfo")
	public void matzipinfo(Model model) {
		log.info("getListAll");
		model.addAttribute("mListAll",service.getListAll());
		model.addAttribute("cList",service.getCategory());
	}
	
	@GetMapping("/join")
	public void join(Model model) {
		log.info("join");
		model.addAttribute("aList",service.join2());
	}
	@PostMapping("/join1")
	public String join1(Model model,MatzipUser matzipUser,String district,String city, RedirectAttributes rttr) {
		log.info("join1:"+matzipUser);
		List<Address> aList = service.join2();
		Iterator<Address> it = aList.iterator();
		while(it.hasNext()) {
			Address addr = it.next();
			if(district.equals(addr.getDistrict()) && city.equals(addr.getCity())) {
				Integer addressId = addr.getAddressId();
				matzipUser.setAddressId(addressId);
				break;
			}
		}		
		service.join1(matzipUser);
		rttr.addFlashAttribute("result",matzipUser.getUserId());
		return "redirect:/matzip/login";
	}
	
	@GetMapping("/myreview")
	public void myReview(Model model, HttpServletRequest request) {
		log.info("myReview in controller...");
		HttpSession session = request.getSession();
		model.addAttribute("rList",service.myReview((String)session.getAttribute("userId")));
	}
	
	@GetMapping("/adminmatzip")
	public void adminMatzip(Model model) {
		model.addAttribute("aList",service.join2());
		model.addAttribute("mList",service.getListAll());
	}
	
	//ssm
	@GetMapping("/login")
	public void login() {
	}

	@PostMapping("/login1")
	public String login1(MatzipUser matzipUser, HttpServletRequest request) {
		log.info("LOGIN1 :" + matzipUser);
		MatzipUser user= service.login1(matzipUser);
		  HttpSession session = request.getSession();
		  
		  if(user.getUserId()==null) { 
			  log.info("아이디 없음"); 
			  session.setAttribute("user", null);
		  return "redirect:/matzip/login"; 
		  }else if(user.getPwd().equals(matzipUser.getPwd())) {
		  log.info("로그인성공"); 
		  session.setAttribute("userId", user.getUserId());
		  session.setAttribute("pwd", user.getPwd());
		  session.setAttribute("userName", user.getUserName());
		  session.setAttribute("nickname", user.getNickname());
		  session.setAttribute("phoneNumber", user.getPhoneNumber());
		  Address addr = service.userAddr(user.getAddressId());
		  session.setAttribute("district", addr.getDistrict());
		  session.setAttribute("city", addr.getCity());
		  return "redirect:/matzip/index"; 
		  }else { 
			  log.info("비번틀림");
		  session.setAttribute("user", null); 
		  return "redirect:/matzip/login"; }
		 
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/matzip/index";
	}
	
	@GetMapping("/myPage")
	public void myPage() {
	}
	
	@PostMapping("/myPage1")
	public String modifyMyInfo(MatzipUser matzipUser, HttpSession session) {
		log.info("myPage1");
		int result = service.myPage1(matzipUser);
		if(result==1) {
			MatzipUser user= service.login1(matzipUser);
			session.setAttribute("userId", user.getUserId());
			  session.setAttribute("pwd", user.getPwd());
			  session.setAttribute("userName", user.getUserName());
			  session.setAttribute("nickname", user.getNickname());
			  session.setAttribute("phoneNumber", user.getPhoneNumber());
			  session.setAttribute("addressId", user.getAddressId());
			  Address addr = service.userAddr(user.getAddressId());
			  session.setAttribute("district", addr.getDistrict());
			  session.setAttribute("city", addr.getCity());
			return "redirect:/matzip/index";
		}else {
			return "redirect:/matzip/myPage";
		}
	}
	//ssm end
	//ajh
	@GetMapping("/findId")
	public String findId(HttpServletRequest request, HttpServletResponse response) {
		return "/matzip/findId";
	}

	@RequestMapping(value = "/matzip/findIdResult", method = RequestMethod.POST)
	public String findIdResult(@RequestParam("userName") String userName,
	        @RequestParam("phoneNumber") String phoneNumber, Model model) {

	    String userId = service.findIdResult(userName, phoneNumber);

	    // 결과를 모델에 추가하여 뷰로 전달
	    model.addAttribute("userId", userId);

	    // 뷰의 경로 반환
	    return "/matzip/findIdResult";
	}
	//ajh end
}
