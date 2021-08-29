package com.toeic.speaking.web.account;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/joinAjax")
public class JoinAjaxServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 조인ajax시작
		String userId = req.getParameter("userId");
		
		UserDao userDao = UserDao.getInstance();
		User users = userDao.getUserById(userId);
		
		// 획득 센터정보를 json형식의 텍스트로 변환
		Gson gson = new Gson();
		String jsonText = gson.toJson(users);
		// System.out.println("json값으로 변경됬는지 확인 "+jsonText);
		// JSON 형식의 텍스트로 변환된 센터정보를 응답으로 보내기
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter writer = resp.getWriter();
		writer.println(jsonText);
	}
	
}
