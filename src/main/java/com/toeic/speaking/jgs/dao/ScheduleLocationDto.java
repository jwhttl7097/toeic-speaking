package com.toeic.speaking.jgs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toeic.speaking.utils.MybatisUtils;
import com.toeic.speaking.vo.ScheduleLocation;

public class ScheduleLocationDto {
	private static SqlSessionFactory sqlSessionFactory;
	
	private static ScheduleLocationDto instance = new ScheduleLocationDto();
	private ScheduleLocationDto() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	public static ScheduleLocationDto getinstance() {
		return instance;
	}
	
	
	public List<ScheduleLocation> scheduleLocationDto(){
		SqlSession session = sqlSessionFactory.openSession();
		List<ScheduleLocation> sclos = session.selectList("scheduleLocationDto");
		session.close();
		return sclos;
	}
	
	public List<ScheduleLocation> getdtoByCetnerName(String name){
		SqlSession session = sqlSessionFactory.openSession();
		List<ScheduleLocation> dtos = session.selectList("getdtoByCetnerName",name);
		session.close();
		return dtos;
	}
	
	public ScheduleLocation getDtoByTestNo(int testNo) {
		SqlSession session = sqlSessionFactory.openSession();
		ScheduleLocation loc = session.selectOne("getDtoByTestNo",testNo);
		session.close();
		return loc;
	}
	
	
}
