<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建数据库</title>
</head>
<body>
<form action="newdatabase.jsp">
        <table align="center" valign="center">
            <tr><th>数据库创建页面</th></tr>
            <tr>
                <td>database</td>
                <td width="500px"><input type="text" name="databasename"/></td>
            </tr>
            <tr>
                <td>别名</td>
                <td width="500px"><input type="text" name="othername"/></td>
            </tr>
            <tr><td><input type="submit" value="创建"></td></tr>
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
		stmt.execute("SHUTDOWN");
		conn.close();
%>
</body>
</html>