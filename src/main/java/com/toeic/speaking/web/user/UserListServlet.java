package com.toeic.speaking.web.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import com.toeic.speaking.dao.UserDao;
import com.toeic.speaking.vo.Pagination;
import com.toeic.speaking.vo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/usersList")
public class UserListServlet extends HttpServlet{
	
	
	private static final int ROWS_PER_PAGE = 10;
	private static final int PAGES_PER_PAGE_BLOCK = 5;
	
	UserDao userDao = UserDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int pageNo = NumberUtils.toInt(req.getParameter("page"),1);
		
		String searchOption = req.getParameter("opt");
		String searchKeyword = req.getParameter("keyword");
		
		Map<String, Object> param = new HashMap<String,Object>();
		
		if(StringUtils.isNoneBlank(searchOption)
				&& StringUtils.isNoneBlank(searchKeyword)) {
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		
		param.put("beginIndex", (pageNo - 1)*ROWS_PER_PAGE+1);
		param.put("endIndex", pageNo*ROWS_PER_PAGE);
		
		List<User> users = userDao.getAllUsersMapWithPaging(param);
		System.out.println("USERS : " + users.toString());
		
		req.setAttribute("users", users);
		
		int totalRows = userDao.getRowsCount(param);
		
		int totalPages = (int)Math.ceil((double) totalRows/ROWS_PER_PAGE);
		
		int totalPageBlocks = (int)Math.ceil((double) totalPages/PAGES_PER_PAGE_BLOCK);
		
		int currentPageBlock = (int)Math.ceil((double) pageNo/PAGES_PER_PAGE_BLOCK);
		
		int beginPage = (currentPageBlock - 1)*PAGES_PER_PAGE_BLOCK + 1;
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
		
		req.getRequestDispatcher("/WEB-INF/views/user/usersList.jsp").forward(req, resp);
	}
}
