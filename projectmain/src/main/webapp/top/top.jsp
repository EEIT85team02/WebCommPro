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
					<a class="navbar-brand" href="${pageContext.request.contextPath}/indexOfAdminPage.jsp">WebComm</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li class=""><a href="${pageContext.request.contextPath}/Talk/TalkServletJSON.do?action=initTalkViewTODataTablesJSON">留言板</a></li>
						<!-----------------------------------下拉式選單(資料建檔開始)---------------------------------------------------- -->
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">資料建檔<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class=""><a href="${pageContext.request.contextPath}/Edu/EduServletJSON.do?action=initEduViewTODataTablesJSON">教育中心</a></li>
								<li class=""><a href="${pageContext.request.contextPath}/Class/ClassServletJSON.do?action=initClassViewTODataTablesJSON">班級建檔</a></li>
								<li class=""><a href="${pageContext.request.contextPath}/02_uploadCSV/StudentInitServlet.do?action=initStuViewTODataTablesJSON">學員建檔</a></li>
							</ul></li>
						<!-----------------------------------下拉式選單(資料建檔結束)---------------------------------------------------- -->

						<!-----------------------------------下拉式選單(系統設定開始)---------------------------------------------------- -->
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">系統設定<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class=""><a href="${pageContext.request.contextPath}/Sign_list/Sign_listServletJSON.do?action=initSlViewTODataTablesJSON">權限設定</a></li>
								<li class=""><a href="${pageContext.request.contextPath}/Employee/EmployeeServletJSON.do?action=initEmpViewTODataTablesJSON">員工權限設定</a></li>
								<li class=""><a href="${pageContext.request.contextPath}/Test_period/Test_periodServletJSON.do?action=initTpViewTODataTablesJSON">考試時段設定</a></li>
								<li class=""><a href="${pageContext.request.contextPath}/Test_interval/Test_intervalServletJSON.do?action=initTiViewTODataTablesJSON">考試日期設定</a></li>
								<li class=""><a href="${pageContext.request.contextPath}/Mail_template/MailServletJSON.do?action=initMailViewTODataTablesJSON">email樣板</a></li>
							</ul></li>
						<!-----------------------------------下拉式選單(系統設定結束)----------------------------------------------------						 -->

						<li class=""><a
							href="${pageContext.request.contextPath}/Examiner_offdayServlet?action=initExamTODataTablesJSON">主考官請假查詢</a></li>

						<li class=""><a href="${pageContext.request.contextPath}/Test_Date/Test_DateServletJSON.do?action=initTdViewTODataTablesJSON"">開放報名日期查詢</a></li>
						<li class=""><a href="${pageContext.request.contextPath}/SendMail/SendMail.jsp">EMAIL寄送</a></li>
						<li class=""><a href="${pageContext.request.contextPath}/StudentProfileServlet?action=initStumTODataTablesJSON">考生資料維護</a></li>
						
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
<!-- </body> -->
<!-- </html> -->

