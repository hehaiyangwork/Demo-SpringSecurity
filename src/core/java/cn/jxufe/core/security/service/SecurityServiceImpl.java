package cn.jxufe.core.security.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.core.dao.BaseDao;
import cn.jxufe.core.web.domain.Authority;
import cn.jxufe.core.web.domain.ResourceInfo;

@Service
public class SecurityServiceImpl implements SecurityService{
	
	@Autowired
	public BaseDao baseDao;
    
	/* (non-Javadoc)
	 * @see cn.jxufe.core.security.service.SecurityService#getAllAuthority()
	 */
	public List<Authority> getAllAuthority(){
		String sql="select * from t_system_authority_info";
		return baseDao.findListBean(sql, Authority.class);
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.security.service.SecurityService#getAllAuthorityResource()
	 */
	public List<Authority> getAllAuthorityResource(){
		String sql="select * from t_system_authority_resource";
		return null;
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.security.service.SecurityService#getAllResource()
	 */
	public List<ResourceInfo> getAllResource(){
		String sql="select * from t_system_resource_info";
		return baseDao.findListBean(sql, ResourceInfo.class);
	}
}
