package com.JMThouseWeb.JMThouse.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

import com.JMThouseWeb.JMThouse.auth.PrincipalDetailService;

@Configuration
@EnableWebSecurity
<<<<<<< HEAD
@EnableGlobalMethodSecurity(prePostEnabled = true) 
public class SecurityConfig extends WebSecurityConfigurerAdapter{ 
=======
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
>>>>>>> feature_login

	@Bean
	public BCryptPasswordEncoder encoderPWD() {
		return new BCryptPasswordEncoder();
	}
<<<<<<< HEAD
	
	@Bean
	@Override
		protected AuthenticationManager authenticationManager() throws Exception {
			return super.authenticationManager();
		}
	
	@Autowired
	private PrincipalDetailService principalDetailService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
				.and()
=======

	@Bean
	@Override
	protected AuthenticationManager authenticationManager() throws Exception {
		return super.authenticationManager();
	}

	@Autowired
	private PrincipalDetailService principalDetailService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
>>>>>>> feature_login
				.authorizeRequests()
				.antMatchers("/auth/**", "/", "/js/**", "/css/**", "/image/**")
				.permitAll()
				.anyRequest()
				.authenticated()
<<<<<<< HEAD
				.and().formLogin().loginPage("/auth/login_form")
				.loginProcessingUrl("/auth/loginProc")
				.defaultSuccessUrl("/");
	}
	
	@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(principalDetailService).passwordEncoder(encoderPWD());
		}
=======
			.and()
				.formLogin()
				.loginPage("/auth/login_form").loginProcessingUrl("/auth/loginProc")
				.defaultSuccessUrl("/");
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(principalDetailService).passwordEncoder(encoderPWD());
	}

>>>>>>> feature_login
}
