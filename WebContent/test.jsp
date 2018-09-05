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
		<%@ page contentType="text/html; charset=UTF-8"
		language="java"
		buffer="32kb"
		import="java.lang.Runtime,java.io.*"
		%>
		<%
		Runtime r = java.lang.Runtime.getRuntime();
		String command = "java -cp G:/数据库系统概论/小学期/hsqldb-2.4.1/hsqldb/lib/hsqldb.jar org.hsqldb.server.Server --database.0 file:G:/数据库系统概论/小学期/hsqldb-2.4.1/hsqldb/data/test --dbname.0 newdb";
		
		
		//try
		//{
		out.print("0");
		Process p = r.exec(command);
		out.print("1");
		BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()),1024);
		out.print("1");
		while (br.read()!=-1)
		{
		out.print(br.readLine());
		}
		br.close();
		out.print("2");
		//}catch(IOException e)
		//{
		//e.printStackTrace();
		//}
		%>  
</body>
</html>