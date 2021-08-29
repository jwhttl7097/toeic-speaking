package com.toeic.speaking.web.user;

import java.io.IOException;
import java.util.List;

import com.toeic.speaking.jgs.dao.ScheduleHistoryDto;
import com.toeic.speaking.vo.ScheduleHistory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/insertUser")
public class InsertModifyScores extends HttpServlet{
	
	ScheduleHistoryDto dtodto = ScheduleHistoryDto.getinstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userId = req.getParameter("hiddenUD");
		List<ScheduleHistory> users = dtodto.getTotalDtoByUserId(userId);
		
		System.out.println(userId);
		
		req.setAttribute("users", users);
		
		req.getRequestDispatcher("/WEB-INF/views/user/addScore.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}

}
