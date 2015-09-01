package cn.jxufe.core.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.core.web.controller.BaseController;
import cn.jxufe.core.web.domain.Page;
import cn.jxufe.core.web.domain.Role;
import cn.jxufe.core.web.domain.TreeBo;
import cn.jxufe.core.web.service.RoleService;

@Controller
@RequestMapping("/admin/role")
public class RoleController extends BaseController{
	
	@Resource
	public RoleService roleService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request){
		int p =request.getParameter("p")==null?1:Integer.valueOf(request.getParameter("p").toString());
		Page page=new Page(p);
		request.setAttribute("page", roleService.getRolePage(page));
		return "/core/admin/role/list";
	}
	
	@ResponseBody
	@RequestMapping("/getRoleJosn")
	public List<TreeBo> getAuthroityJosn(HttpServletRequest request){
		return roleService.getRoleList();
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request){
		request.setAttribute("parentId", request.getParameter("id"));
		return "/core/admin/role/add";
	}
	
	@ResponseBody
	@RequestMapping("/saveAdd")
	public Map<String, Object> saveAdd(HttpServletRequest request, Role role){
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			roleService.insertRole(role);
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
		request.setAttribute("role", roleService.queryRoleById(id));
		return "/core/admin/role/edit";
	}
	
	@ResponseBody
	@RequestMapping("/saveEdit")
	public Map<String, Object> saveEdit(HttpServletRequest request, Role role){
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			roleService.updateRole(role);
			map.put("status", 200);
			return map;
		} catch (Exception e) {
			logger.error(e.getMessage());
			map.put("status", 300);
			map.put("msg", e.getMessage());
			return map;
		}
	}
	
	@RequestMapping("/authority")
	public String authority(HttpServletRequest request){
		long id=Long.valueOf(request.getParameter("id"));
		request.setAttribute("roleId", id);
		List<Map<String, Object>> list=roleService.queryRoleAuthority(id);
		StringBuffer str=new StringBuffer();
		for(int i=0;i<list.size();i++){
			str.append(list.get(i).get("authority_id"));
			if(i!=list.size()-1){
				str.append(",");
			}
		}
		request.setAttribute("arr", str);
		return "/core/admin/role/authority";
	}
	
	@ResponseBody
	@RequestMapping("/saveAuthority")
	public Map<String, Object> saveAuthority(HttpServletRequest request){
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			long id=Long.valueOf(request.getParameter("id"));
			String arr=request.getParameter("auth");
			String[] authArr = arr.split(",");
			int[] num = new int[authArr.length];
			for (int i = 0; i < num.length; i++) {
				num[i] = Integer.parseInt(authArr[i]);
			}
			roleService.saveAuthority(num, id);
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
	public  Map<String, Object> del(HttpServletRequest request){
		long id=Long.valueOf(request.getParameter("id"));
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			List<Object> list=roleService.findAuthorityChildIdList(id);
			int[] arr=new int[list.size()];
			for(int i=0;i<list.size();i++){
				arr[i]=(Integer) list.get(i);
			}
			roleService.deleteRole(arr);
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