package com.toeic.speaking.vo;

public class Pagination {
	
	private int pageNo;
	private int totalRows;
	private int totalPages;
	private int totalPageBlocks;
	private int currentPageBlock;
	private int beginPage;
	private int endPage;
	
	public Pagination() {}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getTotalPageBlocks() {
		return totalPageBlocks;
	}

	public void setTotalPageBlocks(int totalPageBlocks) {
		this.totalPageBlocks = totalPageBlocks;
	}

	public int getCurrentPageBlock() {
		return currentPageBlock;
	}

	public void setCurrentPageBlock(int currentPageBlock) {
		this.currentPageBlock = currentPageBlock;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	
	

}
