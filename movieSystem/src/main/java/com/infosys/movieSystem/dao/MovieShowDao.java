package com.infosys.movieSystem.dao;

import java.util.List;

import com.infosys.movieSystem.bean.MovieShow;
import com.infosys.movieSystem.bean.MovieShowEmbed;

public interface MovieShowDao {
	public void save(MovieShow movie);
	public List<MovieShow> findAll();
	public List<MovieShowEmbed> getAllIds();
	public void deleteMovieShowById(MovieShowEmbed id);
	public MovieShow getMovieShowById(MovieShowEmbed id);
}

