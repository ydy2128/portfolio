package kr.daoko.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.daoko.dto.HrDTO;
import kr.daoko.dto.StatDTO;
import kr.daoko.service.HrService;
import kr.daoko.service.LogService;
import kr.daoko.service.StatService;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	HrService hrService;
	
	@Inject
	LogService logService;
	
	@Inject
	StatService statService;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	// 濡쒓렇�씤 �럹�씠吏� 異쒕젰
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getLogin() throws Exception {
		logger.info("from HomeController.java: getLogin()");
		
		return "login";
	}

	// 濡쒓렇�씤 泥섎━
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String postLogin(HrDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("from HomeController.java: postLogin()");
		
		HttpSession session = req.getSession();
		HrDTO login = hrService.login(dto);
		
		if(login != null) {
		if(pwEncoder.matches(dto.getPw(), login.getPw())){
			session.setAttribute("member", login);
			return "redirect:/main";
		}
		
		else {
			session.setAttribute("member", null);
			
			rttr.addFlashAttribute("msg",false);
			
		}}else {
			session.setAttribute("member", null);
			
			rttr.addFlashAttribute("msg",false);
		}

		return "redirect:/";
	}
	
	// 硫붿씤 �럹�씠吏� 異쒕젰
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String getMain(Model model) throws Exception {
		logger.info("from HomeController.java: getMain()");
		
		int parking = logService.countPark();
		model.addAttribute("parking", parking);
		
		StatDTO dto = statService.statToday();
		model.addAttribute("today", dto);
		
		return "main";
	}
}
