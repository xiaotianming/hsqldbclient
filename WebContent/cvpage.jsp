<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cvpage</title>
</head>
<body>
<form action="createview.jsp">
        <table align="center" valign="center">
            <tr><th>创建视图</th></tr>
            <tr>
                <td>请输入创建视图语句</td>
                <td width="500px"><input type="text" name="statement"/></td>
            </tr>
            <tr><td><input type="submit" value="创建"></td></tr>
        </table>
        <br>
    </form>
</body>
</html>