<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.lol.model.Hero"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="http://localhost:8080/lol/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>英雄联盟</title>

</head>
<body>

	<!-- 英雄的添加和修改都会在这个页面完成。 -->

	<div class="container ">

		<%
			//如果能从后台获取到hero，那么说明是修改//默认将内容填入到表单内。

			Hero hero = (Hero) request.getAttribute("hero");
			Integer id = null;

			String name = "";
			String nick_name = "";
			String avatar = "";
			String image = "";
			String desc = "";

			String title = "添加英雄";//如果不能在页面发现hero,那么页面标题默认为“添加英雄。”

			if (hero != null) {

				id = hero.getId();
				name = hero.getName();

				nick_name = hero.getNickName();
				avatar = hero.getAvatar();
				image = hero.getImage();

				desc = hero.getDesc();
				title = "修改英雄";
			}
		%>

		<h1 class="center">

			<%=title%>

		</h1>

		<form action="/jsp/hero" method="post" class="form-horizontal"
			role="form">
			<!-- 传递id -->

			<input type="hidden" value="<%=id%>" />
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">英雄姓名</label>

				<div class="col-sm-10">

					<input name="name" type="text" class="form-control" id="name"
						placeholder="name" value="<%=name%>">

				</div>

			</div>

			<div class="form-group">

				<label for="nickName" class="col-sm-2 control-label">昵称</label>
				<div class="col-sm-10">
					<input name="nickName" type="text" class="form-control"
						id="nickName" placeholder="nickName" value="<%=nick_name%>">

				</div>

			</div>

			<div class="form-group">

				<label for="avatar" class="col-sm-2 control-label">英雄头像</label>
				<div class="col-sm-10">
					<input name="avatar" type="text" class="form-control" id="avatar"
						placeholder="avatar" value="<%=avatar%>">
				</div>

			</div>

			<div class="form-group">

				<label for="image" class="col-sm-2 control-label">英雄背景</label>
				<div class="col-sm-10">
					<input name="image" type="text" class="form-control" id="image"
						placeholder="image" value="<%=image%>">

				</div>

			</div>

			<div class="form-group">

				<label for="desc" class="col-sm-2 control-label">故事背景</label>
				<div class="col-sm-10">
					<textarea name="desc" class="form-control" rows="3"><%=desc%></textarea>
				</div>

			</div>

			<div class="form-group">

				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success">保存</button>
				</div>
			</div>

		</form>

	</div>

</body>

</html>