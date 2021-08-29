package com.toeic.speaking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toeic.speaking.dto.reception.OnlieReceptionScheduleDto;
import com.toeic.speaking.utils.MybatisUtils;
import com.toeic.speaking.vo.Schedule;

public class ScheduleDao {

	private static ScheduleDao instance = new ScheduleDao();
	private ScheduleDao() {
      this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();   
    }
    public static ScheduleDao getInstance() {
       return instance;
    }
   
    private SqlSessionFactory sqlSessionFactory;
    
    public List<Schedule> getScheduleBySubject(String subject) {
    	SqlSession session = sqlSessionFactory.openSession();
    	List<Schedule> schedulesBySubject = session.selectList("schedules.getScheduleBySubject", subject);
    	session.close();
    	return schedulesBySubject;
    }
    
    /**
     * 온라인접수 페이지에 표시될 시험번호, 시험일, 시험마감일, 성정발표예정일 정보를 획득한다.
     * @return 시험일정 정보
     */
    public List<OnlieReceptionScheduleDto> getOnlieReceptionSchedule() {
    	SqlSession session = sqlSessionFactory.openSession();
    	List<OnlieReceptionScheduleDto> orsds = session.selectList("schedules.getOnlieReceptionSchedule");
    	session.close();
    	return orsds;
    }
    
    /**
     * 접수상태인 시험일정을 가져오기
     * @return 접수상태인 시험일정들
     */
    public List<OnlieReceptionScheduleDto> getOnlieReceptionScheduleOnlyStatus() {
    	SqlSession session = sqlSessionFactory.openSession();
    	List<OnlieReceptionScheduleDto> orsdStatus = session.selectList("schedules.getOnlieReceptionScheduleOnlyStatus");
    	session.close();
    	return orsdStatus;
    }
    
    /**
     * 시험번호로 시험일정을 가져오기
     * @param testNo 테스트 번호
     * @return
     */
    public OnlieReceptionScheduleDto getTestDateByNo(int testNo) {
    	SqlSession session = sqlSessionFactory.openSession();
    	OnlieReceptionScheduleDto testDateByNo = session.selectOne("getTestDateByNo", testNo);
    	session.close();
    	return testDateByNo;
    }
    
    /**
     * 시험일정 신청원인 dto를 전달받아서 신청인원을 update 해준다.
     * @param testDateByNo 시험일정 dto
     */
    public void updateRegistCount (OnlieReceptionScheduleDto testDateByNo) {
    	SqlSession session = sqlSessionFactory.openSession(true);
    	session.update("updateRegistCount", testDateByNo);
    	session.close();
    }
    
    
    /**
     * 비긴인덱스 엔드인덱스를 맵 객체에 담아 맵으로 카드 캐러셀에 담을 시험일정들을 획득한다.
     * @param map 비긴인덱스 엔드인덱스를 맵 객체 
     * @return
     */
    public List<Schedule> getCardSchedule(Map<String, Object> map) {
    	SqlSession session = sqlSessionFactory.openSession();
    	List<Schedule> cardSchedule = session.selectList("schedules.getCardSchedule", map);
    	session.close();
    	return cardSchedule;
    }
    
    public int getTotalRows(Map<String, Object> map) {
    	SqlSession session = sqlSessionFactory.openSession();
    	int totalRows = session.selectOne("schedules.getTotalRows", map);
    	session.close();
    	return totalRows;
    }
    
    
    public void insertNewSchedule(Schedule schedule) {
    	SqlSession session = sqlSessionFactory.openSession(true);
    	session.insert("insertNewSchedule", schedule);
    	session.close();
    }
    
    public void updateSchedule(Schedule schedule) {
    	SqlSession session = sqlSessionFactory.openSession(true);
    	session.update("updateSchedule",schedule);
    	session.close();
    }
    
    public void deleteScheduleByNo(int testNo) {
    	SqlSession session = sqlSessionFactory.openSession(true);
    	session.selectOne("deleteScheduleByNo", testNo);
    	session.close();
    }
    
    public List<Schedule> getAllSchedules(){
    	SqlSession session = sqlSessionFactory.openSession();
    	List<Schedule> schedules = session.selectList("getAllSchedules");
    	session.close();
    	return schedules;
    }
    
    public Schedule getScheduleByTestNo(int testNo) {
    	SqlSession session = sqlSessionFactory.openSession();
    	Schedule schedule = session.selectOne("getScheduleByTestNo", testNo);
    	session.close();
    	return schedule;
    }
    
    public Schedule getScheduleByDate(String testDate) {
    	SqlSession session = sqlSessionFactory.openSession();
    	Schedule schedule = session.selectOne("getScheduleByDate", testDate);
    	session.close();
    	return schedule;
    }
    
    public List<Schedule> getSchedulesByTestName(String testNmae){
    	SqlSession session = sqlSessionFactory.openSession();
    	List<Schedule> schedules = session.selectList("getSchedulesByTestName", testNmae);
    	session.close();
    	return schedules;
    }
    
    public int getRowCount(Map<String, Object> condition) {
    	SqlSession session = sqlSessionFactory.openSession();
    	int count = session.selectOne("getRowCount",condition);
    	session.close();
    	return count;
    }
    
    public List<Schedule> getAllschedulesforPaging(Map<String, Object> condition){
    	SqlSession session = sqlSessionFactory.openSession();
    	List<Schedule> schedules = session.selectList("getAllschedulesforPaging",condition);
    	session.close();
    	return schedules;
    }
    
    public int getSpeakingTestCount() {
    	SqlSession session = sqlSessionFactory.openSession();
    	int num = session.selectOne("getSpeakingTestCount");
    	session.clearCache();
    	return num;
    }
    
    public int getWritingTestCount() {
    	SqlSession session = sqlSessionFactory.openSession();
    	int num = session.selectOne("getWritingTestCount");
    	session.clearCache();
    	return num;
    }
    
    public int getSpeakingWritingTestCount() {
    	SqlSession session = sqlSessionFactory.openSession();
    	int num = session.selectOne("getSpeakingWritingTestCount");
    	session.clearCache();
    	return num;
    }
    
}
