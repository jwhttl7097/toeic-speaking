package com.toeic.speaking.web.center;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.toeic.speaking.jgs.dao.ScheduleLocationDto;
import com.toeic.speaking.vo.ScheduleLocation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/searchedList")
public class TestList extends HttpServlet{
	ScheduleLocationDto dto = ScheduleLocationDto.getinstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String CenterName = req.getParameter("name");
		System.out.println(CenterName);
		List<ScheduleLocation> sheloc = dto.getdtoByCetnerName(CenterName);
		
		Gson gson = new Gson();
		String JsonTextData = gson.toJson(sheloc);
		System.out.println(JsonTextData);
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter writer = resp.getWriter();
		writer.println(JsonTextData);
	}
	

}
