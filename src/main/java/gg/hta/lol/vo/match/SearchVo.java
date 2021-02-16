package gg.hta.lol.vo.match;

import java.util.List;

import gg.hta.lol.riotapi.GameType;
import gg.hta.lol.vo.QueueInfoVo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchVo {
	private String snickname;
	private String accountId;
	private int slevel;
	private String icon;
	private List<QueueInfoVo> qiList;
	
	public QueueInfoVo getSolo() {
		for(QueueInfoVo vo : qiList) {
			if(vo.getQueueType().equals(GameType.RANKED_SOLO_5x5.toString()))
				return vo;
		}
		return null;
	}
	
	public QueueInfoVo getFlex() {
		for(QueueInfoVo vo : qiList) {
			if(vo.getQueueType().equals(GameType.RANKED_FLEX_SR.toString()))
				return vo;
		}
		return null;
	}
	
}
