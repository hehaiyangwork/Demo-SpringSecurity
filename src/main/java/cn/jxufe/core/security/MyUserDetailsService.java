package cn.jxufe.core.security;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;



import cn.jxufe.core.dao.BaseDao;
import cn.jxufe.core.security.domain.UserDetail;
import cn.jxufe.core.web.domain.Resource;

@Component("userDetailsService")
public class MyUserDetailsService implements UserDetailsService {

    protected Logger logger = LoggerFactory.getLogger(getClass());
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private BaseDao baseDao;
    
    //登录验证
    public UserDetails loadUserByUsername(String username)
    throws UsernameNotFoundException, DataAccessException {
        logger.debug("------------验证并授权(MyUserDetailsServiceImpl:loadUserByUsername)------------");
        
        // 根据用户名获取帐户和权限信息
        String sql = "SELECT username,password,enabled,name rname " +
                "FROM t_system_user_info u,t_system_role_info r,t_system_user_role ur " +
                "WHERE u.id=ur.user_id AND r.id=ur.role_id AND username= ?";
        // 如果一个用户具有多个权限，连接查询会返回一个List
        List list =this.jdbcTemplate.queryForList(sql, new Object[] { username });

        // 取出帐户和权限信息填充到User中返回
        if (list == null || list.size() <= 0)
            // spring-security定义的异常
            throw new UsernameNotFoundException("用户不存在！");
        // 如果用户存在
        Map<String, Object> map = (Map<String, Object>) list.get(0);
        // 密码
        String password = (String) map.get("password");
        // 帐户是否可用
        boolean enabled = ((Integer) map.get("enabled") == 1);
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
        // 帐户所具有的权限
        
        Set<GrantedAuthority> authSet = new HashSet<GrantedAuthority>();
        List<Resource> resources=this.getResourceByUsername(username);
        logger.debug("------------用户所拥有权限------------");
        for (int i=0;i<resources.size();i++) {
            GrantedAuthority authority = new SimpleGrantedAuthority(resources.get(i).getName()); 
            authSet.add(authority);
        }
        logger.debug("------------"+authSet.toString()+"------------");
        // spring-security提供的类
        UserDetail userdetail = new UserDetail(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authSet);
        userdetail.setCnname("何海洋");
        return userdetail;

    }
    
    private List<Resource> getResourceByUsername(String username){  
        String sql ="SELECT * FROM t_system_resource_info WHERE id IN(" +
                "SELECT DISTINCT resource_id FROM t_system_authority_resource WHERE authority_id IN(" +
                "SELECT authority_id FROM t_system_role_authority WHERE role_id IN(" +
                "SELECT role_id FROM t_system_user_role WHERE user_id  =( " +
                "SELECT id FROM t_system_user_info WHERE username= ? ))))";
        List<Resource> list =this.baseDao.findListBeanByArray(sql, Resource.class, new Object[] { username });
        return list;  
    }
    

}