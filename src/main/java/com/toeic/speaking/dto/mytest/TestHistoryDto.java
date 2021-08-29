package com.toeic.speaking.dto.mytest;

import java.util.Date;

import org.apache.commons.lang3.time.DateFormatUtils;

public class TestHistoryDto {

	private String userId;
	private int testNo;
	private String testName;
	private Date testDate;
	private String testTime;
	private String centerName;
	private String testStatus;
	private Date testRequestDate;
	private int centerNo;

	public TestHistoryDto() {
	}

	public int getCenterNo() {
		return centerNo;
	}

	public void setCenterNo(int centerNo) {
		this.centerNo = centerNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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
	
	public String getTestDateString() {
		return DateFormatUtils.format(testDate, "yyyy.MM.dd");
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

	public String getCenterName() {
		return centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}

	public String getTestStatus() {
		return testStatus;
	}

	public String getTestStatusText() {
		return "Y".equals(testStatus) ? "접수완료" : "접수취소";
	}

	public void setTestStatus(String testStatus) {
		this.testStatus = testStatus;
	}

	public Date getTestRequestDate() {
		return testRequestDate;
	}

	public void setTestRequestDate(Date testRequestDate) {
		this.testRequestDate = testRequestDate;
	}

}
