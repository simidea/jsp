<%@ page language="java" contentType="text/html; charset=utf-8" 
    import="java.sql.*,java.io.*" %>
<%@ page %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>查看</title>
</head>
<body>
<table>
<%
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
  String connectSQL="jdbc:sqlserver://localhost:1433;DatabaseName=software";
  Connection conn=java.sql.DriverManager.getConnection(connectSQL,"sa","seasonflower");
  Statement stmt=conn.createStatement();
  ResultSet rs=stmt.executeQuery("select * from stu");
 
  while(rs.next())
  {
	  out.println("<tr>");
	  out.println("<td><a href='modify.jsp?id="+rs.getInt("id")+"'>编号</a></td>");
	  out.println("<td>"+rs.getString("name")+"</td>");
	  out.println("<td>"+rs.getInt("age")+"</td>");
	  out.println("<td>"+rs.getString("major")+"</td>");
	  out.println("</tr>");
	  
 
  }
    rs.close();
    stmt.close();
    conn.close();
 %>

<%=session.getAttribute("info") %>

</table>
</body>
</html>