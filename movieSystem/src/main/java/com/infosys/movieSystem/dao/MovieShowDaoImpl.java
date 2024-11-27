package com.infosys.movieSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.movieSystem.bean.MovieShow;
import com.infosys.movieSystem.bean.MovieShowEmbed;

@Service
@Repository
public class MovieShowDaoImpl implements MovieShowDao {
	@Autowired
	private MovieShowRepository repository;
	
	@Override
	public void save(MovieShow movieShow) {
		repository.save(movieShow);
	}
	@Override
	public List<MovieShow> findAll(){
		return repository.findAll();
	}
	@Override
	public List<MovieShowEmbed> getAllIds(){
		return repository.getAllIds();
	}
	
	@Override
	public void deleteMovieShowById(MovieShowEmbed id) {
		repository.deleteById(id);
	}
	
	@Override
	public MovieShow getMovieShowById(MovieShowEmbed id) {
		return repository.findById(id).get(); 
	}
}
