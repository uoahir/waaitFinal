package com.waait.github;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Repo {
    private long id;
    private String name;
    private String fullName;
    private boolean privateRepo;
    private Owner owner;
    private String htmlUrl;
    private String description;
    private boolean fork;
    private String url;

    @JsonProperty("private")
    public void setPrivateRepo(boolean privateRepo) {
        this.privateRepo = privateRepo;
    }

    @Data
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Owner {
        private String login;
        private long id;
        private String url;
        private String htmlUrl;
    }
    
}