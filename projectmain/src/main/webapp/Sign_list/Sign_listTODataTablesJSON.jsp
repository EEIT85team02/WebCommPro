<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<title>Sign_list_Page</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">

<style>
.Main_Content {
	margin-top: 100px;
}
#buttonAdd{
	color: blue;
}
#buttonDelete{
	color: red;
}
#buttonUpdate{
	color: green;
}


label, input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}

</style>
</head>
<body>
	<!-- �ޤJtop.jsp���Y�� �����C����-->
	<jsp:include page="/top/top.jsp" />
	<!-------------�������e�e���}�l------------>
	
	<!-- �T�w�����C��m�A�إ�div�ϰ϶��U�� (starter-template)-->
	<div class="container">
		<div class="Main_Content">
			<div class="row">
				<div class="col-md-12">
					<div class=>
						<table class="table table-hover" id="Sign_listTable">
							<thead>
								<tr>
									<th class="col-md-1 col-xs-1">�N��</th>
									<th class="col-md-2 col-xs-2">�W�r</th>
									<th class="col-md-3 col-xs-3">Email</th>
									<th class="col-md-2 col-xs-2">����</th>
									<th class="col-md-2 col-xs-2">�v��</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>�N��</th>
									<th>�W�r</th>
									<th>Email</th>
									<th>����</th>
									<th>�v��</th>
								</tr>
							</tbody>
						</table>
						
						<!------------------�I��s�W�v���]�w���϶����e----------------------------- -->
					<button id="buttonAdd">�s�W</button>
					<button id="buttonUpdate">�s��</button>
					<button id="buttonDelete">�R��</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- �]�w�s�WFORM���϶�dialog -->
	<div id="dialog-insertForm" title="�إ��v���]�w���">
		<p class="validateTips"></p>
		<form name="Sign_listInsertForm" action="updateSl">
			<fieldset>
				<label for="emp_id">���u�N��</label> 
				<input type="text" name="emp_id" id="emp_id" class="text ui-widget-content ui-corner-all" autocomplete="off">
				<div id="div1"></div>
				<label for="emp_name">���u�W��</label> 
				<input type="text" name="emp_name" id="emp_name" readOnly class="text ui-widget-content ui-corner-all"> 
				<label for="emp_mail">Email</label> 
				<input type="text" name="emp_mail" id="emp_mail" readOnly class="text ui-widget-content ui-corner-all"> 
				<label for="dep_name">�����W��</label> 
				<input type="text"name="dep_name" id="dep_name" readOnly class="text ui-widget-content ui-corner-all">
				<label for="sl_id">�v��</label> 
				<select name="sl_id" id="sl_id" class="text ui-widget-content ui-corner-all"></select>
				<input type="hidden"name="action" value="updateSl">
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- �]�w�ק�FORM���϶�dialog -->
	<div id="dialog-updateForm" title="�ק��v���]�w���">
		<p class="validateTips"></p>
		<form name="Sign_listUpdateForm" action="updateSl">
			<fieldset>
				<label for="emp_id">���u�N��</label> 
				<input type="text" name="emp_id" id="uemp_id"  readOnly class="text ui-widget-content ui-corner-all">
				<label for="emp_name">���u�W��</label> 
				<input type="text" name="emp_name" id="uemp_name" readOnly class="text ui-widget-content ui-corner-all"> 
				<label for="emp_mail">Email</label> 
				<input type="text" name="emp_mail" id="uemp_mail" readOnly class="text ui-widget-content ui-corner-all"> 
				<label for="dep_name">�����W��</label> 
				<input type="text"name="dep_name" id="udep_name" readOnly class="text ui-widget-content ui-corner-all">
				<label for="sl_id">�v��</label> 
				<select name="sl_id" id="usl_id" class="text ui-widget-content ui-corner-all"></select>
				<input type="hidden"name="action" value="updateSl">
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	<!-- �]�w�R���T�{���϶�dialog -->
<div id="dialog-deleteForm" title="�R���T�{">
  <p>�O�_�n�R���������?</p>
</div>



	<script>
		$(function() {
			//�w�qtable��ƨӷ�json�A�P�e�����------>�}�l
			var table = $('#Sign_listTable').DataTable( {
			 	"ajax": {
		            "url": "Sign_listToJSONInitTableServlet",
		        },
		     	"oLanguage": {
				"sProcessing":"��ƥ��B�z��...",
				"sLengthMenu": "��� _MENU_ ���O��",
			    "sZeroRecords": "�L�ŦX���",
			    "sInfo": "�ثe�O���G_START_ �� _END_, �`���ơG_TOTAL_",
			    "sInfoEmpty":"��ܲ� 0 �� 0 �����G�A�@ 0 ��",
                "sInfoFiltered":"(�q _MAX_ �����G�L�o)",
                "sSearch":"�j��:",
                "oPaginate":{"sFirst":"����",
                          "sPrevious":"�W��",
                          "sNext":"�U��",
                          "sLast":"����"}
		 },
	    	  "bJQueryUI":false,
	    	  "bProcessing": true,
	    	  "sPaginationType":"full_numbers",
	    	  
	    	} );
		//�w�qtable��ƨӷ�json�A�P�e�����------>����
// 		$(function() {
// 			//���J�����ɡA���Q��getJSON��k�I�sSign_listServletJSON.do�A���^��Ʈw��ƨëإ�table���e
// 			$('#Sign_listTable>tbody>tr').remove();
// 			$.getJSON('Sign_listServletJSON.do', {"action":"getALLSl"}, function(datas) {
// 				//console.log(datas);
// 				$.each(datas, function(i, Sls) {
// 					//��Ƹ��J�N������J��줺�e
// 					$( "#Sign_listTable>tbody" ).append( 
// 						"<tr>" +
// 						  "<td>" + Sls.emp_id + "</td>" +
// 				          "<td>" + Sls.emp_name + "</td>" +
// 				          "<td>" + Sls.emp_mail + "</td>" +
// 				          "<td>" + Sls.dep_name + "</td>" +
// 				          "<td>" + Sls.sl_id + "</td>" +
// 				          "<td>" + "<button class='buttonUpdate' value="+Sls.emp_id+"> "+"�s��"+"</button>"+ "</td>" +
// 				          "<td>" + "<button class='buttonDelete' value="+Sls.emp_id+"> "+"�R��"+"</button>" + "</td>" +
// 				        "</tr>" );
// 					//console.log(Sls.emp_id);
// 				});
// 			});//���^��Ʈw��ƨëإ�table���e����
			
			//---------------diolog�{�������H�U(�s�W)------------------
			 var  form,Sign_listInsertForm,Sign_listUpdateForm,
			  emp_id = $( "#emp_id" ),
		      emp_name = $( "#emp_name" ),
		      emp_mail = $( "#emp_mail" ),
		      dep_name = $( "#dep_name" ),
		      sl_id = $( "#sl_id" ),
		      uemp_id = $('#uemp_id');
			  uemp_name = $('#uemp_name');
			  uemp_mail = $('#uemp_mail');
			  udep_name = $('#udep_name');
			  usl_id = $('#usl_id');
			  
			  deleteOrUpdateValue = null;//�ˬd�O�_�������Ʀ�
			  
		      allFields = $( [] ).add( emp_id ).add( emp_name ).add( emp_mail ).add( dep_name ).add( sl_id ),
		      uallFields = $( [] ).add( uemp_id ).add( uemp_name ).add( uemp_mail ).add( udep_name ).add( usl_id ),
		      tips = $( ".validateTips" );
		 //�b������ܰ϶��s�Wclass t->�ǤJ���@�q��r
		    function updateTips( t ) {
		      tips
		        .text( t )
		        .css('color','red')
		        .addClass( "ui-state-highlight" );
		      setTimeout(function() {
		        tips.removeClass( "ui-state-highlight", 1500 );
		      }, 500 );
		    }
		 //���Ҹ�ƪ��׬O�_�ŦX�W�ho->$('#���ID')����ơBn->���W�١Bmin->�̵u���סBmax->�̪�����
		    function checkLength( o, n, min, max ) {
		      if ( o.val().length > max || o.val().length < min ) {
		        o.addClass( "ui-state-error" );
		        updateTips( "��� " + n + ":���ץ����� " +
		          min + " �� " + max + "����" );
		        return false;
		      } else {
		        return true;
		      }
		    }
		 //���Ҫ���ƬO�_�ŦX�W�h o->$('#���ID')�B�W�h���Bn->SHOW�@�q��r
		    function checkRegexp( o, regexp, n ) {
		      if ( !( regexp.test( o.val() ) ) ) {
		        o.addClass( "ui-state-error" );
		        updateTips( n );
		        return false;
		      } else {
		        return true;
		      }
		    }
		    //�I��s�W��A�Ұ��檺��k
		    function insertSlFormToCreateTable() {
		      var valid = true;
		      allFields.removeClass( "ui-state-error" );
			  valid = valid && checkLength( emp_name, "�W�r", 1, 30 );
		      valid = valid && checkLength( emp_mail, "Email", 1, 30 );
		      valid = valid && checkLength( dep_name, "�����W��", 1, 30 );
		      valid = valid && checkLength( sl_id, "�v��", 1, 2 );
// 		      valid = valid && checkRegexp( edu_tel, /^([0-9])+$/, "�q�����u���\��J�Ʀr : 0-9" );
		 		if ( valid ) {
		 			var Insertdatas = $('form[name="Sign_listInsertForm"]').serialize();
		 			$.post('Sign_listServletJSON.do',Insertdatas,function(data){
		 				console.log(data);
		 				if(data=="��Ƨ�s����"){
		 					$('.validateTips').css('color','red').text("�s�W���~");
		 				}
		 				else if(data=="��Ƨ�s���\"){
		 					table.ajax.reload();//���s���Jdata tables�����
		 					allFields.val("");//�N�s�Wform��椺�e�M��
					 		$('.validateTips').text("");////�N�s�Wform������Ұ϶����e�M��
					 		deleteOrUpdateValue = null;
					 		Sign_listInsertForm.dialog( "close" );//�N�s�Wform�������
			 				//���^��Ʈw��ƨëإ�table���e����
		 				}
		 			});
		 		}
		      return valid;
		    }
		  
		  //�]�w���e�׵�����ƶ}�l
		    Sign_listInsertForm = $( "#dialog-insertForm" ).dialog({
		      autoOpen: false,
		      height: 500,
		      width: 400,
		      modal: true,
		      buttons: {
		        "send": insertSlFormToCreateTable,
		        Cancel: function() {
		        	Sign_listInsertForm.dialog( "close" );
		        }
		      },
		      close: function() {
		        form[ 0 ].reset();
		        allFields.removeClass( "ui-state-error" );
		       	allFields.val("");//�N�s�Wform��椺�e�M��
	 			$('.validateTips').text("");////�N�s�Wform������Ұ϶����e�M��
		      }
		    });
		  	//�]�w���e�׵�����Ƶ���
		  	form = Sign_listInsertForm.find( "form" ).on( "submit", function( event ) {
		      event.preventDefault();
		      insertSlFormToCreateTable();
		    });
		 	//�j�wclick�ƥ�ϥΪ̷s�Wicon�A�}��dialog ���EduInsertForm
		    $( "#buttonAdd" ).button().on( "click", function() {
		    	Sign_listInsertForm.dialog( "open" );
		    });//diolog�{����������
		    
		   
		    
		  //�I��n�R���νs�誺����A���R���νs����Y�i�A���N��ܪ�[��]����x�s
			$('#Sign_listTable tbody').on( 'click', 'tr', function () {
				deleteOrUpdateValue = $(this).find('td:eq(0)').text(); 
				emp_idUpdateValue = $(this).find('td:eq(0)'); 
				emp_nameUpdateValue = $(this).find('td:eq(1)');
				emp_mailUpdateValue = $(this).find('td:eq(2)');
				dep_nameUpdateValue = $(this).find('td:eq(3)');
				sl_idUpdateValue = $(this).find('td:eq(4)');
				console.log(deleteOrUpdateValue);
					if ( $(this).hasClass('selected') ) {
			            $(this).removeClass('selected');
			        }
			        else {
			            table.$('tr.selected').removeClass('selected');
			            $(this).addClass('selected');
			        }
			    } );
		
		 
		    
		    //diolog�{�������H�U(��s)
			//�]�w���e�׵�����ƶ}�l
			Sign_listUpdateForm = $( "#dialog-updateForm" ).dialog({
		      autoOpen: false,
		      height: 650,
		      width: 400,
		      modal: true,
		      buttons: {
			        "send": updateSlFormToCreateTable,
			        Cancel: function() {
			        	Sign_listUpdateForm.dialog( "close" );
			        }
			      },
		      close: function() {
		        form[ 0 ].reset();
		        uallFields.removeClass( "ui-state-error" );
		      }
		    });
		    
		  	//�]�w���e�׵�����Ƶ���
		  	form = Sign_listUpdateForm.find( "form" ).on( "submit", function( event ) {
		      event.preventDefault();
		      updateSlFormToCreateTable();
		    });

		  //�j�wclick�ƥ�ϥΪ̽s��icon�A�}��dialog ���Sign_listUpdateForm
		 	$('#buttonUpdate').click( function () {
		    	if(deleteOrUpdateValue==null){
		    		console.log(deleteOrUpdateValue);
		    		alert("�Х�����n�s�誺���");
		    	}else{
		    		uemp_id.val(emp_idUpdateValue.text());
	    			uemp_name.val(emp_nameUpdateValue.text());
	    			uemp_mail.val(emp_mailUpdateValue.text());
	    			udep_name.val(dep_nameUpdateValue.text());
	    			usl_id.val(sl_idUpdateValue.text());
	    			Sign_listUpdateForm.dialog( "open" );
		    	}
		    } );
		    //�I��ק���A�Ұ��檺��k
		    function updateSlFormToCreateTable() {
			      var valid = true;
			      uallFields.removeClass( "ui-state-error" );
				  valid = valid && checkLength( uemp_name, "�W�r", 1, 30 );
			      valid = valid && checkLength( uemp_mail, "Email", 1, 30 );
			      valid = valid && checkLength( udep_name, "�����W��", 1, 30 );
			      valid = valid && checkLength( usl_id, "�v��", 1, 2 );
// 			      valid = valid && checkRegexp( uedu_tel, /^([0-9])+$/, "�q�����u���\��J�Ʀr : 0-9" );
			 		if ( valid ) {
			 			var Updatedatas = $('form[name="Sign_listUpdateForm"]').serialize();
			 			$.get('Sign_listServletJSON.do',Updatedatas,function(data){
			 				if(data=="��Ƨ�s����"){
			 					 $('.validateTips').css('color','red').text("��s���~");
			 				}
			 				else if(data=="��Ƨ�s���\"){
			 					
			 					
			 					emp_idUpdateValue.text(uemp_id.val());
			 					emp_nameUpdateValue.text(uemp_name.val());
			 					emp_mailUpdateValue.text(uemp_mail.val());
			 					dep_nameUpdateValue.text(udep_name.val());
			 					sl_idUpdateValue.text(usl_id.val());
// 			 					
						 		$('.validateTips').text("");////�N��sform������Ұ϶����e�M��
						 		Sign_listUpdateForm.dialog( "close" );
			 				}
			 			});
			 		}
			      return valid;
			    }
		  	
		    
			//diolog�{�������H�U(�R��)
			//�]�w�R���T�{���e�׵�����ƶ}�l
		    Sign_listDeleteConfirm =$( "#dialog-deleteForm" ).dialog({
		        autoOpen: false,
		        height: 200,
		        width: 240,
		        modal: true,
		        buttons: {
		          "�T�{": deleteSlFormToCreateTable ,
		          "���": function() {
		            $( this ).dialog( "close" );
		            $('#dialog-deleteForm p').text('�O�_�n�R���������?');
		          }
		        }
		    });
			
		    
		    
			$('#buttonDelete').click( function () {
		    	
		    	if(deleteOrUpdateValue==null){
		    		
							    	
		    		alert("�Х�����n�R�������");
		    	}else{
		    		Sign_listDeleteConfirm.dialog( "open" );
		    	}
		    } );
		    
		} );//load��Ƶ���
		
		//�I��R����A�Ұ��檺��k
		function deleteSlFormToCreateTable() {
			$.get('Sign_listServletJSON.do',{"emp_id":deleteOrUpdateValue,
											 "emp_name":emp_nameUpdateValue.text(),
											 "emp_mail":emp_mailUpdateValue.text(),
											 "dep_name":dep_nameUpdateValue.text(),
											 "sl_id":sl_idUpdateValue.text(),
											 "action":"updatedelSl"},function(data){
			    console.log(emp_nameUpdateValue)
				if(data=="��ƧR�����\"){
					console.log("111111");
					table.row('.selected').remove().draw( false );//�R���e���Wclass��selected������
					Sign_listDeleteConfirm.dialog( "close" );
				}else if (data=="��ƧR������"){
					$('#dialog-deleteForm p').text('��ƧR�����ѡA��ƨϥΤ�');
				}
			});
		}	

	</script>

	
		<!-- ���u�s������r -->
	<script>
	
	var show;
	window.addEventListener("load", init, false);
	var txt = document.getElementById("emp_id");
	function init() {
		txt.addEventListener("keyup", getData, false);
		show = document.getElementById("div1");
	}
	function getData() {
		if(txt.value==''){
			if (show.childNodes.length > 0) {
				show.removeChild(show.childNodes[0]);
				}
			return;
		}
		var xhrEmpId = new XMLHttpRequest();
		
		if (xhrEmpId != null) {
			xhrEmpId.addEventListener("readystatechange", function(){
				if (xhrEmpId.readyState == 4) {
	                if (xhrEmpId.status == 200) {
	                    var name = xhrEmpId.responseText;
	                    var datas = JSON.parse(name);  
						show.style.display = "block";
						if (show.childNodes.length > 0) {
							show.removeChild(show.childNodes[0]);
							}
						var eleDiv = document.createElement("div");
						eleDiv.className = "list-group";
						for (var j = 0, max = datas.length; j < max; j++) {
						var txtBtn = document.createTextNode(datas[j]);
						var eleBtn = document.createElement("button");
						eleBtn.className = "list-group-item";
						eleBtn.setAttribute("type", "button");
						eleBtn.appendChild(txtBtn);

						eleBtn.addEventListener("click", function() {
						document.Sign_listInsertForm.emp_id.value = this.firstChild.nodeValue;
						
						var id = txt.value;
						console.log(id);
						
						$.getJSON('EmployeeList',{'emp_id':id},function(datas){
							$.each(datas,function(i,emp){
								
								document.Sign_listInsertForm.emp_name.value = emp.emp_name;
								document.Sign_listInsertForm.emp_mail.value = emp.emp_mail;
								document.Sign_listInsertForm.dep_name.value = emp.dep_name;
								
							})
						})
						
						
						
						show.style.display = "none";
						}, false)
						eleDiv.appendChild(eleBtn);
					}
					show.appendChild(eleDiv);	
				}
	            else {
	                alert(xhrEmpId.status + ":" + xhrEmpId.statusText);
	            }
	          }
	        });
			
			xhrEmpId.open("get", "Sign_listAuto?keyword="+txt.value); 
			xhrEmpId.send();
			
			}
	    }
	
	</script>
	
		<!-- �v���W�٤U�Կ�� -->
	<script>
	$(function() {
		$.ajax({
			'type':'get',
			'url':'Sign_listXML',
			'dataType':'xml',
			'success':function(data){
				
			console.log(data);
				$(data).find('Sign_list').each(function(){
					var sl_id = $(this).children('sl_id').text();
					var sl_name = $(this).children('sl_name').text();
					console.log(sl_id);
					console.log(sl_name);
					var opt = $('<option></option>').val(sl_id).text(sl_name);
					$('#sl_id ,#usl_id').append(opt);
					
				});
			}
		})
	})
	</script>
</body>
</html>
