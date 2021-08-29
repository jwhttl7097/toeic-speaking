package com.toeic.speaking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toeic.speaking.utils.MybatisUtils;
import com.toeic.speaking.vo.User;

public class UserDao {
	private static UserDao instance = new UserDao();
	private UserDao() {
      this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();   
    }
    public static UserDao getInstance() {
       return instance;
    }
   
    private SqlSessionFactory sqlSessionFactory;
    
    /**
     * 유저객체를 전달받아 유저테이블에 저장한다.
     * @param user 유저객체
     */
    public void insertUser(User user) {
    	SqlSession session = sqlSessionFactory.openSession(true);
    	session.insert("insertUser", user);
    	session.close();
    }
    
    
    /**
	 * 업데이트된 로그인유저 정보를 USER 테이블에 저장한다.
	 * @param loginUser
	 */
	public void updateLoginUser(User loginUser) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("updateLoginUser", loginUser);
		session.close();
	}
	
	/**
     * 아이디로 유저정보 불러오기
     * @param userId 
     * @return
     */
    public User getUserById(String userId){
    	SqlSession session = sqlSessionFactory.openSession();
    	User users = session.selectOne("users.getUserById", userId);
    	session.close();
    	return users;
    }
    
    /**
     * 휴대폰번호로 유저정보 조회하기
     * @param phone 휴대폰번호
     * @return
     */
    public User getUserByPhone(String phone){
    	SqlSession session = sqlSessionFactory.openSession();
    	User users = session.selectOne("users.getUserByPhone", phone);
    	session.close();
    	return users;
    }
    
    /**
     * 유저정보 변경
     * @param user
     */
    public void updateUser(User user) {
    	SqlSession session = sqlSessionFactory.openSession(true);
    	session.update("users.updateUser", user);
    	session.close();
    }
    
    /**
     * 유저정보로 탈퇴하기
     * @param user 유저정보
     */
    public void deleteUser(User user) {
    	SqlSession session = sqlSessionFactory.openSession(true);
    	session.update("users.deleteUser", user);
    	session.close();
    	
    }
    
    
    public List<User> getAllusers(){
    	SqlSession session = sqlSessionFactory.openSession();
    	List<User> users = session.selectList("getAllusers");
    	session.close();
    	return users;
    }
    
    public User getUserByUserId(String userId) {
    	SqlSession session = sqlSessionFactory.openSession();
    	User user = session.selectOne("getUserByUserId",userId);
    	session.close();
    	return user;
    }
    
    public int getRowsCount(Map<String, Object>condition) {
    	SqlSession session = sqlSessionFactory.openSession();
    	int rows = session.selectOne("getRowsCount", condition);
    	session.close();
    	return rows;
    }
    
    public List<User> getAllUsersMapWithPaging(Map<String, Object> condition){
    	SqlSession session = sqlSessionFactory.openSession();
    	List<User> users = session.selectList("getAllUsersMapWithPaging", condition);
    	session.close();
    	return users;
    }
    
    public int takesExamOneMonthAgo() {
    	SqlSession session = sqlSessionFactory.openSession();
    	int val = session.selectOne("takesExamOneMonthAgo");
    	session.close();
    	return val;
    }
    
    public int didntTakesExamOneMonthAgo() {
    	SqlSession session = sqlSessionFactory.openSession();
    	int val = session.selectOne("didntTakesExamOneMonthAgo");
    	session.close();
    	return val;
    }
    
    public int takesExamTwoMonthAgo() {
    	SqlSession session = sqlSessionFactory.openSession();
    	int val = session.selectOne("takesExamTwoMonthAgo");
    	session.close();
    	return val;
    }
    
    public int didnttakesExamTwoMonthAgo() {
    	SqlSession session = sqlSessionFactory.openSession();
    	int val = session.selectOne("didnttakesExamTwoMonthAgo");
    	session.close();
    	return val;
    }
    
    
    public int takesExamThreeMonthAgo() {
    	SqlSession session = sqlSessionFactory.openSession();
    	int val = session.selectOne("takesExamThreeMonthAgo");
    	session.close();
    	return val;
    }
    
    public int didnttakesExamThreeMonthAgo() {
    	SqlSession session = sqlSessionFactory.openSession();
    	int val = session.selectOne("didnttakesExamThreeMonthAgo");
    	session.close();
    	return val;
    }
}
