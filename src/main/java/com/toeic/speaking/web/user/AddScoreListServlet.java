//package com.toeic.speaking.web.user;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//
//import com.google.gson.Gson;
//import com.toeic.speaking.dto.ScheduleHistoryDto;
//import com.toeic.speaking.vo.ScheduleHistory;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/addScoreList")
//public class AddScoreListServlet extends HttpServlet{
//	ScheduleHistoryDto listDto = ScheduleHistoryDto.getinstance();
//	
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		int centerNo = Integer.parseInt(req.getParameter("centerNo"));
//		
//		List<ScheduleHistory> centerList = listDto.getAllDtoByTestNo(centerNo);
//		
//		Gson gson = new Gson();
//		String JsonTextData = gson.toJson(centerList);
//		
//		
//		resp.setContentType("application/text; charset=utf-8");
//		PrintWriter writer = resp.getWriter();
//		writer.println(JsonTextData);
//	}
//}
