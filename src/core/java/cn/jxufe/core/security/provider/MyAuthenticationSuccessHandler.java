package cn.jxufe.core.security.provider;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class MyAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	public MyAuthenticationSuccessHandler() {
	}

	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		String f = request.getParameter("f");
        if (StringUtils.isNotEmpty(f)) {
            if(f.equalsIgnoreCase("web")){
//                Message msg=new Message();
//                msg.setErrorCode("200");
//                msg.setExName("login Success");
//                ControllerTools.print(response, msg);//输出JSON到前台
            }
        }else{
           // request.getRequestDispatcher("/index.htm").forward(request, response);
            response.sendRedirect("/index.htm");
        }
	}

	
}

