//TODO remove
package com.dao.bean;

import java.util.List;

public class Post {
	private String postTitle;
	private String postContent;
	private List<Comment> comment;
	private int upvote, downvote;
	private int postId;
	
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public List<Comment> getComment() {
		return comment;
	}
	public void addComment(Comment comment) {
		//TO DO add comment of user as reply
	}
	public void toggleUpvote(/*User id*/) {
		//TO DO implementation
		//Get user
		//upvote++ or --
		//set user
	}
	public void toggleDownvote(/*User id*/) {
		//TO DO implementation
		//Get user
		//downvote++ or --
		//set user
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
}
