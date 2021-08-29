package com.toeic.speaking.dto.reception;

import java.util.Date;

public class TestReceptionCenterScheduleDto {

	private int testNo;
	private String testName;
	private Date testDate;
	private String testTime;
	private int registerCount;
	private String testStatus;
	private Date testCreatedDate;
	private int centerNo;
	private String centerName;
	private String centerLocation;
	private int centerLocationCount;
	private int quota;
	private String centerStatus;

	public TestReceptionCenterScheduleDto() {}

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

	public int getRegisterCount() {
		return registerCount;
	}

	public void setRegisterCount(int registerCount) {
		this.registerCount = registerCount;
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

	public int getCenterNo() {
		return centerNo;
	}

	public void setCenterNo(int centerNo) {
		this.centerNo = centerNo;
	}

	public String getCenterName() {
		return centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}

	public String getCenterLocation() {
		return centerLocation;
	}

	public void setCenterLocation(String centerLocation) {
		this.centerLocation = centerLocation;
	}

	public int getCenterLocationCount() {
		return centerLocationCount;
	}

	public void setCenterLocationCount(int centerLocationCount) {
		this.centerLocationCount = centerLocationCount;
	}

	public int getQuota() {
		return quota;
	}

	public void setQuota(int quota) {
		this.quota = quota;
	}

	public String getCenterStatus() {
		return centerStatus;
	}

	public void setCenterStatus(String centerStatus) {
		this.centerStatus = centerStatus;
	}

}
