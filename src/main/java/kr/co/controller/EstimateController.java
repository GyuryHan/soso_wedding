package kr.co.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EstimateController {
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

	   @RequestMapping(value = "/estimate/estimate", method = RequestMethod.GET)
	   public String home(Locale locale, Model model) throws Exception {
	      logger.info("estimate");
	      return "/estimate/estimate";
	   }
}
