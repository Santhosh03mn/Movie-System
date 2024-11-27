package com.infosys.movieSystem.bean;

import java.io.Serializable;
import java.util.Objects;

import javax.validation.constraints.NotNull;

import jakarta.persistence.Embeddable;

@Embeddable
public class MovieShowEmbed implements Serializable{
	
	private String movieId;
	@NotNull
	private Integer showTimeId;
	public MovieShowEmbed() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MovieShowEmbed(@NotNull String movieId,@NotNull Integer showTimeId) {
		super();
		this.movieId = movieId;
		this.showTimeId = showTimeId;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public Integer getShowTimeId() {
		return showTimeId;
	}
	public void setShowTimeId(Integer showTimeId) {
		this.showTimeId = showTimeId;
	}
	@Override
	public int hashCode() {
		return Objects.hash(movieId, showTimeId);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MovieShowEmbed other = (MovieShowEmbed) obj;
		return Objects.equals(movieId, other.movieId) && Objects.equals(showTimeId, other.showTimeId);
	}
	@Override
	public String toString() {
		return "MovieShowEmbed [movieId=" + movieId + ", showTimeId=" + showTimeId + "]";
	}
	
	
}
