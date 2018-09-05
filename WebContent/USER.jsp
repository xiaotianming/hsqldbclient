<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>USER创建页面</title>
</head>
<body>
<form action="logindb.jsp">
        <table align="center" valign="center">
        	
            <tr><th>用户创建成功</th></tr>
            <tr><td><input type="submit" value="重新登录"></td></tr>
         </table>
    </form>
<%
	String username = (String)session.getAttribute("username");
	String password = (String)session.getAttribute("password");
	String database = (String)session.getAttribute("database");
	String dbs="jdbc:hsqldb:hsql://localhost/"+database;
	Class.forName("org.hsqldb.jdbcDriver");
	
	  // 2、获取连接
	Connection conn = DriverManager.getConnection(dbs, username, password);		
	  // 3、创建语句
	Statement stmt = conn.createStatement();
	String user = request.getParameter("newusername");
	String pass = request.getParameter("newpassword");
	stmt.execute("create user "+user+" password '"+pass+"' admin");
	out.print("su");
%>
</body>
</html>