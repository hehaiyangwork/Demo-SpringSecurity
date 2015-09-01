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
import cn.jxufe.core.web.domain.Page;
import cn.jxufe.core.web.domain.User;
import cn.jxufe.core.web.service.UserService;

@Controller
@RequestMapping("/admin/user")
public class UserController extends BaseController{
	
	@Resource
	public UserService userService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request){
		int p =request.getParameter("p")==null?1:Integer.valueOf(request.getParameter("p").toString());
		Page page=new Page(p);
		request.setAttribute("page", userService.getUsersPage(page));
		return "/core/admin/user/list";
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public Map<String, Object> del(HttpServletRequest request){
		long id=Long.valueOf(request.getParameter("id"));
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			userService.deleteUser(id);
			map.put("status", 200);
			return map;
		} catch (Exception e) {
			logger.error(e.getMessage());
			map.put("status", 300);
			map.put("msg", e.getMessage());
			return map;
		}
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request){
		return "/core/admin/user/add";
	}
	
	@ResponseBody
	@RequestMapping("/saveAdd")
	public Map<String, Object> saveAdd(HttpServletRequest request, User user){
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			userService.insertUser(user);
			map.put("status", 200);
			return map;
		} catch (Exception e) {
			logger.error(e.getMessage());
			System.out.println(e.getMessage());
			map.put("status", 300);
			map.put("msg", e.getMessage());
			return map;
		}
	}
	
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request){
		long id=Long.valueOf(request.getParameter("id"));
		request.setAttribute("user", userService.queryUserById(id));
		return "/core/admin/user/edit";
	}
	
	@ResponseBody
	@RequestMapping("/saveEdit")
	public Map<String, Object> saveEdit(HttpServletRequest request, User user){
		Map<String, Object> map= new HashMap<String, Object>();
		try {
			userService.updateUser(user);
			map.put("status", 200);
			return map;
		} catch (Exception e) {
			logger.error(e.getMessage());
			map.put("status", 300);
			map.put("msg", e.getMessage());
			return map;
		}
	}
	
	@RequestMapping("/role")
	public String role(HttpServletRequest request){
		long id=Long.valueOf(request.getParameter("id"));
		request.setAttribute("userId", id);
		List<Map<String, Object>> list=userService.queryUserRole(id);
		StringBuffer str=new StringBuffer();
		for(int i=0;i<list.size();i++){
			str.append(list.get(i).get("role_id"));
			if(i!=list.size()-1){
				str.append(",");
			}
		}
		
		request.setAttribute("arr", str);
		return "/core/admin/user/role";
	}
	
	@ResponseBody
	@RequestMapping("/saveRole")
	public Map<String, Object> saveRole(HttpServletRequest request){
		Map<String, Object> map= new HashMap<String, Object>();
		long id=Long.valueOf(request.getParameter("id"));
		try {
			String arr=request.getParameter("role");
			//当前勾选数据数组
			String[] roleArr = arr.split(",");
			int[] num = new int[roleArr.length];
			for (int i = 0; i < num.length; i++) {
				num[i] = Integer.parseInt(roleArr[i]);
			}
			userService.saveRole(num, id);
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