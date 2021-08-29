package com.toeic.speaking.vo;

import java.util.Date;

public class TestHistory {
	private int testNo;
	private String testStatus;
	private String userId;
	private String testScore;
	private String testScore2;
	private String testScore3;
	private String userAddress;
	private String receiveType;
	private String payment;
	private int centerNo;
	private Date testRequestDate; // 접수한날짜

	public TestHistory() {}

	
	public String getTestScore2() {
		return testScore2;
	}


	public void setTestScore2(String testScore2) {
		this.testScore2 = testScore2;
	}


	public String getTestScore3() {
		return testScore3;
	}


	public void setTestScore3(String testScore3) {
		this.testScore3 = testScore3;
	}


	public int getTestNo() {
		return testNo;
	}

	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}

	public String getTestStatus() {
		return testStatus;
	}

	public void setTestStatus(String testStatus) {
		this.testStatus = testStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTestScore() {
		return testScore;
	}

	public void setTestScore(String testScore) {
		this.testScore = testScore;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getReceiveType() {
		return receiveType;
	}

	public void setReceiveType(String receiveType) {
		this.receiveType = receiveType;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public int getCenterNo() {
		return centerNo;
	}

	public void setCenterNo(int centerNo) {
		this.centerNo = centerNo;
	}

	public Date getTestRequestDate() {
		return testRequestDate;
	}

	public void setTestRequestDate(Date testRequestDate) {
		this.testRequestDate = testRequestDate;
	}

}
