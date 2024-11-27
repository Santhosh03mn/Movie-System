package com.infosys.movieSystem.dao;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infosys.movieSystem.bean.Movie;

public interface MovieRepository extends JpaRepository<Movie,String>{
	
	@Query("SELECT max(movieId) from Movie")
    public String getLastId();
	
	@Query("select a from Movie a where language=?1")
	public List<Movie> getLanguagewiseMovieList (String language);

	@Query("SELECT language FROM Movie ")
    public Set<String> getAllLanguages();
	
	
}
