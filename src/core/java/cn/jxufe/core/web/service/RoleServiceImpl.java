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
import cn.jxufe.core.web.domain.Role;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	public BaseDao baseDao;
    
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.RoleService#getRolePage(cn.jxufe.core.web.domain.Page)
	 */
	public Page getRolePage(Page page){
		String sql="SELECT * FROM t_system_role_info ORDER BY order_index DESC, insert_date DESC";
		return baseDao.findPageListByArray(page, Role.class, sql);
	}
	
	public List<TreeBo> getRoleList(){
		String sql="SELECT * FROM t_system_role_info ORDER BY order_index DESC, insert_date DESC";
		List<Role> list= baseDao.findListBeanByArray(sql, Role.class);
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
	
	public int insertRole(Role role) throws Exception{
		String sql="INSERT INTO t_system_role_info(name,cnname,parent_id,is_use,order_Index) VALUES(?,?,?,?,?)";
		Object[] args=new Object[]{ role.getName(), role.getCnName(), role.getParentId(), role.getIsUse(), role.getOrderIndex() };
		return baseDao.executeByArray(sql, args);
	}
	
	public int updateRole(Role role) throws Exception{
		String sql="UPDATE t_system_role_info SET name=?,cnname=?,parent_id=?,is_use=?,order_Index=? WHERE id=?";
		Object[] args=new Object[]{ role.getName(), role.getCnName(), role.getParentId(), role.getIsUse(), role.getOrderIndex(), role.getId() };
		return baseDao.executeByArray(sql, args);
	}
	
	public Role queryRoleById(long id){
		String sql="SELECT * FROM t_system_role_info WHERE id = ? ";
		Object[] args=new Object[]{ id };
		return (Role) baseDao.findUniqueBeanByArray(sql, Role.class, args);
	}
	
	public List<Object> findAuthorityChildIdList(long id){
		String sql="{call func_findRoleChildId("+id+")}";
		return baseDao.findChildIdList(sql);
	}
	
	public void deleteRole(int[] arr) {
		final int[] no = arr;
		baseDao.getJdbcTemplate().batchUpdate(
				"delete from t_system_role_info where id =?",
				new BatchPreparedStatementSetter() {
					public void setValues(PreparedStatement ps, int i)
							throws SQLException {
						ps.setInt(1, no[i]);
					}
					public int getBatchSize() {
						return no.length;
					}
				});
	}
	
	public List<Map<String, Object>> queryRoleAuthority(long id){
		String sql="select * from t_system_role_authority WHERE role_id = ? ";
		Object[] args=new Object[]{ id };
		return baseDao.findListMapByArray(sql, args);
	}
	
	public void saveAuthority(int[] arr,long roleId) throws Exception {
		final int[] no = arr;
		final long id = roleId;
		String sql="DELETE FROM t_system_role_authority WHERE role_id = ? ";
		Object[] args=new Object[]{ id };
		baseDao.executeByArray(sql, args);
		baseDao.getJdbcTemplate().batchUpdate(
				"insert into t_system_role_authority(role_id, authority_id) values(?,?)",
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
