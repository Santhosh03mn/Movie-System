package com.infosys.movieSystem.dao;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.movieSystem.bean.Movie;

@Service
@Repository
public class MovieDaoImpl implements MovieDao {
	
	@Autowired
	private MovieRepository repository;
	
	@Override
	public void save(Movie movie) {
        repository.save(movie);
    }
	
	@Override
    public String generateMovieId() {
        String val= repository.getLastId(); 
        long id=0L;
        if (val == null)
            id=100001L;  
        else {
            id=Integer.parseInt(val.substring(1));
            id++;
        }
        String newId="M"+id;
        return newId;
    }
	
	@Override
	public Movie findById(String id) {
        return repository.findById(id).get();
    }
	
	@Override
    public List<Movie> findAll() {
        return repository.findAll();
    }
	
	@Override
    public void deleteMovieById(String id) {
        repository.deleteById(id);
    }
	
	@Override
	public List<Movie> getLanguagewiseMovieList (String language){
		return repository.getLanguagewiseMovieList(language);
	}
	
	@Override
    public Set<String> getAllLanguages() {
        return repository.getAllLanguages();  
    }

}
