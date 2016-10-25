<%@ page language="java" contentType="text/html; charset=gb2312 " import="java.sql.*,java.io.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>删除信息</title>
</head>
<body>
<% 
String name =request.getParameter("name");
byte b1[]=name.getBytes("ISO-8859-1");
name=new String(b1,"UTF-8");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance(); 
String connectSQL="jdbc:sqlserver://localhost:1433;DatabaseName=axiba";
Connection conn=java.sql.DriverManager.getConnection(connectSQL,"sa","");
Statement stmt=conn.createStatement();
ResultSet rs= stmt.executeQuery("select * from shuju");
out.println("<table>");
while(rs.next()){
	out.println("<tr>");
	out.println("<td>"+rs.getInt("id")+("</td>"));
	out.println("<td>"+rs.getString("name")+("</td>"));
	out.println("<td>"+rs.getString("sex")+("</td>"));
	out.println("<td>"+rs.getString("software")+("</td>"));
}
out.println("</table>");
%>
<% 
String sql="delete from shuju where name = ? ";
PreparedStatement st=conn.prepareStatement(sql);
st.setString(1,name);
st.executeUpdate();
System.out.println(st.toString());
rs.close();
st.close();
conn.close();
%>
删除信息了！
</body>
</html>