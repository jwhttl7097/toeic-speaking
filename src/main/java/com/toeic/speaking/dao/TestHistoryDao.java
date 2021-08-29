package com.toeic.speaking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toeic.speaking.dto.mytest.TestHistoryDto;
import com.toeic.speaking.utils.MybatisUtils;
import com.toeic.speaking.vo.TestHistory;

public class TestHistoryDao {

	private static TestHistoryDao instance = new TestHistoryDao();
	private TestHistoryDao() {
      this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();   
    }
    public static TestHistoryDao getInstance() {
       return instance;
    }
   
    private SqlSessionFactory sqlSessionFactory;
    
    /**
     * 나의 시험신청 내역에 시험신청 정보를 등록한다.
     * @param testHistory 시험신청정보
     */
    public void insertTestHistory(TestHistory testHistory) {
    	SqlSession session = sqlSessionFactory.openSession(true);
    	session.insert("insertTestHistory", testHistory);
    	session.close();
    }
    
    /**
     * 시험일정 모두 불러옴
     * @param userId
     * @return
     */
    public List<TestHistoryDto> getAllTestHistoryByUserId(String userId){
    	SqlSession session = sqlSessionFactory.openSession();
    	List<TestHistoryDto> testHistorys = session.selectList("testHistorys.getAllTestHistoryByUserId", userId);
    	session.close();
    	return testHistorys;
    }
    
    /**
     * 시험일정 최근 3개만 불러옴
     * @param userId
     * @return
     */
    public List<TestHistoryDto> getTestHistoryByUserId(String userId){
    	SqlSession session = sqlSessionFactory.openSession();
    	List<TestHistoryDto> testHistorys = session.selectList("testHistorys.getTestHistoryByUserId", userId);
    	session.close();
    	return testHistorys;
    }
    
    /**
     * 시험접수 취소
     * @param testNo 시험번호
     */
    public void deleteTestHistory(TestHistoryDto testHitoryDto) {
        SqlSession session = sqlSessionFactory.openSession(true);
        session.update("testHistorys.deleteTestHistory", testHitoryDto);
        session.close();
    }
    
    /**
     * 맵객체를 전달해서 페이징에서 화면에 보여줄 데이터갯수를 불러온다.
     * @param param 맵객체
     * @return
     */
    public int getTotalRows(Map<String, Object> param) {
        SqlSession session = sqlSessionFactory.openSession();
        int totalRows = session.selectOne("testHistorys.getTotalRows", param);
        session.close();
        return totalRows;
     }
     
    /**
     * 맵객체를 전달하여 페이징에 필요한 내 시험신청 정보들을 획득한다.
     * @param param beginIndex, endIndex, userId를 맵객체에 담아서 전달한다.
     * @return
     */
     public List<TestHistoryDto> getMyTestLists(Map<String, Object> param){
        SqlSession session = sqlSessionFactory.openSession();
        List<TestHistoryDto> myTestLists = session.selectList("testHistorys.getMyTestLists", param);
        session.close();
        return myTestLists;
     }
     
     
     public void updateTestHistory(TestHistory history) {
     	SqlSession session = sqlSessionFactory.openSession(true);
     	session.selectOne("updateTestHistory",history);
     	session.close();
     }
     
     public List<TestHistory> getAllTestHistoryByTestNo(int no){
     	SqlSession session = sqlSessionFactory.openSession();
     	List<TestHistory> his = session.selectList("getAllTestHistoryByTestNo", no);
     	session.close();
     	return his;
     }
     
     public List<TestHistory> getAllTestHistoryByCentertNo(int no){
     	SqlSession session = sqlSessionFactory.openSession();
     	List<TestHistory> his = session.selectList("getAllTestHistoryByCentertNo", no);
     	session.close();
     	return his;
     }
     
     public TestHistory getTestHistoryByTestNo(int no) {
     	SqlSession session = sqlSessionFactory.openSession();
     	TestHistory his = session.selectOne("getTestHistoryByTestNo",no);
     	session.close();
     	return his;
     }
}
