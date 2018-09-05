<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录成功</title>
</head>
<body>
<%

  String username = request.getParameter("username");


  session.setAttribute("username",username);  

  String password = request.getParameter("password");
  session.setAttribute("password",password);
  String database = request.getParameter("database");
  session.setAttribute("database",database);
  String dbs="jdbc:hsqldb:hsql://localhost/"+database;
  Class.forName("org.hsqldb.jdbcDriver");

  // 2、获取连接
  Connection conn = DriverManager.getConnection(dbs, username, password);

  
  // 3、创建语句
  Statement stmt = conn.createStatement();
  ResultSet rs=stmt.executeQuery("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES where table_schema='PUBLIC' and TABLE_TYPE='BASE TABLE';");
  while(rs.next()) {
		String name = rs.getString("TABLE_NAME");
	    out.println(name);
	}
  out.println("数据库登录成功");
  %>
<form action="Newdb.jsp">
        <table align="center" valign="center">
            <tr><td><input type="submit" value="创建数据库"></td></tr>
        </table>
</form>
<form action="NewUSER.jsp">
        <table align="center" valign="center">
            <tr><td><input type="submit" value="创建用户"></td></tr>
        </table>
</form>

</body>
</html>