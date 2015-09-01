package cn.jxufe.core.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.jxufe.core.web.controller.BaseController;
import cn.jxufe.core.web.domain.Page;
import cn.jxufe.core.web.service.ParameterService;

@Controller
@RequestMapping("/admin/parameter")
public class ParameterController extends BaseController{
	
	@Resource
	public ParameterService paramService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request){
		int p =request.getParameter("p")==null?1:Integer.valueOf(request.getParameter("p").toString());
		Page page=new Page(p, 10);
		request.setAttribute("page", paramService.getParameterPage(page));
		return "/core/admin/parameter/list";
	}
	
}