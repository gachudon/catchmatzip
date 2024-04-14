package com.matzip.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.matzip.domain.Matzip;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MatzipMapperTest {
	@Setter(onMethod_= {@Autowired})
	private MatzipMapper mapper;
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	@Test
	public void testList() {
		List<Matzip> matzips= mapper.getList();
		matzips.forEach(matzip->log.info(matzip));
	}
}
