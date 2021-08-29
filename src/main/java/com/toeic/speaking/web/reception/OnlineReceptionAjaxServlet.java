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
import com.toeic.speaking.vo.Schedule;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/online_reception/onlineReceptionAjax")
public class OnlineReceptionAjaxServlet extends HttpServlet {
	
	ScheduleDao scheduleDao = ScheduleDao.getInstance();
	LocationDao locationDao = LocationDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String subject = req.getParameter("subject");
		if(subject.equals("Writing Test")) {
			subject = "WritingTest";
		} else if (subject.equals("Speaking and Writing Tests")) {
			subject = "SpeakingWritingTest";
		}
		System.out.println("subject Ajax서블릿으로 넘어온 값 확인 : " + subject);
		
		List<Schedule> schedulesBySubject = scheduleDao.getScheduleBySubject(subject);
		
		Gson gson = new Gson();
		String schedules = gson.toJson(schedulesBySubject);
		System.out.println("json값으로 변경됬는지 확인 "+ schedules.toString());
		// JSON 형식의 텍스트로 변환된 센터정보를 응답으로 보내기
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter writer = resp.getWriter();
		writer.write(schedules);
		writer.flush();
		writer.close();
	}
	
}
