package com.waait.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;



@Configuration
@Component

public class WebClientConfig {

    @Value("${token}")
    private String token;

	
	   @Bean
	    public WebClient webClient() {
	        return WebClient.builder()
	                .defaultHeader("Authorization", "Bearer "+token)
	                .defaultHeader("Accept", "application/vnd.github+json")
	                .defaultHeader("User-Agent", "MyGitHubApp")
	                .build();
	    }
}
