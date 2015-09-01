package cn.jxufe.core.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.core.dao.BaseDao;
import cn.jxufe.core.web.domain.Page;
import cn.jxufe.core.web.domain.Parameter;

@Service
public class ParameterServiceImpl implements ParameterService{
	
	@Autowired
	public BaseDao baseDao;
    
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.ParameterService#getParameterPage(cn.jxufe.core.web.domain.Page)
	 */
	public Page getParameterPage(Page page){
		String sql="SELECT * FROM t_system_parameter";
		return baseDao.findPageListByArray(page, Parameter.class, sql);
	}
	
}
