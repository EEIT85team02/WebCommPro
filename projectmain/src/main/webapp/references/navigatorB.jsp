<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">偉康資訊人才招募系統</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="${pageContext.request.contextPath}/indexB.jsp">首頁</a></li>
            <li><a href="${pageContext.request.contextPath}/02_uploadCSV/uploadCSV.jsp">上傳考生資料</a></li>
<%--             <li><a href="${pageContext.request.contextPath}/03_chatRoom/ChatPage.jsp">WebSocket聊天室</a></li> --%>
<%--             <li><a href="${pageContext.request.contextPath}/04_fullcalendar/fullcalendar.jsp">fullCalendar日曆</a></li> --%>
            <li><a href="${pageContext.request.contextPath}/04_fullcalendar/fullcalendar_jQueryB.jsp">fullCalendarjQuery版日曆</a></li>
            <li><a href="${pageContext.request.contextPath}/05_studentInformation/studentInfo.jsp">顯示學生資料</a></li>
            <li><a href="${pageContext.request.contextPath}/03_chatRoom/ChatPagePahoWebComm.jsp">考官專用MQTT</a></li>
            <li><a href="${pageContext.request.contextPath}/06_bootstrap_year_calendar/bootstrap_year_calendar.jsp">bootstrap year calendar年曆</a></li>
<!--             <li><a href="LoginBegin.jsp">登入</a></li> -->
<%--             <li><a href="#">使用者編號:${sessionScope.stuID}</a></li> --%>
			<!-- 登入 -->
			<c:if test="${empty LoginOK}">
            <li><a href="${pageContext.request.contextPath}/01_login/LoginBegin.jsp">登入</a></li>
			</c:if>
			<c:if test="${not empty LoginOK}">
			<li><a href="#">
			<c:out value="${sessionScope.userId}"/>	
			</a></li>
			</c:if>
			<!-- 登出 -->
			<c:if test="${not empty LoginOK}">
            <li><a href="${pageContext.request.contextPath}/01_login/Logout.jsp">登出</a></li>
			</c:if>
			
			
			
			
			</ul>
        </div>
      </div>
    </nav>