package com.infosys.movieSystem.bean;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;


@Entity
public class MovieShow {
	
	@EmbeddedId
	private MovieShowEmbed embeddedId;
	private Integer royalSeatNumber;
	private Integer premierSeatNumber;
	private Integer royalBooked;
	private Integer premierBooked;
	public MovieShow() {
		super();
		this.royalBooked = 0;
		this.premierBooked = 0;
		
	}
	
	public MovieShow(MovieShowEmbed embeddedId, Integer royalSeatNumber,
			Integer premierSeatNumber, Integer royalBooked, Integer premierBooked) {
		super();
		this.embeddedId = embeddedId;
		this.royalSeatNumber = royalSeatNumber;
		this.premierSeatNumber = premierSeatNumber;
		this.royalBooked = royalBooked;
		this.premierBooked = premierBooked;
	}

	public MovieShow(MovieShowEmbed embeddedId, Integer royalSeatNumber,
			Integer premierSeatNumber) {
		super();
		this.embeddedId = embeddedId;
		this.royalSeatNumber = royalSeatNumber;
		this.premierSeatNumber = premierSeatNumber;
		this.royalBooked = 0;
		this.premierBooked = 0;
	}

	public MovieShowEmbed getEmbeddedId() {
		return embeddedId;
	}

	public void setEmbeddedId(MovieShowEmbed embeddedId) {
		this.embeddedId = embeddedId;
	}
	

	public Integer getRoyalSeatNumber() {
		return royalSeatNumber;
	}

	public void setRoyalSeatNumber(Integer royalSeatNumber) {
		this.royalSeatNumber = royalSeatNumber;
	}

	public Integer getPremierSeatNumber() {
		return premierSeatNumber;
	}

	public void setPremierSeatNumber(Integer premierSeatNumber) {
		this.premierSeatNumber = premierSeatNumber;
	}

	public Integer getRoyalBooked() {
		return royalBooked;
	}

	public void setRoyalBooked(Integer royalBooked) {
		this.royalBooked = royalBooked;
	}

	public Integer getPremierBooked() {
		return premierBooked;
	}

	public void setPremierBooked(Integer premierBooked) {
		this.premierBooked = premierBooked;
	}

	@Override
	public String toString() {
		return "MovieShow [embeddedId=" + embeddedId + ", royalSeatNumber=" + royalSeatNumber + ", premierSeatNumber="
				+ premierSeatNumber + ", royalBooked=" + royalBooked + ", premierBooked=" + premierBooked + "]";
	}

	
	
}
