package com.infosys.movieSystem.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Movie {
	
	@Id
    private String movieId;  
    private String movieName; 
    private String language;
    private String genre;
    private int duration;
    private double rating;
	public Movie() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Movie(String movieId, String movieName, String description, String genre, int duration, double rating) {
		super();
		this.movieId = movieId;
		this.movieName = movieName;
		this.genre = genre;
		this.duration = duration;
		this.rating = rating;
	}
	public Movie(String movieId) {
        this.movieId= movieId;
    }

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	@Override
	public String toString() {
		return "Movie [movieId=" + movieId + ", movieName=" + movieName + ", language=" + language + ", genre=" + genre
				+ ", duration=" + duration + ", rating=" + rating + "]";
	}

    
}
