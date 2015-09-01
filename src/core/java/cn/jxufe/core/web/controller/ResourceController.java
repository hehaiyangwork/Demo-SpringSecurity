package cn.jxufe.core.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.core.web.controller.BaseController;
import cn.jxufe.core.web.domain.Page;
import cn.jxufe.core.web.domain.ResourceInfo;
import cn.jxufe.core.web.service.ResourceService;

@Controller
@RequestMapping("/admin/resource")
public class ResourceController extends BaseController{
	
	@Resource
	public ResourceService resourceService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request){
		int p =request.getParameter("p")==null?1:Integer.valueOf(request.getParameter("p").toString());
		Page page=new Page(p);
		request.setAttribute("page", resourceService.getResourcePage(page));
		return "/core/admin/resource/list";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request){
		return "/core/admin/resource/add";
	}
	
	@ResponseBody
	@RequestMapping("/saveAdd")
	public Map<String, Object> saveAdd(HttpServletRequest request, ResourceInfo res){
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			resourceService.insertResource(res);
			map.put("status", 200);
			return map;
		} catch (Exception e) {
			logger.error(e.getMessage());
			map.put("status", 300);
			map.put("msg", e.getMessage());
			return map;
		}
	}
	
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request){
		long id=Long.valueOf(request.getParameter("id"));
		request.setAttribute("resource", resourceService.queryResourceById(id));
		return "/core/admin/resource/edit";
	}
	
	@ResponseBody
	@RequestMapping("/saveEdit")
	public Map<String, Object> saveEdit(HttpServletRequest request, ResourceInfo res){
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			resourceService.updateResource(res);
			map.put("status", 200);
			return map;
		} catch (Exception e) {
			logger.error(e.getMessage());
			map.put("status", 300);
			map.put("msg", e.getMessage());
			return map;
		}
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public Map<String, Object> del(HttpServletRequest request){
		long id=Long.valueOf(request.getParameter("id"));
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			resourceService.deleteResourceInfo(id);
			map.put("status", 200);
			return map;
		} catch (Exception e) {
			logger.error(e.getMessage());
			map.put("status", 300);
			map.put("msg", e.getMessage());
			return map;
		}
	}
	
}