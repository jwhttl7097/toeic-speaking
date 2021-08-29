package com.toeic.speaking.web.schedule;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.toeic.speaking.dao.LocationDao;
import com.toeic.speaking.dao.ScheduleDao;
import com.toeic.speaking.vo.Location;
import com.toeic.speaking.vo.Schedule;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addTest")
public class InsertNewScheduleServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Date nowTime = new Date();
		ScheduleDao scheduleDao = ScheduleDao.getInstance();
		List<Schedule> schedules = scheduleDao.getAllSchedules();
		LocationDao locationDao = LocationDao.getInstance();
		List<Location> locations = locationDao.getAllLocations();
		req.setAttribute("locations", locations);
		req.setAttribute("nowTime", nowTime);
		req.setAttribute("schedules", schedules);
		req.getRequestDispatcher("/WEB-INF/views/schedule/addTestForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		
		String test = req.getParameter("test");
		
		String testDate =  req.getParameter("testDate");
//		String testDate2 =  req.getParameter("testDate");
		int idx = testDate.indexOf("T");
		
		String Tdate = testDate.substring(0,idx);;
		String Thour = testDate.substring(idx+1);
//		String Tdatehour = testDate.replace("T", " "); 
		
		String receipt = req.getParameter("receipt");
		String Rdatehour = receipt.replace("T", " "); 
		
		String deadline = req.getParameter("deadline");
		String Ddatehour = deadline.replace("T", " "); 
		
		String expectedDate = req.getParameter("expectedDate");
		String Edatehour = expectedDate.replace("T", " "); 
		
		int center = Integer.parseInt(req.getParameter("center"));
		
		ScheduleDao scheduleDao = ScheduleDao.getInstance();
		Schedule savedSchedule = scheduleDao.getScheduleByDate(Tdate);
			
		if(savedSchedule != null) {
			resp.sendRedirect("addTestform?fail=exist");
			return;
		}
			
		Schedule schedule = new Schedule();
		schedule.setTestName(test);
		schedule.setCenterNo(center);
		schedule.setTestStatus("Y");
		try {
			schedule.setTestDate(sdf2.parse(Tdate));
			schedule.setTestTime(Thour);
			schedule.setReceiptDate(sdf.parse(Rdatehour));
			schedule.setDeadLineDate(sdf.parse(Ddatehour));
			schedule.setExpectedDate(sdf.parse(Edatehour));
			schedule.setAnnouncementDate(sdf.parse(Edatehour));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		scheduleDao.insertNewSchedule(schedule);
		resp.sendRedirect("admin");
		
	}
}
