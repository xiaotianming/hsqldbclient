<!--主功能界面：现可点击运行界面 
	a href = #
	#表示带跳转的界面
	by huyuhan 09-04-->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<html>
<head>
	<title>HSQL Manage System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$(function () { $('#One').collapse('hide')});
		$(function () { $('#Two').collapse('hide')});
		$(function () { $('#Three').collapse('hide')});
	</script> 
	
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
                    	<li><a href="listTableName">查询所有</a></li>
                    	<li><a href="createTable.jsp">创建</a></li>
                	    <li><a href="#">其它</a></li>
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
                	    <li><a href="#">其它</a></li>
                	</ul>
            	</li>
        	</ul>
    		</div>
    	</div>
	</nav>
	
	<div class="container">
	  <div class="row">
      	<div class="col-sm-12">
      		<div class="panel-group" id="accordion">
      		<%
    		/*String username = (String)session.getAttribute("username");
    		String password = (String)session.getAttribute("password");
    		String database = (String)session.getAttribute("database");*/
    		//String dbs="jdbc:hsqldb:hsql://localhost/"+database;
    		String dbs="jdbc:hsqldb:hsql://localhost/mydb";
    		Class.forName("org.hsqldb.jdbcDriver");
    		
    		  // 2、获取连接
    		Connection conn = DriverManager.getConnection(dbs,"SA", "");		
    		  // 3、创建语句
    		Statement stmt = conn.createStatement();
    		ResultSet rs=stmt.executeQuery("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES where table_schema='PUBLIC' and TABLE_TYPE='BASE TABLE';");
    		  while(rs.next()) {
    				String name = rs.getString("TABLE_NAME");			
      		%>
    			<div class="panel panel-warning">
        			<div class="panel-heading">
            			<h4 class="panel-title">
                			<a data-toggle="collapse" data-parent="#accordion" href="#One">
                				<%out.println(name); %>
                				<a href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-trash"></span></a>
                			</a>
            			</h4>
        			</div>
        			<div id="One" class="panel-collapse collapse in">
            			<div class="panel-body">
                			<table class="table table-bordered">
  								<thead>
    								<tr>
    									<th> 学号</th>
    									<th> 姓名</th>
    									<th> 年龄</th>
    									<th> 选择</th>
    								</tr>
  								</thead>
  								<tbody>
    								<tr>
    									<th> 201508010218</th>
    									<th> 胡雨菡</th>
    									<th> 1</th>
    									<th><input name="columnSelect" type="radio"></th>
    								</tr>
  								</tbody>
							</table>
							<a href="#" class="btn btn-info btn-sm">
          						<span class="glyphicon glyphicon-trash"></span> 删除
        					</a>		
            			</div>
        			</div>
    			</div>
    			<%}; %>    			
    		</div>
		</div>
	  </div>
    </div>   
</body>
</html>
