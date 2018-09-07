<!--主功能界面：现可点击运行界面 
	a href = #
	#表示带跳转的界面
	by huyuhan 09-04-->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Vector" %>
<%@ page import="java.sql.Connection"%>
<html>
<head>
	<title>HSQL Manage System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom:0;background-color: #3399FF">
  		<h1><font color="#FFFFFF">HSQL Manage System</font></h1> 
	</div>
	<nav class="navbar navbar-default" role="navigation">
    	<div class="container-fluid">
    		<div class="navbar-header">
    		    <a class="navbar-brand">主菜单</a>
    		</div>
    		<div>
        	<ul class="nav navbar-nav">
            	<li class="dropdown">
            		<a href="#" class="dropdown-toggle" data-toggle="dropdown">表格<b class="caret"></b></a>
                	<ul class="dropdown-menu">
                    	<li><a href="listTable.jsp">查询所有</a></li>
                    	<li><a href="createTable.jsp">创建</a></li>
                	    <li><a href="changeTable.jsp">设计表格</a></li>
                	</ul>
				</li>
            	<li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">视图<b class="caret"></b></a>
                	<ul class="dropdown-menu">
                    	<li><a href="viewManage.jsp">视图管理</a></li>
                	</ul>
            	</li>
            	<li><a href="working.jsp">运行界面</a></li>
            	<li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">用户系统<b class="caret"></b></a>
                	<ul class="dropdown-menu">
                    	<li><a href="listUser.jsp">所有用户</a></li>
                    	<li><a href="createUser.jsp">创建用户</a></li>
                    	<li><a href="login.jsp">退出登录</a></li>
                	    <li><a href="Newdb.jsp">创建数据库</a></li>
                	</ul>
            	</li>
        	</ul>
    		</div>
    	</div>
	</nav>
	
	<div class="container">
	  <div class="row">
      	<div class="col-sm-12">
			<div style="padding: 10px;">
    			<form class="bs-example bs-example-form" role="form" action="listUser.jsp">
    				<h3 class="text-primary" style="text-align:center;">用户删除成功</h3>
       	 			<br>
       	 			<table align="center">
					<tbody>
						<tr>
							<td><button id="saveButton" type="submit" class="btn btn-success">返回</button></td>
						</tr>
					</tbody>
					</table>
    			</form>
			</div>
      				
		</div>
	  </div>
    </div>
	
<%
			String username = (String)session.getAttribute("username");
			String password = (String)session.getAttribute("password");
			String database = (String)session.getAttribute("database");
			String dbs="jdbc:hsqldb:hsql://localhost/"+database;
			//String dbs="jdbc:hsqldb:hsql://localhost/mydb";
			Class.forName("org.hsqldb.jdbcDriver");
			
			  // 2、获取连接
			//Connection conn = DriverManager.getConnection(dbs,"SA", "");	
			Connection conn = DriverManager.getConnection(dbs,username, password);
			  // 3、创建语句
			Statement stmt = conn.createStatement();
			String user = request.getParameter("usName");
			try{
			stmt.execute("drop user "+user+";");
			}catch (Exception e) {
				response.getWriter().write("<script>alert('用户名不存在');location.href='listUser.jsp'</script>");
			    e.printStackTrace();
			}	
		%>
	
</body>
</html>