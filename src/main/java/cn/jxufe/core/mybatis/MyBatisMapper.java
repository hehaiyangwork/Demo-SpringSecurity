package cn.jxufe.core.mybatis;

import cn.jxufe.core.web.domain.MyBatis;


public interface MyBatisMapper {
    public void insertUser(MyBatis user);

    public MyBatis getUser(String name);
}