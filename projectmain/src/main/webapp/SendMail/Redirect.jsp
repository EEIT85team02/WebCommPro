<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>�A�n<%= session.getAttribute("stu_name")%><%= session.getAttribute("stu_id")%></title>
<script></script>
<script type="text/javascript"> 
function countDown(secs,surl){ 
//alert(surl); 
var jumpTo = document.getElementById('jumpTo');
jumpTo.innerHTML=secs; 
if(--secs>0){ 

setTimeout("countDown("+secs+",'"+surl+"')",1000); 
} 
else{ 
location.href=surl; 
} 
}




</script>

 
</head>
�{�Ҧ��\<br/>
�A�n�I<%= session.getAttribute("stu_name")%><br/>
stuID=<%= session.getAttribute("stu_id")%><br/>
<body><span id="jumpTo">5</span>���۰ʸ����ӤH����
<script type="text/javascript">countDown(5,"/projectmain/LoginForwarded.do");</script> 
</body>
</html>
</html>