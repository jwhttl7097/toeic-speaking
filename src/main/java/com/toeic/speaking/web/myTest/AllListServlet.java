package com.toeic.speaking.web.myTest;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.math.NumberUtils;

import com.toeic.speaking.dao.TestHistoryDao;
import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.dto.mytest.TestHistoryDto;
import com.toeic.speaking.vo.Pagination;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/mytest/allList")
public class AllListServlet extends HttpServlet {

	   private static final int ROWS_PER_PAGE = 5;
	   private static final int PAGES_PER_PAGE_BLOCK = 5;

	   @Override
	   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      
	      HttpSession session = req.getSession();
	      User loginedUser = (User) session.getAttribute("LOGINED_USER");
	      
	      String loginedUserId = loginedUser.getUserId();
	      
	      TestHistoryDao testHistoryDao = TestHistoryDao.getInstance();
	      
	      UserDao userDao = UserDao.getInstance();
	      User user = userDao.getUserById(loginedUserId);
	      req.setAttribute("user", user);
	      
	      int pageNo = NumberUtils.toInt(req.getParameter("page"),1);
	      Map<String, Object> param = new HashMap<String, Object>();
	      
	      param.put("beginIndex", (pageNo-1)*ROWS_PER_PAGE +1);
	      param.put("endIndex", pageNo*ROWS_PER_PAGE);
	      param.put("userId", loginedUserId);
	      
	      List<TestHistoryDto> myTestLists = testHistoryDao.getMyTestLists(param);
	      req.setAttribute("myTestLists", myTestLists);
	      
	      int totalRows = testHistoryDao.getTotalRows(param);
	      int totalPages = (int) Math.ceil((double) totalRows/ROWS_PER_PAGE);
	      int totalPageBlocks = (int) Math.ceil((double) totalPages/PAGES_PER_PAGE_BLOCK);
	      int currentPageBlock = (int) Math.ceil((double) pageNo/PAGES_PER_PAGE_BLOCK);
	      int beginPage = (currentPageBlock - 1)*PAGES_PER_PAGE_BLOCK+1;
	      int endPage = currentPageBlock*PAGES_PER_PAGE_BLOCK;
	      
	      if(currentPageBlock == totalPageBlocks) {
	         endPage = totalPages;
	      }
	      
	      Pagination pagination = new Pagination();
	      pagination.setPageNo(pageNo);
	      pagination.setTotalRows(totalRows);
	      pagination.setTotalPages(totalPages);
	      pagination.setTotalPageBlocks(totalPageBlocks);
	      pagination.setCurrentPageBlock(currentPageBlock);
	      pagination.setBeginPage(beginPage);
	      pagination.setEndPage(endPage);
	      
	      req.setAttribute("pagination", pagination);
	      
	      req.getRequestDispatcher("/WEB-INF/views/mytest/allList.jsp").forward(req, resp);
	   }

}
