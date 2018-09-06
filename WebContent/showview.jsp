<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询视图</title>
</head>
<body>

<%

try{
	
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
	  %>
	  <h1>
	  <%
	  out.println("视图查询成功");
	  %>
	  </h1>
	  <%
  }
  catch(Exception e)
  {
	  %>
	  <h1>
	  <%
	  out.println("视图查询失败");
	  %>
	  </h1>
	  <%
	  e.printStackTrace();
  }

  %>
  
<form action="viewManage.jsp">
<input type="submit" value="返回">
</form>
</body>
</html>