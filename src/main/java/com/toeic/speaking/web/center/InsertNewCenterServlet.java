package com.toeic.speaking.web.center;

import java.io.IOException;
import java.util.List;

import com.toeic.speaking.dao.LocationDao;
import com.toeic.speaking.vo.Location;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addCenter")
public class InsertNewCenterServlet extends HttpServlet{
	LocationDao locationDao = LocationDao.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Location> locs = locationDao.getAllLocations();
		List<Location> locsName = locationDao.getAllLocationsName();
		
		req.setAttribute("locs", locs);
		req.setAttribute("locsName", locsName);
		req.getRequestDispatcher("/WEB-INF/views/center/addCenterForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String location = req.getParameter("location");
		String centerName = req.getParameter("centerName");
		int quota = Integer.parseInt(req.getParameter("quota"));
		
		Location loc = new Location();
		
		loc.setCenterLocation(location);
		loc.setCenterName(centerName);
		loc.setQuota(quota);
		
		locationDao.insertNewCenter(loc);
		resp.sendRedirect("admin");
	}

}
