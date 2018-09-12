<!--创建表：开发完成
	a href = #
	#表格的创建显示
	by huyuhan & Richard.Li 09-07-->
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
	
	<script>
		$(document).ready(function(){
			var flag=1;
			$("#addColumn").click(function(){
			    $("tbody").append("<tr id='idName"+flag
			    		+"'><th><input id='columnName"+flag
			    		+"' type='text' class='form-control'></th><th><input id='dataType"+flag
			    		+"' type='text' class='form-control'></th><th><input id='length"+flag
			    		+"' type='text' class='form-control'></th><th><input id='primaryKey"+flag
			    		+"' type='checkbox'></th><th><input id='isNull"+flag
			    		+"' type='checkbox'></th><th><input id='detail"+flag
			    		+"' type='text' class='form-control'></th><th><button id='"+flag+"' type='button' class='btn btn-info btn-sm' onclick='deleteData(this)'><span class='glyphicon glyphicon-trash'></span> 删除</button></th></tr>");
				
			    flag++;
			});
			$("#deleteColumn").click(function(){
				$("tr").remove(".test");
			});
			
			$("#saveButton").click(function(){
				
				var columnNames = [];
				for(var i=0;i<flag;i++){
					var columnName = document.getElementById("columnName"+i).value;
					columnNames.push(columnName);
				}
				//alert(columnNames);
				
				var dataTypes = [];
				for(var i=0;i<flag;i++){
					var dataType = document.getElementById("dataType"+i).value;
					dataTypes.push(dataType);
				}
				//alert(dataTypes);
				
				var lengths = [];
				for(var i=0;i<flag;i++){
					var length = document.getElementById("length"+i).value;
					lengths.push(length); 
				}
				//alert(lengths);
				
				var primaryKeys = [];
				for(var i=0;i<flag;i++){
					var set=$('#primaryKey'+i).is(':checked');
					if(set){
						var primaryKey = "true";
					}
					else{
						var primaryKey = "false";
					}
					primaryKeys.push(primaryKey);
					//var primaryKey = document.getElementById("primaryKey"+i).value;
				}
				//alert(primaryKeys);
				
				var isNulls = [];
				for(var i=0;i<flag;i++){
					var set=$('#isNull'+i).is(':checked');
					if(set){
						var isNull = "true";
					}
					else{
						var isNull = "false";
					}
					isNulls.push(isNull);
				}
				//alert(isNulls);
				
				var details = [];
				for(var i=0;i<flag;i++){
					var detail = document.getElementById("detail"+i).value;
					details.push(detail);
				}
				//alert(details);
				
				
				/*var tableNameValue=$("#tableName").val();
				document.getElementById("primaryKey").checked;
				alert(tableNameValue);*/
				window.location.href="createTableOperation.jsp?tableName1="+tableName.value
													 +"&columnNames1="+columnNames
													 +"&dataTypes1="+dataTypes
													 +"&lengths1="+lengths
													 +"&primaryKeys1="+primaryKeys
													 +"&isNulls1="+isNulls
													 +"&details1="+details
													 +"&flag1="+flag;
			});
		});
		function deleteData(obj){
			var res = confirm('确认要删除吗？');
			if(res == true)
			{
				$(obj).parents("tr").remove();
			}						
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
    		    <a class="navbar-brand"><span class="glyphicon glyphicon-home"></span><strong>主菜单</strong></a>
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
      		<div class="btn-toolbar" role="toolbar">
				<div class="btn-group">
					<a id="saveButton" class="btn btn-info btn-sm">
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
          			<span class="glyphicon glyphicon-plus"></span> 增加属性
        		</button>
			</div>
			<br></br>
    		
    		<table class="table table-bordered">
  				<thead>
    				<tr>
      					<th>属性名</th>
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
    					<th><input id="columnName0" type="text" class="form-control"></th>
    					<th><input id="dataType0" type="text" class="form-control"></th>
    					<th><input id="length0" type="text" class="form-control"></th>
    					<th><input id="primaryKey0" type="checkbox"></th>
    					<th><input id="isNull0" type="checkbox"></th>
    					<th><input id="detail0" type="text" class="form-control"></th>
    					<th><button id='deleteColumn' type='button' class='btn btn-info btn-sm'><span class='glyphicon glyphicon-trash'></span> 删除</button></th>
    				</tr>
  				</tbody>
			</table>		
		</div>
	  </div>
    </div>   

</body>
</html>