//TODO remove
package com.dao.bean;

public class Record {
	private int postId;
	private String title, description;
	
	public int getId() {
		return postId;
	}
	public void setId(int postId) {
		this.postId = postId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescrip() {
		return description;
	}
	public void setDescrip(String description) {
		this.description = description;
	}

}
