package cn.jxufe.core.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

/**
 * 
* 类名称：MySecurityFilter   
* 类描述： 一个自定义的filter， 
*  必须包含authenticationManager,accessDecisionManager,securityMetadataSource三个属性， 
*  我们的所有控制将在这三个类中实现       
* 创建人：Jxufe HeHaiYang
* 创建时间：2015-1-27 下午03:55:13     
* 修改备注：   
* @version
 */
public class MySecurityFilter extends AbstractSecurityInterceptor implements
		Filter {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	// 与applicationContext-security.xml里的myFilter的属性securityMetadataSource对应，
	// 其他的两个组件，已经在AbstractSecurityInterceptor定义
	private FilterInvocationSecurityMetadataSource securityMetadataSource;

	@Override
	public SecurityMetadataSource obtainSecurityMetadataSource() {
		return this.securityMetadataSource;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		logger.debug("------------MyFilterSecurityInterceptor.doFilter()-----------开始拦截了....");  
		FilterInvocation fi = new FilterInvocation(request, response, chain);
		invoke(fi);
	}

	private void invoke(FilterInvocation fi) throws IOException,
			ServletException {
		// object为FilterInvocation对象
		// 1.获取请求资源的权限 
		// 执行Collection<ConfigAttribute> attributes =
		// SecurityMetadataSource.getAttributes(object);

		logger.debug("--------------用户发送请求--------------");  
		InterceptorStatusToken token = null;
		token = super.beforeInvocation(fi);
		
		try {
			fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
		}catch (Exception e) {
		}finally {
			super.afterInvocation(token, null);
		}
		
		logger.debug("------------MyFilterSecurityInterceptor.doFilter()-----------拦截结束了....");  
	}

	public FilterInvocationSecurityMetadataSource getSecurityMetadataSource() {
		return securityMetadataSource;
	}

	public void setSecurityMetadataSource(
			FilterInvocationSecurityMetadataSource securityMetadataSource) {
		this.securityMetadataSource = securityMetadataSource;
	}

	public void init(FilterConfig arg0) throws ServletException {
	}

	public void destroy() {
	}

	public Class<? extends Object> getSecureObjectClass() {
		// 下面的MyAccessDecisionManager的supports方面必须放回true,否则会提醒类型错误
		return FilterInvocation.class;
	}
}
