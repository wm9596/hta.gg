package gg.hta.lol.vo.match;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MatchMostVo {
	List<MatchListVo> matchList;
	List<MostChampVo> mostList;
}
