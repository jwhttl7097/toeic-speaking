package com.toeic.speaking.web.schedule;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import com.google.gson.Gson;
import com.toeic.speaking.dao.ScheduleDao;
import com.toeic.speaking.jgs.dao.ScheduleLocationDto;
import com.toeic.speaking.vo.ScheduleLocation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/displayOld")
public class DisplayOldDataForm extends HttpServlet{
	
	ScheduleDao scheduleDao = ScheduleDao.getInstance();
	ScheduleLocationDto scheduleLocationDto = ScheduleLocationDto.getinstance();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int testNo = Integer.parseInt(req.getParameter("testNo"));
		ScheduleLocation getSc = scheduleLocationDto.getDtoByTestNo(testNo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		String value = sdf2.format(getSc.getTestDate()) + " " + getSc.getTestTime() + ":00";
		  
		getSc.setTestTime(value);
				
		Gson gson = new Gson();
		
		String JsonTextData = gson.toJson(getSc);
		
		
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter writer = resp.getWriter();
		writer.println(JsonTextData);
		
		
	}

}
