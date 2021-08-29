package com.toeic.speaking.web.schedule;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.toeic.speaking.dao.ScheduleDao;
import com.toeic.speaking.dto.reception.OnlieReceptionScheduleDto;
import com.toeic.speaking.vo.Schedule;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/list")
public class ScheduleLists extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ScheduleDao scheduleDao = ScheduleDao.getInstance();
		List<Schedule> schedules = scheduleDao.getAllSchedules();
		
		
		Date nowTime = new Date();
		
		req.setAttribute("schedules", schedules);
		req.setAttribute("nowTime", nowTime);
		
		String[] names = {"Speaking Test", "WritingTest","SpeakingWritingTest"};
		req.setAttribute("names", names);
		
		List<OnlieReceptionScheduleDto> orsds = scheduleDao.getOnlieReceptionSchedule();
		req.setAttribute("orsds", orsds);
		
		req.getRequestDispatcher("/WEB-INF/views/schedule/schedule.jsp").forward(req, resp);
	}

}
