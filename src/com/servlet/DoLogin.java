package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MySql;

/**
 * Servlet implementation class DoLogin
 */
@WebServlet("/DoLogin")
public class DoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");  
		String password=request.getParameter("userpassword");
		out.println("LoginTest");
		  if(username!=""&&password!="")
		  {
			  String sql="select * from personalblog.blogusers "
					  +"where username=? and password=?";
			  List<Object> list=new ArrayList<Object>();
			  list.add(username);
			  list.add(password);
			  MySql service=new MySql();
			  ResultSet rs= service.Query(sql, list);
			  try{
				  if(rs.next()){
					  out.print("LoginSuccess");	  
					  request.getSession().setAttribute("username",request.getParameter("username")) ;
					  //登录成功页面
					  response.sendRedirect("/PersonalBlog/LoginSuccess.jsp");
					  //主页面
//					  response.sendRedirect("http://localhost:8080/PersonalBlog/index.jsp");

				  }else{
					  
					  //response.sendRedirect("/Jsptest1/admin/loginError.jsp");	  
				      out.println("alert('"+"Fail to login,enter the right username and password"+"');location.href='"+"/PersonalBlog/Login.jsp"+"';");
				      request.setAttribute("logincheck","用户名密码错误");  
				      response.sendRedirect("/PersonalBlog/Login.jsp");
				  }
			  }catch(SQLException e){
				  
			  }
			  service.closeAll();
			  
		  }else{
			  out.print("please enter the username and password");
			  request.setAttribute("logincheck","无用户名密码输入");  
			  response.sendRedirect("/PersonalBlog/Login.jsp");
		  } 
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
