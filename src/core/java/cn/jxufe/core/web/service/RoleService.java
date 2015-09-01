package cn.jxufe.core.web.service;

import java.util.List;
import java.util.Map;

import cn.jxufe.core.web.domain.Page;
import cn.jxufe.core.web.domain.Role;
import cn.jxufe.core.web.domain.TreeBo;

public interface RoleService {

	public abstract Page getRolePage(Page page);
	
	public abstract List<TreeBo> getRoleList();

	public abstract int insertRole(Role role) throws Exception;
	
	public abstract int updateRole(Role role) throws Exception;
	
	public abstract Role queryRoleById(long id);
	
	public abstract List<Object> findAuthorityChildIdList(long id);
	
	public abstract List<Map<String, Object>> queryRoleAuthority(long id);
	
	public abstract void saveAuthority(int[] arr,long roleId) throws Exception;
	
	public abstract void deleteRole(int[] arr);
}