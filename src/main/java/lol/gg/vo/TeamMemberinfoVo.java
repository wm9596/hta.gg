package lol.gg.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamMemberinfoVo {
	private int TMNUM;
	private int SNUM;
	private String TEAMID;
	private String MATCHID;
	private String CHAMPIONID;
	private int KILL;
	private int DEATH;
	private int ASSIST;
	private int CHAMPIONLEVEL;
	private int SPELL1;
	private int SPELL2;
	private int RUNE1;
	private int RUNE2;
	private String TIER;
	private int CHAMPIONDAMAGE;
	private int TAKENDAMAGE;
	private int CS;
	private int WARDINSTALL;
	private int WARDREMOVE;
	private int GOLD;
	private int ITEM1;
	private int ITEM2;
	private int ITEM3;
	private int ITEM4;
	private int ITEM5;
	private int ITEM6;
	private int ACCESSORY;
	private int MULTIKILL;
	public TeamMemberinfoVo() {
		super();
	}
	public TeamMemberinfoVo(int tMNUM, int sNUM, String tEAMID, String mATCHID, String cHAMPIONID, int kILL, int dEATH,
			int aSSIST, int cHAMPIONLEVEL, int sPELL1, int sPELL2, int rUNE1, int rUNE2, String tIER,
			int cHAMPIONDAMAGE, int tAKENDAMAGE, int cS, int wARDINSTALL, int wARDREMOVE, int gOLD, int iTEM1,
			int iTEM2, int iTEM3, int iTEM4, int iTEM5, int iTEM6, int aCCESSORY, int mULTIKILL) {
		super();
		TMNUM = tMNUM;
		SNUM = sNUM;
		TEAMID = tEAMID;
		MATCHID = mATCHID;
		CHAMPIONID = cHAMPIONID;
		KILL = kILL;
		DEATH = dEATH;
		ASSIST = aSSIST;
		CHAMPIONLEVEL = cHAMPIONLEVEL;
		SPELL1 = sPELL1;
		SPELL2 = sPELL2;
		RUNE1 = rUNE1;
		RUNE2 = rUNE2;
		TIER = tIER;
		CHAMPIONDAMAGE = cHAMPIONDAMAGE;
		TAKENDAMAGE = tAKENDAMAGE;
		CS = cS;
		WARDINSTALL = wARDINSTALL;
		WARDREMOVE = wARDREMOVE;
		GOLD = gOLD;
		ITEM1 = iTEM1;
		ITEM2 = iTEM2;
		ITEM3 = iTEM3;
		ITEM4 = iTEM4;
		ITEM5 = iTEM5;
		ITEM6 = iTEM6;
		ACCESSORY = aCCESSORY;
		MULTIKILL = mULTIKILL;
	}
	
	
	
}
