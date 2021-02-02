package gg.hta.lol.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChampionVo {
	private String championid;
	private String name;
	private int pickCount;
	private int banCount;
	private int winCount;
	private int loseCount;
	private String picture;
	private String skillP_icon;
	private String skillP_info;
	private String skillQ_icon;
	private String skillQ_info;
	private String skillW_icon;
	private String skillW_info;
	private String skillE_icon;
	private String skillE_info;
	private String skillR_icon;
	private String skillR_info;
	private String story;
	private String tip;
	public ChampionVo() {
		super();
	}
	public ChampionVo(String championid, String name, int pickCount, int banCount, int winCount, int loseCount,
			String picture, String skillP_icon, String skillP_info, String skillQ_icon, String skillQ_info,
			String skillW_icon, String skillW_info, String skillE_icon, String skillE_info, String skillR_icon,
			String skillR_info, String story, String tip) {
		super();
		this.championid = championid;
		this.name = name;
		this.pickCount = pickCount;
		this.banCount = banCount;
		this.winCount = winCount;
		this.loseCount = loseCount;
		this.picture = picture;
		this.skillP_icon = skillP_icon;
		this.skillP_info = skillP_info;
		this.skillQ_icon = skillQ_icon;
		this.skillQ_info = skillQ_info;
		this.skillW_icon = skillW_icon;
		this.skillW_info = skillW_info;
		this.skillE_icon = skillE_icon;
		this.skillE_info = skillE_info;
		this.skillR_icon = skillR_icon;
		this.skillR_info = skillR_info;
		this.story = story;
		this.tip = tip;
	}
	
}
