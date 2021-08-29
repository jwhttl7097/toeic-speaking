package com.toeic.speaking.web.myTest;

import java.io.IOException;

import com.toeic.speaking.dao.ScheduleDao;
import com.toeic.speaking.dao.TestHistoryDao;
import com.toeic.speaking.dto.mytest.TestHistoryDto;
import com.toeic.speaking.dto.reception.OnlieReceptionScheduleDto;
import com.toeic.speaking.utils.CommonUtils;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/mytest/del")
public class DeleteListServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		User loginedUser = (User) session.getAttribute("LOGINED_USER");

		int testNo = CommonUtils.stringToInt(req.getParameter("testNo"));
		int centerNo = CommonUtils.stringToInt(req.getParameter("centerNo"));

		TestHistoryDto testHistoryDto = new TestHistoryDto();
		testHistoryDto.setCenterNo(centerNo);
		testHistoryDto.setTestNo(testNo);

		TestHistoryDao testHistoryDao = TestHistoryDao.getInstance();
		testHistoryDao.deleteTestHistory(testHistoryDto);
		
		ScheduleDao scheduleDao = ScheduleDao.getInstance();
		OnlieReceptionScheduleDto testDateByNo = scheduleDao.getTestDateByNo(testNo);
		testDateByNo.setRegisterCount(testDateByNo.getRegisterCount()-1);
		if(testDateByNo.getRegisterCount() < 50) {
			testDateByNo.setTestStatus("Y");
		}
		
		scheduleDao.updateRegistCount(testDateByNo);

		resp.sendRedirect("modifyList");
	}

}
