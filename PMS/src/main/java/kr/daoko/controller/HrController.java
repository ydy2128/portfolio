package kr.daoko.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.daoko.dto.HrDTO;
import kr.daoko.service.HrService;

@Controller
@RequestMapping("/hr/*")
public class HrController {
	private static final Logger logger = LoggerFactory.getLogger(HrController.class);
	
	@Inject
	HrService service;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	// 관리자 추가 페이지
	@RequestMapping(value = "/addsudouser", method = RequestMethod.GET)
	public String getAddSudoUser() throws Exception {
		logger.info("from HrController: getAddSudoUser()");
		
		return "hr/addsudouser";
	}
	
	// 관리자 추가
	@RequestMapping(value = "/addsudouser", method = RequestMethod.POST)
	public String postAddSudoUser(HrDTO dto) throws Exception {
		logger.info("from HrController: postAddSudoUser()");
		
		String pw = pwEncoder.encode(dto.getPw());
		dto.setPw(pw);
		
		dto.setAuth(true);
		
		service.addUser(dto);
		
		return "redirect:/";
	}
	
	// 사용자 추가
	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public String postAdduser(HrDTO dto) throws Exception {
		logger.info("from HrController: postAdduser()");
		
		String pw = pwEncoder.encode(dto.getSsn());
		dto.setPw(pw);
		
		dto.setAuth(false);
		
		service.addUser(dto);
		
		return "redirect:/";
	}
	
	// 사용자 조회 페이지
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList() throws Exception {
		logger.info("from HrController: getList()");
		
		return "hr/list";
	}
	
	// 사용자 등록 페이지
	@RequestMapping(value = "/adduser", method = RequestMethod.GET)
	public String getAdduser() throws Exception {
		return "hr/adduser";
	}
	
	// 사용자 수정 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String getHrModify(@RequestParam("ssn") String ssn, Model model) throws Exception {
		logger.info("from HrController: getHrModify()");
		
		HrDTO user = service.viewUser(ssn);
		model.addAttribute("user", user);

		return "hr/modify";
	}
	
	// 사용자 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postHrModify(HrDTO dto) throws Exception {
		logger.info("from HrController: postHrModify()");

		service.modifyUser(dto);
		
		return "redirect:/hr/list";
	}
}
