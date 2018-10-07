<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function loseFocus(){
		var username=document.getElementById("username");
		var printout="请填写用户名";
		var pinttout2="请填写密码";
//		alert(username.value);
//		document.getElementById("spanid").innerHTML=username.value;
		if (username.value==undefined||username.value==null||username.value==""){
			document.getElementById("spanid").innerHTML=printout;
		}else{
			document.getElementById("spanid").innerHTML="";
		}
	}

</script>
</head>
<body>
	<h1>注册</h1>
	<form method="post" action=/PersonalBlog/DoRegister>
	    <div>
            <p>
               	用户名 <input name="username" id="username" onblur="loseFocus()"/>
            <span id="spanid"></span>    
            </p>

            <p>
 				密码 <input type="password" name="userpassword" onblur="loseFocus2()" />
 				<span id="spanid2"></span>    
            </p>
            <input type="submit" value="注册">
            <a href="http://localhost:8080/PersonalBlog/Login.jsp">返回</a>
        </div>
		
	
	</form>

</body>
</html>