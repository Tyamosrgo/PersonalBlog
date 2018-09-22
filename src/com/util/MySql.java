package com.util;

import java.sql.*;
import java.util.List;
public class MySql {
	private final String DRIVER="com.mysql.jdbc.Driver",
	URL="jdbc:mysql://localhost/personalblog",
	USERNAME="root",
	PASSWORD="s343473";
	
	public Connection connection;
	public Statement st;
	public PreparedStatement ps;
	public ResultSet rs;
	//链接数据库
	public Connection getConnection(){		
		try{
			Class.forName(DRIVER);
			connection=DriverManager.getConnection(URL,USERNAME,PASSWORD);
		}catch(ClassNotFoundException e){
			System.out.print("数据库驱动不成功（数据库和java的架包版本不是一样的）");
			return null;
		}catch(SQLException e){
			System.out.print("连接不上数据库（登录名，密码，连接地址写错了）");
			return null;
		}
		return connection;
	}
	
	public int execute(String sql){
		Connection con=getConnection();
		int count=0;
		try{
			st=con.createStatement();
			count=st.executeUpdate(sql);			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return count;
	}
	
	public int execute(String sql,List<Object> list)
	{
		Connection con=getConnection();
		int count=0;
		try{
			ps=con.prepareStatement(sql);
			for(int i=0;i<list.size();i++){
				ps.setObject((i+1),list.get(i));
			}			
			count=ps.executeUpdate();			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return count;
	}
	
	public ResultSet Query(String sql){
		Connection con=getConnection();
		try{
			st=con.createStatement();
			rs= st.executeQuery(sql);			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet Query(String sql,List<Object> list){
		Connection con=getConnection();
		try{
			ps=con.prepareStatement(sql);
			for(int i=0;i<list.size();i++){
				ps.setObject((i+1),list.get(i));
			}	
			rs= ps.executeQuery();			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	//关闭数据库
	public void closeAll(){
		try{
			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				ps.close();
			}
			if(st!=null){				
				st.close();
			}
			connection.close();
		}catch(Exception e){
			System.out.print("数据库关闭出错");
		}
	}
	
}
