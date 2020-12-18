package kr.daoko.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.daoko.dto.NoticeDTO;
import kr.daoko.dto.Pagination;
import kr.daoko.dto.Search;
import kr.daoko.service.NoticeService;

@Controller
@RequestMapping("/community/*")
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@Inject
	NoticeService noticeService;
	
	@GetMapping("/faq")
	public String getFaq(Model model, @RequestParam(required = false, defaultValue = "all") String searchType, @RequestParam(required = false) String keyword, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		logger.info("from CommunityController: getFaq()");
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt = noticeService.noticeCnt(search);
		
		search.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", search);
		model.addAttribute("noticeList", noticeService.listNotice(search));
		
		return "community/faq";
	}
	
	@GetMapping("/faqContent")
	public String getFaqContent(Model model, @RequestParam int i) throws Exception {
		logger.info("from CommunityController: getFaqContent()");

		noticeService.hitUp(i);
		NoticeDTO view = noticeService.viewNotice(i);
		model.addAttribute("view", view);
		
		return "community/faqContent";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String getWrite(Model model, @RequestParam(required = false, defaultValue = "0") int i) throws Exception {
		logger.info("from CommunityController: getWrite()");
		
		if(i > 0) {
			NoticeDTO view = noticeService.viewNotice(i);
			model.addAttribute("view", view);
		}
		
		return "community/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(NoticeDTO dto) throws Exception {
		logger.info("from CommunityController: postWrite()");
		
		noticeService.insertNotice(dto);
		
		return "redirect:/community/faq";
	}
	
	@PostMapping("/modify")
	public String postModify(NoticeDTO dto) throws Exception{
		logger.info("from CommunityController: postModify()");
		noticeService.modifyNotice(dto);
		
		return "redirect:/community/faqContent?i="+dto.getIdx();
	}
	
	@GetMapping("/remove")
	public String getRemove(@RequestParam int i) throws Exception {
		logger.info("from CommunityController: getRemove()");
		noticeService.removeNotice(i);
		
		return "redirect:/community/faq";
	}
}
