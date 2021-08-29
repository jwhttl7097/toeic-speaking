package com.toeic.speaking.web.myInfo;

import java.io.IOException;
import java.util.Date;

import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/myInfo/withdrawal")
public class SetWithdrawal extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User loginedUser = (User) session.getAttribute("LOGINED_USER");
		
		UserDao userDao = UserDao.getInstance();
		User user  = new User();
		user.setUserId(loginedUser.getUserId());
		user.setDeletedDate(new Date());
		user.setStatus("Y");
		userDao.deleteUser(user);
		
		if(session != null) {
			session.invalidate();
		}
		
		resp.sendRedirect("../main");
	}
}
