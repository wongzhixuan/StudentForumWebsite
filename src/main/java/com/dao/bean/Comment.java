package com.dao.bean;

import java.util.List;
import com.entities.User;

public class Comment {
	private int id, pid;
	private User user;
	private String commentText;
	private List<LeafComment> replies;
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public List<LeafComment> getReplies() {
		return replies;
	}
	public void setReplies(List<LeafComment> replies) {
		this.replies = replies;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
}
