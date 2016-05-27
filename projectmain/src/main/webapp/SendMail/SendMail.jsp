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
�Z�šG
<select id="class" name="class">
<!-- <option value="EEIT70">EEIT70</option> -->
<!-- <option value="EEIT85">EEIT85</option> -->
<!-- <option value="MEME33">MEME33</option> -->
<!-- <option value="MMMH25">MMMH25</option> -->
<!-- <option value="MSIT05">MSIT05</option> -->
</select>

<select id="content" name="content">
<!-- <option value="1">�w�����\�q��</option> -->
<!-- <option value="2">�ܽЫH</option> -->
<!-- <option value="3">�����q��</option> -->
<!-- <option value="4">�������q��</option> -->
</select>  
<button type="submit"><b>����</b></button>  
</form>


					<table id="studentTable" class="table table-bordered">
						<tbody></tbody>
					</table>
		               	<input type="button" name="ok" id="ok" value="�T�w">					

<!-- 	�ոլݥ�EL���� -->
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
	
	var sel = document.getElementById("class");//��class�U�Ԧ���檺id
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
	
	//--------------------�@�}�l�N�Z�ť�����X�Ӫ���k--------------------------------
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
						//�٬O�n�૬��JSON����
						js = JSON.parse(datas);
						console.log("js"+js);
						
						//var myBody = document.querySelector("select");
						var myBody = document.getElementById("class")
						//���R����椤�����e
						while(myBody.hasChildNodes()){
							myBody.removeChild(myBody.lastChild);
						}
						
						 //Ū�XJSON�������
		               	  //�N�����ܦbhtml��select���Ҥ�
		               	  
		               	  //��for�j��Ū�XJSON�������   
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
			alert("�z���s�������䴩Ajax�\��!!");
		}	
				

	}
	//-------------------�@�}�l�Nemail�˥�������X�Ӫ��o��-----------------------
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
						//�٬O�n�૬��JSON����
						js = JSON.parse(datas);
						console.log("js"+js);
						
						//var myBody = document.querySelector("select");
						var myBody = document.getElementById("content")
						//���R����椤�����e
						while(myBody.hasChildNodes()){
							myBody.removeChild(myBody.lastChild);
						}
						
						 //Ū�XJSON�������
		               	  //�N�����ܦbhtml��select���Ҥ�
		               	  
		               	  //��for�j��Ū�XJSON�������   
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
			alert("�z���s�������䴩Ajax�\��!!");
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
						//�٬O�n�૬��JSON����
						js = JSON.parse(datas);
						console.log("js"+js);
						
						var myBody = document.querySelector(".table>tbody");
						
						//���R����椤�����e
						while(myBody.hasChildNodes()){
							myBody.removeChild(myBody.lastChild);
						}
						
						 //Ū�XJSON�������
		               	  //�N�����ܦbhtml��select���Ҥ�
		               	  
		               	  //��for�j��Ū�XJSON�������   
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
//��ӹw�Q���ӬO��form���@�Ӥ@�Ӿǥͥ]�_�Ӱe�X�ҥH�n�@�ӭӦ����s 
// 		 					  var cell6=document.createElement("td");
// 		 					  var button=document.createElement("button");
// 		 					  button.type="submit";
// 		 					  button.value="Submit"
// 		 					  var txt6=document.createTextNode("�e�X");
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

// 		                  //�A�NŪ�X�������ܦbhtml��table���Ҥ�
// 		               	  //�Ѧһy�k�p�U
// 		               	  //�إ�<td>iPhone</td>
// 		               	  //var cell1 = document.createElement("td");
// 	 					  //var txt1 = document.createTextNode("iPhone");
// 	 					  //cell1.appendChild(txt1);
// 	 					  //�N<td>�[��<tr>���U
// 	 					  //var row = document.createElement("tr");
// 	 					  //row.appendChild(cell1);
// 	 					  //�N<tr>�[��<tbody>���U
	 			myBody.appendChild(frag);		  
					}else{
						alert(xhr.status + ":" + xhr.statusText);
					}
				}	
				
			});
			
			//Ū��html select���Ҥ��A�ثe�Q������ت�value(CategoryID)�A�y�k�ѦҦp�U
		    //select.options[select.selectedIndex].value
 		    var classNumber = sel.options[sel.selectedIndex].value;
			var content =sel1.options[sel1.selectedIndex].value;
			//�ϥ�get���覡�A�N���id�Ǩ�Server��Products.java���{��
			console.log(classNumber);
			console.log(content);		
	        xhr.open('post','SendMail.do',true);
	        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("class="+classNumber+"&content="+content);	
		}else{
			alert("�z���s�������䴩Ajax�\��!!");
		}	
				

	}
//-------------------------------enterInformationToSendMail�O���checkbox������U�e�X�ҳB�o����k---------------------	
	function enterInformationToSendMail() {		
	    var xhr = new XMLHttpRequest(),
	        id = 0;    
	    var frag = document.createDocumentFragment();
					      var arr = new Array();
					      //getElement"s"ByName,checkbox�̭���name���n�O�@�˪��A�ڷ|�N���ۦP�W�٪��@�_��J�}�C
					      //obj�O�@�Ӱ}�C�A�̭��˪��O�Q���checkbox���W�l
					      var obj=document.getElementsByName("checkboxname");
					      
					      var selected=[];
					    
					      
					      for (var i=0; i<obj.length; i++) {
					    	  //obj.check�O�N���_���ġAtrue�N����U��
					        if (obj[i].checked) {
					          selected.push(obj[i].value);//selected�O�U�[�}�C���W�١Apush�O�i�H�N�Ȥ@�Ӥ@�ӱ���}�C�᭱
					          }
					        }
					      
					      alert("�z�諸 : " + selected);	
					

		               	  for(var i = 0,max=selected.length;i<max;i++){
		              		
							//�Nselected�}�C�̭����ƭȧ@���}�C�ĴX�Ӥ������Ѧ�
							//������0�ӡA�ڴN�h��js�}�C�����ĴX�Ӥ����Ajs�}�C�O�ڪ�
							//SelectStudentInformation_controller���^�Ǫ���
							var selectobj=js[selected[i]]
							//concat() ��k�Ω�s����өΦh�Ӱ}�C�C
							//��k���|���ܭ�Ӱ}�C����
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