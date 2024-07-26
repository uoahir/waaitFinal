package com.waait.github;

import java.nio.file.Files;
import java.nio.file.Path;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
@RequiredArgsConstructor
public class GitController {


    private final GitService gitService;
    
    @GetMapping("/users/{userName}/repos")
    public Flux<Repo> getUserRepos(@PathVariable String userName){
        return gitService.getUserRepos(userName);
    }
    //repository 생성
    @PostMapping("/repos")
    public Mono<Repo> createRepository(@RequestBody CreateRepoRequest createRepoRequest) { 
        return gitService.createRepository(createRepoRequest.getName(), createRepoRequest.getDescription(), createRepoRequest.isPrivate());
    }// repository 초대하기
    @PostMapping("/repos/{owner}/{repo}/collaborators/{username}")
    public Mono<String> addCollaborator(@PathVariable String owner, @PathVariable String repo, @PathVariable String username) {
        return gitService.addCollaborator(owner, repo, username);
    }
    @PostMapping("/repos/{owner}/{repo}/contents/{path}")
    public Mono<String> uploadFile(@PathVariable String owner, @PathVariable String repo, @PathVariable String path,
                                   @RequestParam("file") MultipartFile file,
                                   @RequestParam("message") String message) {
        try {
            Path tempFile = Files.createTempFile(null, null);
            file.transferTo(tempFile);

            return gitService.uploadFile(owner, repo, path, tempFile, message);
        } catch (Exception ex) {
            return Mono.just("Failed to upload file: " + ex.getMessage());
        }
    }
}
