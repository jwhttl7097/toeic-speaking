package com.toeic.speaking.web.schedule;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import com.google.gson.Gson;
import com.toeic.speaking.dao.ScheduleDao;
import com.toeic.speaking.vo.Schedule;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test") 
public class ScheduleServlet extends HttpServlet{
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm.dd (E)");
	
	ScheduleDao scheduleDao = ScheduleDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	String testName = req.getParameter("name");
	
	List<Schedule> schedules = scheduleDao.getSchedulesByTestName(testName);
	
	Gson gson = new Gson();
	String JsonText = gson.toJson(schedules);
	
	resp.setContentType("application/json; charset=utf-8");
	PrintWriter writer = resp.getWriter();
	writer.println(JsonText);
	}
}
