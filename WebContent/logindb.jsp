<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hyper SQL登录界面</title>
</head>
<body>
<form action="login.jsp">
        <table align="center" valign="center">
            <tr><th>Hyper SQL登录界面</th></tr>
            <tr>
                <td>username</td>
                <td width="500px"><input type="text" name="username"/></td>
            </tr>
            <tr>
                <td>password</td>
                <td><input type="text" name="password"/></td>
            </tr>
            <tr>
                <td>database</td>
                <td><input type="text" name="database"/></td>
            </tr>
            <tr><td><input type="submit" value="登录"></td></tr>
        </table>
    </form>
</body>
</html>