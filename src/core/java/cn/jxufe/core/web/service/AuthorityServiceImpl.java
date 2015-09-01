package cn.jxufe.core.web.service;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.stereotype.Service;

import cn.jxufe.core.dao.BaseDao;
import cn.jxufe.core.web.domain.Authority;
import cn.jxufe.core.web.domain.TreeBo;
import cn.jxufe.core.web.domain.Page;

@Service
public class AuthorityServiceImpl implements AuthorityService{
	
	@Autowired
	public BaseDao baseDao;
    
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.AuthorityService#getResourcePageByAuthorityId(cn.jxufe.core.web.domain.Page, long)
	 */
	public Page getAuthorityPage(Page page){
		String sql="SELECT * FROM t_system_authority_info ORDER BY order_index DESC, insert_date DESC";
		return baseDao.findPageListByArray(page, Authority.class, sql);
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.AuthorityService#getAuthorityList()
	 */
	public List<TreeBo> getAuthorityList(){
		String sql="SELECT * FROM t_system_authority_info ORDER BY order_index DESC, insert_date DESC";
		List<Authority> list= baseDao.findListBeanByArray(sql, Authority.class);
		List<TreeBo> fList = new ArrayList<TreeBo>();
		for (int i = 0; i < list.size(); i++) {
			TreeBo bo = new TreeBo();
			bo.setId(String.valueOf(list.get(i).getId()));
			bo.setName(list.get(i).getCnName()+"(ID:"+list.get(i).getId()+")");
			bo.setOpen(true);
			bo.setpId(String.valueOf(list.get(i).getParentId()));
			bo.setIsParent(false);
//			bo.setTarget("Ajax");
//			bo.setClick("");
//			bo.setUrl("");
//			bo.setRel("");
//			bo.setIconOpen("/styles/ztree/css/zTreeStyle/img/diy/1_open.png");
//			bo.setIconClose("/styles/ztree/css/zTreeStyle/img/diy/1_close.png");
//			bo.setIcon("/styles/ztree/css/zTreeStyle/img/diy/3.png");
			fList.add(bo);
		}
		return fList;
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.AuthorityService#insertAuthority(cn.jxufe.core.web.domain.Authority)
	 */
	public int insertAuthority(Authority auth) throws Exception{
		String sql="INSERT INTO t_system_authority_info(name,cnname,parent_id,order_Index) VALUES(?,?,?,?)";
		Object[] args=new Object[]{ auth.getName(), auth.getCnName(), auth.getParentId(), auth.getOrderIndex() };
		return baseDao.executeByArray(sql, args);
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.AuthorityService#updateAuthority(cn.jxufe.core.web.domain.Authority)
	 */
	public int updateAuthority(Authority auth) throws Exception{
		String sql="UPDATE t_system_authority_info SET name=?,cnname=?,parent_id=?,order_Index=? WHERE id=?";
		Object[] args=new Object[]{ auth.getName(), auth.getCnName(), auth.getParentId(), auth.getOrderIndex(), auth.getId() };
		return baseDao.executeByArray(sql, args);
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.AuthorityService#queryAuthorityById(long)
	 */
	public Authority queryAuthorityById(long id){
		String sql="SELECT * FROM t_system_authority_info WHERE id = ? ";
		Object[] args=new Object[]{ id };
		return (Authority) baseDao.findUniqueBeanByArray(sql, Authority.class, args);
	}
	
	public List<Object> findAuthorityChildIdList(long id){
		String sql="{call func_findAuthorityChildId("+id+")}";
		return baseDao.findChildIdList(sql);
	}
	
	public List<Map<String, Object>> queryAuthorityResource(long id){
		String sql="select * from t_system_authority_resource WHERE authority_id = ? ";
		Object[] args=new Object[]{ id };
		return baseDao.findListMapByArray(sql, args);
	}
	
	public void saveAuthorityResource(int[] arr,long authorityId) throws Exception {
		final int[] no = arr;
		final long id = authorityId;
		String sql="DELETE FROM t_system_authority_resource WHERE authority_id = ? ";
		Object[] args=new Object[]{ id };
		baseDao.executeByArray(sql, args);
		baseDao.getJdbcTemplate().batchUpdate(
				"insert into t_system_authority_resource(authority_id,resource_id) values(?,?)",
				new BatchPreparedStatementSetter() {
					public void setValues(PreparedStatement ps, int i)
							throws SQLException {
						ps.setLong(1, id);
						ps.setInt(2, no[i]);
					}
					public int getBatchSize() {
						return no.length;
					}
				});
	}
}
