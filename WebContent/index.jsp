<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.util.*,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人博客</title>
<style>

	.indexpicture{
    	float: left;
	}
	.clear{
		clear:both;
	}
	.picturetitle{
		text-align:center;
	}
	.usernamePrint{
		float: right;
	}
	#lbpicture{
		height:300px;
	}
	
</style>
</head>
<body onload="init()">
	<!-- 网站抬头 -->
	<div>网站首页</div>
	<div>
		<a href="Picture.jsp">个人图片</a>
		<a href="PersonalInformation.jsp">个人信息</a>
		<a href="BlogPage.jsp">博客</a>
		<div class="usernamePrint">
			<%
			String username=String.valueOf(session.getAttribute("username"));;
			if (username!="null"){	
				%>欢迎，<a href="#"><%=username%></a><%
				%>&nbsp&nbsp<a href="http://localhost:8080/PersonalBlog/LogOut.jsp">注销</a><%
				
			}else{
				%>&nbsp&nbsp<a href="http://localhost:8080/PersonalBlog/Login.jsp">登录</a><%
			}
			%>
		</div>
	</div>

	<hr/>
	
	<!-- 主体部分 -->
	<div>
		<div>这里用于展示个人信息资料栏</div>
		<hr/>
		<div>近期博客资料</div>
		<div>
			<%
				MySql service=new MySql();
				String sql="select * from personalblog.blogtext";
				ResultSet rs=service.Query(sql);
				while(rs.next()){
			%>
			
				<a href="TextInfo.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("textName") %></a>
				&nbsp&nbsp&nbsp<%=rs.getString("createTime") %>
				
			<%
				}

			%>
			
		</div>
		<hr/>

		<!-- 用于展示近期图片更新 -->
		<div>
		<% 
			sql="select * from personalblog.blogpicture";
			rs=service.Query(sql);
			while(rs.next()){
		%>
			<div class="indexpicture">
				<a href="Picturedetail.jsp?id=<%=rs.getString("id")%>">
				<img src="<%=rs.getString("pictureAddress")%>" height=200px >
				</a>
				<p class="picturetitle"><%=rs.getString("name")%></p>
			</div>
		
		<%
			}
			service.closeAll();
		
		%>
		</div>
	</div>

	
	<div class="clear"></div>
	
	<hr/>
	
	<!-- 轮播图 -->
	<div class="lunbo">
		<img src="ui/img/lp1.jpg" id="lbpicture">
	</div>
	
	<!-- 下方部分 -->
	<div>用于最下方的  关于我们....</div>
</body>
	<script>
		var i=1;
		
		function init(){
			setInterval(showPicture,3000);
		}
		
		function showPicture(){
			var imgObj=document.getElementById("lbpicture");
			
			imgObj.src="ui/img/lp"+i+".jpg";
			i++;
			if (i>3){
				i=1;
			}
		}
		
		
	</script>
</html>