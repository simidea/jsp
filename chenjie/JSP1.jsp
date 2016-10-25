<%@ page language="java" contentType="text/html; charset=gb2312 " import="java.sql.*,java.io.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>插入数据</title>
</head>
<body>
<% 
String id =request.getParameter("id");
byte b1[]=id.getBytes("ISO-8859-1");
id=new String(b1,"UTF-8");
String name =request.getParameter("name");
byte b2[]=name.getBytes("ISO-8859-1");
name=new String(b2,"UTF-8");
String sex =request.getParameter("sex");
byte b3[]=sex.getBytes("ISO-8859-1");
sex=new String(b3,"UTF-8");
String software =request.getParameter("software");
byte b4[]=software.getBytes("ISO-8859-1");
software=new String(b4,"UTF-8");

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
String sql="insert into shuju values (?,?,?,?)";
PreparedStatement st=conn.prepareStatement(sql);
st.setInt(1,Integer.parseInt(id));
st.setString(2,name);
st.setString(3,sex);
st.setString(4,software);
st.executeUpdate();
System.out.println(st.toString());
st.close();
rs.close();
stmt.close();
conn.close();
%>
插入信息了！
</body>
</html>