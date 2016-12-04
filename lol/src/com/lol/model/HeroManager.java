package com.lol.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lol.model.Hero;

public class HeroManager {

	private Hero hero;// 保存从数据库内获取的一个英雄数据 private List<Hero>
						// heroes;//保存从数据库内获取的多个英雄数据

	private Connection conn; // 数据库相关变量 private Statement stmt;
	private ResultSet rs;
	private PreparedStatement ps;

	/*
	 * * 根据传递过来的id查找一个英雄
	 * 
	 */

	public Hero findOne(int id) {

		conn = getConnetion();

		try {

			stmt = conn.createStatement();

			// 执行查询

			rs = stmt.executeQuery("select * from hero where id = " + id);

			hero = new Hero(id);

			// 将获取到的结果集(rs)，放到hero里面封装好。

			while (rs.next()) {

				hero.setName(rs.getString("name"));
				hero.setNickName(rs.getString("nick_name"));
				hero.setImage(rs.getString("image"));
				hero.setAvatar(rs.getString("avatar"));
				hero.setDesc(rs.getString("description"));

			}

			rs.close();
			stmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 返回封装好的hero。

		return hero;

	}

	/*
	 * 
	 * 查找所有英雄
	 * 
	 */

	public List<Hero> findAll() {
		conn = getConnetion();
		try {
			stmt = conn.createStatement();
			// 执行查询

			rs = stmt.executeQuery("select * from hero");
			// 声明一个列表变量heroes来放所有的hero

			heroes = new ArrayList<Hero>();

			while (rs.next()) {

				// 每读一条数据就新生成一个hero
				hero = new Hero();

				// 将每一条数据的值取出，放入刚才声明的hero。

				hero.setId(rs.getInt("id"));
				hero.setName(rs.getString("name"));
				hero.setNickName(rs.getString("nick_name"));
				hero.setImage(rs.getString("image"));
				hero.setAvatar(rs.getString("avatar"));
				hero.setDesc(rs.getString("description"));

				// 将装好的hero放到之前申明的heroes列表中。

				heroes.add(hero);

			}

			rs.close();
			stmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 返回所有的英雄

		return heroes;

	}

	/*
	 * * 增加一个英雄
	 * 
	 */

	public void add(Hero hero) {

		String sql = "insert into hero (name, nick_name, avatar, image, description) values(?,?,?,?,?)";

		conn = getConnetion();

		try {

			// 预处理，准备向数据库插入新的英雄
			ps = conn.prepareStatement(sql);

			// 从传递过来的hero中取出英雄的属性，放入将要查询的sql中。

			ps.setString(1, hero.getName());
			ps.setString(2, hero.getNickName());
			ps.setString(3, hero.getAvatar());
			ps.setString(4, hero.getName());
			ps.setString(5, hero.getDesc());
			// 执行查询。

			ps.executeUpdate();

			ps.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/*
	 * * 修改一个英雄
	 * 
	 */

	public void modify(Hero hero) {

		String sql = "update hero set name = ?, nick_name = ?, avatoar = ?" + "image = ?, description = ? where id = ?";

		conn = getConnetion();
		try {

			// 预处理，准备向数据库更新的英雄
			ps = conn.prepareStatement(sql);

			// 从传递过来的hero中取出英雄的属性，放入将要查询的sql中。

			ps.setString(1, hero.getName());
			ps.setString(2, hero.getNickName());
			ps.setString(3, hero.getAvatar());
			ps.setString(4, hero.getName());
			ps.setString(5, hero.getDesc());
			ps.setInt(6, hero.getId());

			// 执行查询。

			ps.executeUpdate();

			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/*
	 * * 获取数据库连接
	 * 
	 */

	public Connection getConnetion() {

		String driverName = "com.mysql.jdbc.Driver";

		String url = "jdbc:mysql://localhost:3306/lol";

		String user = "root";

		String password = "";

		try {

			Class.forName(driverName);

			return DriverManager.getConnection(url, user, password);// 将连接好的对象connection返回，供调用。
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;

		}

	}

	public HeroManager() {

	}

}