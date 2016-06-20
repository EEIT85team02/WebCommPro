<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->

<!-- <link rel='stylesheet' href='http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.7.3/fullcalendar.print.css' /> -->



<%-- <link rel='stylesheet' href='${pageContext.request.contextPath}/fullcalendar/fullcalendar.css' /> --%>
<link rel='stylesheet' href='http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.7.3/fullcalendar.min.css' />

<link rel='stylesheet' href='${pageContext.request.contextPath}/fullcalendar/lib/cupertino/jquery-ui.min.css' />

<script src='${pageContext.request.contextPath}/fullcalendar/lib/moment.js'></script>

<%-- <script src='${pageContext.request.contextPath}/fullcalendar/fullcalendar.min.js'></script> --%>
<script src='http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.7.3/fullcalendar.min.js'></script>
<!-- 載入fullcalendar的語言包 -->
<!-- http://fullcalendar.io/docs/text/lang/ -->
<!-- 受影響的參數: header, month, day, week, timeFormat, weekNumberCalculation, firstDay  -->
<script src='${pageContext.request.contextPath}/fullcalendar/lang/zh-tw.js'></script>
<script src='${pageContext.request.contextPath}/MyLib/notifacation.js'></script>
<script src='${pageContext.request.contextPath}/MyLib/updateDataBase.js'></script>
<script src='${pageContext.request.contextPath}/MyLib/deBugUtil.js'></script>
