package com.toeic.speaking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toeic.speaking.dto.reception.CenterCountDto;
import com.toeic.speaking.dto.reception.TestReceptionCenterInfoByLocationDto;
import com.toeic.speaking.utils.MybatisUtils;
import com.toeic.speaking.vo.Location;
import com.toeic.speaking.vo.ScheduleLocation;

public class LocationDao {

	private static LocationDao instance = new LocationDao();
	private LocationDao() {
      this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();   
    }
    public static LocationDao getInstance() {
       return instance;
    }
   
    private SqlSessionFactory sqlSessionFactory;
    
    /**
     * 센터 지역별 지역명과 센터카운트수 획득하기
     * @return 센터지역명과 센터카운트수
     */
    public List<CenterCountDto> getCenterLocationCnt() {
    	SqlSession session = sqlSessionFactory.openSession();
    	List<CenterCountDto> locationCnts = session.selectList("getCenterLocationCnt");
    	session.close();
    	return locationCnts;
    }
    
    /**
     * 센터정보들 획득하기
     * @return 센터정보
     */
    public List<Location> getAllLocations() {
    	SqlSession session = sqlSessionFactory.openSession();
    	List<Location> locations = session.selectList("getAllLocations");
    	session.close();
    	return locations;
    }
    
    /**
     * 센터지역으로 센터정보들을 가져온다.
     * @param centerLocation 센터지역명
     * @return 센터정보들
     */
    public List<TestReceptionCenterInfoByLocationDto> getCenterInfoByLocation(Map<String, Object> map) {
    	SqlSession session = sqlSessionFactory.openSession();
    	List<TestReceptionCenterInfoByLocationDto> centerInfos = session.selectList("getCenterInfoByLocation", map);
    	session.close();
    	return centerInfos;
    }
    
    
    public void insertNewCenter(Location newCenter) {
 	   SqlSession session = sqlSessionFactory.openSession(true);
 	   session.insert("insertNewCenter",newCenter);
 	   session.close();
    } 
     
    public void updateCenter(Location location) {
 	   SqlSession session = sqlSessionFactory.openSession(true);
 	   session.update("updateCenter",location);
 	   session.close();
    }
     
     public List<Location> getAllLocationsName(){
     	SqlSession session = sqlSessionFactory.openSession();
     	List<Location> locations = session.selectList("getAllLocationsName");
     	session.close();
     	return locations;
     }
     
     public List<Location> getLocationByCityName(String cityName){
     	SqlSession session = sqlSessionFactory.openSession();
     	List<Location> locs = session.selectList("getLocationByCityName", cityName);
     	session.close();
     	return locs;
     }
     
     public Location getLocationByCenerNo(int centerNo) {
     	SqlSession session = sqlSessionFactory.openSession();
     	Location loc = session.selectOne("getLocationByCenerNo", centerNo);
     	session.close();
     	return loc;
     }
     
     public List<ScheduleLocation> getDtoByCenterLocation(String name){
     	SqlSession session = sqlSessionFactory.openSession();
     	List<ScheduleLocation> locs = session.selectList("getDtoByCenterLocation",name);
     	session.close();
     	return locs;
     }
     
     public Location getLocationByCenerName(String name){
     	SqlSession session = sqlSessionFactory.openSession();
     	Location loc = session.selectOne("getLocationByCenerName", name);
     	session.close();
     	return loc;
     }
}
