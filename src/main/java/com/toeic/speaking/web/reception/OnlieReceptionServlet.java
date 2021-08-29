package com.toeic.speaking.web.reception;

import java.io.IOException;
import java.util.List;

import com.toeic.speaking.dao.ScheduleDao;
import com.toeic.speaking.dao.TestHistoryDao;
import com.toeic.speaking.dto.mytest.TestHistoryDto;
import com.toeic.speaking.dto.reception.OnlieReceptionScheduleDto;
import com.toeic.speaking.vo.Schedule;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/online_reception/onlineReception")
public class OnlieReceptionServlet extends HttpServlet {
	
	ScheduleDao scheduleDao = ScheduleDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		ScheduleDao scheduleDao = ScheduleDao.getInstance();
		List<Schedule> schedulesBySubject = scheduleDao.getScheduleBySubject("Speaking Test");
		req.setAttribute("schedulesBySubject", schedulesBySubject);
		
		req.getRequestDispatcher("/WEB-INF/views/online_reception/onlineReception.jsp").forward(req, resp);
		
	}
}
