package com.waait.github;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Base64;

import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
@Service
@RequiredArgsConstructor
public class GitService {
	 private final WebClient webClient;
	    
	    public Flux<Repo> getUserRepos(String userName){
	        return webClient.get()
	                .uri("https://api.github.com/users/{userName}/repos", userName)
	                .retrieve()
	                .bodyToFlux(Repo.class);
	    }
	    public Mono<Repo> createRepository(String repoName, String description, boolean isPrivate) {
	        return webClient.post()
	                .uri("https://api.github.com/user/repos")
	                .bodyValue(new CreateRepoRequest(repoName, description, isPrivate))
	                .retrieve()
	                .bodyToMono(Repo.class);
	    }
	    public Mono<String> addCollaborator(String owner, String repo, String username) {
	        return webClient.put()
	                .uri("https://api.github.com/repos/{owner}/{repo}/collaborators/{username}", owner, repo, username)
	                .retrieve()
	                .bodyToMono(String.class);
	    }
	    public Mono<String> uploadFile(String owner, String repo, String path, Path filePath, String message) {
	        try {
	            byte[] fileContent = Files.readAllBytes(filePath);
	            String encodedContent = Base64.getEncoder().encodeToString(fileContent);
	            CreateFileRequest request = new CreateFileRequest(encodedContent, message);

	            return webClient.put()
	                    .uri("https://api.github.com/repos/{owner}/{repo}/contents/{path}", owner, repo, path)
	                    .bodyValue(request)
	                    .retrieve()
	                    .bodyToMono(String.class)
	                    .onErrorResume(WebClientResponseException.class, ex -> {
	                        System.err.println("Error uploading file: " + ex.getMessage());
	                        return Mono.just("Failed to upload file: " + ex.getMessage());
	                    });
	        } catch (Exception ex) {
	            System.err.println("Error reading file: " + ex.getMessage());
	            return Mono.just("Failed to read file: " + ex.getMessage());
	        }
	    }


}
