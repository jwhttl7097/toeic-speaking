package com.toeic.speaking.web.center;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.toeic.speaking.dao.LocationDao;
import com.toeic.speaking.vo.Location;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/modifyCenter")
public class UpdateCenterServlet extends HttpServlet{
	
	LocationDao locationDao = LocationDao.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Location> locs = locationDao.getAllLocations();
		List<Location> locsName = locationDao.getAllLocationsName();
		
		req.setAttribute("locs", locs);
		req.setAttribute("locsName", locsName);
		req.getRequestDispatcher("/WEB-INF/views/center/modifyForm.jsp").forward(req, resp);

		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String location = req.getParameter("location");
		String values = req.getParameter("centerOld");
		int centerNo = Integer.parseInt(values.substring(0,5));
		String centerName = req.getParameter("center");
		int quota = Integer.parseInt(req.getParameter("quota"));
		String centerStatus = req.getParameter("centerStatus");
		
		Location loc = locationDao.getLocationByCenerNo(centerNo);
		
		loc.setCenterLocation(location);
		loc.setCenterName(centerName);
		loc.setQuota(quota);
		if(centerStatus.equals("N")) {
			loc.setDeletedDate(null);
			loc.setCenterStatus(centerStatus);
		}
		
		if(centerStatus.equals("Y")) {
			loc.setCenterStatus(centerStatus);
			loc.setDeletedDate(new Date());
		}
		
		locationDao.updateCenter(loc);
		
		resp.sendRedirect("admin");
	}
}
