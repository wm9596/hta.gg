package gg.hta.lol.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
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
	
}
