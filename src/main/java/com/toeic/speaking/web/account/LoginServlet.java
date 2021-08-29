package com.toeic.speaking.web.account;

import java.io.IOException;
import java.net.URLEncoder;

import org.apache.commons.codec.digest.DigestUtils;

import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("WEB-INF/views/loginform.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userId = req.getParameter("userId");
		String pwd = req.getParameter("password");
		
		UserDao userDao = UserDao.getInstance();
		User savedUser = userDao.getUserById(userId);
		
		if(savedUser == null) {
			resp.sendRedirect("login?fail=invalid");
			return;
		}
		
		if(savedUser.getStatus().equals("Y")) {
			resp.sendRedirect("login?fail=deny&job=" + URLEncoder.encode("이미 탈퇴한 회원입니다.", "utf-8"));
			return;
		}
		
		String shaPassword = DigestUtils.sha256Hex(pwd);
		if(!shaPassword.equals(savedUser.getPassword())) {
			resp.sendRedirect("login?fail=deny&job=" + URLEncoder.encode("아이디 혹은 비밀번호가 일치하지 않습니다.", "utf-8"));
			return;
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("LOGINED_USER", savedUser);
		
		resp.sendRedirect("main");
	}
	
}
