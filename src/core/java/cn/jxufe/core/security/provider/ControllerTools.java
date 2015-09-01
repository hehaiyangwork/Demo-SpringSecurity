package cn.jxufe.core.security.provider;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerTools {
	public static boolean isAjaxRequest(HttpServletRequest request){
		String header=request.getHeader("X-Requested-With");
		//System.out.println("header:"+request.getHeader("Accept"));
		if(header!=null && "XMLHttpRequest".equalsIgnoreCase(header))
			return true;
		else 
			return false;
	}
	public static void print(HttpServletResponse res,Message msg){
		try {
			res.setHeader("Content-Type", "application/json;charset=UTF-8");
			res.getWriter().print(JsonUtil.objectToJson(msg));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
