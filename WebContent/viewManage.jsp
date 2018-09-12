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
	
	<script>
		$(document).ready(function(){
			$("#clearButton").click(function(){
    			$("#inputArea").val("");
  			});
  			$("#createButton").click(function(){
  				var inputValue= $("#inputArea").val();
  				window.location.href="createview.jsp?statement="+inputValue;
  			});
  			$("#deleteButton").click(function(){
  				var inputValue= $("#deleteView1").val();
  				window.location.href="deleteview.jsp?statement="+inputValue;
  			});
  			$("#selectButton").click(function(){
  				var inputValue= $("#selectView1").val();
  				window.location.href="viewManage.jsp?statement="+inputValue;
  			});
		});
	</script>
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
      		<!-- 创建视图的折叠面板页 -->
      		<div class="panel panel-primary">
        			<div class="panel-heading">
            			<h4 class="panel-title">
                			<a data-toggle="collapse" data-parent="#accordion" href="#One">
                				创建视图
                			</a>
            			</h4>
        			</div>
        			<div id="One" class="panel-collapse collapse in">
            			<div class="panel-body">
                			<form role="form">
								<div class="form-group">
									<textarea id="inputArea" class="form-control" rows="5" placeholder="请输入查询视图的SQL语句"></textarea>
									<br>
									<div class="btn-toolbar" role="toolbar">
										<div class="btn-group">
										<!--#代替跳转JSP-->
    										<a id="createButton" class="btn btn-info btn-sm">
          										<span class="glyphicon glyphicon-play"></span> 创建
        									</a>
									</div>
										<div class="btn-group">
											<button id="clearButton" type="button" class="btn btn-default btn-sm">
          										<span class="glyphicon glyphicon-bell"></span> 清空
        									</button>
										</div>
									</div>
  								</div>
							</form>
            			</div>
        			</div>
    			</div>
    			
    			<!-- 查询视图的折叠面板页 -->
      			<div class="panel panel-success">
        			<div class="panel-heading">
            			<h4 class="panel-title">
                			<a data-toggle="collapse" data-parent="#accordion" href="#Two">
                				查询视图
                			</a>
            			</h4>
        			</div>
        			<div id="Two" class="panel-collapse collapse in">
            			<div class="panel-body">
                			<form role="form">
								<div class="form-group">
									<div class="input-group" style="width:300px">
    									<span class="input-group-addon"> 视图名 </span>
    									<input id="selectView1" type="text" class="form-control" placeholder="请输入视图名查询">
    								</div> 									
    								<br>
									<div class="btn-toolbar" role="toolbar">
										<div class="btn-group">
										<!--#代替跳转JSP-->
    										<a id="selectButton" class="btn btn-success btn-sm">
          										<span class="glyphicon glyphicon-play"></span> 查询
        									</a>
										</div>
									</div>
									<br>
									<div class="well">
									<%
										String words = request.getParameter("statement");
										if(words!=null)
										{
										try{
										  
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
										  
										  String tb=null;
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
											  <table class="table table-bordered">
											  	<h3 class="text-primary" style="text-align:center;"><%=words %></h3>
											  	<thead>
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
											  	</thead>
											  	<tbody>
											  <%
										
												while(rs.next()) {
											  %>
											 	
											 		<tr>
													  <%
													for(int k=1;k<=count;k++)
													{
														  %>
														  <td width="100">
														  <%
														out.print(rs.getString(k));
														
														  %>
														  </td>
														  <%
													}
													  %>
													  
													</tr>
												
													  <%
												}
											  %>
											  	</tbody>
											</table>
											  <%
										  }
										  catch(Exception e)
										  {
											  %>
											  <h4 class="text-danger">
											  <%
											  out.println("视图查询失败");
											  %>
											  </h4>
											  <%
											  e.printStackTrace();
										  }
										}
										else{
											%>
											<h5 class="text-success">
											<%
											out.println("显示视图");
											%>
											</h5>
											<%
										}
										  %>
									</div>
  								</div>
							</form>
            			</div>
        			</div>
    			</div>
    			
    			<!-- 删除视图的折叠面板页 -->
      			<div class="panel panel-warning">
        			<div class="panel-heading">
            			<h4 class="panel-title">
                			<a data-toggle="collapse" data-parent="#accordion" href="#Three">
                				删除视图
                			</a>
            			</h4>
        			</div>
        			<div id="Three" class="panel-collapse collapse in">
            			<div class="panel-body">
                			<form role="form">
								<div class="form-group">
									<div class="input-group" style="width:300px">
    									<span class="input-group-addon"> 视图名 </span>
    									<input id="deleteView1" type="text" class="form-control" placeholder="请输入视图名删除">
    								</div> 									
    								<br>
									<div class="btn-toolbar" role="toolbar">
										<div class="btn-group">
										<!--#代替跳转JSP-->
    										<a id="deleteButton" class="btn btn-danger btn-sm">
          										<span class="glyphicon glyphicon-remove"></span> 删除
        									</a>
										</div>
									</div>
  								</div>
							</form>
            			</div>
        			</div>
    			</div>
		</div>
	  </div>
    </div>
    <script type="text/javascript">
		$(function () { $('#One').collapse('show')});
		$(function () { $('#Two').collapse('show')});
		$(function () { $('#Three').collapse('show')});
	</script> 
</body>
</html>
