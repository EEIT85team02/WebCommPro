<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
    <title>Log'n Load</title>
    <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/login/normalize.css">
    <link rel="stylesheet" href="css/login/style.css">
    <link href="../css/lobibox.min.css" rel="stylesheet">
    <script src="../js/lobibox.min.js"></script>
     <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<!-- 	 <script src="js/login/index.js"></script>
	    -->
	    <script type="text/javascript" src="js/fancybox/jquery.form.min.js">
	    
	    $(document).ready(function(){ 
	    	console.log("-------------------------------------");
	    $(function(){ 
		    //提交表单 
		    $('#login_form').ajaxForm({ 
		        beforeSubmit: showRequest, //表单验证 
		        success: showResponse //成功返回 
		    }); 
		    console.log("-------------------------------------");
		}); 
		 
		function showRequest(){ 
		    var Username = $("#Username").val(); 
		    var Password = $("#Password").val(); 
		    console.log(Username);
		    console.log(Password);
		    if(Username =='' && Password ==''){ 
// 		        alert("请输入内容！"); 
     Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
			 			    			{
			 			    			msg: "请输入内容！"
			 			    			});
		        $("#Username").focus(); 
		        $("#Password").focus(); 
		        return false; 
		    } 
		} 
		 
		
		function showResponse(responseText, statusText, xhr, $form){ 
		    if(statusText=="success"){     
		        if(responseText==1){ 
		            $.fancybox.close();//关闭弹出层 
		            $('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据 
		        }else{ 
// 		            alert(responseText);
		  Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
 			    			{
 			    			msg: responseText
 			    			});
		        } 
		    }else{ 
// 		        alert(statusText); 
		   Lobibox.alert("info", //AVAILABLE TYPES: "error", "info", "success", "warning"
			    			{
			    			msg: statusText
			    			});
		    } 
		} 	
		});
		
	    </script>
    
  </head>

  <body>

    <div class="login">
  <header class="header">
    <span class="text">LOGIN</span>
    <span class="loader"></span>
  </header>
  <form class="login_form" action="<c:url value='/Login.do' />" method="POST">  
    <input class="input" type="text" name="Username" placeholder="Username">
    <input class="input" type="password" name="Password" placeholder="Password">
    <button class="btn" type="submit"></button>
  </form>
</div>
	<button class ="resetbtn" type= "reset">Reset it</button>
 
  </body>
</html>