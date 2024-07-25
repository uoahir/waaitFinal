package com.waait.dto;

import java.io.IOException;

import org.kohsuke.github.GHCommit;
import org.kohsuke.github.GHCommitSearchBuilder;
import org.kohsuke.github.GitHub;
import org.kohsuke.github.GitHubBuilder;
import org.kohsuke.github.PagedIterator;
import org.kohsuke.github.PagedSearchIterable;

public class GithubApi {
	GitHub gitHub;
	String token = "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";
	
	
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
