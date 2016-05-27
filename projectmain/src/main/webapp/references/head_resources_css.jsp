<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <link href="/css/bootstrap.min.css" rel="stylesheet"> -->
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/datatables.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/css/buttons.jqueryui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/css/buttons.dataTables.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/css/buttons.foundation.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/css/common.scss"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/css/buttons.bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/css/mixins.scss"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/Select-1.1.2/css/select.bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/Select-1.1.2/css/select.dataTables.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/Select-1.1.2/css/select.foundation.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/Select-1.1.2/css/select.jqueryui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/css/mixins.scss"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Widgets/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Widgets/jquery-ui.structure.css"/>





    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<!--     <script src='fullcalendar/lib/moment.js'></script> -->
    
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
<!--     <script src="bootstrap/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/datatables.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/js/buttons.bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/js/buttons.colVis.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/js/buttons.flash.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/js/buttons.foundation.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/js/buttons.html5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/js/buttons.jqueryui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/js/buttons.print.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/Buttons-1.1.2/js/dataTables.buttons.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/Select-1.1.2/js/dataTables.select.js"></script>

<!--     記得只有頭的地方要引入jquery 而且不能重複 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/Widgets/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jQueryForm/Form-3-46-0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/MyLib/deBugUtil.js"></script>
