package com.toeic.speaking.web.myTest;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import com.toeic.speaking.dao.TestHistoryDao;
import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.dto.mytest.TestHistoryDto;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/mytest/list")
public class ListServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		User loginedUser = (User) session.getAttribute("LOGINED_USER");
		
		if(loginedUser == null) {
			resp.sendRedirect("../login?fail=deny&job=" + URLEncoder.encode("마이테스트 페이지는 로그인 이후 이용가능합니다.", "utf-8"));
			return;
		}
		
		String loginedUserId = loginedUser.getUserId();
		
		TestHistoryDao testHistoryDao = TestHistoryDao.getInstance();
		List<TestHistoryDto> testHistoryDtos = testHistoryDao.getTestHistoryByUserId(loginedUserId);
		req.setAttribute("testHistoryDtos", testHistoryDtos);
		
		UserDao userDao = UserDao.getInstance();
		User user = userDao.getUserById(loginedUserId);
		req.setAttribute("user", user);
		
		
		req.getRequestDispatcher("/WEB-INF/views/mytest/list.jsp").forward(req, resp);
	}
}
