package lol.gg.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

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
	public CommunityVo() {
		super();
	}
	public CommunityVo(int pNum, String username, int cNum, String title, String content, int hit, int nohit,
			int viewCount, int commentCount) {
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
	}
	
}
