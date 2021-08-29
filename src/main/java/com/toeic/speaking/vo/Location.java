package com.toeic.speaking.vo;

import java.util.Date;

public class Location {

	private int centerNo;
	private String centerName;
	private String centerLocation;
	private int quota;
	private String centerStatus;
	private Date createdDate;
	private Date deletedDate;

	public Location() {}

	
	
	public Date getCreatedDate() {
		return createdDate;
	}



	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}



	public Date getDeletedDate() {
		return deletedDate;
	}



	public void setDeletedDate(Date deletedDate) {
		this.deletedDate = deletedDate;
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

}
