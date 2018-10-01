<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.util.*,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
	<div>

		<%
			//连接数据库
			MySql service=new MySql();
			int id=Integer.valueOf(request.getParameter("id"));
			String sql="select * from personalblog.blogpicture where id="+id;
			ResultSet rs=service.Query(sql);
			while(rs.next()){

		%>
			<!-- 显示浏览量 -->
			<p>浏览量：<%=rs.getInt("clickCount")%></p>
			
			<%
			//浏览量更改
			sql="UPDATE personalblog.blogpicture SET clickCount="+(rs.getInt("clickCount")+1)+" WHERE id="+id;
			service.execute(sql);
			%>
			<!-- 图片显示 -->
			<a href="Picture.jsp?">
			<img src="<%=rs.getString("pictureAddress")%>">
			</a>

		<%	
			}
			service.closeAll();
		%>

		<a href="http://localhost:8080/PersonalBlog/DownloadServlet">图片下载</a>
		
	</div>
</body>
</html>