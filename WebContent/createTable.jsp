<!--创建表：待开发
	a href = #
	#表格的创建显示
	by huyuhan 09-04-->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.sql.Connection"%>
	<meta http-equiv="Content-Type" content="textml; charset=UTF-8">
	
	<title>HSQL Manage System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/createTable.js"></script>
	
	<script>
		$(document).ready(function(){
			var flag=0;
			var className=["","one","two","three","four","five","six","seven","eight","nine","ten"];
			var deleteFunName=["","deleteOne()","deleteTwo()","deleteThree()","deleteFour()","deleteFive()","deleteSix()","deleteSeven()","deleteEight()","deleteNine()","deleteTen()"];
			$("#addColumn").click(function(){
				flag++;
				
			    $("tbody").append("<tr class='"+className[flag]+"'>"
			    +"<th><input id='columnName' type='text' class='form-control'></th>"
			    +"<th><input id='dataType' type='text' class='form-control'></th>"
			    +"<th><input id='length' type='text' class='form-control'></th>"
			    +"<th><input id='primaryKey' type='checkbox'></th>"
			    +"<th><input id='isNull' type='checkbox'></th>"
			    +"<th><input id='detail' type='text' class='form-control'></th>"
			    +"<th><button type='button' class='btn btn-info btn-sm' onclick="+deleteFunName[flag]+">"
			    +"<span class='glyphicon glyphicon-trash'></span> 删除</button></th>"
			    +"</tr>");
			 
			});
			$("#deleteColumn").click(function(){
				$("tr").remove(".test");
			});
			/*$("#saveButton").click(function(){
				var tableNameValue=$("#tableName").val();
				alert(tableNameValue);
				window.location.href="test.jsp?tableName="+tableNameValue;
			});*/
		});
		function deleteOne(){
			$("tr").remove(".one");
		}
		function deleteTwo(){
			$("tr").remove(".two");
		}
		function deleteThree(){
			$("tr").remove(".three");
		}
		function deleteFour(){
			$("tr").remove(".four");
		}
		function deleteFive(){
			$("tr").remove(".five");
		}
		function deleteSix(){
			$("tr").remove(".six");
		}
		function deleteSeven(){
			$("tr").remove(".seven");
		}
		function deleteEight(){
			$("tr").remove(".eight");
		}
		function deleteNine(){
			$("tr").remove(".nine");
		}
		function deleteTen(){
			$("tr").remove(".ten");
		}

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
      		<div class="btn-toolbar" role="toolbar">
				<div class="btn-group">
					<a href="javascript:;" id="saveButton" class="btn btn-info btn-sm">
          				<span class="glyphicon glyphicon-ok"></span> 保存
        			</a>				
        		</div>
				<div class="btn-group">
					<a href="createTable.jsp" class="btn btn-warning btn-sm">
          				<span class="glyphicon glyphicon-remove"></span> 清空
        			</a>
				</div>
			</div>
			<br>
      	
      		<div class="input-group" style="width:300px">
    			<span class="input-group-addon"> 表名 </span>
    			<input id="tableName" type="text" class="form-control" placeholder="请输入表名">
    		</div> 
    		<br>
    		
    		<div class="btn-group">
    			<button id="addColumn" type="button" class="btn btn-warning btn-sm">
          			<span class="glyphicon glyphicon-plus"></span> 增加字段
        		</button>
			</div>
			<br></br>
    		
    		<table class="table table-bordered">
  				<thead>
    				<tr>
      					<th>字段名</th>
      					<th>数据类型</th>
      					<th>长度</th>
      					<th>主键</th>
      					<th>非空</th>
      					<th>注释</th>
      					<th>操作</th>
    				</tr>
  				</thead>
  				<tbody>
    				<tr class="test">
    					<th><input id="columnName" type="text" class="form-control"></th>
    					<th><input id="dataType" type="text" class="form-control"></th>
    					<th><input id="length" type="text" class="form-control"></th>
    					<th><input id="primaryKey" type="checkbox"></th>
    					<th><input id="isNull" type="checkbox"></th>
    					<th><input id="detail" type="text" class="form-control"></th>
    					<th><button id='deleteColumn' type='button' class='btn btn-info btn-sm'><span class='glyphicon glyphicon-trash'></span> 删除</button></th>
    				</tr>
  				</tbody>
			</table>		
		</div>
	  </div>
    </div>   
	
</body>
</html>
