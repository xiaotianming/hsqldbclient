<!--主功能界面：现可点击运行界面 
	a href = #
	#表示带跳转的界面
	by huyuhan 09-04-->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Vector" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page contentType="text/html; charset=UTF-8"
		language="java"
		buffer="32kb"
		import="java.lang.Runtime,java.io.*"
		%>
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
    		    <a href="index.jsp" class="navbar-brand"><span class="glyphicon glyphicon-home"></span><strong>主菜单</strong></a>
    		</div>
    		<div>
        	<ul class="nav navbar-nav">
            	<li class="dropdown">
            		<a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-th"></span><strong>表格</strong><b class="caret"></b></a>
                	<ul class="dropdown-menu">
                    	<li><a href="listTable.jsp">查询所有</a></li>
                    	<li><a href="createTable.jsp">创建</a></li>
                	    <li><a href="changeTable.jsp">设计表格</a></li>
                	</ul>
				</li>
            	<li class="dropdown">
                	<a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-th-large"></span><strong>视图</strong><b class="caret"></b></a>
                	<ul class="dropdown-menu">
                    	<li><a href="viewManage.jsp">视图管理</a></li>
                	</ul>
            	</li>
            	<li class="dropdown">
                	<a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span><strong>用户系统</strong><b class="caret"></b></a>
                	<ul class="dropdown-menu">
                    	<li><a href="listUser.jsp">所有用户</a></li>
                    	<li><a href="createUser.jsp">创建用户</a></li>
                	    <li><a href="Newdb.jsp">创建数据库</a></li>
                	</ul>
            	</li>
            	<li><a href="working.jsp"><span class="glyphicon glyphicon-play-circle"></span><strong>运行界面</strong></a></li>
        	</ul>
        	<ul class="nav navbar-nav navbar-right"> 
        		<li><a href="login.jsp"><span class="glyphicon glyphicon-log-out"></span><strong>退出登录</strong></a></li>
        	</ul>
    		</div>
    	</div>
	</nav>
	
	<div class="container">
	  <div class="row">
      	<div class="col-sm-12">
			<div style="padding: 10px;">
    			<form class="bs-example bs-example-form" role="form" action="login.jsp">
    				<h3 class="text-primary" style="text-align:center;">新建数据库成功</h3>
       	 			<br>
       	 			<table align="center">
					<tbody>
						<tr>
							<td><button id="saveButton" type="submit" class="btn btn-success">重新登录</button></td>
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
			Connection conn = DriverManager.getConnection(dbs,username, password);	
			  // 3、创建语句
			Statement stmt = conn.createStatement();
			stmt.execute("SHUTDOWN");
			conn.close();
			String dbn = request.getParameter("databasename");
			String otn = request.getParameter("othername");
			
			Runtime r = java.lang.Runtime.getRuntime();
			String path="G:/数据库系统概论/小学期/hsqldb-2.4.1/hsqldb";
			String command = "java -cp "+path+"/lib/hsqldb.jar org.hsqldb.server.Server --database.0 file:"+path+"/data/"+dbn+" --dbname.0 "+otn;
			/*try
			{*/
			Process p = r.exec(command);
			/*BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()),1024);
			while (br.read()!=-1)
			{
			out.print(br.readLine());
			}
			br.close();
			
			}catch(IOException e)
			{
			e.printStackTrace();
			}*/
		%>
	
</body>
</html>