<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
	<h1>登录</h1>
	<form method="post" action=/PersonalBlog/DoLogin>
	    <div>
            <p>
               	用户名 <input name="username"/>
                
            </p>
            <p>
 				密码 <input type="password" name="userpassword"/>
            </p>
            <input type="submit" value="提交">
			<a href="register.jsp">用户注册</a>
        </div>
		
	
	</form>
	
	
	<!-- request取不到DoLogin中传的值，待解决 -->
            <div>
          	 	<%=request.getAttribute("logincheck")%>
           </div>
</body>
</html>