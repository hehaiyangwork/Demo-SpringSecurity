package cn.jxufe.core.security.provider;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.access.AccessDeniedHandler;

import cn.jxufe.core.security.provider.ControllerTools;
import cn.jxufe.core.security.provider.Message;
import cn.jxufe.core.security.provider.MessageManager;

/**
 * 
* 类名称：DefaultAccessDeniedHandler   
* 类描述： 
* 创建时间：2015年8月31日 下午10:51:46     
* 修改备注：   http://blog.csdn.net/jaune161/article/details/18403113
* @version
 */
public class DefaultAccessDeniedHandler implements AccessDeniedHandler {

	/* (non-Javadoc)
	 * @see org.springframework.security.web.access.AccessDeniedHandler#handle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, org.springframework.security.access.AccessDeniedException)
	 */
	private String errorPage;

    //~ Methods ========================================================================================================

    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException)
            throws IOException, ServletException {
    	//注意在jquery1.4.x当中request请求当中，headers当中没有X-Requested-With，高版本才有，特别小心
    	boolean isAjax = ControllerTools.isAjaxRequest(request);
    	System.out.println("===========handel==============:"+isAjax+" isCommitted:"+response.isCommitted());
    	if(isAjax){
    		System.out.println("--为ajax请求---");
    		Message msg = MessageManager.exception(accessDeniedException,"403");
    		ControllerTools.print(response, msg);//输出JSON到前台
    	}else if (!response.isCommitted()) {
            if (errorPage != null) {
                // Put exception into request scope (perhaps of use to a view)
                request.setAttribute(WebAttributes.ACCESS_DENIED_403, accessDeniedException);

                // Set the 403 status code.
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);

                // forward to error page.
                RequestDispatcher dispatcher = request.getRequestDispatcher(errorPage);
                dispatcher.forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, accessDeniedException.getMessage());
            }
        }
    }

    /**
     * The error page to use. Must begin with a "/" and is interpreted relative to the current context root.
     *
     * @param errorPage the dispatcher path to display
     *
     * @throws IllegalArgumentException if the argument doesn't comply with the above limitations
     */
    public void setErrorPage(String errorPage) {
        if ((errorPage != null) && !errorPage.startsWith("/")) {
            throw new IllegalArgumentException("errorPage must begin with '/'");
        }

        this.errorPage = errorPage;
    }

}
