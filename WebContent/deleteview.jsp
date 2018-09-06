<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除成功</title>
</head>
<body>
<%

  String words = request.getParameter("statement");
  
  //String dbs="jdbc:hsqldb:hsql://localhost/"+database;
  Class.forName("org.hsqldb.jdbcDriver");

  // 2、获取连接
  Connection conn = DriverManager.getConnection("jdbc:hsqldb:hsql://localhost/mydb", "SA", "");

  // 3、创建语句
  Statement stmt = conn.createStatement();
  /*stmt.execute("drop view "+words+";");
  out.println("视图删除成功");*/
  try{
	  stmt.execute("drop view "+words+";");
	  out.println("视图删除成功");
  }
  catch(Exception e)
  {
	  out.println("视图删除失败");
	  e.printStackTrace();
  }
  %>
<form action="dvpage.jsp">
<input type="submit" value="返回">
</form>
</body>
</html>