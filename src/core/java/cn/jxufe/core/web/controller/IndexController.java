package cn.jxufe.core.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.jxufe.core.web.controller.BaseController;

@Controller
@RequestMapping
public class IndexController extends BaseController{

	/*
	 * 跳转到首页
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		return "index";
	}
	
	
	@RequestMapping("/start")
	public String start(HttpServletRequest request){
		return "start";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request){
		return "login";
	}
		
}