package cn.jxufe.core.security;

import java.util.Collection;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

/**
 * 
* 类名称：MyAccessDecisionManager   
* 类描述： 访问决策器，决定某个用户具有的角色，是否有足够的权限去访问某个资源 ;做最终的访问控制决定 
* 创建人：Jxufe HeHaiYang
* 创建时间：2015-1-27 下午04:45:02     
* 修改备注：   
* @version
 */
public class MyAccessDecisionManager implements AccessDecisionManager {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	/** 
     *  认证用户是否具有权限访问该url地址 
     *  
     */  
	public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes) throws AccessDeniedException, InsufficientAuthenticationException {
		logger.debug("--------------匹配用户拥有权限和请求权限(MyAccessDecisionManager:decide)--------------");  
		logger.debug("--------------验证用户是否具有一定的权限--------------");  
		 if(configAttributes == null) {
			return;
		}
		//所请求的资源拥有的权限(一个资源对多个权限)
		Iterator<ConfigAttribute> iterator = configAttributes.iterator();
		while(iterator.hasNext()) {
			ConfigAttribute configAttribute = iterator.next();
			//访问所请求资源所需要的权限
			String needPermission = configAttribute.getAttribute();
			logger.debug("--------------访问所请求资源所需要的权限为 " + needPermission+"--------------");  
			//用户所拥有的权限authentication
			for(GrantedAuthority ga : authentication.getAuthorities()) {
				if(needPermission.equals(ga.getAuthority())) {
					logger.debug("--------------权限验证通过--------------"); 
					return;
				}
			}
		}
		//没有权限让我们去捕捉
		logger.debug("--------------权限验证未通过--------------"); 
		throw new AccessDeniedException(" 没有权限访问！");
	}

	/** 
     * 启动时候被AbstractSecurityInterceptor调用，决定AccessDecisionManager是否可以执行传递ConfigAttribute。 
     */  
	public boolean supports(ConfigAttribute attribute) {
		 logger.debug("MyAccessDescisionManager.supports()------------"+attribute.getAttribute());  
		return true;
	}

	  /** 
     * 被安全拦截器实现调用，包含安全拦截器将显示的AccessDecisionManager支持安全对象的类型 
     */  
	public boolean supports(Class<?> clazz) {
		logger.debug("MyAccessDescisionManager.supports()--------------------------------");  
		return true;
	}
	
}
