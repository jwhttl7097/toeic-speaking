package com.toeic.speaking.web.reception;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.tomcat.jakartaee.commons.io.IOUtils;

import com.toeic.speaking.dao.LocationDao;
import com.toeic.speaking.dao.ScheduleDao;
import com.toeic.speaking.dao.TestHistoryDao;
import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.dto.mytest.TestHistoryDto;
import com.toeic.speaking.dto.reception.CenterCountDto;
import com.toeic.speaking.dto.reception.OnlieReceptionScheduleDto;
import com.toeic.speaking.utils.CommonUtils;
import com.toeic.speaking.vo.Location;
import com.toeic.speaking.vo.TestHistory;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/online_reception/testReception")
@MultipartConfig
public class TestReceptionServlet extends HttpServlet {
	
	ScheduleDao scheduleDao = ScheduleDao.getInstance();
	LocationDao locationDao = LocationDao.getInstance();
	TestHistoryDao testHistoryDao = TestHistoryDao.getInstance();
	UserDao userDao = UserDao.getInstance();
	
	private static final String saveDirectory = "C:\\workspace\\woohyeok\\java-web\\toeic-speaking\\src\\main\\webapp\\images\\userImages";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String testDate = req.getParameter("testDate");
		
		HttpSession session = req.getSession();
		
		User loginUser = (User) session.getAttribute("LOGINED_USER"); 
		System.out.println(loginUser);
		
		if(loginUser == null) {
			resp.sendRedirect("../login?fail=deny&job=" + URLEncoder.encode("시험접수는 로그인 이후 이용가능합니다.", "utf-8"));
			return;
		}
		
		String userId = loginUser.getUserId();
		
		TestHistoryDao testHistoryDao = TestHistoryDao.getInstance();
		List<TestHistoryDto> thd = testHistoryDao.getAllTestHistoryByUserId(userId);
		for (TestHistoryDto item : thd) {
			if(item.getTestDateString().equals(testDate)) {
				if(item.getTestStatus().equals("Y")) {
					resp.sendRedirect("onlineReception?fail=deny&job=" + URLEncoder.encode("중복접수불가", "utf-8"));
					return;
				}
			}
		}
		
		req.setAttribute("loginUser", loginUser);
		
		// 시험일정 목록 획득하기
		List<OnlieReceptionScheduleDto> orsds = scheduleDao.getOnlieReceptionSchedule();
		req.setAttribute("orsds", orsds);
		
		// 접수중인 시험일정 목록만 획득하기
		List<OnlieReceptionScheduleDto> orsdStatus = scheduleDao.getOnlieReceptionScheduleOnlyStatus();
		req.setAttribute("orsdStatus", orsdStatus);
		
		// 센터 지역과 지역별 카운트수 획득하기
		List<CenterCountDto> locationCnts = locationDao.getCenterLocationCnt();
		req.setAttribute("locationCnts", locationCnts);
		
		// 시험센터정보 획득하기
		List<Location> locations = locationDao.getAllLocations();
		req.setAttribute("locations", locations);
		
		// 시험번호로 시험일자 획득하기
//		OnlieReceptionScheduleDto testDateByNo = scheduleDao.getTestDateByNo(testNo);
//		req.setAttribute("testDateByNo", testDateByNo);
		
		
		
		
		
		// 시험접수페이지로 내부이동
		req.getRequestDispatcher("/WEB-INF/views/online_reception/testReception.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User loginUser = (User) session.getAttribute("LOGINED_USER");
		
		String testDate = req.getParameter("testDate"); 
		
		
		String lastName = req.getParameter("lastname");
		String firstName = req.getParameter("firstname");
		String gender = req.getParameter("gendercheck");
		String receiveType = req.getParameter("receptiontype");
		String userAddress = req.getParameter("address");
		String payment = req.getParameter("flexRadioDefault");
		int centerNo = CommonUtils.stringToInt(req.getParameter("centerNumber"));
		int testNo = CommonUtils.stringToInt(req.getParameter("testNumber"));
		Part part = req.getPart("upfile");
		
		if(centerNo == 0) {
			resp.sendRedirect("testReception?fail=deny&job=" + URLEncoder.encode("시험센터명", "utf-8"));
			return;
		}
		
		// testHistory에 나의 신청정보를 저장한다.
		TestHistory testHistory = new TestHistory();
		testHistory.setTestNo(testNo);
		testHistory.setTestStatus("Y");
		testHistory.setUserId(loginUser.getUserId());
		testHistory.setUserAddress(userAddress);
		testHistory.setReceiveType(receiveType);
		testHistory.setPayment(payment);
		testHistory.setCenterNo(centerNo);
		testHistory.setTestRequestDate(new Date());
		
		
		testHistoryDao.insertTestHistory(testHistory);
		
		//part로 가져온 업로드된 첨부파일정보를 part.getSubmittedFileName()를 이용해서 파일이름을 획득한다.
		String filename = System.currentTimeMillis() + part.getSubmittedFileName(); 
		// 첨부파일 정보를 가진 part객체를 읽어오는 스트림획득 메소드
		InputStream in = part.getInputStream();
		// OutputStream은 첨부파일을 디스크에 저장하는 출력스트림
		OutputStream out = new FileOutputStream(new File(saveDirectory, filename));
		// 입력스트림으로 읽어온 데이터를 출력스트림으로 출력시켜서 파일을 복사한다.
		IOUtils.copy(in, out);
		out.close();
		// 로그인된 유저 객체에 아이디를 입력받아서 유저 fileName에 set으로 넣어준다.
		loginUser.setFileName(filename);
		loginUser.setLastName(lastName);
		loginUser.setFirstName(firstName);
		loginUser.setGender(gender);
		// 결제접수한 시험일에 시험신청인원을 +1 한다.
		OnlieReceptionScheduleDto testDateByNo = scheduleDao.getTestDateByNo(testNo);
		testDateByNo.setRegisterCount(testDateByNo.getRegisterCount()+1);
		if(testDateByNo.getRegisterCount() == 50) {
			testDateByNo.setTestStatus("N");
		}
		// 그 객체를 db에 insert한다.
		userDao.updateLoginUser(loginUser);
		
		scheduleDao.updateRegistCount(testDateByNo);
		// 클라이언트에게 index.jsp를 재요청하게 하는 응답을 보내기
		
//		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
		resp.sendRedirect("../main");
		
	}
}
