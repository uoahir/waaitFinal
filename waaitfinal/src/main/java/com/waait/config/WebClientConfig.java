package com.waait.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;

import lombok.Value;

@Configuration
public class WebClientConfig {
	
	
	   @Bean
	    public WebClient webClient() {
	        return WebClient.builder()
	                .defaultHeader("Authorization", "Bearer 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")
	                .defaultHeader("Accept", "application/vnd.github+json")
	                .defaultHeader("User-Agent", "MyGitHubApp")
	                .build();
	    }
}
