package com.matzip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matzip.domain.Address;
import com.matzip.domain.Category;
import com.matzip.domain.Matzip;
import com.matzip.domain.MatzipUser;
import com.matzip.domain.MyReview;
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
	
	public List<MyReview> myReview(String userId){
		log.info("myReview...");
		return mapper.myReview(userId);
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
	//ajhend
}
