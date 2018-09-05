<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>USER创建页面</title>
</head>
<body>
<form action="USER.jsp">
        <table align="center" valign="center">
            <tr><th>用户创建页面</th></tr>
            <tr>
                <td>用户</td>
                <td width="500px"><input type="text" name="newusername"/></td>
            </tr>
            <tr>
                <td>密码</td>
                <td width="500px"><input type="text" name="newpassword"/></td>
            </tr>
            <tr><td><input type="submit" value="创建"></td></tr>
         </table>
    </form>
</body>
</html>