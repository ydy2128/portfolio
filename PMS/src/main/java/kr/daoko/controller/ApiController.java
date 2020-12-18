package kr.daoko.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.daoko.dto.HrDTO;
import kr.daoko.dto.LogListDTO;
import kr.daoko.dto.StatCorpDTO;
import kr.daoko.dto.StatPeriodDTO;
import kr.daoko.service.HrService;
import kr.daoko.service.LogService;
import kr.daoko.service.StatService;

@Controller
@RequestMapping("/api/*")
public class ApiController {
	private static final Logger logger = LoggerFactory.getLogger(ApiController.class);
	
	@Inject
	private HrService hrService;
	
	@Inject
	private LogService logService;
	
	@Inject
	private StatService statService;
	
	// GSON Object
	Gson gson = new Gson();
	
	// 사용자 조회
	@ResponseBody
	@RequestMapping(value = "/hr/list", produces = "application/json", method = RequestMethod.GET)
	public String getHrList() throws Exception {
		logger.info("from ApiController: getHrList()");
		
		List<HrDTO> list = hrService.listUser();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value = "/log/log", produces = "application/json", method = RequestMethod.GET)
	public String getLogLog() throws Exception {
		logger.info("from ApiController: getLogLog()");
		
		List<LogListDTO> list = logService.listLog();
		String json = gson.toJson(list);
		
		return json;
	}
	
	// 회사별 전체 통계 조회
	@ResponseBody
	@RequestMapping(value = "/stat/corp", produces = "application/json", method = RequestMethod.GET)
	public String getStatCorp() throws Exception {
		logger.info("from ApiController: getStatCorp()");
		
		List<StatCorpDTO> list = statService.listCorp();
		String json = gson.toJson(list);
		
		return json;
	}
	
	// 기간별 통계 조회
		@ResponseBody
		@RequestMapping(value = "/stat/period", produces = "application/json", method = RequestMethod.GET)
		public String getStatPeriod(@RequestParam String p, @RequestParam String s, @RequestParam String e) throws Exception {
			logger.info("from ApiController: getStatPeriod()");
			HashMap<String, String> period = new HashMap<String, String>();
			period.put("start", s);
			period.put("end", e);
			
			List<StatPeriodDTO> list = null;
			if(p.equals("year")) {
				list = statService.listYear(period);
			}else if (p.equals("month")) {
				list = statService.listMonth(period);
			}else if (p.equals("day")) {
				list = statService.listDay(period);
			}else if (p.equals("time")) {
				list = statService.listTime(s);
			}
			String json = gson.toJson(list);
			
			return json;
		}
		
		// 선택된 회사의 사원들 통계 조회
		@ResponseBody
		@RequestMapping(value = "/stat/hr", produces = "application/json", method = RequestMethod.GET)
		public String getStatHr(@RequestParam String c) throws Exception {
			logger.info("from ApiController: getStatHr()");
			
			List<StatPeriodDTO> list = statService.listHr(c);
			String json = gson.toJson(list);
			
			return json;
		}
		
		// 해당 사원에 대한 기간별 통계 조회
		@ResponseBody
		@RequestMapping(value = "/stat/personal", produces = "application/json", method = RequestMethod.GET)
		public String getStatPersonal(@RequestParam String s, @RequestParam String p) throws Exception {
			logger.info("from ApiController: getStatPersonal()");
					
			List<StatPeriodDTO> list = null;
			if(p.equals("year")) {
				list = statService.statYear(s);
			}else if (p.equals("month")) {
				list = statService.statMonth(s);
			}else if (p.equals("day")) {
				list = statService.statDay(s);
			}else if (p.equals("time")) {
				list = statService.statTime(s);
			}
			String json = gson.toJson(list);
			
			return json;
		}
}
