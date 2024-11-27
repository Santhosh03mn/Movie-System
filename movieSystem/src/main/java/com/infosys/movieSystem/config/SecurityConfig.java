package com.infosys.movieSystem.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.infosys.movieSystem.service.MovieUserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	@Autowired
	private EncoderConfig encoderConfig;
	@Autowired
	private MovieUserService service;
	
	@Autowired
	protected void configure(AuthenticationManagerBuilder authority) throws Exception {
		authority.userDetailsService(service).passwordEncoder(encoderConfig.passwordEncoder());
	}
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
          http.csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                                .requestMatchers("/WEB-INF/jsp/**", "/loginpage","/loginerror","/login","/register").permitAll()
                               .anyRequest().authenticated()
                )
                .formLogin(login -> login.loginPage("/loginpage").failureHandler(new MyAuthenticationFailureHandler()).loginProcessingUrl("/login").defaultSuccessUrl("/index")
                		.permitAll());
	      return http.build();
	}

}
