package com.toeic.speaking.jgs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toeic.speaking.utils.MybatisUtils;
import com.toeic.speaking.vo.UserTestHistory;

public class UserTestHistoryDto {
private static SqlSessionFactory sqlSessionFactory;
	
	private static UserTestHistoryDto instance = new UserTestHistoryDto();
	private UserTestHistoryDto() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	public static UserTestHistoryDto getinstance() {
		return instance;
	}
	
	public List<UserTestHistory> getUserHistoryByUserId(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		List<UserTestHistory> dtos = session.selectList("getUserHistoryByUserId",userId);
		session.close();
		return dtos;
	}

}
