package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.QnaBoardService;
import kr.co.service.QnaReplyService;
import kr.co.service.ReplyService;
import kr.co.service.dminService;
import kr.co.vo.PageMaker;
import kr.co.vo.SearchCriteria;

@Controller
@RequestMapping("/notices/*")
public class NoticesController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticesController.class);
	
	@Inject
	dminService dminService;
	@Inject
    ReplyService replyService;
	@Inject
	QnaBoardService qnaService;
	@Inject
	QnaReplyService qnaRService;
	
	
	// 관리자화면
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String getIndex(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception {
			logger.info("공지사항페이지"); 
			model.addAttribute("notices", dminService.notices(scri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
	     	pageMaker.setTotalCount(dminService.listCount3(scri));
	     	model.addAttribute("pageMaker", pageMaker);
	     	
				return "noticesBoard/list";
		}

}
