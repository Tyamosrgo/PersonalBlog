<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.util.*,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css"> 
	p{
 	 word-wrap: break-word;
 	 word-break: break-all;
 	 overflow: hidden;
	}
</style> 
<title>文章详情</title>
</head>
<body>
	<div>
		<a href="index.jsp">网站首页</a>
		<a href="BlogPage.jsp">返回博客</a>
	</div>
	<div>
		<%
			MySql service=new MySql();
			String sql="select * from personalblog.blogtext where id="+request.getParameter("id");
			ResultSet rs=service.Query(sql);
			while(rs.next()){
		%>
			<p><%=rs.getString("text").replaceAll("~!@","<br>")%></p>
			<p><%=rs.getString("createTime") %></p>
			<p><%=rs.getString("writerName") %></p>
			<p><%=rs.getString("class") %></p>
		<%
			}
			service.closeAll();
		%>


	</div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
</body>
</html>