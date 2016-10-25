<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>deleteAndAdd</title>
</head>
<body>
输入添加
<form action="insert.jsp" method="post">
学号 ：<input name="id" type="text"/><br>
姓名： <input name="name" type="text"/><br>
性别： <input name="sex" type="text"/><br>
专业 ：<input name="software" type="text"/><br>

<button type="sumbit" >提交</button>
</form>
<br>
<br>
输入删除
<form action="delete.jsp" method="post">
请输入姓名删除 ：<input name="name" type="text"/><br>
<button type="sumbit" >提交</button>
</form>

</body>
</html>