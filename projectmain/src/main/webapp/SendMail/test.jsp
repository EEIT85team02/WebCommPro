<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

 
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

 <!-- 引入jQuery  and bootstrap css/js 檔案 -->
		<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
		<link href=../"css/maincontentdiv.css" rel="stylesheet" type="text/css" >
		<script src="../js/jquery.min.js"></script>
		<script src="../js/jquery-ui.min.js"></script>
		<script src="../js/bootstrap/bootstrap.min.js"></script> 

	<script>
	window.onload=  function ()
	{
		SendAllMail2();
	}
		function SendAllMail() {
		
			var xhr = new XMLHttpRequest(), id = 0;
			var frag = document.createDocumentFragment();


			if (xhr != null) {

				xhr.open('post', 'SendMail1.do', true);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xhr.send("key=你好嗎" );
				Lobibox.alert("success", //AVAILABLE TYPES: "error", "info", "success", "warning"
				{
					msg : "email已寄送"
				});
			} else {
				// 				alert("您的瀏覽器不支援Ajax功能!!");
				Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
				{
					msg : "您的瀏覽器不支援Ajax功能!!"
				});
			}
			}
			function SendAllMail2() {
		    $.ajax({
		       type: "POST",
		       url: "SendMail1.do",
		       dataType: "json",
		       cache: false,
		       contentType: "application/x-www-form-urlencoded",
		       data:{"key":"你好嗎"}
		      });
		      }
		      
		       
		
	</script>
</body>
</html>