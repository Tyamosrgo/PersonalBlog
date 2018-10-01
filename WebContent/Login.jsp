<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>
	function formCheck(){
		//获取用户名 内容 判断
			var usernameObj=document.getElementById("usernameId");
			var username=usernameObj.value;
			if(username==""||username==null){
				alert("用户名不能为空");
				return false;
			}
		
		//获取密码 内容 判断
			var passwordObj=document.getElementById("passwordId");
			var password=passwordObj.value;
			if(password==""||password==null){
				alert("密码不能为空");
				return false;
			}	
		return true;
	}
	

</script>


<title>登录</title>
</head>
<body>
	<h1>登录</h1>
	<!-- /PersonalBlog/DoLogin # -->
	<form method="post" action="/PersonalBlog/DoLogin" onsubmit="return formCheck()">
	    <div>
            <p>
               	用户名 <input name="username" id="usernameId"/>
                
            </p>
            <p>
 				密码 <input type="password" name="userpassword" id="passwordId"/>
            </p>
            <input type="submit" value="提交">
			<a href="Register.jsp">用户注册</a>
        </div>
		
	</form>
	
	
	<!-- request取不到DoLogin中传的值，待解决 -->
            <div>
          	 	<%=request.getAttribute("logincheck")%>
           </div>
</body>
</html>