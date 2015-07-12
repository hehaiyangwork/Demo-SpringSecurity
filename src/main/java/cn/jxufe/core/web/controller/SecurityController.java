package cn.jxufe.core.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
* 类名称：SecurityController   
* 类描述： 权限管理后台控制类
* 创建人：Jxufe HeHaiYang
* 创建时间：2015年7月12日 下午3:47:03     
* 修改备注：   
* @version
 */
@Controller
@RequestMapping("/security")
public class SecurityController {

	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		return "security/index";
	}
	
}