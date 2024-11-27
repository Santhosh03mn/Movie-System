package com.infosys.movieSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infosys.movieSystem.bean.ShowTime;

public interface ShowTimeRepository extends JpaRepository<ShowTime, Integer> {
	
	@Query("SELECT max(showTimeId) from ShowTime")
	public Integer getlastId();
	
	@Query("select showTimeId from ShowTime")
	public List<Integer> getAllIds();
	
	@Query("SELECT showTimeName from ShowTime where showTimeId=?1")
	public String getShowTimeName(Integer showTimeId);
	
	@Query("SELECT a from ShowTime a where showTimeName=?1")
	public ShowTime getShowTime(String showTimeName);
}
