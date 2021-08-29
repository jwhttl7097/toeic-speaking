package com.toeic.speaking.web.user;

import java.io.IOException;

import com.toeic.speaking.dao.TestHistoryDao;
import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.vo.TestHistory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/modifyUser")
public class UpdateUserServlet extends HttpServlet{
	
	TestHistoryDao testHistoryDao = TestHistoryDao.getInstance();
	UserDao userDao = UserDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String value = req.getParameter("testList");
		
		int devider = value.indexOf("T");
		int testNo = Integer.parseInt(value.substring(0,devider));
		
		TestHistory th = testHistoryDao.getTestHistoryByTestNo(testNo);
		
		String sp = req.getParameter("sp");
		String wr = req.getParameter("wr");
		String spwr = req.getParameter("spwr");
		
		if(sp != null) {
			th.setTestScore(sp);
		}
		
		if(wr != null) {
			th.setTestScore2(wr);
		}
		
		if(spwr != null) {
			th.setTestScore3(spwr);
		}
		
//		String addr = req.getParameter("addr");
//		th.setUserAddress(addr);
		
		testHistoryDao.updateTestHistory(th);
		
		////////////////////////////////////////////////////////////////////////
//		String phone = req.getParameter("phone");
//		
//		String email = req.getParameter("email");
//		
//		User user = userDao.getUserByUserId(userId);
//		
//		user.setPhone(phone);
//		user.setEmail(email);
//		
//		userDao.updateUser(user);
		
		resp.sendRedirect("admin");
	}
}
