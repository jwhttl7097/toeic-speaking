package com.toeic.speaking.web.schedule;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.toeic.speaking.dao.ScheduleDao;
import com.toeic.speaking.jgs.dao.ScheduleLocationDto;
import com.toeic.speaking.vo.Schedule;
import com.toeic.speaking.vo.ScheduleLocation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet
public class UpdateScheduleServletBackUp extends HttpServlet{
	ScheduleDao scheduleDao = ScheduleDao.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Date nowTime = new Date();
		List<Schedule> schedules = scheduleDao.getAllSchedules();
		ScheduleLocationDto scheduleLocationDto = ScheduleLocationDto.getinstance();
		List<ScheduleLocation> scloDto = scheduleLocationDto.scheduleLocationDto();
		req.setAttribute("nowTime", nowTime);
		req.setAttribute("schedules", schedules);
		req.setAttribute("scloDto", scloDto);
		req.getRequestDispatcher("/WEB-INF/views/schedule/modifyForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		String value = req.getParameter("test");
		int testNo = Integer.parseInt(value.substring(0,5));
		int centerNo = Integer.parseInt(req.getParameter("center"));
		
		String statusValue = req.getParameter("statusValue");
		int quota = Integer.parseInt(req.getParameter("quota"));
		
		String testDate = req.getParameter("testDate");
		String Tdate = testDate.replace("T", " ");
		
		String receipt = req.getParameter("receipt");
		String Rdate = receipt.replace("T", " ");
		
		String deadline = req.getParameter("deadline");
		String Ddate = deadline.replace("T", " ");
		
		String expectedDate = req.getParameter("expectedDate");
		String Edate = expectedDate.replace("T", " ");
		
		Schedule schedule = scheduleDao.getScheduleByTestNo(testNo);
		
		schedule.setTestStatus(statusValue);
		schedule.setQuota(quota);
		schedule.setCenterNo(centerNo);
		
		try {
			schedule.setTestDate(sdf.parse(Tdate));
			schedule.setReceiptDate(sdf.parse(Rdate));
			schedule.setDeadLineDate(sdf.parse(Ddate));
			schedule.setExpectedDate(sdf.parse(Edate));
			schedule.setAnnouncementDate(sdf.parse(Edate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		scheduleDao.updateSchedule(schedule);
		resp.sendRedirect("admin");
		
	}
}
