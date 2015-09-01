package cn.jxufe.core.security.service;

import java.util.List;

import cn.jxufe.core.web.domain.Authority;
import cn.jxufe.core.web.domain.ResourceInfo;

public interface SecurityService {

	public abstract List<Authority> getAllAuthority();

	public abstract List<Authority> getAllAuthorityResource();

	public abstract List<ResourceInfo> getAllResource();

}