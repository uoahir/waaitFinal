package com.waait.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.waait.common.EmpAuthority;
import com.waait.security.controller.UserPasswordAuthenticationProvider;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	// 대칭키
	

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http, UserPasswordAuthenticationProvider provider)
			throws Exception {
		http.csrf(csrf -> csrf.disable())
				.authorizeHttpRequests(authorizeRequests -> authorizeRequests
						.requestMatchers("/logininfo","/login", "/WEB-INF/views/**", "/resources/**").permitAll()
						.requestMatchers("/admin").hasAnyAuthority(EmpAuthority.ADMIN.name())
						.anyRequest().authenticated()
						)
				.formLogin(formLogin -> formLogin.loginPage("/login")
						.loginProcessingUrl("/logininfo")
						.defaultSuccessUrl("/user")
						.usernameParameter("user")
						.passwordParameter("password"))
				.authenticationProvider(provider)
				.logout(logout -> logout.logoutSuccessUrl("/login").invalidateHttpSession(true)
				).sessionManagement(session->
				session.maximumSessions(1)
				)
				;
		return http.build();
	}

	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
