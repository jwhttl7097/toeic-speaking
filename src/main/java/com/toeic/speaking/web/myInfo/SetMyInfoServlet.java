package com.toeic.speaking.web.myInfo;

import java.io.IOException;

import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/myInfo/setMyInfo")
public class SetMyInfoServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User loginedUser = (User) session.getAttribute("LOGINED_USER");
		
		String logiedUserId = loginedUser.getUserId();
		
		UserDao userDao = UserDao.getInstance();
		User user = userDao.getUserById(logiedUserId);
		
		req.setAttribute("user", user);
		
		req.getRequestDispatcher("/WEB-INF/views/myInfo/setMyInfo.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		
		HttpSession session = req.getSession();
		User loginedUser = (User) session.getAttribute("LOGINED_USER");
		
		String loginedUserId = loginedUser.getUserId();
		
		UserDao userDao = UserDao.getInstance();
		User user = userDao.getUserById(loginedUserId);
		
		user.setPhone(phone);
		user.setEmail(email);
		
		userDao.updateUser(user);
		
		resp.sendRedirect("../main");
	}
	
}
