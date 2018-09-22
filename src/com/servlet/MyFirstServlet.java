package com.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;


public class MyFirstServlet implements Servlet {
	//初始化servlet 将servlet装载到内存中，只运行一次
	public void init(ServletConfig config)
	          throws ServletException{
		
	}

	@Override
	//销毁servlet 仅调用一次
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	//得到servletconfig对象
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	//得到servlet配置信息
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	//核心函数 服务函数，业务逻辑代码写在这里
	//每次请求都会被调用
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("测试代码"+new java.util.Date());
		res.setCharacterEncoding("UTF-8");
		res.getWriter().println("测试代码  "+new java.util.Date());
	}
}
