package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MySql;

/**
 * Servlet implementation class DoRegister
 */
@WebServlet("/DoRegister")
public class DoRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoRegister() {
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

		  if(username!=""&&password!="")
		  {
			  //判断重复
			  MySql service=new MySql();
			  String sql="select * from personalblog.blogusers "
						  +"where username='"+username+"'";
			  ResultSet rs= service.Query(sql); 
			  //判断 如果数据库中有用户名则不予注册
			  try {
				if(rs.next()){
					
				}else{
				  
				  //插入
				  sql="INSERT INTO personalblog.blogusers (id,username,password) VALUES(null,'"+username+"','"+password+"')";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			  int count=service.execute(sql);
			  if(count!=0){
				  response.sendRedirect("/PersonalBlog/Login.jsp");
			  }else{
				  response.sendRedirect("/PersonalBlog/register.jsp");
			  }
			  
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
