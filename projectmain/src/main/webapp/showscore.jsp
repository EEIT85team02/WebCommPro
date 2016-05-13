<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="Student.model.*"%>
  <%
  StudentService Svc = new StudentService();
    List<StudentVO> list = Svc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���Z�X���o</title>
</head>
<body>
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�Z�O</th>
		<th>�m�W</th>
		<th>�W�����Z</th>
		<th>���զ��Z</th>
	</tr>
	<c:forEach var="StudentVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${StudentVO.stu_id}</td>
			<td>${StudentVO.stu_name}</td>
			<td>${StudentVO.stu_implement}</td>
			<td>${StudentVO.stu_interview}</td>
			</c:forEach>
</body>
</html>