package cn.jxufe.core.security.cache;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.jxufe.core.security.service.SecurityService;
import cn.jxufe.core.web.domain.Authority;
import cn.jxufe.core.web.domain.Resource;

/**
 * 
 *类名称：RoleMenuCacheInit
 *类描述：初始化角色菜单缓存
 *创建人：Jxufe HeHaiYang
 *创建时间：2014-8-7 下午03:59:23
 *修改备注：
 *@version
 *
 */
public class SecurityCacheInit {

	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	private SecurityService securityService;
	
	public void setSecurityService(SecurityService securityService) {
		this.securityService = securityService;
	}

	public SecurityService getSecurityService() {
		return securityService;
	}

	public void init(){
		logger.info("正在初始化权限控制相关缓存!");
		Collection<Authority> authoritys=securityService.getAllAuthority();
		for(Authority auth:authoritys){
			SecurityCache.putAuthorityCache(auth.getId(), auth);
		}
		Collection<Resource> resources=securityService.getAllResource();
		for(Resource res:resources){
			SecurityCache.putResourceCache(res.getId(), res);
		}
		logger.info("权限控制相关缓存初始化结束!");
	}
	

	
}
