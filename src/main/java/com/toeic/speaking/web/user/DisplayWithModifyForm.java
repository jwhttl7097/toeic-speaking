package com.toeic.speaking.web.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.toeic.speaking.jgs.dao.ScheduleHistoryDto;
import com.toeic.speaking.vo.ScheduleHistory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addModifyDisplayScore")
public class DisplayWithModifyForm extends HttpServlet{
	ScheduleHistoryDto dto = ScheduleHistoryDto.getinstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String value = req.getParameter("byId");
//		// value.substring(0,5);
//		String testNo = value.substring(0,5);
//		// value.substring(6);
//		String userId = value.substring(6);
		
		int devider = value.indexOf("T");
		String userId = value.substring(devider+1);
		int testNo = Integer.parseInt(value.substring(0,devider));
		
		Map<String, Object> condition = new HashMap<String, Object>();
		
		condition.put("userId", userId);
		condition.put("testNo", testNo);
		
		ScheduleHistory data = dto.getTotalDtoByTestNoWithUserId(condition);
		
		Gson gson = new Gson();
		String JsonTextData = gson.toJson(data);
		
		resp.setContentType("application/text; charset=utf-8");
		PrintWriter writer = resp.getWriter();
		writer.println(JsonTextData);
	}

}
