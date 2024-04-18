package com.matzip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.matzip.domain.Address;
import com.matzip.domain.Category;
import com.matzip.domain.Matzip;
import com.matzip.domain.MatzipUser;
import com.matzip.domain.MyReview;

@Mapper
public interface MatzipMapper {
	
	@Select("select matzipId, matzipName, district, city, detailAddress, averageScore, category, image\r\n"
			+ "from matzip inner join address on matzip.addressId = address.addressId\r\n"
			+ "order by averageScore desc\r\n"
			+ "limit 5")
	public List<Matzip> getList();
	
	@Select("select matzipId, matzipName, district, city, detailAddress, averageScore, category, image\r\n"
			+ "from matzip inner join address on matzip.addressId = address.addressId\r\n"
			+ "order by averageScore desc")
	public List<Matzip> getListAll();
	
	@Select("select * from category")
	public List<Category> getCategory();
	
	public int join1(MatzipUser matzipUser);
	
	@Select("select * from address")
	public List<Address> join2();
	
	//ssm
	@Select("select * from matzipUser where userId=#{userId}")
	public MatzipUser login1(MatzipUser matzipUser);
	
	@Select("select * from address where addressId=#{addressId}")
	public Address userAddr(Integer addressId);
	
	@Update("update matzipuser\r\n"
			+ "set userName=#{userName}, pwd=#{pwd}, nickname=#{nickname}, phoneNumber=#{phoneNumber}, addressId=#{addressId}\r\n"
			+ "where userId=#{userId}")
	public int myPage1(MatzipUser matzipUser);
	//ssmend
	
	@Select("select matzipName, userId, score, reviewComment, writtenTime, review.image "
			+ "from review join matzip on matzip.matzipId = review.matzipId "
			+ "where userId=#{userId} "
			+ "order by writtenTime desc")
	public List<MyReview> myReview(String useerId);
	
	//ajh
	public String findIdResult(@Param("userName")String userName, @Param("phoneNumber")String phoneNumber);
	//ajhend
}
