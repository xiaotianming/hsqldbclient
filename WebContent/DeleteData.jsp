<%@page import="java.sql.*"%>
<%@page import="java.util.Vector" %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%  
   request.setCharacterEncoding("utf-8");  
   response.setCharacterEncoding("utf-8");  
   response.setContentType("text/html; charset=utf-8");  
   response.setHeader("iso-8859-1","utf-8"); 
%>  
<html> 
<head> 
<title>delete_message</title>  
</head> 
<body> 
<br/>
<% 
try{
	String db=(String)session.getAttribute("database"); 		//数据库名
	String n=(String)session.getAttribute("username"); 			//用户名
	String p=(String)session.getAttribute("password"); 		//密码 
	String tb=(String)session.getAttribute("tbName");		//表名
	String k=request.getParameter("key");	//要删除的数据
	String dbs="jdbc:hsqldb:hsql://localhost/"+db;
	Class.forName("org.hsqldb.jdbcDriver");  //用class加载动态链接库——驱动程序
	Connection conn = DriverManager.getConnection(dbs,n,p);
	Statement stat = conn.createStatement();
	String sql="select COLUMN_NAME from information_schema.COLUMNS where table_name = '"+tb+"'";
    ResultSet per = stat.executeQuery(sql);  //用于返回结果
    Vector<Object> vec = new Vector<Object>(); 
    while(per.next())
    {
    	vec.add(per.getString("COLUMN_NAME"));
    }
    sql="delete from "+tb+" where "+vec.get(0)+"='"+k+"'";
    stat.executeUpdate(sql);
    response.getWriter().write("<script>alert('删除成功');location.href='listTable.jsp'</script>");
}catch(SQLException e){
	response.getWriter().write("<script>alert('删除失败1');location.href='listTable.jsp'</script>");
    e.printStackTrace();
}catch (Exception e) {
	response.getWriter().write("<script>alert('删除失败2');location.href='listTable.jsp'</script>");
    e.printStackTrace();
}
	
%>
</body> 
</html>