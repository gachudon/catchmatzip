package com.matzip.controller;

//import java.util.List;

//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		model.addAttribute("mList",service.getListAll());
	}
}
