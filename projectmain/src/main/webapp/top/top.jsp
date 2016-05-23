<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<style>
	#gotop {
		display: none;
		position: fixed;
		right: 20px;
		bottom: 20px;
		/* [disabled]padding: 10px 15px; */
		font-size: 20px;
		background: #777;
		color: white;
		cursor: pointer;
	}

</style>




<meta charset="UTF-8">
<!-- 引入jQuery  and bootstrap css/js 檔案 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
<link href="${pageContext.request.contextPath}/css/maincontentdiv.css" rel="stylesheet" type="text/css" >
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>



</head>
<body>
	<!-- 巡覽列-->
	<div class="container">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">BootStrap</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li class=""><a href="${pageContext.request.contextPath}/indexOfAdminPage.jsp">關於我們</a></li>
						<!-----------------------------------下拉式選單(資料建檔開始)---------------------------------------------------- -->
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">資料建檔<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class=""><a href="${pageContext.request.contextPath}/Edu/EduServlet.do?action=getALLEdu">教育中心</a></li>
								<li class=""><a href="${pageContext.request.contextPath}/Class/ClassServlet.do?action=getALLClass">班級建檔</a></li>
								<li class=""><a href="${pageContext.request.contextPath}/Student/Studentform.jsp">學員建檔</a></li>
							</ul></li>
						<!-----------------------------------下拉式選單(資料建檔結束)---------------------------------------------------- -->

						<!-----------------------------------下拉式選單(系統設定開始)---------------------------------------------------- -->
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">系統設定<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class=""><a href="${pageContext.request.contextPath}/Sign_list/Sign_listForm.jsp">權限設定</a></li>
								<li class=""><a href="${pageContext.request.contextPath}/Test_interval/Test_intervalform.jsp">考試時段設定</a></li>
								<li class=""><a href="${pageContext.request.contextPath}/Test_Date/Test_Dateform.jsp">考試日期設定</a></li>
								<li class=""><a href="${pageContext.request.contextPath}/Mail_template/Mail_templateform.jsp">email樣板</a></li>
							</ul></li>
						<!-----------------------------------下拉式選單(系統設定結束)----------------------------------------------------						 -->

						<li class=""><a
							href="${pageContext.request.contextPath}/Examiner_offday/Examiner_offdayform.jsp">主考官請假查詢</a></li>
						<li class=""><a href="${pageContext.request.contextPath}/Test_period/Test_periodform.jsp">開放報名日期查詢</a></li>
						<li class=""><a href="#">登出</a></li>


					</ul>
<!-- 					menu nav navbar-nav結束 -->
				</div>
<!-- 				container collapse navbar-collapse結束 -->
			</div>
<!-- 			container 結束 -->
		</nav>
<!-- 		nav結束 -->
	</div>
<!-- 	div container結束 -->



<div id="gotop">TOP</div>
<script type="text/javascript">

    $("#gotop").click(function(){
        jQuery("html,body").animate({
            scrollTop:0
        },1000);
    });
    $(window).scroll(function() {
        if ( $(this).scrollTop() > 300){
            $('#gotop').fadeIn("fast");
        } else {
            $('#gotop').stop().fadeOut("fast");
        }
    });

</script>
</body>
</html>

