<%@page import="java.sql.*"%>
<%@page import="java.util.Vector" %>
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
<title>add_column</title>  
</head> 
<body> 
<br/>
<% 
String tableName=(String)session.getAttribute("tbName");
try{
	String flag="";
	if(request.getParameter("flag1")!="0"){
		flag=request.getParameter("flag1");
	}
	
	
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
	
	Class.forName("org.hsqldb.jdbcDriver");				 
	Connection conn = DriverManager.getConnection("jdbc:hsqldb:hsql://localhost:9001/mydb", "sa", "");				 
	Statement stmt = conn.createStatement();	
   		
	int flag_number=Integer.parseInt(flag);	
			
	for(int i=0;i<flag_number;i++){
		
		String sqlstmt="alter table "+tableName+" add column ";
		
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
		
		sqlstmt+=columnNames[i]+" "+dataTypes[i]+lengths[i]+" "+primaryKeys[i]+" "+isNulls[i]+" "+details[i]+" ;";
		
		System.out.println(sqlstmt);
				
		stmt.execute(sqlstmt);
		
		sqlstmt="";
	}
	
	
	
    response.getWriter().write("<script>alert('添加属性成功');location.href='listTable.jsp'</script>");		
   
    
}catch(SQLException e){
	response.getWriter().write("<script>alert('添加失败1');location.href='changeTable.jsp?tableName="+tableName+"'</script>");
    e.printStackTrace();
}catch (Exception e) {
	response.getWriter().write("<script>alert('添加失败2');location.href='changeTable.jsp?tableName="+tableName+"'</script>");
    e.printStackTrace();
}
	
%>
</body> 
</html>