<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除视图</title>
</head>
<body>

<%

try{

  String words = request.getParameter("statement");
  
  Class.forName("org.hsqldb.jdbcDriver");

  // 2、获取连接
  Connection conn = DriverManager.getConnection("jdbc:hsqldb:hsql://localhost/mydb", "SA", "");

  // 3、创建语句
  Statement stmt = conn.createStatement();

	  stmt.execute("drop view "+words+";");
	  response.getWriter().write("<script>alert('视图删除成功！');location.href='viewManage.jsp'</script>");
  }
  catch(Exception e)
  {
	  	  response.getWriter().write("<script>alert('视图删除失败！');location.href='viewManage.jsp'</script>");

	  e.printStackTrace();
  }
  %>
<form action="viewManage.jsp">
<input type="submit" value="返回">
</form>
</body>
</html>