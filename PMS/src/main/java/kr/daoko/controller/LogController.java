package kr.daoko.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.daoko.service.LogService;

@Controller
@RequestMapping("/log/*")
public class LogController {
	private static final Logger logger = LoggerFactory.getLogger(LogController.class);

	@Inject
	LogService service;
	
	@GetMapping("/log")
	public String getLog(Model model) throws Exception {
		int parking = service.countPark();
		model.addAttribute("parking", parking);
		return "log/log";
	}
	
}
