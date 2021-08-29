package com.toeic.speaking.web.myInfo;

import java.io.IOException;

import org.apache.commons.codec.digest.DigestUtils;

import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/myInfo/confirmLogin")
public class ConfirmLoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/myInfo/confirmPwd.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		HttpSession session = req.getSession();
		User loginedUser = (User) session.getAttribute("LOGINED_USER");
		
		String confirmPassword = req.getParameter("password");
		
		String shaPassword = DigestUtils.sha256Hex(confirmPassword);
		
		
		if(loginedUser == null) {
			resp.sendRedirect("confirmLogin?fail=invalid");
			return;
		}
		
		if(!loginedUser.getStatus().equals("N")) {
			resp.sendRedirect("confirmLogin?fail=invalid");
			return;
		}
		
		if(!loginedUser.getPassword().equals(shaPassword)) {
			resp.sendRedirect("confirmLogin?fail=invalid");
			return;
		}
		
		resp.sendRedirect("checkPassword");
	}
}
