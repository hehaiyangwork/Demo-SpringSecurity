package cn.jxufe.core.security.provider;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class MyAuthenticationFailureHandler implements AuthenticationFailureHandler{

	public void onAuthenticationFailure(HttpServletRequest request,
			HttpServletResponse response, AuthenticationException arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		String f = request.getParameter("f");
        if (StringUtils.isNotEmpty(f)) {
            if(f.equalsIgnoreCase("web")){
//                Message msg = MessageManager.exception(arg2,"300");
//                ControllerTools.print(response, msg);//输出JSON到前台
            }
            
        }else{
            System.out.println("---登陆失败！--跳转1---");
            request.setAttribute("error", arg2);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
                        
        }
	}

}
