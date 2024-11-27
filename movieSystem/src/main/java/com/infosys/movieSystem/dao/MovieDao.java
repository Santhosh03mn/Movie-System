package com.infosys.movieSystem.dao;

import java.util.List;
import java.util.Set;

import com.infosys.movieSystem.bean.Movie;

public interface MovieDao {
	public void save(Movie movie);
	public String generateMovieId();
	public Movie findById(String id);
	public List<Movie> findAll();
	public void deleteMovieById(String id);
	public List<Movie> getLanguagewiseMovieList (String Language);
	public Set<String> getAllLanguages();
}
