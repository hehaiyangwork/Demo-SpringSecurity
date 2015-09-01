package cn.jxufe.core.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.core.web.controller.BaseController;
import cn.jxufe.core.web.domain.Authority;
import cn.jxufe.core.web.domain.TreeBo;
import cn.jxufe.core.web.domain.Page;
import cn.jxufe.core.web.service.AuthorityService;
import cn.jxufe.core.web.service.ResourceService;

@Controller
@RequestMapping("/admin/authority")
public class AuthorityController extends BaseController{
	
	@Resource
	public AuthorityService authorityService;
	
	@Resource
	public ResourceService resourceService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request){
		int p =request.getParameter("p")==null?1:Integer.valueOf(request.getParameter("p").toString());
		Page page=new Page(p);
		request.setAttribute("page", authorityService.getAuthorityPage(page));
		return "/core/admin/authority/list";
	}
	
	@ResponseBody
	@RequestMapping("/getAuthroityJosn")
	public List<TreeBo> getAuthroityJosn(HttpServletRequest request){
		return authorityService.getAuthorityList();
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request){
		request.setAttribute("parentId", request.getParameter("id"));
		return "/core/admin/authority/add";
	}
	
	@ResponseBody
	@RequestMapping("/saveAdd")
	public Map<String, Object> saveAdd(HttpServletRequest request, Authority auth){
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			authorityService.insertAuthority(auth);
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
		request.setAttribute("authority", authorityService.queryAuthorityById(id));
		return "/core/admin/authority/edit";
	}
	
	@ResponseBody
	@RequestMapping("/saveEdit")
	public Map<String, Object> saveEdit(HttpServletRequest request, Authority auth){
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			authorityService.updateAuthority(auth);
			map.put("status", 200);
			return map;
		} catch (Exception e) {
			logger.error(e.getMessage());
			map.put("status", 300);
			map.put("msg", e.getMessage());
			return map;
		}
	}
	
	@RequestMapping("/resource")
	public String resource(HttpServletRequest request){
		request.setAttribute("resourceList", resourceService.getResourceList());
		long id=Long.valueOf(request.getParameter("id"));
		request.setAttribute("authorityId", id);
		List<Map<String, Object>> list=authorityService.queryAuthorityResource(id);
		StringBuffer str=new StringBuffer();
		for(int i=0;i<list.size();i++){
			str.append(list.get(i).get("resource_id"));
			if(i!=list.size()-1){
				str.append(",");
			}
		}
		request.setAttribute("arr", str);
		return "/core/admin/authority/resource";
	}
	
	@ResponseBody
	@RequestMapping("/saveResource")
	public Map<String, Object> saveResource(HttpServletRequest request){
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			String[] arr= request.getParameterValues("resourceArray");
			long id=Long.valueOf(request.getParameter("id"));
			int[] num = new int[arr.length];
			for (int i = 0; i < num.length; i++) {
				num[i] = Integer.parseInt(arr[i]);
			}
			authorityService.saveAuthorityResource(num, id);
			map.put("status", 200);
			return map;
		} catch (Exception e) {
			logger.error(e.getMessage());
			map.put("status", 300);
			map.put("msg", e.getMessage());
			return map;
		}
	}
	
	@RequestMapping("/del")
	public void del(HttpServletRequest request){
		long id=2;
		authorityService.findAuthorityChildIdList(id);
	}
	
}