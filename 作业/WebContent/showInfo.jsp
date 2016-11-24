<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>接受审判吧少年！</title>
</head>
<body>
<%
    GirlFriend gf = (GirFriend)session.getAttribute("myGirlFriend");//从刚才的页面中得到选项内容
    String phone = request.getParameter("phone");//从刚才的页面得到选项内容
    
    
    int  shengQi = gf.getShengQi();//获得现在女朋友的生气值
    int ai= gf.getAi();//获得现在女朋友的爱值
    
    if(phone.equals("0")){
    	shengQi = shengQi + 10;//如果选择了手机静音shengQ1+10
     }else if(phone.equals("1")){
    	shengQi = shengQi + 30;//如果选择了打游戏shengQ1+30
     }else if(phone.equals("2")){
	    ai = ai + 20;//如果选择了给她买东西ai+30
     }else{
    	 ai = ai + 10;//如果选择了在工作 ai + 30
    	 shengQi = shengQi + 10; //shengQi + 10
     }
     gf.setShengQi(shengQi);//把最后的结果赋值给gf变量
     gf.getAi(ai);
     
     if(gf.getShengQi() > 20){//做个判断
    	 out.print("<h1>恭喜你,你已经go die了<h1>");	 
     }else{
    	 out.print("<h1>少年你要小心，女朋友的怒气已经达到<h1>" + gf.getShengQi() + "</h1>");	
    	 
    	 if(gf.getAi() > 30){
    		out.print("<h1>哎呦，不错哦，女朋友还是蛮喜欢你的嘛~<h1>");
    	 }
    	 out.print("<p><a href='status.jsp'>继续测试！</a></p>");
     }
     if(gf.getAi() > 100){
    	 out.print("<h1>恭喜你们可以不如殿堂</h1>");
     } 
    %>
</body>
</html>