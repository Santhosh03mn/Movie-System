package com.infosys.movieSystem.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class TicketBooking {
	@Id
	private Long ticketId;
	private String movieName;
	private String showTimeName;
	private String seatType;
	private Integer numberOfSeatBooking;
	private Double amountPayable;
	private String transactionId;
	private String status;
	public TicketBooking() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TicketBooking(Long ticketId, String movieName, String showTimeName, String seatType,
			Integer numberOfSeatBooking, Double amountPayable, String transactionId, String status) {
		super();
		this.ticketId = ticketId;
		this.movieName = movieName;
		this.showTimeName = showTimeName;
		this.seatType = seatType;
		this.numberOfSeatBooking = numberOfSeatBooking;
		this.amountPayable = amountPayable;
		this.transactionId = transactionId;
		this.status = status;
	}
	public Long getTicketId() {
		return ticketId;
	}
	public void setTicketId(Long ticketId) {
		this.ticketId = ticketId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getShowTimeName() {
		return showTimeName;
	}
	public void setShowTimeName(String showTimeName) {
		this.showTimeName = showTimeName;
	}
	public String getSeatType() {
		return seatType;
	}
	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}
	public Integer getNumberOfSeatBooking() {
		return numberOfSeatBooking;
	}
	public void setNumberOfSeatBooking(Integer numberOfSeatBooking) {
		this.numberOfSeatBooking = numberOfSeatBooking;
	}
	public Double getAmountPayable() {
		return amountPayable;
	}
	public void setAmountPayable(Double amountPayable) {
		this.amountPayable = amountPayable;
	}
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "TicketBooking [ticketId=" + ticketId + ", movieName=" + movieName + ", showTimeName=" + showTimeName
				+ ", seatType=" + seatType + ", numberOfSeatBooking=" + numberOfSeatBooking + ", amountPayable="
				+ amountPayable + ", transactionId=" + transactionId + ", status=" + status + "]";
	}
	
	
	
	
}
