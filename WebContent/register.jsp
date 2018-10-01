<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>注册</h1>
	<form method="post" action=/PersonalBlog/DoRegister>
	    <div>
            <p>
               	用户名 <input name="username"/>
                
            </p>
            <p>
 				密码 <input type="password" name="userpassword"/>
            </p>
            <input type="submit" value="注册">
            <a href="http://localhost:8080/PersonalBlog/Login.jsp">返回</a>
        </div>
		
	
	</form>

</body>
</html>