package com.lol.model;

public class Hero {

	private Integer id; // 存入数据库的编号 private String name; //名字如盖伦

	private String nickName;// 别称如德玛西亚之力 private String desc;//英雄的描述
	private String avatar;// 英雄的头像地址 private String image;//英雄的背景图片

	public Hero(int id) {

		this.id = id;

	}

	public Hero() {

	}

	public Integer getId() {

		return id;

	}

	public void setId(Integer id) {

		this.id = id;

	}

	public String getName() {

		return name;

	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {

		return desc;

	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getImage() {

		return image;

	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAvatar() {

		return avatar;

	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

}
