<!--主功能界面：现可点击运行界面 
	a href = #
	#表示带跳转的界面
	by huyuhan & Richard.Li 09-11-->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Vector"%>
<html>
<head>
<title>HSQL Manage System</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"> </script> 

<script type="text/javascript">
	var flag = 1;
	$(document).ready(function() {						
						$("#addColumn").click(function() {
						$("#tbody1").append(
							"<tr id='idName"+flag
			    			+"'><th><input id='columnName"+flag
			    			+"' type='text' class='form-control'></th><th><input id='dataType"+flag
			    			+"' type='text' class='form-control'></th><th><input id='length"+flag
			    			+"' type='text' class='form-control'></th><th><input id='primaryKey"+flag
			    			+"' type='checkbox'></th><th><input id='isNull"+flag
			    			+"' type='checkbox'></th><th><input id='detail"+flag
			    			+"' type='text' class='form-control'></th><th><button id='"+ flag
							+ "' type='button' class='btn btn-info btn-sm' onclick='deleteData(this)'><span class='glyphicon glyphicon-trash'></span> 删除</button></th></tr>");
								flag++;
							});
						$("#deleteColumn").click(function() {
							$("tr").remove(".test");
						});
					});
	function deleteData(obj) {
		var res = confirm('确认要删除吗？');
		if (res == true) {
			$(obj).parents("tr").remove();
		}
	}
	
	function saveButton() {

		var columnNames = [];
		for (var i = 0; i < flag; i++) {
			var columnName = document
					.getElementById("columnName" + i).value;
			columnNames.push(columnName);
		}
		//alert(columnNames);

		var dataTypes = [];
		for (var i = 0; i < flag; i++) {
			var dataType = document.getElementById("dataType"
					+ i).value;
			dataTypes.push(dataType);
		}
		//alert(dataTypes);

		var lengths = [];
		for (var i = 0; i < flag; i++) {
			var length = document.getElementById("length" + i).value;
			lengths.push(length);
		}
		//alert(lengths);

		var primaryKeys = [];
		for (var i = 0; i < flag; i++) {
			var set = $('#primaryKey' + i).is(':checked');
			if (set) {
				var primaryKey = "true";
			} else {
				var primaryKey = "false";
			}
			primaryKeys.push(primaryKey);
			//var primaryKey = document.getElementById("primaryKey"+i).value;
		}
		//alert(primaryKeys);

		var isNulls = [];
		for (var i = 0; i < flag; i++) {
			var set = $('#isNull' + i).is(':checked');
			if (set) {
				var isNull = "true";
			} else {
				var isNull = "false";
			}
			isNulls.push(isNull);
		}
		//alert(isNulls);

		var details = [];
		for (var i = 0; i < flag; i++) {
			var detail = document.getElementById("detail" + i).value;
			details.push(detail);
		}
		//alert(details);

		/*var tableNameValue=$("#tableName").val();
		document.getElementById("primaryKey").checked;
		alert(tableNameValue);*/
		
		window.location.href = "addColumn.jsp?columnNames1="+ columnNames 
							+ "&dataTypes1=" + dataTypes
							+ "&lengths1=" + lengths 
							+ "&primaryKeys1="+ primaryKeys 
							+ "&isNulls1=" + isNulls
							+ "&details1=" + details 
							+ "&flag1=" + flag;
	}
</script>
</head>
<body>
	<div class="jumbotron text-center"
		style="margin-bottom: 0; background-color: #3399FF">
		<h1>
			<font color="#FFFFFF">HSQL Manage System</font>
		</h1>
	</div>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">主菜单</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">表格<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="listTable.jsp">查询所有</a></li>
							<li><a href="createTable.jsp">创建</a></li>
							<li><a href="changeTable.jsp">设计表格</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">视图<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="viewManage.jsp">视图管理</a></li>
						</ul></li>
					<li><a href="working.jsp">运行界面</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">用户系统<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="listUser.jsp">所有用户</a></li>
							<li><a href="createUser.jsp">创建用户</a></li>
							<li><a href="login.jsp">退出登录</a></li>
							<li><a href="Newdb.jsp">创建数据库</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel-group" id="accordion">
					<div class="btn-group">
						<button id="saveButton" type="button" onclick="saveButton()" class="btn btn-info btn-sm">
							<span class="glyphicon glyphicon-ok"></span> 保存修改
						</button>
					</div>
					&nbsp;
					<div class="btn-group">
						<button id="addColumn" type="button"
							class="btn btn-success btn-sm">
							<span class="glyphicon glyphicon-plus"></span> 增加属性
						</button>
					</div>
					<br></br>
					<%
						String username = (String) session.getAttribute("username");
						String password = (String) session.getAttribute("password");

						String database = (String) session.getAttribute("database");
						String tbName = request.getParameter("tableName"); //表名

						/*tring database = (String)session.getAttribute("database");
						String tbName=request.getParameter("tableName");*/ //获取表名
						session.setAttribute("tbName", tbName); //将表名存入session
						//String dbs="jdbc:hsqldb:hsql://localhost/"+database;
						//String dbs="jdbc:hsqldb:hsql://localhost/mydb";
						String dbs="jdbc:hsqldb:hsql://localhost/"+database;
						//连接数据库
						//String dbs = "jdbc:hsqldb:hsql://localhost/mydb";
						Class.forName("org.hsqldb.jdbcDriver");

						// 2、获取连接
						//Connection conn = DriverManager.getConnection(dbs,"SA", "");	
						Connection conn = DriverManager.getConnection(dbs, username, password);
						// 3、创建语句
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery(
								"SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES where table_schema='PUBLIC' and TABLE_TYPE='BASE TABLE';");
						String a = "a";
					%>
					<a href="#" class="list-group-item active"> <strong>表名：</strong>
						<%
							out.println(tbName);
						%>
					</a>
					<%
						//通过表名获取列名
						Statement stat = conn.createStatement();
						String sql = "select COLUMN_NAME from information_schema.COLUMNS where table_name = '" + tbName + "'";
						ResultSet per = stat.executeQuery(sql); //用于返回结果
						Vector<Object> vec = new Vector<Object>();
						while (per.next()) {
							//获取到的列名（属性名）
							vec.add(per.getString("COLUMN_NAME"));
						}

						int i = 0, num = vec.size();
						for (i = 0; i < num; i++) {//属性名输出
					%>
					<a class="list-group-item">
						<table>
							<tr>
								<td><a
									href="deleteColumn.jsp?columnName=<%=vec.get(i)%>"><span
										class="glyphicon glyphicon-trash"></span></a></td>
								<td>&nbsp;&nbsp;</td>
								<td>&nbsp;&nbsp;</td>
								<td><strong>属性: </strong> <%=vec.get(i)%></td>
							</tr>
						</table>
					</a>
					<%
						}
					%>
					<a class="list-group-item">
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
							<tbody id="tbody1">
								<tr class="test">
									<th><input id="columnName0" type="text"
										class="form-control"></th>
									<th><input id="dataType0" type="text" class="form-control"></th>
									<th><input id="length0" type="text" class="form-control"></th>
									<th><input id="primaryKey0" type="checkbox"></th>
									<th><input id="isNull0" type="checkbox"></th>
									<th><input id="detail0" type="text" class="form-control"></th>
									<th><button id='deleteColumn' type='button'
											class='btn btn-info btn-sm'>
											<span class='glyphicon glyphicon-trash'></span> 删除
										</button></th>
								</tr>
							</tbody>
						</table>
					</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
