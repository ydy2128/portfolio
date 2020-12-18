package kr.daoko.dto;

import java.time.LocalDateTime;

public class NoticeDTO {
	private int idx;
	private String title;
	private String content;
	private String author;
	private LocalDateTime postdate;
	private int hit;
	
	// getters and setters
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public LocalDateTime getPostdate() {
		return postdate;
	}
	public void setPostdate(LocalDateTime postdate) {
		this.postdate = postdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
}