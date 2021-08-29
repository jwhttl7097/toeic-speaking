package com.toeic.speaking.dto.reception;

public class TestReceptionCenterInfoByLocationDto {

	private int centerNo;
	private int testNo;
	private String centerName;
	private String centerLocation;
	private int quota;
	private String centerStatus;
	private String testStatus;
	private int registerCount;

	public TestReceptionCenterInfoByLocationDto() {
	}
	
	

	public String getTestStatus() {
		return testStatus;
	}



	public void setTestStatus(String testStatus) {
		this.testStatus = testStatus;
	}



	public int getTestNo() {
		return testNo;
	}

	public void setTestNo(int testNo) {
		this.testNo = testNo;
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

	public int getRegisterCount() {
		return registerCount;
	}

	public void setRegisterCount(int registerCount) {
		this.registerCount = registerCount;
	}

}
