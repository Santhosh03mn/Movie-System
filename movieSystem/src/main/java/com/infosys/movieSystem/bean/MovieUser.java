package com.infosys.movieSystem.bean;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.GrantedAuthority;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class MovieUser  extends User{
	@Id
	private String username;
	private String password;
	private String name;
	private String email;
	private String role;
	public MovieUser() {
		super("abc","pqr",new ArrayList<>());
		// TODO Auto-generated constructor stub
	}
	public MovieUser(String username, String password, Collection<? extends GrantedAuthority> authorities,
			String username2, String password2, String name, String email, String role) {
		super(username, password, authorities);
		this.username = username2;
		this.password = password2;
		this.name = name;
		this.email = email;
		this.role = role;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "MovieUser [username=" + username + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", role=" + role + "]";
	}
	
	
	

}
