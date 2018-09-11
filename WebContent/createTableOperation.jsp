<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%  
   request.setCharacterEncoding("utf-8");  
   response.setCharacterEncoding("utf-8");  
   response.setContentType("text/html; charset=utf-8");  
   response.setHeader("iso-8859-1","utf-8"); 
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>创建表格操作页面</title>
</head>
<body>
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
		
		if(lengths[i].equals("")){
			lengths[i]=" ";
		}else{
			lengths[i]="("+lengths[i]+")";
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
	
	if(lengths[flag_number-1].equals("")){
		lengths[flag_number-1]=" ";
	}else{
		lengths[flag_number-1]="("+lengths[flag_number-1]+")";
	}
	
	sqlstmt+=columnNames[flag_number-1]+" "+dataTypes[flag_number-1]+lengths[flag_number-1]+" "+primaryKeys[flag_number-1]+" "+isNulls[flag_number-1]+" "+details[flag_number-1]+");";
	
	System.out.println(sqlstmt);
	
	Class.forName("org.hsqldb.jdbcDriver");				 
	Connection conn = DriverManager.getConnection("jdbc:hsqldb:hsql://localhost:9001/mydb", "sa", "");				 
	Statement stmt = conn.createStatement();
	
	stmt.execute(sqlstmt);
    response.getWriter().write("<script>alert('创建表格成功');location.href='listTable.jsp'</script>");		
	}catch(Exception e){
	    response.getWriter().write("<script>alert('创建表格失败');location.href='createTable.jsp'</script>");		
		e.printStackTrace();
	}
%>

</body>
</html>