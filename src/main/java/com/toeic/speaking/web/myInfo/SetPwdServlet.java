package com.toeic.speaking.web.myInfo;

import java.io.IOException;

import org.apache.commons.codec.digest.DigestUtils;

import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/myInfo/setPassword")
public class SetPwdServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/myInfo/setPassword.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User loginedUser = (User) session.getAttribute("LOGINED_USER");
		
		
		String beforePwd = req.getParameter("beforePassword");
		String shaBeforePwd = DigestUtils.sha256Hex(beforePwd);
		String newPwd = req.getParameter("newPassword");
		String confirmPwd = req.getParameter("confirmPassword");
		
		if(loginedUser == null) {
			resp.sendRedirect("setPassword?fail=invalid");
			return;
		}
		
		if(!loginedUser.getPassword().equals(shaBeforePwd)) {
			resp.sendRedirect("setPassword?fail=invalid");
			return;
		}
		
		if(!newPwd.equals(confirmPwd)) {
			resp.sendRedirect("setPassword?fail=invalid");
			return;
		}
		
		UserDao userDao = UserDao.getInstance();
		User user = userDao.getUserById(loginedUser.getUserId());
		
		String shaPassword = DigestUtils.sha256Hex(newPwd);
		user.setPassword(shaPassword);
		userDao.updateUser(user);
		
		resp.sendRedirect("../main");
	}
	
	
}
