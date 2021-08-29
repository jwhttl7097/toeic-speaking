package com.toeic.speaking.dto.reception;

import java.util.Date;

import org.apache.commons.lang3.time.DateFormatUtils;

public class OnlieReceptionScheduleDto {
	private int testNo;
	private String testName;
	private Date testDate;
	private Date receptDate;
	private Date deadLineDate;
	private Date expectedDate;
	private int registerCount;
	private String testStatus;

	public OnlieReceptionScheduleDto() {}

	
	public String getTestName() {
		return testName;
	}



	public void setTestName(String testName) {
		this.testName = testName;
	}



	public Date getReceptDate() {
		return receptDate;
	}


	public void setReceptDate(Date receptDate) {
		this.receptDate = receptDate;
	}


	public int getTestNo() {
		return testNo;
	}

	public int getRegisterCount() {
		return registerCount;
	}

	public void setRegisterCount(int registerCount) {
		this.registerCount = registerCount;
	}

	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}

	public Date getTestDate() {
		return testDate;
	}

	public void setTestDate(Date testDate) {
		this.testDate = testDate;
	}
	
	public String getTestDateString() {
		return DateFormatUtils.format(testDate, "yyyy.MM.dd");
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

	public String getTestStatus() {
		return testStatus;
	}

	public void setTestStatus(String testStatus) {
		this.testStatus = testStatus;
	}
	


}
