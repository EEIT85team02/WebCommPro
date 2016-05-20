<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="Stu_additional.model.*"%>
<%@ page import="Member_status.model.*"%>
<%-- <%@ page import="org.json.simple.JSONValue"%> --%>
<%  //������
    Stu_additionalService Svc = new Stu_additionalService();
    List<Stu_additionalVO> list = Svc.getAll();
    pageContext.setAttribute("list",list);
//     String jsonString = JSONValue.toJSONString(list); 
%>
<%  //�w�֭�
    Member_statusService MscOK = new Member_statusService();
    List<Member_statusVO> statuslistOK = MscOK.getStatusOK();
    pageContext.setAttribute("statuslistOK",statuslistOK);
%>
<%  //�ݮ֭�
    Member_statusService MscWAIT = new Member_statusService();
    List<Member_statusVO> statuslistWAIT = MscWAIT.getStatusWAIT();
    pageContext.setAttribute("statuslistWAIT",statuslistWAIT);
%>
<%  //�w����
    Member_statusService MscCANCEL = new Member_statusService();
    List<Member_statusVO> statuslistCANCEL = MscCANCEL.getStatusCANCEL();
    pageContext.setAttribute("statuslistCANCEL",statuslistCANCEL);
%>
<%  //�����W
    Member_statusService MscNEVER = new Member_statusService();
    List<Member_statusVO> statuslistNEVER = MscNEVER.getStatusNEVER();
    pageContext.setAttribute("statuslistNEVER",statuslistNEVER);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���A</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">

</head>
<body>
	<div class="bs-example bs-example-tabs" role="tabpanel">
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#OK" id="OK-tab" role="tab" data-toggle="tab" aria-controls="OK" aria-expanded="true">�w�֭�</a></li>
        <li role="presentation"><a href="#WAIT" role="tab" id="WAIT-tab" data-toggle="tab" aria-controls="WAIT">�ݮ֭�</a></li>
        <li role="presentation"><a href="#CANCEL" id="CANCEL-tab" role="tab" data-toggle="tab" aria-controls="CANCEL">�w����</a></li>
        <li role="presentation"><a href="#NEVER" role="tab" id="NEVER-tab" data-toggle="tab" aria-controls="NEVER">�����W</a></li>
      </ul>
    <div id="myTabContent" class="tab-content">
      <div role="tabpanel" class="tab-pane fade in active" id="OK" aria-labelledBy="OK-tab">
        <p>
        <table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�m�W</th>
		<th>E-mail</th>
		<th>�Z�O</th>
		<th>�w�����</th>
		<th>���A</th>
	</tr>
<%--         <c:forEach var="Stu_additionalVO" items="${list}"> --%>
<!-- 		<tr align='center' valign='middle'> -->
<%--  			<td>${Stu_additionalVO.studentVO.stu_name}</td> --%>
<%-- 			<td>${Stu_additionalVO.studentVO.stu_email}</td> --%>
<%-- 			<td>${Stu_additionalVO.studentVO.stu_id}</td> --%>
<%-- 			<td>${Stu_additionalVO.stu_applytime}</td> --%>
<%--         	<td>${Stu_additionalVO.member_statusVO.sta_name}</td> --%>
<%-- 			</c:forEach> --%>
		   <c:forEach var="Member_statusVO" items="${statuslistOK}">
           <c:forEach var="a" items="${Member_statusVO.stus}">
             <tr align='center' valign='middle'>
			<td>${a.studentVO.stu_name}</td>
			<td>${a.studentVO.stu_email}</td>
			<td>${a.studentVO.stu_id}</td>
			<td>${a.stu_applytime}</td>
			<td>${Member_statusVO.sta_name}</td>
			</c:forEach>
		   </c:forEach>
		</table>
		<p>
      </div>
      
      <div role="tabpanel" class="tab-pane fade" id="WAIT" aria-labelledBy="WAIT-tab">
        <p>    
        <table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�m�W</th>
		<th>E-mail</th>
		<th>�Z�O</th>
		<th>�w�����</th>
		<th>���A</th>
	</tr>
        <c:forEach var="Member_statusVO" items="${statuslistWAIT}">
           <c:forEach var="a" items="${Member_statusVO.stus}">
             <tr align='center' valign='middle'>
			<td>${a.studentVO.stu_name}</td>
			<td>${a.studentVO.stu_email}</td>
			<td>${a.studentVO.stu_id}</td>
			<td>${a.stu_applytime}</td>
			<td>${Member_statusVO.sta_name}</td>
		</c:forEach>
		   </c:forEach>
		</table>
		<p>
      </div>
      <div role="tabpanel" class="tab-pane fade" id="CANCEL" aria-labelledBy="CANCEL-tab">
        <p>    
        <table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�m�W</th>
		<th>E-mail</th>
		<th>�Z�O</th>
		<th>�w�����</th>
		<th>���A</th>
	</tr>
        <c:forEach var="Member_statusVO" items="${statuslistCANCEL}">
           <c:forEach var="a" items="${Member_statusVO.stus}">
             <tr align='center' valign='middle'>
			<td>${a.studentVO.stu_name}</td>
			<td>${a.studentVO.stu_email}</td>
			<td>${a.studentVO.stu_id}</td>
			<td>${a.stu_applytime}</td>
			<td>${Member_statusVO.sta_name}</td>
		</c:forEach>
		   </c:forEach>
		</table>
		<p>
      </div>
      <div role="tabpanel" class="tab-pane fade" id="NEVER" aria-labelledBy="NEVER-tab">
        <p>    
        <table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�m�W</th>
		<th>E-mail</th>
		<th>�Z�O</th>
		<th>�w�����</th>
		<th>���A</th>
	</tr>
        <c:forEach var="Member_statusVO" items="${statuslistNEVER}">
           <c:forEach var="a" items="${Member_statusVO.stus}">
             <tr align='center' valign='middle'>
			<td>${a.studentVO.stu_name}</td>
			<td>${a.studentVO.stu_email}</td>
			<td>${a.studentVO.stu_id}</td>
			<td>${a.stu_applytime}</td>
			<td>${Member_statusVO.sta_name}</td>
		</c:forEach>
		   </c:forEach>
		</table>
		<p>
      </div>
    </div>
  </div>
		<script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap/bootstrap.min.js"></script>
</body>
</html>