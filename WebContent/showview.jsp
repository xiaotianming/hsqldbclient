<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>打印成功</title>
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
  
  String tb=null;
  //System.out.println(words);
  String[] s=words.split(" ");
  
  for(int i=0;i<s.length;i++)
  {
	  if(s[i].toLowerCase().equals("from"))
	  {
		  if(s[i+1].endsWith(";"))
		  {
			  tb=s[i+1].replaceAll(";","");
		  }
		  else
		  {
			  tb=s[i+1];
		  }
		  break;
	  }
  }
  
  try{
	  ResultSet rs = stmt.executeQuery("SELECT * FROM "+words+";");
	  ResultSetMetaData   mtdt=rs.getMetaData(); 
	  int count=mtdt.getColumnCount();
	  %>
	  <table>
	  <tr>
	  <%
	  for(int l=1;l<=count;l++){
		  %>
		  <td width="100">
		  <%
			out.println(mtdt.getColumnName(l)+'\n');  
		  %>
		  </td>
		  <%
	  }
		  %>
	  
	  </tr>
	  </table>
	  <%

		while(rs.next()) {
			  %>
			  <table>
			  <tr>
			  <%
			for(int k=1;k<=count;k++)
			{
				  %>
				  <td width="100">
				  <%
				out.print(rs.getString(k)/*+" "+rs.getString(2)*/);
				
				  %>
				  </td>
				  <%
			}
			  /*out.print("<br>");*/
			  %>
			  
			  </tr>
			  </table>
			  <%
			}
	  out.println("视图打印成功");
  }
  catch(Exception e)
  {
	  out.println("视图打印失败");
	  e.printStackTrace();
  }

  %>
  
<form action="svpage.jsp">
<input type="submit" value="返回">
</form>
</body>
</html>