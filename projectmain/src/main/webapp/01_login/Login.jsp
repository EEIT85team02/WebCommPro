<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 匯入css -->
	<jsp:include page="../references/head_resources_css.jsp" />
<title>Insert title here</title>
</head>
<!-- 匯入js -->
	<jsp:include page="../references/head_resources_js.jsp" />
<body>
<div class="container">
	<!-- 匯入功能表列 -->
	<jsp:include page="../references/navigator.jsp" />

      <div class="starter-template">
<CENTER>  
<!-- 
<Form Action="login.do" method="POST">
 -->
 <!-- 
<Form Action="<c:url value='login.do' />" method="POST">
 -->
<Form Action="<c:url value='/Login.do' />" method="POST">
    <Table width='330' >
         <TR><TH colspan='2'>
            <H1>登入</H1> 
         </TH><TH></TH></TR>
         <TR>
             <TD align="RIGHT">帳號：</TD>
             <TD align="LEFT"><input	type="text" name="userId" size="10"></TD>
             <TD width='120'><small><Font color='red' size="-1">${ErrorMsgKey.AccountEmptyError}</Font></small></TD>
         </TR>
         <TR>
             <TD align="RIGHT">密碼：</TD>
             <TD align="LEFT" ><input	type="password" name="pswd"  size="10"></TD>
             <TD width='120'><small><Font color='red'  size="-1">${ErrorMsgKey.PasswordEmptyError}</Font></small></TD>
         </TR>            
         <TR>
             <TD align="CENTER" colspan='3'><Font color='red' size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font></TD>
             
         </TR>
            
        <TR>
            <TD colspan="2" align="center">      <input type="submit" value="提交"> </TD>
            </TR>
         </Table>        
         
</Form>
</CENTER>
 </div>
    </div><!-- /.container -->
<!-- 匯入js -->
	<jsp:include page="../references/foot_resources_js.jsp" />
 
</body>
</html>