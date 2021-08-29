package com.toeic.speaking.vo;

import java.util.Date;

public class Schedule {

	private int testNo;
	private String testName;
	private Date testDate;
	private String testTime;
	private Date receiptDate;
	private Date deadLineDate;
	private Date expectedDate;
	private Date announcementDate;
	private int registerCount;
	private int quota;
	private int centerNo;
	private String testStatus;
	private Date testCreatedDate;
	private Date deletedDate;

	public Schedule() {}
	
	public Date getDeletedDate() {
		return deletedDate;
	}



	public void setDeletedDate(Date deletedDate) {
		this.deletedDate = deletedDate;
	}



	public int getTestNo() {
		return testNo;
	}

	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public Date getTestDate() {
		return testDate;
	}

	public void setTestDate(Date testDate) {
		this.testDate = testDate;
	}

	public String getTestTime() {
		return testTime;
	}

	public void setTestTime(String testTime) {
		this.testTime = testTime;
	}

	public Date getReceiptDate() {
		return receiptDate;
	}

	public void setReceiptDate(Date receiptDate) {
		this.receiptDate = receiptDate;
	}

	public Date getDeadLineDate() {
		return deadLineDate;
	}

	public void setDeadLineDate(Date deadLineDate) {
		this.deadLineDate = deadLineDate;
	}

	public Date getExpectedDate() {
		return expectedDate;
	}

	public void setExpectedDate(Date expectedDate) {
		this.expectedDate = expectedDate;
	}

	public Date getAnnouncementDate() {
		return announcementDate;
	}

	public void setAnnouncementDate(Date announcementDate) {
		this.announcementDate = announcementDate;
	}

	public int getRegisterCount() {
		return registerCount;
	}

	public void setRegisterCount(int registerCount) {
		this.registerCount = registerCount;
	}

	public int getQuota() {
		return quota;
	}

	public void setQuota(int quota) {
		this.quota = quota;
	}

	public int getCenterNo() {
		return centerNo;
	}

	public void setCenterNo(int centerNo) {
		this.centerNo = centerNo;
	}

	public String getTestStatus() {
		return testStatus;
	}

	public void setTestStatus(String testStatus) {
		this.testStatus = testStatus;
	}

	public Date getTestCreatedDate() {
		return testCreatedDate;
	}

	public void setTestCreatedDate(Date testCreatedDate) {
		this.testCreatedDate = testCreatedDate;
	}

	@Override
	public String toString() {
		return "Schedule [testNo=" + testNo + ", testName=" + testName + ", testDate=" + testDate + ", testTime="
				+ testTime + ", receiptDate=" + receiptDate + ", deadLineDate=" + deadLineDate + ", expectedDate="
				+ expectedDate + ", announcementDate=" + announcementDate + ", registerCount=" + registerCount
				+ ", quota=" + quota + ", centerNo=" + centerNo + ", testStatus=" + testStatus + ", testCreatedDate="
				+ testCreatedDate + "]";
	}

}
