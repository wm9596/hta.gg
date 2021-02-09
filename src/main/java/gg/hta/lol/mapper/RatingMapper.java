package gg.hta.lol.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface RatingMapper {
	public int getRatingAvg(String snickname);
	
	public int addRating(@Param("snickname")String snickname,@Param("rate")int rate);
}
