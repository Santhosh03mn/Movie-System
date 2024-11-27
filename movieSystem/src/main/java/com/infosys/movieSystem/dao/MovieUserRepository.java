package com.infosys.movieSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.infosys.movieSystem.bean.MovieUser;

public interface MovieUserRepository extends JpaRepository<MovieUser, String> {

}
