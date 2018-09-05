<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建数据库成功</title>
</head>
<body>
<%@ page contentType="text/html; charset=UTF-8"
		language="java"
		buffer="32kb"
		import="java.lang.Runtime,java.io.*"
		%>
		<%
		String dbn = request.getParameter("databasename");
		String otn = request.getParameter("othername");

		Runtime r = java.lang.Runtime.getRuntime();
		String command = "java -cp G:/数据库系统概论/小学期/hsqldb-2.4.1/hsqldb/lib/hsqldb.jar org.hsqldb.server.Server --database.0 file:G:/数据库系统概论/小学期/hsqldb-2.4.1/hsqldb/data/"+dbn+" --dbname.0 "+otn;
		try
		{
		Process p = r.exec(command);
		BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()),1024);
		while (br.read()!=-1)
		{
		out.print(br.readLine());
		}
		br.close();
		
		}catch(IOException e)
		{
		e.printStackTrace();
		}
		%>  
<form action="logindb.jsp">
        <table align="center" valign="center">
            <tr><td><input type="submit" value="重新登录"></td></tr>
        </table>
</form>
</body>
</html>