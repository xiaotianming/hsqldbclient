<!--主功能界面：现可点击运行界面 
	a href = #
	#表示带跳转的界面
	by huyuhan 09-04-->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Vector" %>
<html>
<head>
	<title>HSQL Manage System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#addColumn").click(function(){
			    $("p").append("<a class='list-group-item'><input id='columnName0' type='text' class='form-control'></a>");
			});
		});
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
      			<div class="btn-group">
    				<button id="addColumn" type="button" class="btn btn-success btn-sm">
          				<span class="glyphicon glyphicon-plus"></span> 增加字段
        			</button>
				</div>
				<br></br>
      		<%
    		/*String username = (String)session.getAttribute("username");
    		String password = (String)session.getAttribute("password");
    		String database = (String)session.getAttribute("database");*/
    		String tbName=request.getParameter("tableName");			//表名
    		session.setAttribute("tbName",tbName);					//将表名存入session
    		//String dbs="jdbc:hsqldb:hsql://localhost/"+database;
    		String dbs="jdbc:hsqldb:hsql://localhost/mydb";
    		Class.forName("org.hsqldb.jdbcDriver");
    		
    		  // 2、获取连接
    		Connection conn = DriverManager.getConnection(dbs,"SA", "");		
    		  // 3、创建语句
    		Statement stmt = conn.createStatement();
    		ResultSet rs=stmt.executeQuery("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES where table_schema='PUBLIC' and TABLE_TYPE='BASE TABLE';");
    		String a="a";
      		%>
            	<a href="#" class="list-group-item active">
					<strong>表名：</strong>   <%out.println(tbName);%>
				</a>
        		<% 
        			Statement stat = conn.createStatement();
        			String sql="select COLUMN_NAME from information_schema.COLUMNS where table_name = '"+tbName+"'";
        		    ResultSet per = stat.executeQuery(sql);  //用于返回结果
        		    Vector<Object> vec = new Vector<Object>(); 
        		    while(per.next())
        		    {
        		    	vec.add(per.getString("COLUMN_NAME"));
        		    }
        		
        		    int i=0,num=vec.size();
							for(i=0;i<num;i++) 
							{
						%>
							<a class="list-group-item"><strong>属性: </strong>   <%=vec.get(i)%></a>
						<%
							}
    					%>
    					<div id="addAttribute">
    						<p></p>
    					</div>
            		</div>
        		</div>
    		</div>	   			
    	</div>
	
</body>
</html>
