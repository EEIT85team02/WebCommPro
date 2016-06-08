<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<title>留言板</title>
<style>
body{
	font-size:16px;
	color:white;

}
.allpage {
	background-color:#33FF33;
	position:absolute;
	width:600px;
}
.page2{
	width:500px;
	background-color:#00AAAA;
	border:3px solid red;
	padding:10px;
	margin:0 auto;
}
.title{
	width:80px;
	float:left;
}
.divinput{
	margin-top:20px;
}
.divbutton{    
	margin-top:20px;
}
.page1{
	background-color:#DDDDDD;
	width:500px;
	height:100px;
	border:3px solid red;
	padding:10px;
	margin:0 auto;
}




</style>
</head>
<body>
<div class="allpage">
	<div class="page1">
		訪客姓名:123
	</div>
	<div class="page1">
		訪客姓名:123
	</div>
	<div class="page1">
		訪客姓名:123
	</div>
	<div class="page1">
		訪客姓名:123
	</div>
	
	
	
	
	<div class="page2">
		<h3>訪客留言版</h3>
		<hr>
		<form action="TalkServletJSON.do" name="talk" method="post">
			<div class="divinput">
				<label class="title">訪客姓名:</label> 
				<input type="text" id="talkName" name="talkName" size="20">
			</div>
			<div class="divinput">
				<label class="title">性別:</label> 
				<input type="radio" name="talkGender" value="male" checked>男
				<input type="radio" name="talkGender" value="female">女
			</div>
			<div class="divinput">
				<label class="title">悄悄話:</label> 
				<input type="radio" name="talkChose" value="0" checked>否
				<input type="radio" name="talkChose" value="1">是
			</div>
			<div class="divinput">
				<label class="title">留言內容:</label> 
				<textarea rows="10" cols="50" name="talkContent" id="talkContent"></textarea>
			</div>
			<div class="divbutton">
				<input type="hidden" name="action" value="addTalk"> 
				<input type="submit" id="bsubmit" value="送出留言"> 
				<input type="reset" id="breset" value="清除留言">
			</div>
		</form>
	</div>
</div>
</body>
</html>