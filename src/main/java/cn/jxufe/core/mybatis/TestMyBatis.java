package cn.jxufe.core.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import cn.jxufe.core.web.domain.MyBatis;

public class TestMyBatis {
	
    public static SqlSessionFactory sqlSessionFactory = MyBatisUtil.getSqlSessionFactory();

    public static void main(String[] args) {
        testAdd();
        //getUser();
    }

    public static void testAdd() {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
        	MyBatisMapper userMapper = sqlSession.getMapper(MyBatisMapper.class);
        	MyBatis user = new MyBatis("lisi", "123456");
            userMapper.insertUser(user);
            sqlSession.commit();// 这里一定要提交，不然数据进不去数据库中
        } finally {
            sqlSession.close();
        }
    }

    public static void getUser() {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
        	MyBatisMapper userMapper = sqlSession.getMapper(MyBatisMapper.class);
        	MyBatis user = userMapper.getUser("lisi");
            System.out.println("name: " + user.getUsername() + "|age: "
                    + user.getPassword());
        } finally {
            sqlSession.close();
        }
    }
}