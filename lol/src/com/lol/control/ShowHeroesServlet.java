package com.lol.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lol.model.Hero;
import com.lol.model.HeroManager;

public class ShowHeroesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShowHeroesServlet() {

	}

	/**
	 * 
	 * 显示全部的英雄.
	 * 
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HeroManager manager = new HeroManager();// 生成一个manager对象

		List<Hero> heroes = manager.findAll();// 找到所有的英雄

		request.setAttribute("heroes", heroes);// 将所有的英雄放到request中

		RequestDispatcher dis = request.getRequestDispatcher("/lolView/heroes.jsp");
		dis.forward(request, response);// 带着所有的英雄转向。
	}

}