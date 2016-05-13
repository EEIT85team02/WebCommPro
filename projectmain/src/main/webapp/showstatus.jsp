<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="Stu_additional.model.*"%>
  <%
  Stu_additionalService Svc = new Stu_additionalService();
    List<Stu_additionalVO> list = Svc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>狀態</title>
</head>
<body>
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>姓名</th>
		<th>E-mail</th>
		<th>班別</th>
		<th>預約日期</th>
		<th>狀態</th>
	</tr>
	<c:forEach var="Stu_additionalVO" items="${list}">
		<tr align='center' valign='middle'>
 			<td>${Stu_additionalVO.studentVO.stu_name}</td>
			<td>${Stu_additionalVO.studentVO.stu_email}</td>
			<td>${Stu_additionalVO.studentVO.stu_id}</td>
			<td>${Stu_additionalVO.stu_applytime}</td>
        	<td>${Stu_additionalVO.member_statusVO.sta_name}</td>
			</c:forEach>
</body>
</html>