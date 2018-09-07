<!--运行界面：输入文本框已经设计
	a href = #
	#表示带跳转的界面
	by huyuhan 09-04-->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<div class="container" id="workingController">
	  <div class="row">
      	<div class="col-sm-12">
      	
      		<form role="form">
				<div class="form-group">
					<div class="btn-toolbar" role="toolbar">
						<div class="btn-group">
    						<a href="#" class="btn btn-info btn-sm">
          						<span class="glyphicon glyphicon-play"></span> 运行
        					</a>
						</div>
						<div class="btn-toolbar" role="toolbar">
							<button id="clearButton" type="button" class="btn btn-warning btn-sm">
          						<span class="glyphicon glyphicon-remove"></span> 清空
        					</button>
        				</div>
					</div>
					<br>
    				<textarea id="inputArea" class="form-control" rows="10"></textarea>
  				</div>
			</form>
			
			<form role="form">
				<div class="form-group">
					<div class="btn-toolbar" role="toolbar">
						<a href="#" class="btn btn-info btn-sm">
          					<span class="glyphicon glyphicon-asterisk"></span> 结果
        				</a>
    					<button type="button" class="btn btn-default btn-sm">
          					<span class="glyphicon glyphicon-bell"></span> 消息
        				</button>
        			</div>
        			<br>
        			<div class="well">
						填入查询之后的结果
					</div>
  				</div>
			</form>
		</div>
	  </div>
    </div>
	
</body>
</html>
