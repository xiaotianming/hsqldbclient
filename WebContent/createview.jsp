<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建视图</title>
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
	  stmt.execute(words);
	  response.getWriter().write("<script>alert('创建成功！');location.href='viewManage.jsp'</script>");
	}
  catch(Exception e)
  {
	  response.getWriter().write("<script>alert('创建失败！');location.href='viewManage.jsp'</script>");
	  e.printStackTrace();
  }

  %>
 
</body>
</html>