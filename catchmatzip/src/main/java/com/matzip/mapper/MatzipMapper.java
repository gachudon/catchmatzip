package com.matzip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.matzip.domain.Matzip;

@Mapper
public interface MatzipMapper {
	@Select("select matzipId, matzipName, district, city, detailAddress, averageScore, category, image\r\n"
			+ "from matzip inner join address on matzip.addressId = address.addressId\r\n"
			+ "order by averageScore desc\r\n"
			+ "limit 5")
	public List<Matzip> getList();
}
