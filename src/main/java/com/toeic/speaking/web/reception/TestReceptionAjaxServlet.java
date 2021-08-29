package com.toeic.speaking.web.reception;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.toeic.speaking.dao.LocationDao;
import com.toeic.speaking.dao.ScheduleDao;
import com.toeic.speaking.dto.reception.TestReceptionCenterInfoByLocationDto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/online_reception/testReceptionAjax")
public class TestReceptionAjaxServlet extends HttpServlet {
	
	ScheduleDao scheduleDao = ScheduleDao.getInstance();
	LocationDao locationDao = LocationDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 센터ajax시작
		// ajax에서 보내온 센터지역명과 그 시험번호 
		String centerLocation = req.getParameter("centerLocation");
		String testDate = req.getParameter("testDate");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("centerLocation", centerLocation);
		map.put("testDate", testDate);
		
		List<TestReceptionCenterInfoByLocationDto> centerInfos = locationDao.getCenterInfoByLocation(map);
		
		// 획득 센터정보를 json형식의 텍스트로 변환
		
		Gson gson = new Gson();
		String jsonText = gson.toJson(centerInfos);
//		System.out.println("json값으로 변경됬는지 확인 "+jsonText);
		// JSON 형식의 텍스트로 변환된 센터정보를 응답으로 보내기
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter writer = resp.getWriter();
		writer.println(jsonText);
	}
	
}
