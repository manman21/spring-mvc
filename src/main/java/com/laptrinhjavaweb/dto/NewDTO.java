package com.laptrinhjavaweb.dto;

public class NewDTO extends AbstractDTO<NewDTO>{

	private String title;
	private String thumbnail;
	private String shortDescription;
	private String content;
	private Long categoryId;
	private String categoryCode;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getShortDescription() {
		return shortDescription;
	}
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public NewDTO(String title, String thumbnail, String shortDescription, String content, Long categoryId) {
		super();
		this.title = title;
		this.thumbnail = thumbnail;
		this.shortDescription = shortDescription;
		this.content = content;
		this.categoryId = categoryId;
	}
	public NewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	
}
