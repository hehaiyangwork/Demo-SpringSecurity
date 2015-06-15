package cn.jxufe.web.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		return "admin/index";
	}
	
}