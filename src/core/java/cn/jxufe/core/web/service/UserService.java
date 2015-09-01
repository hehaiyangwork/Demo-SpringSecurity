package cn.jxufe.core.web.service;

import java.util.List;
import java.util.Map;

import cn.jxufe.core.web.domain.Page;
import cn.jxufe.core.web.domain.User;

public interface UserService {

	public abstract Page getUsersPage(Page page);

	public abstract int insertUser(User user) throws Exception;

	public abstract int updateUser(User user) throws Exception;

	public abstract User queryUserById(long id);
	
	public abstract int deleteUser(long id) throws Exception;
	
	public abstract List<Map<String, Object>> queryUserRole(long id);
	
	public abstract void saveRole(int[] arr,long userId) throws Exception ;

}