package com.toeic.speaking.web.center;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.toeic.speaking.dao.LocationDao;
import com.toeic.speaking.jgs.dao.ScheduleLocationDto;
import com.toeic.speaking.vo.Location;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteCenter")
public class DeleteCenterServlet extends HttpServlet{
	LocationDao locationDao = LocationDao.getInstance();
	ScheduleLocationDto dto = ScheduleLocationDto.getinstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Location> locsName = locationDao.getAllLocationsName();
		req.setAttribute("locsName", locsName);
		
		req.getRequestDispatcher("/WEB-INF/views/center/deleteForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String value = req.getParameter("centerOld");
		
		Location savedloc = locationDao.getLocationByCenerName(value);
		
		savedloc.setCenterStatus("Y");
		savedloc.setDeletedDate(new Date());
		
		locationDao.updateCenter(savedloc);
		
		resp.sendRedirect("admin");
		
	}

}
