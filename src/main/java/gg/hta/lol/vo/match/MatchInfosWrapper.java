package gg.hta.lol.vo.match;

import com.google.gson.JsonObject;

import gg.hta.lol.vo.MatchinfoVo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MatchInfosWrapper {
	MatchinfoVo matchinfoVo;
	JsonObject json;
}
