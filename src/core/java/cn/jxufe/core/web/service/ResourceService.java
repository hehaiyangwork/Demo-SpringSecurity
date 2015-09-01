package cn.jxufe.core.web.service;

import java.util.List;

import cn.jxufe.core.web.domain.Page;
import cn.jxufe.core.web.domain.ResourceInfo;

public interface ResourceService {

	public abstract Page getResourcePage(Page page);

	public abstract int insertResource(ResourceInfo res) throws Exception;

	public abstract int updateResource(ResourceInfo res) throws Exception;

	public abstract ResourceInfo queryResourceById(long id);
	
	public abstract List<ResourceInfo> getResourceList();
	
	public abstract int deleteResourceInfo(long id) throws Exception;

}