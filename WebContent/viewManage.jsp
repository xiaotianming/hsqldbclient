<!--主功能界面：现可点击运行界面 
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
  			$("#excuteButton").click(function(){
    			
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
  				window.location.href="showview.jsp?statement="+inputValue;
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
									<textarea id="inputArea" class="form-control" rows="5" placeholder="请输入创建视图语句"></textarea>
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
										填入查询之后的结果
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
		$(function () { $('#One').collapse('hide')});
		$(function () { $('#Two').collapse('hide')});
		$(function () { $('#Three').collapse('hide')});
	</script> 
</body>
</html>
