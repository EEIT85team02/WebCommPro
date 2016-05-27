<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="Student.model.*"%>    
<%@ page import="SendMail.Controller.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/top/top.jsp" /> 
<form action="SendMail.do" method="post">
班級：
<select id="class" name="class">
<!-- <option value="EEIT70">EEIT70</option> -->
<!-- <option value="EEIT85">EEIT85</option> -->
<!-- <option value="MEME33">MEME33</option> -->
<!-- <option value="MMMH25">MMMH25</option> -->
<!-- <option value="MSIT05">MSIT05</option> -->
</select>

<select id="content" name="content">
<!-- <option value="1">預約成功通知</option> -->
<!-- <option value="2">邀請信</option> -->
<!-- <option value="3">錄取通知</option> -->
<!-- <option value="4">不錄取通知</option> -->
</select>  
<button type="submit"><b>提交</b></button>  
</form>


					<table id="studentTable" class="table table-bordered">
						<tbody></tbody>
					</table>
		               	<input type="button" name="ok" id="ok" value="確定">					

<!-- 	試試看用EL抓資料 -->
<!-- 	<table> -->
	
<%-- 	<c:forEach var="studentVO" items="${allstudent}" > --%>
<!-- 		<tr align='center' valign='middle'> -->
<%-- 			<td>${studentVO.stu_id}</td> --%>
<%-- 			<td>${studentVO.stu_lastname}</td> --%>
<%-- 			<td>${studentVO.stu_firstname}</td> --%>
<%-- 			<td>${studentVO.stu_tel}</td> --%>
<%-- 			<td>${studentVO.stu_email}</td> --%>
<!-- 			<td> -->
<%-- 	          ${studentVO.classVO.class_id}         --%>
<!-- 			</td> -->
		
<!-- 		</tr> -->
<%-- 	</c:forEach>	 --%>
<!-- 	</table> -->
<!-- 	<table>					 -->
<%-- 	<c:forEach var="Mail_templateVO" items="${textcontent}" > --%>
<!-- 		<tr align='center' valign='middle'> -->
<%-- 			<td>${Mail_templateVO}</td> --%>
	
<!-- 		</tr> -->
<%-- 	</c:forEach>	 --%>
<!-- 	</table>					 -->
					
					
					
	<script src="js/jquery-1.12.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script>
	
	var sel = document.getElementById("class");//抓class下拉式選單的id
	document.getElementById("class").onload=loadClassSelector();
	sel.addEventListener("change",loadSendAllMail);
	
	var sel1 = document.getElementById("content");
	document.getElementById("content").onload=loadMailTextSelector();
	sel1.addEventListener("change",loadSendAllMail);
	
	var btn=document.getElementById("ok");
	btn.addEventListener("click",enterInformationToSendMail);

	
	var datas=null;
	var js =null;
	var selectedJSON=null;
	
	//--------------------一開始將班級全部抓出來的方法--------------------------------
	function loadClassSelector() {		
	    var xhr = new XMLHttpRequest(),
	        id = 0;    
	    var frag = document.createDocumentFragment();


		if (xhr != null){
			xhr.addEventListener("readystatechange",function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){			
			            datas = xhr.responseText;
						console.log("datas"+datas);
						//還是要轉型成JSON物件
						js = JSON.parse(datas);
						console.log("js"+js);
						
						//var myBody = document.querySelector("select");
						var myBody = document.getElementById("class")
						//先刪除表格中的內容
						while(myBody.hasChildNodes()){
							myBody.removeChild(myBody.lastChild);
						}
						
						 //讀出JSON中的資料
		               	  //將資料顯示在html的select標籤中
		               	  
		               	  //用for迴圈讀出JSON中的資料   
		               	  for(var i = 0,max=js.length;i<max;i++){
		               		  
		               		  var class_id=js[i].class_id;
			 
              		  
		               		  console.log("class_id====="+class_id);		               		 
		 					  var cell0=document.createElement("option");
		 					  var txt0=document.createTextNode(class_id);
		 					  cell0.name="class_id"+i;
		 					  cell0.value=class_id;
		 					  cell0.appendChild(txt0);
		 					 myBody.appendChild(cell0);
		 					 
					 
		 					 
		 					 
		 					 
		 					 
		               	  }
		               		  
		               		
	 			myBody.appendChild(frag);		  
					}else{
						alert(xhr.status + ":" + xhr.statusText);
					}
				}	
				
			});
			
		
	        xhr.open('post','LoadStartingClassComboBox_controller.do',true);
	        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send();	
		}else{
			alert("您的瀏覽器不支援Ajax功能!!");
		}	
				

	}
	//-------------------一開始將email樣本全部抓出來的發紡-----------------------
		function loadMailTextSelector() {		
	    var xhr = new XMLHttpRequest(),
	        id = 0;    
	    var frag = document.createDocumentFragment();

	    
		if (xhr != null){
			xhr.addEventListener("readystatechange",function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){			
			            datas = xhr.responseText;
						console.log("datas"+datas);
						//還是要轉型成JSON物件
						js = JSON.parse(datas);
						console.log("js"+js);
						
						//var myBody = document.querySelector("select");
						var myBody = document.getElementById("content")
						//先刪除表格中的內容
						while(myBody.hasChildNodes()){
							myBody.removeChild(myBody.lastChild);
						}
						
						 //讀出JSON中的資料
		               	  //將資料顯示在html的select標籤中
		               	  
		               	  //用for迴圈讀出JSON中的資料   
		               	  for(var i = 0,max=js.length;i<max;i++){
		               		  

		               		  var Mail_template=js[i].Mail_template;				 

		 					 
		               		  console.log("Mailtext====="+Mail_template);		               		 
		 					  var cell1=document.createElement("option");
		 					  var txt1=document.createTextNode(Mail_template);
		 					  cell1.name="Mail_template"+i;
		 					  cell1.value=i+1;
		 					  cell1.appendChild(txt1);
		 					  myBody.appendChild(cell1);		 					 
		 					 
		 					 
		 					 
		 					 
		               	  }
		               		  
		               		
	 			myBody.appendChild(frag);		  
					}else{
						alert(xhr.status + ":" + xhr.statusText);
					}
				}	
				
			});
			
		
	        xhr.open('post','LoadStartingMailTemplateComboBox_controller.do',true);
	        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send();	
		}else{
			alert("您的瀏覽器不支援Ajax功能!!");
		}	
				

	}
	
	//-------------------------------------------
	function loadSendAllMail() {		
	    var xhr = new XMLHttpRequest(),
	        id = 0;    
	    var frag = document.createDocumentFragment();

	    
		if (xhr != null){
			xhr.addEventListener("readystatechange",function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){			
			            datas = xhr.responseText;
						console.log("datas"+datas);
						//還是要轉型成JSON物件
						js = JSON.parse(datas);
						console.log("js"+js);
						
						var myBody = document.querySelector(".table>tbody");
						
						//先刪除表格中的內容
						while(myBody.hasChildNodes()){
							myBody.removeChild(myBody.lastChild);
						}
						
						 //讀出JSON中的資料
		               	  //將資料顯示在html的select標籤中
		               	  
		               	  //用for迴圈讀出JSON中的資料   
		               	  for(var i = 0,max=js.length;i<max;i++){
		               		  
		               		  var stu_id=js[i].stu_id;
		               		  var stu_email=js[i].stu_email;
		               		  var stu_name=js[i].stu_name;		               		            		  
		               		  var mailText=js[i].mailText;  
							 
              		  
		               		 
		 					  var cell0=document.createElement("td");
		 					  var checkbox=document.createElement("input");
		 					  checkbox.type="checkbox";
		 					  checkbox.id="checkboxid"+i;
		 					  checkbox.name="checkboxname";
		 					  checkbox.value=i;
		 					  cell0.appendChild(checkbox);	               		  
		               		  
		               		  
		               		  
		               		  console.log("stu_id====="+stu_id);
		 					  var cell1=document.createElement("td");
		 					  var txt1=document.createTextNode(stu_id);
		 					 cell1.id="stu_id"+i;
		 					 cell1.name="stu_id"+i;		 					 
		 					  cell1.appendChild(txt1);
		
		 					  var cell2=document.createElement("td");
		 					  var txt2=document.createTextNode(stu_email);
		 					 cell2.id="stu_email"+i;
		 					cell2.name="stu_email"+i;
		 					  cell2.appendChild(txt2);
		 					  
		 					  var cell3=document.createElement("td");
		 					  var txt3=document.createTextNode(stu_name);
		 					 cell3.id="stu_name"+i;
		 					 cell3.name="stu_name"+i;	 					 
		 					  cell3.appendChild(txt3);
		 					  


		 					  var cell5=document.createElement("td");
		 					  var txt5=document.createTextNode(mailText);
		 					 cell5.id="mailText"+i;
		 					 cell5.name="mailText"+i;		 					 
		 					  cell5.appendChild(txt5);
//原來預想本來是用form表單一個一個學生包起來送出所以要一個個有按鈕 
// 		 					  var cell6=document.createElement("td");
// 		 					  var button=document.createElement("button");
// 		 					  button.type="submit";
// 		 					  button.value="Submit"
// 		 					  var txt6=document.createTextNode("送出");
// 		 					  cell6.appendChild(button);
// 		 					 button.appendChild(txt6);
		 					  
		 					  
		 					  
		 					  

		 					  
		 					  var row = document.createElement("tr");
		 					
		 					 row.appendChild(cell0);
		 					row.appendChild(cell1);
		 					row.appendChild(cell2);
		 					row.appendChild(cell3);

		 					row.appendChild(cell5);
//		 					row.appendChild(cell6);
		               		  

		 					 
	 					  frag.appendChild(row);
		               	  }

// 		                  //再將讀出的資料顯示在html的table標籤中
// 		               	  //參考語法如下
// 		               	  //建立<td>iPhone</td>
// 		               	  //var cell1 = document.createElement("td");
// 	 					  //var txt1 = document.createTextNode("iPhone");
// 	 					  //cell1.appendChild(txt1);
// 	 					  //將<td>加到<tr>之下
// 	 					  //var row = document.createElement("tr");
// 	 					  //row.appendChild(cell1);
// 	 					  //將<tr>加到<tbody>之下
	 			myBody.appendChild(frag);		  
					}else{
						alert(xhr.status + ":" + xhr.statusText);
					}
				}	
				
			});
			
			//讀取html select標籤中，目前被選取項目的value(CategoryID)，語法參考如下
		    //select.options[select.selectedIndex].value
 		    var classNumber = sel.options[sel.selectedIndex].value;
			var content =sel1.options[sel1.selectedIndex].value;
			//使用get的方式，將資料id傳到Server端Products.java的程式
			console.log(classNumber);
			console.log(content);		
	        xhr.open('post','SendMail.do',true);
	        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("class="+classNumber+"&content="+content);	
		}else{
			alert("您的瀏覽器不支援Ajax功能!!");
		}	
				

	}
//-------------------------------enterInformationToSendMail是選擇checkbox之後按下送出所處發的方法---------------------	
	function enterInformationToSendMail() {		
	    var xhr = new XMLHttpRequest(),
	        id = 0;    
	    var frag = document.createDocumentFragment();
					      var arr = new Array();
					      //getElement"s"ByName,checkbox裡面的name都要是一樣的，我會將有相同名稱的一起抓入陣列
					      //obj是一個陣列，裡面裝的是被選到checkbox的名子
					      var obj=document.getElementsByName("checkboxname");
					      
					      var selected=[];
					    
					      
					      for (var i=0; i<obj.length; i++) {
					    	  //obj.check是將有否打勾，true就執行下面
					        if (obj[i].checked) {
					          selected.push(obj[i].value);//selected是愈加陣列的名稱，push是可以將值一個一個接到陣列後面
					          }
					        }
					      
					      alert("您選的 : " + selected);	
					

		               	  for(var i = 0,max=selected.length;i<max;i++){
		              		
							//將selected陣列裡面的數值作為陣列第幾個元素的參考
							//像選到第0個，我就去抓js陣列中的第幾個元素，js陣列是我的
							//SelectStudentInformation_controller中回傳的值
							var selectobj=js[selected[i]]
							//concat() 方法用於連接兩個或多個陣列。
							//方法不會改變原來陣列的值
							//http://www.w3school.com.cn/jsref/jsref_concat_array.asp
							  arr = arr.concat(selectobj);
						  	alert("arr==="+arr);					  
	
               	  
		               	  }
		               	  
							selectedJSON=JSON.stringify(arr);
							
					  	alert(selectedJSON);
				        xhr.open('post','SendMail1.do',true);
				        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
						xhr.send("key="+selectedJSON);						  
			
	
		
// 	        xhr.open('post','SendMail1.do',false);
// 	        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
// 			xhr.send("key="+selectedJSON);	
		

	}
			
	
	
	
	</script>
</body>
</html>