package com.bbs.pojo;

public class Plate {
	private Integer plateId;
	private String plateTitle;
	private String plateMessage;
	
	public Plate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Plate(Integer plateId, String plateTitle, String plateMessage) {
		super();
		this.plateId = plateId;
		this.plateTitle = plateTitle;
		this.plateMessage = plateMessage;
	}
	public Integer getPlateId() {
		return plateId;
	}
	public void setPlateId(Integer plateId) {
		this.plateId = plateId;
	}
	public String getPlateTitle() {
		return plateTitle;
	}
	public void setPlateTitle(String plateTitle) {
		this.plateTitle = plateTitle;
	}
	public String getPlateMessage() {
		return plateMessage;
	}
	public void setPlateMessage(String plateMessage) {
		this.plateMessage = plateMessage;
	}
	
}
