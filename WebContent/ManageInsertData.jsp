<!--主功能界面：现可点击运行界面 
	a href = #
	#表示带跳转的界面
	by huyuhan 09-04-->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.Vector" %>
<%@ page import="java.sql.Connection"%>
<html>
<head>
	<title>HSQL Manage System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
	<script type="text/javascript">
		$(document).ready(function(){
			var flag=[];
			var a="#a";
			for(var i=0;i<10;i++){
				a=a+"a";
				flag[i]=a;
				$(function () { $(flag).collapse('hide')});
			}
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
      		<div class="panel-group" id="accordion">
      		<%
    		String username = (String)session.getAttribute("username");
    		String password = (String)session.getAttribute("password");
    		String database = (String)session.getAttribute("database");
    		String tbName=request.getParameter("tbName");			//表名
    		session.setAttribute("tbName",tbName);					//将表名存入session
    		String dbs="jdbc:hsqldb:hsql://localhost/"+database;
    		//String dbs="jdbc:hsqldb:hsql://localhost/mydb";
    		Class.forName("org.hsqldb.jdbcDriver");
    		
    		  // 2、获取连接
    		Connection conn = DriverManager.getConnection(dbs,username, password);		
    		  // 3、创建语句
    		Statement stmt = conn.createStatement();
    		ResultSet rs=stmt.executeQuery("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES where table_schema='PUBLIC' and TABLE_TYPE='BASE TABLE';");
    		String a="a";
      		%>
            	<h3 class="text-primary" style="text-align:center;">        
                		<%out.println(tbName);%>
            	</h3>
        		<% 
        			Statement stat = conn.createStatement();
        			String sql="select COLUMN_NAME from information_schema.COLUMNS where table_name = '"+tbName+"'";
        		    ResultSet per = stat.executeQuery(sql);  //用于返回结果
        		    Vector<Object> vec = new Vector<Object>(); 
        		    while(per.next())
        		    {
        		    	vec.add(per.getString("COLUMN_NAME"));
        		    }
        		    sql="select * from "+tbName;
        		    per=stat.executeQuery(sql);
        		    int i=0,num=vec.size();
        		%>
                <table class="table table-bordered">
  					<thead>
    					<tr>
    					<%
							for(i=0;i<num;i++) 
							{
						%>
							<td><%=vec.get(i)%></td>
						<%
							}
    					%>
    					</tr>
  						</thead>
  						<tbody>
    					<%
    						while(per.next()) 
    						{
    					%>
    						<tr>
    						<%
    							for(i=1;i<=num;i++)
    							{
    						%>
    							<td><%=per.getString(i)%></td>
    						<%
    							}
    						%>
    						</tr>
    							<%
    							}  
    							%>
    							
    						<tr>
    							<form action="InsertData.jsp" method="post">
									<% 
										for(i=0;i<num;i++)
									{
									%>
										<td><input type = "text" name="<%=vec.get(i)%>" class="form-control"/></td>
									<%
									}
									%> 
							</tr>
							<tr>
								<button class="btn btn-info btn-sm" type="submit">
          							<span class="glyphicon glyphicon-plus"></span> 添加
        						</button>
        						<br></br>
        					</tr>
        						   </form>		
        					</tbody>
						</table>
            		</div>
        		</div>
    		</div>	   			
    	</div>   
</body>
</html>
