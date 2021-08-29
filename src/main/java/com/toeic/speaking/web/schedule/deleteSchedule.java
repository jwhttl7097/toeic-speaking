package com.toeic.speaking.web.schedule;

import java.io.IOException;
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

@WebServlet("/deleteTest")
public class deleteSchedule extends HttpServlet{
	
	ScheduleDao scheduleDao = ScheduleDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Date nowTime = new Date();
		ScheduleLocationDto scheduleLocationDto = ScheduleLocationDto.getinstance();
		List<ScheduleLocation> scloDto = scheduleLocationDto.scheduleLocationDto();
		String[] names = {"SpeakingTest", "WritingTest","SpeakingWritingTest"};
		req.setAttribute("nowTime", nowTime);
		req.setAttribute("scloDto", scloDto);
		req.setAttribute("names", names);
		req.getRequestDispatcher("/WEB-INF/views/schedule/deleteForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String value = req.getParameter("test");
		String testNo = value.substring(0,5);
		int TN = Integer.parseInt(testNo);
		
		Schedule update = scheduleDao.getScheduleByTestNo(TN);
		System.out.println("DELETEDSC.GETSTATUS = " + update.getTestStatus());
		update.setTestStatus("N");
		update.setDeletedDate(new Date());
		
		scheduleDao.updateSchedule(update);
		
		resp.sendRedirect("admin");
	}

}
