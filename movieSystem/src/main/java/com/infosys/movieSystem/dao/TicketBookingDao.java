package com.infosys.movieSystem.dao;

import java.util.List;

import com.infosys.movieSystem.bean.TicketBooking;

public interface TicketBookingDao {
	public void save(TicketBooking ticketBooking);
	public List<TicketBooking> findAll();
	public TicketBooking getTicket(Long ticketId);
	public Long generateId();
	void delete(Long ticketId);
}
