package com.toeic.speaking.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.math.NumberUtils;

import com.toeic.speaking.dao.ScheduleDao;
import com.toeic.speaking.vo.Pagination;
import com.toeic.speaking.vo.Schedule;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class MainServlet extends HttpServlet {

	private static final int ROWS_CARD = 3;
	private static final int CARD_PAGES_BLOCK = 5;
	ScheduleDao scheduleDao = ScheduleDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 시험일정 조회하기 초판
//		List<OnlieReceptionScheduleDto> orsds = scheduleDao.getOnlieReceptionSchedule();
//		req.setAttribute("orsds", orsds);
		
		// 카드캐러셀 시험일정 조회하기
		int pageNo = NumberUtils.toInt(req.getParameter("pageNo"), 1);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("beginIndex", (pageNo - 1)*ROWS_CARD +1);
		map.put("endIndex", pageNo*ROWS_CARD);
		List<Schedule> cardSchedule = scheduleDao.getCardSchedule(map);
		req.setAttribute("cardSchedule", cardSchedule);
		
		// 카드캐러셀 페이징처리
		int totalRows = scheduleDao.getTotalRows(map);
		int totalPages = (int) Math.ceil((double) totalRows/ROWS_CARD);
		// 전체 페이지블록 갯수 계산하기
		int totalPageBlocks = (int) Math.ceil((double) totalPages/CARD_PAGES_BLOCK);
		// 요청한 페이지번호가 속하는 페이지블록번호 계산하기
		int currentPageBlock = (int) Math.ceil((double) pageNo/CARD_PAGES_BLOCK);
		// 현재 페이지블록의 시작페이지 번화 끝 페이지번호를 계산하기
		  int beginPage = (currentPageBlock - 1)*CARD_PAGES_BLOCK + 1;
		  int endPage = currentPageBlock*CARD_PAGES_BLOCK;
		  if (currentPageBlock == totalPageBlocks) {
		     endPage = totalPages;
		  }
		  // 페이징처리에 필요한 정보를 Pagination객체에 저장하기
		  Pagination pagination = new Pagination();
		  pagination.setPageNo(pageNo);
		  pagination.setTotalRows(totalRows);
		  pagination.setTotalPages(totalPages);
		  pagination.setTotalPageBlocks(totalPageBlocks);
		  pagination.setCurrentPageBlock(currentPageBlock);
		  pagination.setBeginPage(beginPage);
		  pagination.setEndPage(endPage);
		  // 요청객체의  속성으로 Pagination객체를 저장하기
		  req.setAttribute("pagination", pagination);   
		
		
		
		
		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}
}
