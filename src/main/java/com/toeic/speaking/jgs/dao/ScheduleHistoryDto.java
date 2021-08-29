package com.toeic.speaking.jgs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toeic.speaking.utils.MybatisUtils;
import com.toeic.speaking.vo.ScheduleHistory;

public class ScheduleHistoryDto {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	private static ScheduleHistoryDto instance = new ScheduleHistoryDto();
	private ScheduleHistoryDto() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	public static ScheduleHistoryDto getinstance() {
		return instance;
	}
	
	public List<ScheduleHistory> getAllScheduleHistoryDto(){
		SqlSession session = sqlSessionFactory.openSession();
		List<ScheduleHistory> dtos = session.selectList("getAllScheduleHistoryDto");
		session.close();
		return dtos;
	}
	
	public List<ScheduleHistory> getAllDtoByTestNo(int CenterNo){
		SqlSession session = sqlSessionFactory.openSession();
		List<ScheduleHistory> dtos = session.selectList("getAllDtoByTestNo",CenterNo);
		session.close();
		return dtos;
	}
	
    public List<ScheduleHistory> getTotalDtoByUserId (String userid){
    	SqlSession session = sqlSessionFactory.openSession();
    	List<ScheduleHistory> dtos = session.selectList("getTotalDtoByUserId",userid);
    	session.close();
    	return dtos;
    }
    
    public ScheduleHistory getTotalDtoByTestNoWithUserId(Map<String, Object> condition){
    	SqlSession session = sqlSessionFactory.openSession();
    	ScheduleHistory dto = session.selectOne("testHistorys.getTotalDtoByTestNoWithUserId", condition);
    	session.close();
    	return dto;
    }
	
	

}
