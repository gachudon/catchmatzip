package com.matzip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
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
	
	@Delete("delete from review where reviewId = #{reviewId}")
	public int deleteReview(int reviewId);
	
	@Delete("delete from matzip where matzipId = #{matzipId}")
	public int deleteMatzip(int matzipId);
	
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
	
		//adminMatzip => paging
		@Select("select * from matzip limit #{first}, #{second}")
		public List<Matzip> adminMatzipPaging(@Param("first") Integer first, @Param("second") Integer second);
		
		@Select("select count(*) from matzip")
		public Integer countAdminMatzip();
		
		//matzipApply
		@Insert("insert into matzip (matzipName,addressId, detailAddress, category, image)\r\n"
				+ "values(#{matzip.matzipName}, #{addressId},#{matzip.detailAddress}, #{matzip.category}, #{matzip.image})")
		public int matzipApply1(@Param("matzip")Matzip matzip,@Param("addressId")Integer addressId);
		

	//matzipModify
		@Select("select * from matzip where matzipId=#{matzipId}")
		public Matzip getMatzip(Integer matzipId);
		
		@Select("select address.addressId, district, city from address inner join matzip on matzip.addressId = address.addressId where matzipId=#{matzipId}")
		public Address getMatzipCity(Integer matzipId);
		
		@Update("update matzip set matzipName=#{matzip.matzipName}, addressId=#{addressId}, detailAddress=#{matzip.detailAddress}, category=#{matzip.category}\r\n"
				+ "where matzipId=#{matzip.matzipId}")
		public int matzipModify1(@Param("matzip")Matzip matzip,@Param("addressId")Integer addressId);
		
	//ssmend
	
	@Select("select reviewId, matzipName, userId, score, reviewComment, writtenTime, review.image "
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

	@Select("select matzipId, nickname, score, reviewComment, writtenTime, image from review join matzipuser on review.userId = matzipuser.userId where matzipId = #{matzipId} order by writtenTime desc")
	public List<Review> getReviewListByMatzipId(Integer matzipId);

	@Select("select * from matzip where matzipName like concat('%',#{keyword},'%') order by averageScore desc")
	public List<Matzip> getListBySearch(String keyword);
	//ajhend
	
	//putReview 페이지-------------------------------------------------------------------------------------------
	@Insert("insert into review(matzipId, userId, score, reviewComment, image)\r\n"
			+ "values(#{matzipId},#{userId},#{score},#{reviewComment},#{image})")
	public int putReview(Review review);
	
	@Select("select matzipName from matzip where matzipId=#{matzipId}") //맛집 이름 뽑아오기
	public String putReview1(Integer matzipId);
	//putReview 페이지-------------------------------------------------------------------------------------------
	//modReviwe 페이지-------------------------------------------------------------------------------------------
	@Select("select * from review where reviewId=#{reviewId}")
	public Review modReview(Integer reviewId);
	@Update("update review set score=#{score}, reviewComment=#{reviewComment}, image=#{image}, writtenTime=current_timestamp where reviewId=#{reviewId}")
	public int modReviewAction(Review Review);
}
