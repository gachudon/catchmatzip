package com.matzip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matzip.domain.Address;
import com.matzip.domain.Category;
import com.matzip.domain.Matzip;
import com.matzip.domain.MatzipUser;
import com.matzip.domain.MyReview;
import com.matzip.domain.Review;
import com.matzip.mapper.MatzipMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MatzipService {
	@Setter(onMethod_=@Autowired)
	private MatzipMapper mapper;
	public List<Matzip> getList(){ // db에서 평점이 높은 맛집 정보 5개 불러오기
		log.info("getList...");
		return mapper.getList();
	}
	public List<Matzip> getListAll(){ // db에서 matzip 정보 전부 불러오기
		log.info("getListAll...");
		return mapper.getListAll();
	}
	public List<Category> getCategory(){ // db에서 category 정보 불러오기
		log.info("getCategory...");
		return mapper.getCategory();
	}
	public void join1(MatzipUser matzipUser) { //db에 matzipuser 정보 집어넣기
		log.info("join1...");
		mapper.join1(matzipUser);
	}
	public List<Address> join2(){ //db에서 주소 정보 불러오기
		log.info("join2...");
		return mapper.join2();
	} //join2
	
	public boolean selectId(String id) {
		log.info("confirmId...");
		return mapper.selectId(id);
	}
	
	public List<MyReview> myReview(String userId){
		log.info("myReview...");
		return mapper.myReview(userId);
	}
	//리뷰 등록, 수정------------------------------------------------------------------
	public int putReview(Review review) {
		log.info("putReview...");
		return mapper.putReview(review);
	}
	
	public String putReview1(Integer matzipId) {
		log.info("putReview1");
		return mapper.putReview1(matzipId);
	}
	
	public Review modReview(Integer reviewId) {
		log.info(reviewId);
		return mapper.modReview(reviewId);
	}
	
	public int modReviewAction(Review review) {
		log.info("modReview...");
		return mapper.modReviewAction(review);
	}
	//리뷰 등록, 수정------------------------------------------------------------------
	
	public int deleteReview(int reviewId) {
		log.info("deleteReview...");
		return mapper.deleteReview(reviewId);
	}
	
	public int deleteMatzip(int matzipId) {
		log.info("deleteMatzip....");
		return mapper.deleteMatzip(matzipId);
	}
	
	//ssm
	public MatzipUser login1(MatzipUser matzipUser) {
		log.info("MATZIPSERVICE - LOGIN1 *****");
		log.info(mapper.login1(matzipUser));
		return mapper.login1(matzipUser);
	}
	
	public Address userAddr(Integer addressId) {
		log.info("USERaDDR ***");
		return mapper.userAddr(addressId);
	}
	
	public int myPage1(MatzipUser matzipUser) {
		log.info("SERVICE-MYPAGE1");
		return mapper.myPage1(matzipUser)==1?1:0;
	}
	
	//matzipInfo 
		public List<Matzip> getCityMatzip(Integer addressId){
			return mapper.getCityMatzip(addressId);
		}
		
		public List<Matzip> getCategoryMatzip(String category){
			return mapper.getCategoryMatzip(category);
		}
		
		public List<Matzip> getCateAddrMatzip(String category, Integer addressId){
			return mapper.getCateAddrMatzip(category, addressId);
		}
		
		public List<Matzip> getSearchMatzip(String search){
			return mapper.getSearchMatip(search);
		}
		
		public List<Matzip> getAddrSearchMatzip(String search, Integer addressId){
			
			return mapper.getAddrSearchMatzip(search, addressId);
		}
	
		//adminMatzip => Paging
		public List<Matzip> adminMatzipPaging(Integer first, Integer second){
			return mapper.adminMatzipPaging(first, second);
		}
		
		public Integer countAdminMatzip() {
			return mapper.countAdminMatzip();
		}
		
		//matzipApply
		public int matzipApply1(Matzip matzip,Integer addressId) {
			log.info("service-matzipApply1");
			System.out.println(matzip.getMatzipName());
			return  mapper.matzipApply1(matzip, addressId)==1?1:0;
		}
				
		//matzipModify
		public Matzip getMatzip(Integer matzipId) {
			return mapper.getMatzip(matzipId);
		}
		
		public Address getMatzipCity(Integer matzipId) {
			return mapper.getMatzipCity(matzipId);
		}
		
		
		public int matzipModify1(Matzip matzip, Integer addressId) {
			return mapper.matzipModify1(matzip, addressId);
		}
		
	//ssmend
	//ajh
	public String findIdResult(String userName, String phoneNumber) {
		log.info("findId...");
		String userId = "";
		try {
			userId = mapper.findIdResult(userName, phoneNumber);
		} catch (Exception e) {
			log.error("Error occurred while finding user ID: " + e.getMessage());
			e.printStackTrace();
		}
		return userId;
	}
	
	public String findPwResult(String userId, String userName, String phoneNumber) {
		log.info("findPw...");
		String pwd = "";
		try {
			pwd = mapper.findPwResult(userId, userName, phoneNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pwd;
	}
	
	public Matzip matzipDetail(Integer matzipId) {
		log.info("matzipDetail...");
		return mapper.matzipDetail(matzipId);
	}

	public List<Review> getReviewListByMatzipId(Integer matzipId) {
		log.info("getReviewListByMatzipId...");
		return mapper.getReviewListByMatzipId(matzipId);
	}

	public List<Matzip> getListBySearch(String keyword) {
		return mapper.getListBySearch(keyword);
	}
	//ajhend
}
