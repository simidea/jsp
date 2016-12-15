<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=urf-8">
<title>JSTL</title>
</head>
<body>
<sql:setDataSource
     var = "hero"
     driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
     url = "jdbc:sqlserver://localhost:1433;DatabaseName=lol"
     user = "sa"
     password = ""
     />

<!-- 查询id为22的英雄 -->
<sql:query
     dataSource = "${hero}"
     sql = "select * from hero where id=22"
     var = "result"
     />
     
<c:forEach var = "row" items = "${result.rows}">
<c:out value = "${row.id}"/>
<c:out value = "${row.name}"/>
<c:out value = "${row.bieming}"/>
<c:out value = "${row.miaoshu}"/>
<br>
</c:forEach>
<br>

<!-- 查询id从10到20的英雄 -->
<sql:query
     dataSource = "${hero}"
     var = "result2" >
    select * from hero where id between ? and ?
    <sql:param value = "10"></sql:param>
    <sql:param value = "20"></sql:param>
</sql:query>
    
<c:forEach var = "row2" items = "${result2.rows}">
<c:out value = "${row2.id}"/>
<c:out value = "${row2.name}"/>
<c:out value = "${row2.bieming}"/>
<c:out value = "${row2.miaoshu}"/>
<br>
</c:forEach>
<br>

<!-- 使用fn将查找到的艾希换成盖伦 -->
<sql:query
     dataSource = "${hero}"
     sql = "select * from hero where bieming='艾希'"
     var = "result3"
     />
     
<c:forEach var = "row3" items = "${result3.rows}">
<c:out value = "${row3.id}"/>
<c:out value = "${row3.name}"/>
<c:out value = "${fn:replace(row3.bieming, '艾希', '盖伦')}"/>
<c:out value = "${row3.miaoshu}"/>
<br>
</c:forEach>


<!-- 使用fn把德玛西亚之力改成德玛西亚 -->
<sql:query
     dataSource = "${hero}"
     sql = "select * from hero where name='德玛西亚之力'"
     var = "result4"
     />
     
<c:forEach var = "row4" items = "${result4.rows}">
<c:out value = "${row4.id}"/>
<c:out value = "${fn:substring(row4.name,0,4)}"/>
<c:out value = "${row4.bieming}"/>
<c:out value = "${row4.miaoshu}"/>
<br>
</c:forEach>

<!-- 计算id为9的英雄描述有多少字 -->
<sql:query
     dataSource = "${hero}"
     sql = "select * from hero where id='9'"
     var = "result5"
     />
     
<c:forEach var = "row5" items = "${result5.rows}">
<c:out value = "${row5.id}"/>
<c:out value = "${row5.name}"/>
<c:out value = "${row5.bieming}"/>
<c:out value = "${row5.miaoshu}"/>
<c:out value = "${fn:length(row5.miaoshu)}"/>
<br>
</c:forEach>


</body>
</html>