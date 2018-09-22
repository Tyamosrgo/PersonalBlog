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
			MySql service=new MySql();
			String sql="select * from personalblog.blogpicture where id="+request.getParameter("id");
			ResultSet rs=service.Query(sql);
			out.print(sql);
		%>

		<%
			service.closeAll();
		%>


		
	</div>
</body>
</html>