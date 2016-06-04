<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 匯入css -->
	<jsp:include page="/references/head_resources_css.jsp" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<!-- 匯入js -->
	<jsp:include page="/references/head_resources_js.jsp" />
<body>
	<div class="container">
	<!-- 匯入功能表列 -->
	<jsp:include page="/references/navigator.jsp" />

      <div class="starter-template">
	
	<h3>請點選您需要的功能</h3>
        <p class="lead">請依據您的考生身分選擇登入的方式.</p>	
<!-- 		<input class="btn btn-default" type="button" value="gmail"> -->
<!-- 		<input class="btn btn-default" type="button" value="其他"> -->
        <H5>考生身分的定義係指<br>【登記報名資訊時所填寫的信箱種類】為【gmail】或【其他】.</H5>

   <!-- 匯入專區捷徑 -->
	<jsp:include page="/references/middle_resources_css.jsp" />

			

		</div>
    </div>
    
    <!-- /.container -->


   <!-- 匯入js -->
	<jsp:include page="/references/foot_resources_js.jsp" />

	
</body>
</html>