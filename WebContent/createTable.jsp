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
				window.location.href="createTable.jsp?tableName1="+tableName.value
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
	<%
	
	try{
		String flag="";
		if(request.getParameter("flag1")!="0"){
			flag=request.getParameter("flag1");
		}
		
		String tableName="";
		if(request.getParameter("tableName1")!=null){
			tableName=request.getParameter("tableName1");
		}
		/*if(tableName!=null)
		System.out.println(tableName);*/
		
		String columnName;
		String columnNames[]=null;
		if(request.getParameter("columnNames1")!=null){
			columnName=request.getParameter("columnNames1");
			columnNames= columnName.split(",",1000);
		}
		/*if(request.getParameter("columnNames1")!=null)
		System.out.println(request.getParameter("columnNames1"));*/
		
		
		String dataType;
		String dataTypes[]=null;
		if(request.getParameter("dataTypes1")!=null){
			dataType=request.getParameter("dataTypes1");
			dataTypes= dataType.split(",",1000);
		}
		/*if(request.getParameter("dataTypes1")!=null)		
		System.out.println(request.getParameter("dataTypes1"));*/
		
		String length;
		String lengths[]=null;
		if(request.getParameter("lengths1")!=null){
			length=request.getParameter("lengths1");
			lengths= length.split(",",1000);
		}
		/*if(request.getParameter("lengths1")!=null)				
		System.out.println(request.getParameter("lengths1"));*/
		
		
		String primaryKey=request.getParameter("primaryKeys1");
		String primaryKeys[] = primaryKey.split(",",1000);
		
		/*for(int i=0;i<primaryKeys.length;i++){
			System.out.println(primaryKeys[i]);
		}*/
		
		
		String isNull=request.getParameter("isNulls1");
		String isNulls[] = isNull.split(",",1000);
		
		/*for(int i=0;i<isNulls.length;i++){
			System.out.println(isNulls[i]);
		}*/
		
		String detail;
		String details[]=null;
		if(request.getParameter("details1")!=null){
			detail=request.getParameter("details1");
			details= detail.split(",",1000);
		}
		/*if(request.getParameter("details1")!=null)			
		System.out.println(request.getParameter("details1"));*/
		
		
		
	   
		String sqlstmt="create table "+tableName+"(";
		
		int flag_number=Integer.parseInt(flag);		
				
		for(int i=0;i<flag_number-1;i++){
						
			if(primaryKeys[i].equals("true")){
				primaryKeys[i]="PRIMARY KEY";
			}else{
				primaryKeys[i]=" ";
			}
									
			if(isNulls[i].equals("true")){
				isNulls[i]="NOT NULL";
			}else{
				isNulls[i]=" ";
			}
			
			if(lengths[i]==null){
				lengths[i]="("+lengths[i]+")";
			}else{
				lengths[i]=" ";
			}
			
			sqlstmt+=columnNames[i]+" "+dataTypes[i]+lengths[i]+" "+primaryKeys[i]+" "+isNulls[i]+" "+details[i]+", ";
									
		}
		
		if(primaryKeys[flag_number-1].equals("true")){
			primaryKeys[flag_number-1]="PRIMARY KEY";
		}else{
			primaryKeys[flag_number-1]=" ";
		}
		
		
		if(isNulls[flag_number-1].equals("true")){
			isNulls[flag_number-1]="NOT NULL";
		}else{
			isNulls[flag_number-1]=" ";
		}
		
		if(lengths[flag_number-1]==null){
			lengths[flag_number-1]="("+lengths[flag_number-1]+")";
		}else{
			lengths[flag_number-1]=" ";
		}
		
		sqlstmt+=columnNames[flag_number-1]+" "+dataTypes[flag_number-1]+lengths[flag_number-1]+" "+primaryKeys[flag_number-1]+" "+isNulls[flag_number-1]+" "+details[flag_number-1]+");";
		
		System.out.println(sqlstmt);
		
		Class.forName("org.hsqldb.jdbcDriver");				 
		Connection conn = DriverManager.getConnection("jdbc:hsqldb:hsql://localhost:9001/mydb", "sa", "");				 
		Statement stmt = conn.createStatement();
		
		stmt.execute(sqlstmt);
				
		}catch(Exception e){
			e.printStackTrace();
		}
    %> 
</body>
</html>