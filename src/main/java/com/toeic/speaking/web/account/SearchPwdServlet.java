package com.toeic.speaking.web.account;

import java.io.IOException;
import java.util.Random;

import org.apache.commons.codec.digest.DigestUtils;

import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/search/getPassword")
public class SearchPwdServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/search/getPassword.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String phone = req.getParameter("phone");
		
		System.out.println("userId : " + userId);
		System.out.println("phone : " + phone);
		
		UserDao userDao = UserDao.getInstance();
		User user =  userDao.getUserById(userId);
		
		if(user == null) {
			resp.sendRedirect("getPassword?fail=invalid");
			return;
		}
		
		if(!phone.equals(user.getPhone())) {
			resp.sendRedirect("getPassword?fail=invalid");
			return;
		}
		
		Random rand = new Random(System.currentTimeMillis());
		String TemporaryPwd = String.valueOf(Math.abs(rand.nextInt(990)+10));
		
		String shaPassword = DigestUtils.sha256Hex(TemporaryPwd);
		user.setPassword(shaPassword);
		userDao.updateUser(user);
		
		User TemporaryUser = new User();
		TemporaryUser.setPassword(TemporaryPwd);
		
		req.setAttribute("TemporaryUser", TemporaryUser);
		
		
		req.getRequestDispatcher("/WEB-INF/views/search/outputPwd.jsp").forward(req, resp);
	}

}
