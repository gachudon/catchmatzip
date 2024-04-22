package com.matzip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.matzip.domain.Address;
import com.matzip.domain.Category;
import com.matzip.domain.Matzip;
import com.matzip.domain.MatzipUser;
import com.matzip.domain.MyReview;
import com.matzip.domain.Review;

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
	
	@Select("select count(*) from matzipUser where userId=#{id}")
	public boolean selectId(String id);
	
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
	
	//***************************
		// matzipInfo
		@Select("select * from matzip where addressId=#{addressId} order by averageScore desc")
		public List<Matzip> getCityMatzip(Integer addressId);
		
		@Select("select * from matzip where category=#{category} order by averageScore desc")
		public List<Matzip> getCategoryMatzip(String category);
		
		@Select("select * from matzip where addressId=#{addressId} and category=#{category} order by averageScore desc" )
		public List<Matzip> getCateAddrMatzip(@Param("category") String category, @Param("addressId") Integer addressId);
		
		@Select("select * from matzip where matzipName like concat('%',#{search},'%') order by averageScore desc")
		public List<Matzip> getSearchMatip(String search);

		@Select("select * from matzip where addressId=#{addressId} and matzipName like concat('%',#{search},'%') order by averageScore desc")
		public List<Matzip> getAddrSearchMatzip(@Param("search") String search, @Param("addressId")Integer addressId);
	
	//ssmend
	
	@Select("select matzipName, userId, score, reviewComment, writtenTime, review.image "
			+ "from review join matzip on matzip.matzipId = review.matzipId "
			+ "where userId=#{userId} "
			+ "order by writtenTime desc")
	public List<MyReview> myReview(String useerId);
	
	//ajh
	@Select("select userId from matzipuser where userName = #{userName} and phoneNumber = #{phoneNumber}")
	public String findIdResult(@Param("userName") String userName, @Param("phoneNumber") String phoneNumber);

	@Select("select pwd from matzipuser where userName = #{userName} and phoneNumber = #{phoneNumber} and userId = #{userId}")
	public String findPwResult(@Param("userId") String userId, @Param("userName") String userName,
			@Param("phoneNumber") String phoneNumber);

	@Select("select * from matzip where matzipId = #{matzipId}")
	public Matzip matzipDetail(Integer matzipId);

	@Select("select matzipId, nickname, score, reviewComment, writtenTime, image from review join matzipuser on review.userId = matzipuser.userId where matzipId = #{matzipId}")
	public List<Review> getReviewListByMatzipId(Integer matzipId);

	@Select("select * from matzip where matzipName like concat('%',#{keyword},'%') order by averageScore desc")
	public List<Matzip> getListBySearch(String keyword);
	//ajhend
	
	@Insert("insert into review(matzipId, userId, score, reviewComment, image)\r\n"
			+ "values(#{matzipId},#{userId},#{score},#{reviewComment},#{image})")
	public int putReview(Review review);
	
	@Select("select matzipName from matzip where matzipId=#{matzipId}")
	public String putReview1(Integer matzipId);
}
