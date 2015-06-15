package cn.jxufe.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping
public class IndexController {

	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		return "home/index";
	}
	
}