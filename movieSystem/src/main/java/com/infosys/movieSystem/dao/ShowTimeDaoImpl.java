package com.infosys.movieSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.movieSystem.bean.ShowTime;

@Service
@Repository
public class ShowTimeDaoImpl implements ShowTimeDao{
	
	@Autowired
	private ShowTimeRepository repository;
	
	@Override
	public void save(ShowTime showTime) {
		repository.save(showTime);
		
	}
	
	@Override
	public Integer generateShowTimeId() {
		Integer newId=repository.getlastId();
		if(newId==null) {
			newId=1;
		}
		else {
			newId=newId+1;
		}
		return newId;
		
	}
	@Override
	public ShowTime findById(Integer id) {
		return repository.findById(id).orElse(null);
	}
	@Override
	public List<ShowTime> findAll(){
		return repository.findAll();
	}
	@Override
	public void deleteShowTimeById(Integer id) {
		repository.deleteById(id);
	}
	
	@Override
	public List<Integer> getAllIds() {
	    return repository.getAllIds();
	}
	
	@Override
	public String getShowTimeName(Integer showTimeId) {
		return repository.getShowTimeName(showTimeId);
	}
	
	@Override
	public ShowTime getShowTime(String showTimeName) {
		return repository.getShowTime(showTimeName);
	}

}
