//package com.toeic.speaking.web.user;
//
//import java.io.IOException;
//import java.util.List;
//
//import com.toeic.speaking.dao.ScheduleDao;
//import com.toeic.speaking.dto.ScheduleHistoryDto;
//import com.toeic.speaking.vo.Schedule;
//import com.toeic.speaking.vo.ScheduleHistory;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/addScore")
//public class AddScoreServlet extends HttpServlet{
//	ScheduleHistoryDto scheduleHistoryDto = ScheduleHistoryDto.getinstance();
//	ScheduleDao scheduleDao = ScheduleDao.getInstance();
//	
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		List<ScheduleHistory> dtos = scheduleHistoryDto.getAllScheduleHistoryDto();
//		
//		req.setAttribute("dtos", dtos);
//		
//		req.getRequestDispatcher("WEB-INF/views/user/addScore.jsp").forward(req, resp);
//	}
//	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		
//	}
//}
