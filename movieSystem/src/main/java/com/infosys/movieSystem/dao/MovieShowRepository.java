package com.infosys.movieSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infosys.movieSystem.bean.MovieShow;
import com.infosys.movieSystem.bean.MovieShowEmbed;

public interface MovieShowRepository extends JpaRepository<MovieShow,MovieShowEmbed>{
	
	@Query("select embeddedId from MovieShow")
	public List<MovieShowEmbed> getAllIds();
	
}
