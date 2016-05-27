<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 	<c:if test="${empty LoginOK}"> --%>
<%-- 		<c:set var="target" value="${pageContext.request.servletPath}" --%>
<%-- 			scope="session" /> --%>
<%-- 		<c:redirect url="/01_login/LoginBegin.jsp" /> --%>
<%-- 	</c:if> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 匯入css -->
	<jsp:include page="/references/head_resources_css.jsp" />
	
	
<title>上傳考生資料</title>
</head>
	<!-- 匯入js -->
	<jsp:include page="/references/head_resources_js.jsp" />
<body>
	
 
 <div class="container">
	<!-- 匯入功能表列 -->
	<jsp:include page="/references/navigator.jsp" />
<%-- 	<jsp:include page="/top/top.jsp" /> --%>
      
      <div class="starter-template">
        <h1>上傳考生資料</h1>
        <p class="lead">請準備一份CSV檔案並且確認即將匯入的檔案沒有重複的資料.<br> 重複的定義係指【班別】【期別】【座號】同時相同的兩份資料.</p>
        
		<a href="/projectmain/UploadStudentServlet">上傳會員資料</a>
		<a href="/projectmain/UploadOneServlet">上傳一筆資料</a><br>
		
		<form action="javascript: uploadAndSubmit();" enctype="multipart/form-data" id="uploadForm" method="post" name="uploadForm">
			<input class="btn btn-default" type="button" value="選擇csv檔">
			<input class="btn btn-default" type="button" value="上傳csv檔">
			<input class="btn btn-default" type="button" value="下載csv檔">
<!-- 		<input  type="file" id="choosefile" name="file"  style="display:none"  accept="video/mp4,video/avi,video/3gpp,video/x-matroska,video/ogg,image/jpeg,image/png,image/bmp,image/gif,image/tiff"/>  -->
			<input  type="file" id="choosefile" name="file"  style="display:none"  accept=".csv"/> 
  			<input  type="submit" id="submitfile" style="display:none" >
		</form>
		
        <input class="btn btn-default" type="button" value="寫入資料庫">
		
<!-- 		空標籤 -->
		<div id=MyDiv ></div>
		<div id=MyDiv2 ></div>
<!-- 		<div id=MyDiv3 ><textarea rows="" cols=""></textarea></div> -->
		
		<!-- Ajax -->
        <script>
        // 編輯過後會將CSV字串寫到這邊
        globalv = '';
        
        
        document.getElementsByTagName("input")[0].onclick = function(){
        	console.log("按到選擇CSV按鈕");
        	//模擬點擊選擇檔案的按鈕(已經被隱藏的)
        	document.getElementById("choosefile").click();
        }
        
        
        	var reader = new FileReader();
        	
        	
        	
        document.getElementById("choosefile").onchange= function(event){
        	console.log("選擇了檔案");
        	// 待reader裝滿
        	reader.onload = function(e){
        		// 將text轉為array形式
        		var readerToArray = processData(e.target.result);
        		// 將text轉為dataTables可使用形式
//         		var readerToArrayFit = "{"+"\""+"data"+"\":"+"["+readerToArray+"]"+"}"
//         		var readerToArrayFit = "{"+"["+readerToArray+"]"+"}"
//         		var readerToArrayFit = "["+readerToArray+"]"
        		var readerToArrayFit = readerToArray;

        		 // --1. 畫出 Datatables
        		 iniDataTables(readerToArrayFit);
        		
        		// --2. 測試使用textarea 
        		// 		填充到HTML標籤
//         		 $('textarea')
// //      	        .attr('src', e.target.result)
// // 					.append(e.target.result)
// // 					.append("{"+"\""+"data"+"\":"+"["+readerToArray+"]"+"}")
// 					.append(readerToArrayFit)
//      	        .width(400)
//      	        .height(700);
        	};
        	
        	
//         	reader.readAsDataURL(event.target.files[0]);// 圖片適用
        	reader.readAsText(event.target.files[0]);	// 文字適用
        };
        
        // 上傳
        document.getElementsByTagName("input")[1].onclick = function(){
        	console.log("按到上傳CSV按鈕");
        	document.getElementById("submitfile").click();//模擬點擊選擇檔案的按鈕(已經被隱藏的)
        };
        // 下載
        document.getElementsByTagName("input")[2].onclick = function(){
        	console.log("按到下載CSV按鈕");
        	// 準備一支servlet來下載test01.csv
        	var xhr = new XMLHttpRequest(); 
        	if(xhr!=null){
				xhr.onload = function(){
					if(xhr.status==200){
     	  			if(document.getElementById("MyDiv2").hasChildNodes()){
     	  				console.log("有孩子");
     	  				document.getElementById("MyDiv2").removeChild(document.getElementById("MyDiv2").childNodes[0]);
     	  			}
						var datas = xhr.responseText;
						console.log(datas);
						var eleLink = document.createElement("a");
						if (eleLink.download !== undefined) {
							var url1 = document.createTextNode("http://localhost:8080/projectmain/test01.csv");
							eleLink.setAttribute("href", 'http://localhost:8080/projectmain/test01.csv');
							eleLink.setAttribute("download","test01.csv");
							eleLink.style.visibility = 'hidden';
						document.getElementById("MyDiv2").appendChild(eleLink);
							eleLink.appendChild(url1);
							eleLink.click();
							eleLink.removeChild(url1);
						}

					}
				}
				xhr.open("GET","/projectmain/DownloadStudent2desktopServlet");
// 				xhr.overrideMimeType("./csv"); 
				xhr.send();
			}
     	
        };

        
        
        // -- 1.上傳檔案至servlet【一般情況】
        function uploadAndSubmit(){
        	
// 			var form = new FormData(document.getElementById("uploadForm")); 
         	var form = document.forms["uploadForm"]; 
        	 if (form["file"].files.length > 0){ 
        	 //if (form!=null){ 
        	  var file = form["file"].files[0]; 
        	  var reader = new FileReader(); 
        	  
        	  
        	  reader.onloadend = function() { 
				/*若使用test03.csv 編碼是UTF-8 印出來是正常的
				 -- 這表示servlet 在接收實出現問題!
        	   	 -- console.log(reader.result);
				*/
				console.log(typeof(reader.result));
				console.log(reader.result);
        	   var xhr = new XMLHttpRequest(); 
        	   xhr.open("POST", "/projectmain/UploadStudent2ServerServlet"); 
//         	   xhr.overrideMimeType("application/octet-stream"); 
			   xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        	   xhr.overrideMimeType("./csv"); 
        	   xhr.send(reader.result); 
        	  } 
        	  
//         	  reader.readAsBinaryString(file); 
//         	  reader.readAsArrayBuffer(form); 
        	  reader.readAsText(file,'UTF-8');
        	 } 
        	 else { 
        	  alert ("Please choose a file."); 
        	 }  
        }
        	 
		// -- 1.編輯過後的CSV上傳函數【離線編輯後】 
        function uploadAndSubmitAfterEdit(){
				console.log('uploadAndSubmitAfterEdit()');        	
        	   var xhr = new XMLHttpRequest(); 
        	   xhr.open("POST", "/projectmain/UploadStudent2ServerServlet"); 
			   xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        	   xhr.overrideMimeType("./csv"); 
        	   xhr.send(globalv); 
        }

        	 
        	 
        	 
        	 
        
		
		// -- 2.寫入資料庫 
        document.getElementsByTagName("input")[5].onclick = function(){
        	console.log("按到寫入資料庫按鈕");
     	  		if(document.getElementById("MyDiv").hasChildNodes()){
     	  			console.log("有孩子");
     	  			document.getElementById("MyDiv").removeChild(document.getElementById("MyDiv").childNodes[0]);
     	  		}
        	var xhr = new XMLHttpRequest(); 
     	   	xhr.open("POST", "/projectmain/UploadStudentServlet"); 
//      	   xhr.overrideMimeType("application/octet-stream"); 
     	   	xhr.send();
     	   	
     	   	// -- start
     	  	xhr.onloadstrart = function(){
     		  var eleDiv01 = document.createElement("H3");
     		  var textH301 = document.createTextNode("開始寫入資料庫...");
     		  eleDiv01.appendChild(textH301);
     		  document.getElementById("MyDiv").appendChild(eleDiv01);
     		  
     	  	}
        	// -- success
     	  	xhr.onload = function(){
        		if(xhr.status==200){
     		  var eleDiv02 = document.createElement("H3");
     		 	eleDiv02.setAttribute("style","color:blue");
     		  var textH302 = document.createTextNode("成功寫入資料庫!!!");
     		  eleDiv02.appendChild(textH302);
     		  document.getElementById("MyDiv").appendChild(eleDiv02);
        		}
        	}
        	// -- error 
     	  	xhr.onerror = function(){
     		  var eleDiv03 = document.createElement("H3");
     		  	eleDiv03.setAttribute("style","color:red");
     		  var textH303 = document.createTextNode("無法寫入資料庫!!!");
     		  eleDiv03.appendChild(textH303);
     		  document.getElementById("MyDiv").appendChild(eleDiv03);
        	}
        	// -- end
     	  	xhr.onloadend = function(){
        		console.log(xhr.status);
        		if(xhr.status==500){
     		  var eleDiv04 = document.createElement("H3");
     		  	eleDiv04.setAttribute("style","color:red");
     		  var textH304 = document.createTextNode("無法寫入資料庫!!!");
     		  eleDiv04.appendChild(textH304);
     		  document.getElementById("MyDiv").appendChild(eleDiv04);
        		}
        		
        	}
        	
        	
        };
        
        </script>
      </div>
    </div><!-- /.container -->


   <!-- 匯入js -->
	<jsp:include page="/references/foot_resources_js.jsp" />

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">考生基本資料維護</h4>
        </div>
        <div class="modal-body">
          <div id=showMember></div>
          <div class="form-group"><div id=formMember></div></div>
          
        </div>
        <div class="modal-footer">
        <button type="submit" id="modifybtn" class="btn btn-default btn-success btn-block"><span class="glyphicon glyphicon-off"></span>確認</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" id="modalClose">Close</button>
        </div>
      </div>
      
    </div>
  </div>
 
<!-- 2. 傳統dialog -->
<div id="dialog" title="Create new user">
  <form>
    <fieldset>
      <label for="name">Name</label>
      <input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
      <label for="email">Email</label>
      <input type="text" name="email" id="email" value="jane@smith.com" class="text ui-widget-content ui-corner-all">
      <label for="password">Password</label>
      <input type="password" name="password" id="password" value="xxxxxxx" class="text ui-widget-content ui-corner-all">
<!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
  </div>


<script>$( "#dialog" ).dialog({ autoOpen: false });</script>


<table id="example" class="display" cellspacing="0" width="100%"></table>




</body>
</html>