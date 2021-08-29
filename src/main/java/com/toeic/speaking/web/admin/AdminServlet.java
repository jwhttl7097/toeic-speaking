package com.toeic.speaking.web.admin;

import java.io.IOException;

import com.toeic.speaking.dao.ScheduleDao;
import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User loginedUser = (User)session.getAttribute("LOGINED_USER");
		
		if (loginedUser == null) {
			resp.sendRedirect("main");
			return;
		}
		if (loginedUser.getAdmin().equals("N")) {
			resp.sendRedirect("main");
			return;
		}
		
		ScheduleDao scheduleDao = ScheduleDao.getInstance();
		UserDao userDao = UserDao.getInstance();
		int oneN = userDao.didntTakesExamOneMonthAgo();
		int oneY = userDao.takesExamOneMonthAgo();
		int twoN = userDao.didnttakesExamTwoMonthAgo();
		int twoY = userDao.takesExamTwoMonthAgo();
		int threeN = userDao.didnttakesExamThreeMonthAgo();
		int threeY = userDao.takesExamThreeMonthAgo();
		
		req.setAttribute("oneN", oneN);
		req.setAttribute("oneY", oneY);
		req.setAttribute("twoN", twoN);
		req.setAttribute("twoY", twoY);
		req.setAttribute("threeN", threeN);
		req.setAttribute("threeY", threeY);
		
		int spNo = scheduleDao.getSpeakingTestCount();
		int wrNo = scheduleDao.getWritingTestCount();
		int spwrNo = scheduleDao.getSpeakingWritingTestCount();
		
		req.setAttribute("spNo", spNo);
		req.setAttribute("wrNo", wrNo);
		req.setAttribute("spwrNo", spwrNo);
		
		req.getRequestDispatcher("/WEB-INF/views/admin/admin.jsp").forward(req, resp);
		
	}
}
