package com.waait.dto;

import java.io.IOException;

import org.kohsuke.github.GHCommit;
import org.kohsuke.github.GHCommitSearchBuilder;
import org.kohsuke.github.GitHub;
import org.kohsuke.github.GitHubBuilder;
import org.kohsuke.github.PagedIterator;
import org.kohsuke.github.PagedSearchIterable;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
@ConfigurationProperties(prefix = "github")
@Component
public class GithubApi {
	GitHub gitHub;
	String token;
	
	
	 public PagedIterator<GHCommit> getCommits(String userId) {
	    	try {
	        	connectToGithub(token); 
	        } 
	        catch (IOException e) { 
	        	throw new IllegalArgumentException("failed to connect gitHub");
	        }
	        
	        GHCommitSearchBuilder builder = gitHub.searchCommits() 
	       		.author(userId)
	            	.sort(GHCommitSearchBuilder.Sort.AUTHOR_DATE); 
	        
	        PagedSearchIterable<GHCommit> commits = builder.list().withPageSize(7);
	        return commits._iterator(1);
	    } 
	
	private void connectToGithub(String token) throws IOException{
		gitHub = new GitHubBuilder().withOAuthToken(token).build();
		gitHub.checkApiUrlValidity();
	}
}
