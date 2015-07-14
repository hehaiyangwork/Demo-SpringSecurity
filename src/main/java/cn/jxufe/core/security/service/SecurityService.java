package cn.jxufe.core.security.service;

import java.util.List;

import cn.jxufe.core.security.domain.Authority;
import cn.jxufe.core.security.domain.Resource;

public interface SecurityService {

	public abstract List<Authority> getAllAuthority();

	public abstract List<Authority> getAllAuthorityResource();

	public abstract List<Resource> getAllResource();

}