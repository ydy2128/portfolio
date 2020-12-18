package kr.daoko.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.daoko.dto.StatCorpDTO;
import kr.daoko.service.HrService;
import kr.daoko.service.StatService;

@Controller
@RequestMapping("/stat/*")
public class StatController {
	private static final Logger logger = LoggerFactory.getLogger(StatController.class);
	
	@Inject
	StatService statService;
	@Inject
	HrService hrService;
	
	// 회사별 입.출차 통계 출력
	@RequestMapping(value = "/corp", method = RequestMethod.GET)
	public String getCorp(Model model) throws Exception {
		logger.info("from StatController: getCorp");
		
		List<StatCorpDTO> stat = statService.listCorp();
		model.addAttribute("stat", stat);
		
		return "stat/corp";
	}

	@GetMapping("/period")
	public String getPeriod() throws Exception {
		logger.info("from StatController: getPeriod");
		
		return "stat/period";
	}
	
	@GetMapping("/employee")
	public String getEmployee() throws Exception {
		logger.info("from StatController: getEmployee");
		return "stat/employee";
	}
	
}
