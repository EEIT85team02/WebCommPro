<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="Stu_additional.model.*"%>
<%-- <%@ page import="org.json.simple.JSONValue"%> --%>
  <%
  Stu_additionalService Svc = new Stu_additionalService();
    List<Stu_additionalVO> list = Svc.getAll();
    pageContext.setAttribute("list",list);
//     String jsonString = JSONValue.toJSONString(list); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���A</title>
<link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">

</head>
<body>
<!-- <table border='1' bordercolor='#CCCCFF' width='800'> -->
<!-- 	<tr> -->
<!-- 		<th>�m�W</th> -->
<!-- 		<th>E-mail</th> -->
<!-- 		<th>�Z�O</th> -->
<!-- 		<th>�w�����</th> -->
<!-- 		<th>���A</th> -->
<!-- 	</tr> -->
<%-- 	<c:forEach var="Stu_additionalVO" items="${list}"> --%>
<!-- 		<tr align='center' valign='middle'> -->
<%--  			<td>${Stu_additionalVO.studentVO.stu_name}</td> --%>
<%-- 			<td>${Stu_additionalVO.studentVO.stu_email}</td> --%>
<%-- 			<td>${Stu_additionalVO.studentVO.stu_id}</td> --%>
<%-- 			<td>${Stu_additionalVO.stu_applytime}</td> --%>
<%--         	<td>${Stu_additionalVO.member_statusVO.sta_name}</td> --%>
<%-- 			</c:forEach> --%>
			
	<div class="bs-example bs-example-tabs" role="tabpanel">
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">�w�֭�</a></li>
        <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">�ݮ֭�</a></li>
      </ul>
    <div id="myTabContent" class="tab-content">
      <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledBy="home-tab">
        <p>
        <table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�m�W</th>
		<th>E-mail</th>
		<th>�Z�O</th>
		<th>�w�����</th>
		<th>���A</th>
	</tr>
        <c:forEach var="Stu_additionalVO" items="${list}">
		<tr align='center' valign='middle'>
 			<td>${Stu_additionalVO.studentVO.stu_name}</td>
			<td>${Stu_additionalVO.studentVO.stu_email}</td>
			<td>${Stu_additionalVO.studentVO.stu_id}</td>
			<td>${Stu_additionalVO.stu_applytime}</td>
        	<td>${Stu_additionalVO.member_statusVO.sta_name}</td>
			</c:forEach>
		</table>
		<p>
      </div>
      
      <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledBy="profile-tab">
        <p>    
        <table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�m�W</th>
		<th>E-mail</th>
		<th>�Z�O</th>
		<th>�w�����</th>
		<th>���A</th>
	</tr>
        <c:forEach var="Stu_additionalVO" items="${list}">
		<tr align='center' valign='middle'>
 			<td>${Stu_additionalVO.studentVO.stu_name}</td>
			<td>${Stu_additionalVO.studentVO.stu_email}</td>
			<td>${Stu_additionalVO.studentVO.stu_id}</td>
			<td>${Stu_additionalVO.stu_applytime}</td>
        	<td>${Stu_additionalVO.member_statusVO.sta_name}</td>
			</c:forEach>
		</table>
		<p>
      </div>
    </div>
  </div>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap/bootstrap.min.js"></script>
</body>
</html>