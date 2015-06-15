package cn.jxufe.core.security;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import cn.jxufe.core.dao.BaseDao;
import cn.jxufe.web.domain.User;

public class MyUsernamePasswordAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
    private static final String USERNAME = "username";
    private static final String PASSWORD = "password";
    private static final String KAPTCHA = "kaptcha";

    private BaseDao baseDao;

    public BaseDao getBaseDao() {
        return baseDao;
    }

    public void setBaseDao(BaseDao baseDao) {
        this.baseDao = baseDao;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        if (!request.getMethod().equals("POST")) {
            throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
        }

        String username = obtainUsername(request);
        String password = obtainPassword(request);
        String kaptcha = obtainKaptcha(request);
        logger.debug("--------------用户：" + username + password+"正在登录---"+kaptcha+"-----------");  
        // 验证码校验
        String kaptchaExpected = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        if(!kaptcha.equals(kaptchaExpected)){
            BadCredentialsException exception = new BadCredentialsException("验证码不匹配！");
            throw exception;
        }
        
        // 账号与密码校验
        username = username.trim();
        String sql="select * from t_system_user_info where username=? and password=?";
        Object[] args=new Object[]{ username, password };

        User users = (User) this.baseDao.findUniqueBeanByArray(sql, User.class, args);
        if (users == null || !users.getPassword().equals(password)) {
            BadCredentialsException exception = new BadCredentialsException("用户名或密码不匹配！");
            throw exception;
        }
        // 实现 Authentication
        UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
        // 允许子类设置详细属性
        setDetails(request, authRequest);
        // 运行UserDetailsService的loadUserByUsername 再次封装Authentication
        return this.getAuthenticationManager().authenticate(authRequest);
    }

    @Override
    protected String obtainUsername(HttpServletRequest request) {
        Object obj = request.getParameter(USERNAME);
        return null == obj ? "" : obj.toString();
    }

    @Override
    protected String obtainPassword(HttpServletRequest request) {
        Object obj = request.getParameter(PASSWORD);
        return null == obj ? "" : obj.toString();
    }
    
    protected String obtainKaptcha(HttpServletRequest request) {
        Object obj = request.getParameter(KAPTCHA);
        return null == obj ? "" : obj.toString();
    }
    
    @Override
    protected void setDetails(HttpServletRequest request, UsernamePasswordAuthenticationToken authRequest) {
        super.setDetails(request, authRequest);
    }
    
}