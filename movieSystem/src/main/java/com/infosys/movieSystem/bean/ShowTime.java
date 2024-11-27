package com.infosys.movieSystem.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class ShowTime {
	@Id
	private Integer showTimeId;
	private String showTimeName;
	private Double showTimeRoyalPrice;
	private Double showTimePremierPrice;
	public ShowTime() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public ShowTime(Integer showTimeId) {
		super();
		this.showTimeId = showTimeId;
		this.showTimeName ="";
		this.showTimeRoyalPrice =0.0;
		this.showTimePremierPrice =0.0;
	}


	public ShowTime(String showTimeName, Double showTimeRoyalPrice, Double showTimePremierPrice) {
		super();
		this.showTimeName = showTimeName;
		this.showTimeRoyalPrice = showTimeRoyalPrice;
		this.showTimePremierPrice = showTimePremierPrice;
	}
	public Integer getShowTimeId() {
		return showTimeId;
	}
	public void setShowTimeId(Integer showTimeId) {
		this.showTimeId = showTimeId;
	}
	public String getShowTimeName() {
		return showTimeName;
	}
	public void setShowTimeName(String showTimeName) {
		this.showTimeName = showTimeName;
	}
	public Double getShowTimeRoyalPrice() {
		return showTimeRoyalPrice;
	}
	public void setShowTimeRoyalPrice(Double showTimeRoyalPrice) {
		this.showTimeRoyalPrice = showTimeRoyalPrice;
	}
	public Double getShowTimePremierPrice() {
		return showTimePremierPrice;
	}
	public void setShowTimePremierPrice(Double showTimePremierPrice) {
		this.showTimePremierPrice = showTimePremierPrice;
	}

	@Override
	public String toString() {
		return "ShowTime [showTimeId=" + showTimeId + ", showTimeName=" + showTimeName + ", showTimeRoyalPrice="
				+ showTimeRoyalPrice + ", showTimePremierPrice=" + showTimePremierPrice + "]";
	}
	

}
