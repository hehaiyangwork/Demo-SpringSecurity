package cn.jxufe.core.web.service;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.stereotype.Service;

import cn.jxufe.core.dao.BaseDao;
import cn.jxufe.core.web.domain.Page;
import cn.jxufe.core.web.domain.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	public BaseDao baseDao;
    
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.UserService#getUsersPage(cn.jxufe.core.web.domain.Page)
	 */
	public Page getUsersPage(Page page){
		String sql="SELECT * FROM t_system_user_info ORDER BY id DESC,insert_date ASC";
		return baseDao.findPageListByArray(page, User.class, sql);
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.UserService#insertUser(cn.jxufe.core.web.domain.User)
	 */
	public int insertUser(User user) throws Exception{
		String sql="INSERT INTO t_system_user_info(username,password,cnname,email,mobile) VALUES(?,?,?,?,?)";
		Object[] args=new Object[]{ user.getUsername(), user.getPassword(), user.getCnName(), user.getEmail(), user.getMobile() };
		return baseDao.executeByArray(sql, args);
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.UserService#updateUser(cn.jxufe.core.web.domain.User)
	 */
	public int updateUser(User user) throws Exception{
		String sql="UPDATE t_system_user_info SET username=?,password=?,cnname=?,email=?,mobile=? WHERE id=?";
		Object[] args=new Object[]{ user.getUsername(), user.getPassword(), user.getCnName(), user.getEmail(), user.getMobile(), user.getId() };
		return baseDao.executeByArray(sql, args);
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.core.web.service.UserService#queryUserById(long)
	 */
	public User queryUserById(long id){
		String sql="SELECT * FROM t_system_user_info WHERE id = ? ";
		Object[] args=new Object[]{ id };
		return (User) baseDao.findUniqueBeanByArray(sql, User.class, args);
	}
	
	public int deleteUser(long id) throws Exception{
		String sql="delete from t_system_user_info WHERE id = ? ";
		Object[] args=new Object[]{ id };
		return baseDao.executeByArray(sql, args);
	}
	
	public List<Map<String, Object>> queryUserRole(long id){
		String sql="select * from t_system_user_role WHERE user_id = ? ";
		Object[] args=new Object[]{ id };
		return baseDao.findListMapByArray(sql, args);
	}
	
	public void saveRole(int[] arr,long userId) throws Exception {
		final int[] no = arr;
		final long id = userId;
		String sql="DELETE FROM t_system_user_role WHERE user_id = ? ";
		Object[] args=new Object[]{ id };
		baseDao.executeByArray(sql, args);
		baseDao.getJdbcTemplate().batchUpdate(
				"insert into t_system_user_role(user_id,role_id) values(?,?)",
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
