package gg.hta.lol.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemVo {
 private int iNum;
 private String icon;
 private String name;
 private int price;
 private String effect;
 private String tags;
public ItemVo() {
	super();
}
public ItemVo(int iNum, String icon, String name, int price, String effect,String tags) {
	super();
	this.iNum = iNum;
	this.icon = icon;
	this.name = name;
	this.price = price;
	this.effect = effect;
	this.tags=tags;
} 
 
}
