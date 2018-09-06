<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.io.IOException"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建成功</title>
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
  /*ResultSet rs=stmt.executeQuery("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS where TABLE_SCHEMA='PUBLIC';");
  String[] s=rs.split(" ");
  for(int i=0;i<s.length;i++)
  {
	  if(s[i].toLowerCase().equals("viewname"))
	  {
		  
		  break;
	  }
  }
  if()*/
  try{
	  stmt.execute(words);
	  out.println("视图创建成功");
  }
  catch(Exception e)
  {
	  out.println("视图创建失败");
	  e.printStackTrace();
  }

  %>
<form action="cvpage.jsp">
<input type="submit" value="返回">
</form>
</body>
</html>