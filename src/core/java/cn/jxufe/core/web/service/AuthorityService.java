package cn.jxufe.core.web.service;

import java.util.List;
import java.util.Map;

import cn.jxufe.core.web.domain.Authority;
import cn.jxufe.core.web.domain.TreeBo;
import cn.jxufe.core.web.domain.Page;

public interface AuthorityService {

	public abstract Page getAuthorityPage(Page page);

	public abstract List<TreeBo> getAuthorityList();

	public abstract int insertAuthority(Authority auth) throws Exception;

	public abstract int updateAuthority(Authority auth) throws Exception;

	public abstract Authority queryAuthorityById(long id);
	
	public abstract List<Object> findAuthorityChildIdList(long id);
	
	public abstract List<Map<String, Object>> queryAuthorityResource(long id);
	
	public abstract void saveAuthorityResource(int[] arr,long authorityId) throws Exception;

}