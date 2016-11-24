<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>展开女朋友页面</title>
<!-- 初始化女朋友 -->
<jsp:useBean id="myGirlFriend" class="kwx.GirlFriend" scope="session" />
<!-- 一次填入，再无烦恼 -->
<jsp:setProperty property="*" name="myGirlFriend" />

<!-- 讲刚才填入的值,设置到女朋友内
<jsp:setproperty name="myGirlFriend" property="yanZhi" />
<jsp:setproperty name="myGirlFriend" property="tiZhong" />
<jsp:setproperty name="myGirlFriend" property="shenGao" />
<jsp:setproperty name="myGirlFriend" property="shengQi" />
<jsp:setproperty name="myGirlFriend" property="ai" />
-->
</head>
<body>
<p> 女朋友的颜值: <jspgetProperty name="myGirlFriend" property="yanZhi" />分</p>
<p> 女朋友的体重: <jspgetProperty name="myGirlFriend" property="tiZHong" />kg</p>
<p> 女朋友的身高: <jspgetProperty name="myGirlFriend" property="shenGao" />cm</p>
<p> 女朋友的怒值: <jspgetProperty name="myGirlFriend" property="shengQi" /></p>
<p> 女朋友的爱值: <jspgetProperty name="myGirlFriend" property="ai" /></p>

<p><a href="status.jsp">前方高能！！开始测试！！！</a></p>
</body>
</html>