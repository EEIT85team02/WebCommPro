 <%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <!DOCTYPE html > -->
<!-- <html> -->
<!-- <head> -->
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




<!-- <meta charset="UTF-8"> -->
<!-- 引入jQuery  and bootstrap css/js 檔案 -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<%-- <link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" > --%>
<%-- <link href="${pageContext.request.contextPath}/css/maincontentdiv.css" rel="stylesheet" type="text/css" > --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script> --%>
<!-- <script -->
<!-- 	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script> -->

<!-- </head> -->
<!-- <body> -->
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
					<a class="navbar-brand" href="${pageContext.request.contextPath}/indexOfExamierPage.jsp">WebComm</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">

						<li class=""><a href="${pageContext.request.contextPath}/Status/showstatusJSON.jsp">考生核准查詢</a></li>
						<li class=""><a href="${pageContext.request.contextPath}/Score/showscoreJSON.jsp">考生成績變更</a></li>

<%-- 						<li class=""><a href="${pageContext.request.contextPath}/Examiner_offday/Examiner_offday_view.jsp">個人請假查詢</a></li> --%>
<%-- 						<li class=""><a href="${pageContext.request.contextPath}/03_chatRoom/ChatPagePahoWebComm.jsp">聊天</a></li> --%>
<%-- 						<li class=""><a href="${pageContext.request.contextPath}/01_login/Logout.jsp">登出</a></li> --%>

						<li class=""><a href="${pageContext.request.contextPath}/Examiner_offday/Examiner_offday_view.jsp">個人請假查詢</a></li>
						<c:if test="${not empty LoginOK}">
				            <li class=""><a href="<c:url value='/Logout.do'/>">登出</a></li>
						</c:if>
						



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


<div id="gotop">EXAMIERTOP</div>
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
<!-- </body> -->
<!-- </html> -->

