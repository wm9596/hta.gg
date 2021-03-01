package gg.hta.lol.vo;

public class hitLimitedVo {
	private int oNum;
	private int pNum; 
	private String username;
	private int hit;
	
	public hitLimitedVo() {
		super();
	}

	public hitLimitedVo(int oNum, int pNum, String username, int hit) {
		super();
		this.oNum = oNum;
		this.pNum = pNum;
		this.username = username;
		this.hit = hit;
	}

	public int getoNum() {
		return oNum;
	}

	public void setoNum(int oNum) {
		this.oNum = oNum;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "hitLimitedVo [oNum=" + oNum + ", pNum=" + pNum + ", username=" + username + ", hit=" + hit + "]";
	}

}
