<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���A</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">

</head>
<body>
        <form action="ShowStatus.do" method="post">
				<input type="submit" value="���A�d��" > 
				<input type="hidden" name="action" value="showstatus">  
		</form>
	<div class="bs-example bs-example-tabs" role="tabpanel">
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#WAIT" id="WAIT-tab" role="tab" data-toggle="tab" aria-controls="WAIT" aria-expanded="true">�֭㤤</a></li>
        <li role="presentation"><a href="#OK" role="tab" id="OK-tab" data-toggle="tab" aria-controls="OK">�w�֭�</a></li>
        <li role="presentation"><a href="#NO" id="NO-tab" role="tab" data-toggle="tab" aria-controls="NO">���֭�</a></li>
        <li role="presentation"><a href="#NEVER" role="tab" id="NEVER-tab" data-toggle="tab" aria-controls="NEVER">�����W</a></li>
        <li role="presentation"><a href="#YES" role="tab" id="YES-tab" data-toggle="tab" aria-controls="YES">�w���W</a></li>
        <li role="presentation"><a href="#WAITING" role="tab" id="WAITING-tab" data-toggle="tab" aria-controls="WAITING">���W��</a></li>
      </ul>
    <div id="myTabContent" class="tab-content">
      <div role="tabpanel" class="tab-pane fade in active" id="WAIT" aria-labelledBy="WAIT-tab">
        <p>
        <table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�m�W</th>
		<th>E-mail</th>
		<th>�Z�O</th>
		<th>�w�����</th>
		<th>���A</th>
		<th>�ק�</th>
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
      
      <div role="tabpanel" class="tab-pane fade" id="OK" aria-labelledBy="OK-tab">
        <p>    
        <table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�m�W</th>
		<th>E-mail</th>
		<th>�Z�O</th>
		<th>�w�����</th>
		<th>���A</th>
		<th>�ק�</th>
	</tr>
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
      <div role="tabpanel" class="tab-pane fade" id="NO" aria-labelledBy="NO-tab">
        <p>    
        <table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�m�W</th>
		<th>E-mail</th>
		<th>�Z�O</th>
		<th>�w�����</th>
		<th>���A</th>
		<th>�ק�</th>
	</tr>
        <c:forEach var="Member_statusVO" items="${statuslistNO}">
           <c:forEach var="a" items="${Member_statusVO.stus}">
             <tr align='center' valign='middle'>
			<td>${a.studentVO.stu_name}</td>
			<td>${a.studentVO.stu_email}</td>
			<td>${a.studentVO.stu_id}</td>
			<td>${a.stu_applytime}</td>
			<td>${Member_statusVO.sta_name}</td>
			
<!-- 			<td>  -->
<!-- 			  <form action="ShowStatus.do" method="post"> -->
<!--  			     <input type="submit" value="�ק�"/> -->
<%-- 			     <input type="hidden" name="stu_id" value="${a.studentVO.stu_id}"> --%>
<!-- 			     <input type="hidden" name="action"	value="sta_nameUpdate"> -->
<!-- 			  </form> -->
<!-- 			</td>  -->
<%-- 			<jsp:useBean id="msSvc" scope="page" class="Member_status.model.Member_statusService" /> --%>
<!-- 			<td> -->
<!-- 			  <select size="1"> -->
<%-- 			    <c:forEach var="msVO" items="${msSvc.all}"> --%>
<%-- 				  <option>${msVO.sta_name} --%>
<%-- 			    </c:forEach> --%>
<!-- 		      </select> -->
<!-- 		    </td> -->
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
		<th>�ק�</th>
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
      <div role="tabpanel" class="tab-pane fade" id="YES" aria-labelledBy="YES-tab">
        <p>    
        <table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�m�W</th>
		<th>E-mail</th>
		<th>�Z�O</th>
		<th>�w�����</th>
		<th>���A</th>
		<th>�ק�</th>
	</tr>
        <c:forEach var="Member_statusVO" items="${statuslistYES}">
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
      <div role="tabpanel" class="tab-pane fade" id="WAITING" aria-labelledBy="WAITING-tab">
        <p>    
        <table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�m�W</th>
		<th>E-mail</th>
		<th>�Z�O</th>
		<th>�w�����</th>
		<th>���A</th>
		<th>�ק�</th>
	</tr>
        <c:forEach var="Member_statusVO" items="${statuslistWAITING}">
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