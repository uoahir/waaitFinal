package com.waait.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import com.waait.common.EmpAuthority;
import com.waait.security.controller.UserPasswordAuthenticationProvider;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	// 대칭키


	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http, UserPasswordAuthenticationProvider provider)
			throws Exception {
		http
			.cors()
			.and()
			.csrf(csrf -> csrf.disable())
				.authorizeHttpRequests(authorizeRequests -> authorizeRequests
							.dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE).permitAll()
						  .requestMatchers("/logininfo","/login", "/WEB-INF/views/**","/resources/**").permitAll()
						 .requestMatchers("/admin").hasAnyAuthority(EmpAuthority.ADMIN.name())
						 .requestMatchers("/api/user/notification").permitAll()
						.anyRequest().authenticated()
						)
				.formLogin(formLogin -> formLogin.loginPage("/login")
						.loginProcessingUrl("/logininfo") //PostMapping("login")
						.defaultSuccessUrl("/") //로그인 성공할때 들어가지는 요청주소
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
	public CorsConfigurationSource corsConfigurationSource() {
		
		CorsConfiguration configuration = new CorsConfiguration();
		configuration.addAllowedOrigin("http://localhost:5731");
		configuration.addAllowedMethod("*");
        configuration.addAllowedHeader("*");
        configuration.setAllowCredentials(true); // 쿠키 허용

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        
        return source;	
	}
		
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
