package cn.jxufe.core.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.core.dao.BaseDao;
import cn.jxufe.core.web.domain.Page;
import cn.jxufe.core.web.domain.ResourceInfo;

@Service
public class ResourceServiceImpl implements ResourceService{
	
	@Autowired
	public BaseDao baseDao;
    
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.ResourceService#getResourcePage(cn.jxufe.core.web.domain.Page)
	 */
	public Page getResourcePage(Page page){
		String sql="SELECT * FROM t_system_resource_info ORDER BY order_index DESC, insert_date DESC";
		return baseDao.findPageListByArray(page, ResourceInfo.class, sql);
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.ResourceService#insertResource(cn.jxufe.core.web.domain.Resource)
	 */
	public int insertResource(ResourceInfo res) throws Exception{
		String sql="INSERT INTO t_system_resource_info(name,cnname,path,order_Index) VALUES(?,?,?,?)";
		Object[] args=new Object[]{ res.getName(), res.getCnName(), res.getPath(), res.getOrderIndex() };
		return baseDao.executeByArray(sql, args);
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.ResourceService#updateResource(cn.jxufe.core.web.domain.Resource)
	 */
	public int updateResource(ResourceInfo res) throws Exception{
		String sql="UPDATE t_system_resource_info SET name=?,cnname=?,path=?,order_Index=? WHERE id=?";
		Object[] args=new Object[]{ res.getName(), res.getCnName(), res.getPath(), res.getOrderIndex(), res.getId() };
		return baseDao.executeByArray(sql, args);
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.ResourceService#queryResourceById(long)
	 */
	public ResourceInfo queryResourceById(long id){
		String sql="SELECT * FROM t_system_resource_info WHERE id = ? ";
		Object[] args=new Object[]{ id };
		return (ResourceInfo) baseDao.findUniqueBeanByArray(sql, ResourceInfo.class, args);
	}
	
	public List<ResourceInfo> getResourceList(){
		String sql="SELECT * FROM t_system_resource_info ORDER BY order_index DESC, insert_date DESC";
		return baseDao.findListBean(sql, ResourceInfo.class);
	}
	
	public int deleteResourceInfo(long id) throws Exception{
		String sql="delete from t_system_resource_info WHERE id = ? ";
		Object[] args=new Object[]{ id };
		return baseDao.executeByArray(sql, args);
	}
}
