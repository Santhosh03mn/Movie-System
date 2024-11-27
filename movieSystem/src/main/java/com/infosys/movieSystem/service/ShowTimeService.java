package com.infosys.movieSystem.service;

import org.springframework.stereotype.Service;

import com.infosys.movieSystem.bean.ShowTime;

@Service
public class ShowTimeService {
	
	public Double createRoyalPrice(Double premierPrice) {
		double royalPrice=premierPrice+(premierPrice*0.25);
		return royalPrice;
		
	}
}
