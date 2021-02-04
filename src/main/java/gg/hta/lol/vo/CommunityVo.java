package gg.hta.lol.vo;

import java.sql.Date;

public class CommunityVo {
	private int pNum; 
	private String username;
	private int cNum;
	private String title;
	private String content;
	private int hit;
	private int nohit;
	private int viewCount;
	private int commentCount;
	Date regdate;
	public CommunityVo() {
		super();
	}
	public CommunityVo(int pNum, String username, int cNum, String title, String content, int hit, int nohit,
			int viewCount, int commentCount, Date regdate) {
		super();
		this.pNum = pNum;
		this.username = username;
		this.cNum = cNum;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.nohit = nohit;
		this.viewCount = viewCount;
		this.commentCount = commentCount;
		this.regdate = regdate;
	}
	
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getNohit() {
		return nohit;
	}
	public void setNohit(int nohit) {
		this.nohit = nohit;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "CommunityVo [pNum=" + pNum + ", username=" + username + ", cNum=" + cNum + ", title=" + title
				+ ", content=" + content + ", hit=" + hit + ", nohit=" + nohit + ", viewCount=" + viewCount
				+ ", commentCount=" + commentCount + ", regdate=" + regdate + "]";
	}
}