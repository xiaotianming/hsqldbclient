<!--主功能界面：现可点击运行界面 
	a href = #
	#表示带跳转的界面
	by huyuhan 09-04-->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.io.IOException"%>
<html>
<head>
	<title>HSQL Manage System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<br>
	<br>
	<div class="container">
  		<div class="row">
    		<div class="col-sm-12" style="text-align:center">
				<div id="myCarousel" class="carousel slide">
				
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
					</ol>   
					<div class="carousel-inner">
						<div class="item active">
							<img src="images/image_1.png" alt="First slide">
						</div>
						<div class="item">
							<img src="images/image_2.png" alt="Second slide">
						</div>
					</div>

					<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div> 
			</div>
		</div>
	</div>
	<%
	
	  String username = request.getParameter("firstname");
	  session.setAttribute("username",username);  
	  String password = request.getParameter("password");
	  session.setAttribute("password",password);
	  String database = request.getParameter("dbName");
	  session.setAttribute("database",database);
	  String dbs="jdbc:hsqldb:hsql://localhost/"+database;
	  Class.forName("org.hsqldb.jdbcDriver");
	  //System.out.print(username);
	  //System.out.print(password);
	  //System.out.print(dbs);
	  // 2、获取连接
	    try
	  {
	  Connection conn = DriverManager.getConnection(dbs, username, password);

	  // 3、创建语句
	  Statement stmt = conn.createStatement();
	  }catch(SQLException e){
		 response.getWriter().write("<script>alert('密码或用户名错误');location.href='login.jsp'</script>");
		 e.printStackTrace();
	  }
	%>
</body>
</html>