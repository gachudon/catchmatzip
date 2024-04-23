package com.matzip.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

//import java.util.List;

//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.matzip.domain.Address;
import com.matzip.domain.Criteria;
import com.matzip.domain.Matzip;
import com.matzip.domain.MatzipApply;
import com.matzip.domain.MatzipModify;
import com.matzip.domain.MatzipUser;
import com.matzip.domain.ModReview;
import com.matzip.domain.PageDTO;
import com.matzip.domain.PutReview;
import com.matzip.domain.Review;
//import com.matzip.doma
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
	public void matzipinfo(Model model, HttpServletRequest request) {
		log.info("getListAll");
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") != null) {
			model.addAttribute("mListAll", service.getCityMatzip((int) session.getAttribute("addressId")));
			log.info("로그인상태");
		} else {
			log.info("로그인xxxxxxxxxxxx");
			model.addAttribute("mListAll", service.getListAll());
		}
		model.addAttribute("cList", service.getCategory());
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
	public void adminMatzip(@RequestParam(required = false) String keyword, Model model,@RequestParam(required=false)Integer pageNum, @RequestParam(required=false) Integer amount) {
		model.addAttribute("aList", service.join2());
	    if (keyword != null && !keyword.isEmpty())
			model.addAttribute("mList", service.getListBySearch(keyword));
		else
			model.addAttribute("mList", service.getListAll());
	    
	  //추가
		
		
	  		if(pageNum == null) {
	  			pageNum = 1;
	  		}
	  		if(amount==null) {
	  			amount = 10;
	  		}
	  		Criteria cri = new Criteria(pageNum, amount);
	  		PageDTO dto = new PageDTO(cri, service.countAdminMatzip() );
	  		Integer first = cri.getAmount()*(cri.getPageNum()-1);
	  		Integer second = cri.getAmount();
	  		
	  		//추가
	  	    if (keyword != null && !keyword.isEmpty())
	  			model.addAttribute("mList", service.getListBySearch(keyword));
	  		else {
	  			model.addAttribute("mList", service.adminMatzipPaging(first, second));
	  			model.addAttribute("pagingDTO", dto);
	  		}
	}
	

	
//	@PostMapping("/putReviewAction") //버튼 누르면 요거 작동
	
	
	@PostMapping("/confirmId")
	public ResponseEntity<Boolean> confirmId(String id){
		boolean result = true;
		if(id.trim().isEmpty()) {
			result = false;
		} else {
			if (service.selectId(id)) {
				result = false; 
			} else {
				result = true;
			}
		}
		
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	@GetMapping("/putReview")
	public void putReview(Model model, @RequestParam(required=true) Integer matzipId) {
		//1. 리뷰 등록 시 보여주는 정보 : matzipName
		//2. 리뷰 등록 시 필요한 정보 : matzipId, userId, reviewComment, image
		model.addAttribute("matzipName",service.putReview1(matzipId));
//		model.addAttribute("matzipId",1);
//		model.addAttribute("userId","gycity");
//		model.addAttribute("matzipName",service.putReview1((Integer)model.getAttribute("matzipId")));
//		log.info("putReview...");
	}
	
	@GetMapping("/modReview")
	public void modReview(Model model, @RequestParam(required=true) Integer reviewId) {
		Review review = service.modReview(reviewId);
		model.addAttribute("review",review);
		model.addAttribute("matzipName",service.putReview1(review.getMatzipId()));
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteReview", method=RequestMethod.POST)
	public ResponseEntity<Integer> deleteReview(@RequestBody HashMap<String,Integer> map){
		log.info(map);
		int result = service.deleteReview(map.get("reviewId"));
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteMatzip",method=RequestMethod.POST)
	public ResponseEntity<Integer> deleteMatzip(@RequestBody HashMap<String,Integer> map){
		log.info(map);
		int result = service.deleteMatzip(map.get("matzipId"));
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	@PostMapping("/modReviewAction")
	public ResponseEntity<String> modReviewAction(@RequestPart(value="request") ModReview modReview, @RequestPart(value="uploadFile") MultipartFile uploadFile) {
		String uploadFolder="C:/Users/dones/git/catchmatzip/catchmatzip/src/main/webapp/resources/img/matzip";
		
		log.info("----------------------------");
		log.info("Upload File Name: "+uploadFile.getOriginalFilename());
		log.info("Upload File Size: "+uploadFile.getSize());
		
		UUID uuid = UUID.randomUUID();
		String uploadFileName = uuid.toString()+"_"+uploadFile.getOriginalFilename();
		
		Review review = new Review();
		review.setReviewId(modReview.getReviewId());
		review.setScore(modReview.getScore());
		review.setReviewComment(modReview.getReviewComment());
		review.setImage(uploadFileName);
		
		
		File saveFile = new File(uploadFolder, uploadFileName);
		try {
			uploadFile.transferTo(saveFile);
		} catch(Exception e) {log.error(e.getMessage());}
		service.modReviewAction(review);
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	
	
	
	@PostMapping("/uploadAjaxAction")
	public ResponseEntity<String> uploadAjaxPost(@RequestPart(value="request") PutReview putReview, @RequestPart(value="uploadFile") MultipartFile uploadFile) {
		//2. 리뷰 등록 시 필요한 정보 : matzipId, userId, reviewComment, image
		String uploadFolder="C:/Users/dones/git/catchmatzip/catchmatzip/src/main/webapp/resources/img/matzip";
		
			log.info("----------------------------");
			log.info("Upload File Name: "+uploadFile.getOriginalFilename());
			log.info("Upload File Size: "+uploadFile.getSize());
			
			UUID uuid = UUID.randomUUID();
			String uploadFileName = uuid.toString()+"_"+uploadFile.getOriginalFilename();
			
			Review review = new Review();
			review.setMatzipId(putReview.getMatzipId());
			review.setUserId(putReview.getUserId());
			review.setScore(putReview.getScore());
			review.setReviewComment(putReview.getReviewComment());
			review.setImage(uploadFileName);
			
			
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				uploadFile.transferTo(saveFile);
			} catch(Exception e) {log.error(e.getMessage());}
			service.putReview(review);
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	
	//matzipApply
		@GetMapping("/matzipApply")
		public void matzipApply(){
			log.info("matzipApply...");
		}
			
		@PostMapping(value="/matzipApply1")
		public ResponseEntity<String> matzipApply1(@RequestPart(value="request") MatzipApply matzipApply, @RequestPart(value="uploadFile") MultipartFile uploadFile) {
			String uploadFolder="C:/Users/dones/git/catchmatzip/catchmatzip/src/main/webapp/resources/img/matzip";
			
			log.info("----------------------------");
			log.info("Upload File Name: "+uploadFile.getOriginalFilename());
			log.info("Upload File Size: "+uploadFile.getSize());
			
			UUID uuid = UUID.randomUUID();
			String uploadFileName = uuid.toString()+"_"+uploadFile.getOriginalFilename();
			
			Matzip matzip = new Matzip();
			matzip.setMatzipName(matzipApply.getMatzipName());
			matzip.setDetailAddress(matzipApply.getDetailAddress());
			matzip.setCategory(matzipApply.getCategory());
			matzip.setImage(uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				uploadFile.transferTo(saveFile);
			} catch(Exception e) {log.error(e.getMessage());}
			
			service.matzipApply1(matzip, matzipApply.getAddressId());
			
			return new ResponseEntity<>("success",HttpStatus.OK);
		}
		
		//matzipModify
		@GetMapping("/matzipModify")
		public void matzipModify(@RequestParam("matzipId") Integer matzipId,Model model) {
			log.info("/matzipModify");
			model.addAttribute("matzip",service.getMatzip(matzipId));
			model.addAttribute("address", service.getMatzipCity(matzipId));

		}
		
		@PostMapping(value="/matzipModify1")
		public ResponseEntity<String> matzipModify1(@RequestPart(value="request") MatzipModify matzipModify, @RequestPart(value="uploadFile") MultipartFile uploadFile) {
			String uploadFolder="C:/Users/dones/git/catchmatzip/catchmatzip/src/main/webapp/resources/img/matzip";
			
			log.info("----------------------------");
			log.info("Upload File Name: "+uploadFile.getOriginalFilename());
			log.info("Upload File Size: "+uploadFile.getSize());
			
			UUID uuid = UUID.randomUUID();
			String uploadFileName = uuid.toString()+"_"+uploadFile.getOriginalFilename();
			Matzip matzip = new Matzip();
			matzip.setMatzipId(matzipModify.getMatzipId());
			matzip.setMatzipName(matzipModify.getMatzipName());
			matzip.setDetailAddress(matzipModify.getDetailAddress());
			matzip.setCategory(matzipModify.getCategory());
			matzip.setImage(uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				uploadFile.transferTo(saveFile);
			} catch(Exception e) {log.error(e.getMessage());}
			
			service.matzipModify1(matzip, matzipModify.getAddressId());
			
			return new ResponseEntity<>("success",HttpStatus.OK);
		}
		
	
//	@PostMapping("/putReview2")
//	@ResponseBody
//	public String putReview2(@RequestPart(value = "uploadFile", required=false) MultipartFile[] uploadFile,@RequestParam("request") String request, HttpServletRequest sr) throws JsonProcessingException {
//		HttpSession session = sr.getSession();
//		
//		class PutReview{
//			Integer matzipId;
//			Double score;
//			String reviewComment;
//		}
//		
//		ObjectMapper objectMapper = new ObjectMapper().registerModule(new SimpleModule());
//		PutReview pList = objectMapper.readValue(request, new TypeReference<>() {});
//		Review review = new Review();
//		review.setMatzipId(pList.matzipId);
//		review.setUserId((String)session.getAttribute("userId"));
//		review.setScore(pList.score);
//		review.setReviewComment(pList.reviewComment);
//		//파일 경로는 적절히 바꿀것********************************************************************************************************************
//		String uploadFolder = "C:/Users/dones/git/catchmatzip/catchmatzip/src/main/webapp/resources/img/matzip";
//		//파일 경로는 적절히 바꿀것********************************************************************************************************************
//		List<Attached> list = new ArrayList<Attached>();
//		File uploadPath = new File(uploadFolder);
//		log.info("upload Path : "+uploadPath);
//		if(uploadPath.exists()==false) {
//			uploadPath.mkdir();
//		}
		
//		for(MultipartFile multipartFile : uploadFile) {
//			Attached attached = new Attached();
//			log.info("----------------------------------------");
//			log.info("Upload File Name : "+multipartFile.getOriginalFilename());
//			log.info("Upload File Size : "+multipartFile.getSize());
//			
//			UUID uuid = UUID.randomUUID();
//			String uploadFileName = multipartFile.getOriginalFilename();
//			attached.setFileName(uploadFileName);
//			uploadFileName = uuid.toString()+"_"+uploadFileName;
//			review.setImage(uploadFileName);
//			File saveFile = new File(uploadPath, uploadFileName);
//			try {
//				multipartFile.transferTo(saveFile);
//				//여기에 썸네일 작성. mySpring 프로젝트 UploadController 69번째 라인 참고
//				list.add(attached); log.info("attached : "+ attached);
//				} catch(Exception e) {log.error(e.getMessage());}
//			}
//		service.putReview(review);
//		return "redirect:/matzip/matzipDetail";
//	}
	
//	private String getFolder() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = new Date();
//		String  str = sdf.format(date);
//		return str.replace("-", File.separator);
//	}
	
	//ssm************************************************************************************
	@GetMapping("/login")
	public void login() {
	}

	@PostMapping("/login1")
	public String login1(MatzipUser matzipUser, HttpServletRequest request) {
		log.info("LOGIN1 :" + matzipUser);
		MatzipUser user= service.login1(matzipUser);
		  HttpSession session = request.getSession();
		  
		  if(user == null) { 
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
		  
		  session.setAttribute("addressId", user.getAddressId());
		  
		  Address addr = service.userAddr(user.getAddressId());
		  session.setAttribute("district", addr.getDistrict());
		  session.setAttribute("city", addr.getCity());
		  if(user.getUserCategory()==0) return "redirect:/matzip/adminmatzip";
		  else return "redirect:/matzip/index";
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
	
	@PostMapping(value = "/searchMatzip")
	public void searchMatzip(@RequestParam String search, Model model, HttpServletRequest request) {
		log.info("검색한거 : " + search);
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") != null) {
			int addressId = (int)session.getAttribute("addressId");
			model.addAttribute("mListAll", service.getAddrSearchMatzip(search, addressId));
			log.info("로그인상태");
		} else {
			log.info("로그인xxxxxxxxxxxx");
			model.addAttribute("mListAll", service.getSearchMatzip(search));
		}
		model.addAttribute("cList", service.getCategory());
	}
	
	@GetMapping("/matzipInfo1")
	public void matzipinfo1(Model model, HttpServletRequest request,@RequestParam String category) {
		log.info(category);
		log.info("getListAll");
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") != null) {
			int addressId = (int)session.getAttribute("addressId");
			model.addAttribute("mListAll",service.getCateAddrMatzip(category, addressId));
			log.info("로그인상태");
			
			
		} else {
			log.info("로그인xxxxxxxxxxxx");
			model.addAttribute("mListAll",service.getCategoryMatzip(category));
		}
		model.addAttribute("cList", service.getCategory());
	}
	
	//ssm end*****************************************************************************************
	
	//ajh************************************************************************************
	@GetMapping("/findId")
	public String findId(HttpServletRequest request, HttpServletResponse response) {
		return "/matzip/findId";
	}

	@RequestMapping(value = "/matzip/findIdResult", method = RequestMethod.POST)
	public String findIdResult(@RequestParam("userName") String userName,
	        @RequestParam("phoneNumber") String phoneNumber, Model model) {

	    String userId = service.findIdResult(userName, phoneNumber);
	    String pwd = service.findPwResult(userId, userName, phoneNumber);

	    // 결과를 모델에 추가하여 뷰로 전달
	    model.addAttribute("fId", userId);
	    model.addAttribute("fpwd",pwd);

	    // 뷰의 경로 반환
	    return "/matzip/findIdResult";
	}
	
	@GetMapping("/findPw")
	public String findPw(HttpServletRequest request, HttpServletResponse response) {
		return "/matzip/findPw";
	}

//	@PostMapping(value = "/matzip/findPwResult")
//	public String findPwResult(@RequestParam("userId") String userId, @RequestParam("userName") String userName,
//			@RequestParam("phoneNumber") String phoneNumber, Model model) {
//
//		String pwd = service.findPwResult(userId, userName, phoneNumber);
//
//		// 결과를 모델에 추가하여 뷰로 전달
//		model.addAttribute("pwd", pwd);
//
//		// 뷰의 경로 반환
//		return "/matzip/findPwResult";
//	}
	
	@GetMapping("/MatzipDetail")
	public void read(@RequestParam("matzipId") Integer matzipId, Model model) {
		log.info("matzipdetail");
		model.addAttribute("matzip", service.matzipDetail(matzipId));
		model.addAttribute("reviewList", service.getReviewListByMatzipId(matzipId));
	}
	//ajh end************************************************************************************
}
