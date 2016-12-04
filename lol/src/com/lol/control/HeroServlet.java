package com.lol.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lol.model.Hero;
import com.lol.model.HeroManager;

public class HeroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;、

	public HeroServlet() {

		super();

	}

	/**
	 * 
	 * 显示某一个英雄，查看和编辑某一个英雄时都会用到这个方法。
	 * 
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HeroManager manager = new HeroManager();// 生成管理对象manager.

		int id = Integer.parseInt(request.getParameter("id"));// 从get的url获得id,以得到hero

		String isChange = request.getParameter("is_change");// 从get的url获得is_change的值,以判断是要查看还是编辑一个英雄。

		String directPage = "";// 将要转向的页面。

		Hero hero = manager.findOne(id);// 使用manager对象和刚才传递过来的id，获取英雄
										// request.setAttribute("hero",
										// hero);//将获取到的英雄放到request里面去。

		// 如果url的is_change对象不为空，说明是需要跳转到编辑页面. //否则是英雄的显示页面.
		if (isChange != null) {

			directPage = "/lolView/update.jsp";

		} else {

			directPage = "/lolView/hero.jsp";

		}

		// 带着hero的值转向。

		RequestDispatcher dis = request.getRequestDispatcher(directPage);
		dis.forward(request, response);

	}

	/**
	 * 
	 * 修改、添加某一个英雄
	 * 
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 转码

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String idStr = request.getParameter("id");// 从表单获得英雄id

		HeroManager manager = new HeroManager();// 使用manager对象和刚才传递过来的id，获取英雄
												// Hero hero = new
												// Hero();//声明一个新的英雄对象

		hero.setName(request.getParameter("name"));
		// 从前台获得英雄name，并把值放入刚才申明的hero对象中，下面类似。

		hero.setNickName(request.getParameter("nickName"));
		hero.setAvatar(request.getParameter("avatar"));
		hero.setImage(request.getParameter("image"));
		hero.setDesc(request.getParameter("desc"));

		String info;

		if (idStr == null) {// 如果页面传递过来没有id，则是添加英雄

			manager.add(hero);
			info = "英雄已成功添加！";

		} else {// 如果页面传递过来有id，说明是修改英雄

			int id = Integer.parseInt(idStr);
			hero.setId(id);
			manager.modify(hero);
			info = "英雄已成功修改！";
		}

		request.setAttribute("info", info);
		request.setAttribute("hero", hero);

		RequestDispatcher dis = request.getRequestDispatcher("/lolView/hero.jsp");
		dis.forward(request, response);
	}

}
