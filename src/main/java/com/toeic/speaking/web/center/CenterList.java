package com.toeic.speaking.web.center;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.toeic.speaking.dao.LocationDao;
import com.toeic.speaking.vo.Location;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/centerLists")
public class CenterList extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String locations = req.getParameter("location");
		
		LocationDao locDao = LocationDao.getInstance();
		System.out.println(locations);
		List<Location> locs = locDao.getLocationByCityName(locations);
		
		Gson gson = new Gson();
		
		String JsonText = gson.toJson(locs);
		System.out.println(JsonText);
		
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter writer = resp.getWriter();
		writer.println(JsonText);
	}
}
