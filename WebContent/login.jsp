<!--登录界面：实现登录注册 
	a href = #
	#表示带跳转的界面-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HSQL Manager System</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
      
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="../js/login.js"></script>
	
	<script>
	$(document).ready(function(){	
		$("#cancelButton").click(function(){
			event.preventDefault();
			$("#inputName").val("");
			$("#inputPassword").val("");
			$("#inputDB").val("");
		});
	});
	</script>
	
</head>

<body>
	<div class="jumbotron text-center" style="margin-bottom:0;background-color: #3399FF">
		<h1><font color="#FFFFFF">HSQL Manage System</font></h1>
	</div>
	<br><br>
	<div class="container">
  		<div class="row">
  			
    		<div class="col-sm-4">
      			<div class="fakeimg"><img src="images/timg.jpg"></div>
    		</div>
    		
    		<div class="col-sm-8">
    			<br><br><br>
				<form class="form-horizontal" role="form" action="logindb.jsp">
					<h3 class="text-info" style="text-align:center"><strong>HyperSQL数据库管理系统登录</strong></h3>
					<br><br>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">名字</label>
						<div class="col-sm-8">
							<input id="inputName" type="text" class="form-control" name="firstname" placeholder="请输入用户名">
						</div>
					</div>
					
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-8">
							<input id="inputPassword" type="password" class="form-control" name="password" placeholder="请输入密码">
						</div>
					</div>
					
					<div class="form-group">
						<label for="dbName" class="col-sm-2 control-label">数据库</label>
							<div class="col-sm-8">
								<input id="inputDB" type="text" class="form-control" name="dbName" placeholder="请输入数据库名">
							</div>
					</div>
		
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-8">
							<table align="center">
								<tbody>
									<tr>
										<td><button type="submit" class="btn btn-success">登录</button></td>
										<td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td>
										<td><button id="cancelButton" class="btn btn-default">取消</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>