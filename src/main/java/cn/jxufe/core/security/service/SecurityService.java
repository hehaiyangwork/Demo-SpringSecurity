package cn.jxufe.core.security.service;

import java.util.List;

import cn.jxufe.web.domain.Authority;
import cn.jxufe.web.domain.Resource;

public interface SecurityService {

	public abstract List<Authority> getAllAuthority();

	public abstract List<Authority> getAllAuthorityResource();

	public abstract List<Resource> getAllResource();

}