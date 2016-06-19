<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>indexOfAdminpage</title>
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<meta name="description" content="hello test">
<meta name="author" content="">
<style>
.navbar-inverse {
    background-image: linear-gradient(to bottom,#E4C00D 0,rgba(249, 68, 27, 0.97) 100%);
}
 html {
            height: 100%;
        }
        
 body {
            background-image: url(img/background/examiner.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
        }
</style>
</head>
<body>
<!-- 引入top.jsp標頭檔 巡覽列部分-->
<jsp:include page="/top/ExamierTop.jsp" />


</body>
</html>

