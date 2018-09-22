<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.util.*,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人图片</title>
</head>
<body>
	<div>
		<a href="index.jsp">网站首页</a>
	</div>
	<div>
		个人图片
		<a href="PersonalInformation.jsp">个人信息</a>
		<a href="BlogPage.jsp">博客</a>
	</div>
	<div></div>

	<hr/>
	
	<div>
		<% 
			MySql service=new MySql();
			String sql="select * from personalblog.blogpicture";
			ResultSet rs=service.Query(sql);
			while(rs.next()){
		%>
		<a href="Picturedetail.jsp?id=<%=rs.getString("id")%>">
		<img src="<%=rs.getString("pictureAddress")%>" height=600px>
		</a>
		
		<%
			}
			service.closeAll();
			
		%>
	</div>

</body>
</html>