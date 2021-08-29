package com.toeic.speaking.web.account;

import java.io.IOException;

import org.apache.commons.codec.digest.DigestUtils;

import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/join.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String userId = req.getParameter("userPasswordConfirm");
		String userId = req.getParameter("userId");
		String userPassword = req.getParameter("userPassword");
		String userName = req.getParameter("userName");
		String userBirth = req.getParameter("userBirth");
		String userEmail = req.getParameter("userEmail");
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		
		String shaPassword = DigestUtils.sha256Hex(userPassword);
		
		User user = new User();
		
		user.setUserId(userId);
		user.setPassword(shaPassword);
		user.setUserName(userName);
		user.setBirth(userBirth);
		user.setEmail(userEmail);
		user.setPhone(phone);
		user.setAdmin("N");
		
		UserDao userDao = UserDao.getInstance();
		userDao.insertUser(user);
		
		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}

}
