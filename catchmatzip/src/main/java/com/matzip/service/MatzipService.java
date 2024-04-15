package com.matzip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matzip.domain.Matzip;
import com.matzip.mapper.MatzipMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MatzipService {
	@Setter(onMethod_=@Autowired)
	private MatzipMapper mapper;
	public List<Matzip> getList(){
		log.info("getList...");
		return mapper.getList();
	}
	public List<Matzip> getListAll(){
		log.info("getListAll...");
		return mapper.getListAll();
	}
}
