package com.toeic.speaking.web.account;

import java.io.IOException;

import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/search/getId")
public class SearchIdServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/search/getId.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		String phone = req.getParameter("phone");
		
		UserDao userDao = UserDao.getInstance();
		User user =  userDao.getUserByPhone(phone);
		
		if(user == null) {
			resp.sendRedirect("getId?fail=invalid");
			return;
		}
		
	
		req.setAttribute("user", user);
		
		req.getRequestDispatcher("/WEB-INF/views/search/outputId.jsp").forward(req, resp);
	}

}
