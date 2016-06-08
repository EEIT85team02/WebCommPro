<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-tw">
<head>
<title>Mail_template_Page</title>
<link href="${pageContext.request.contextPath}/css/jquery-ui.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/css/jquery-ui.structure.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/css/jquery-ui.theme.min.css"
	rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<style>
.ui-widget-overlay.custom-overlay
{
    background-color: black;
    background-image: none;
    opacity: 0.6;
    z-index: 1040;    
}
.Main_Content {
	margin-top: 100px;
}
.buttonUpdate{
	color: red;
}
.buttonDelete{
	color: blue;
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

div#users-contain {
	width: 350px;
	margin: 20px 0;
}

div#users-contain table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
}

div#users-contain table td, div#users-contain table th {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: left;
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
						<table class="table table-hover" id="Mail_templateTable">
							<thead>
								<tr>
									
									<th class="col-md-3 col-xs-3">�W��</th>
									<th class="col-md-3 col-xs-3">���e</th>
									<th class="col-md-1 col-xs-1">�ק�</th>
									<th class="col-md-1 col-xs-1">�R��</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>aaaaa</td>
									<td>aaaaa</td>
									<td>aaaaa</td>
									<td>aaaaa</td>
								</tr>
							</tbody>
						</table>

						<!------------------�I��s�W�Ш|���ߪ��϶����e----------------------------- -->
							<button id="buttonAdd">�s�W���</button>
							<button id="buttonUpdate1">��ƭק�</button>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- �]�w�s�WFORM���϶�dialog -->
	<div id="dialog-form1" title="Create Email�˪O�]�w">
		<p class="validateTips">����������</p>
		<form>
			<fieldset>
				<label for="mail_name">�˪O�W��</label> 
				<input type="text" name="mail_name" id="mail_name" value="�w�����\" class="text ui-widget-content ui-corner-all"> 
				<label for="mail_text">�˪����e</label> 
				<textarea name="mail_text" id="mail_text" value="�w�����W�w���\" class="form-control" rows="12"></textarea>
<!-- 				<input type="text" name="mail_text" id="mail_text" value="�w�����W�w���\" class="text ui-widget-content ui-corner-all" -->
<!-- 					style="height:250px">  -->
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	
	<!-- �]�w�ק�FORM���϶�dialog -->
	<div id="dialog-form2" title="Update Email�˪O�]�w">
		<p class="validateTips">����������</p>
		<form>
			<fieldset>
				<label for="mail_id">�˪O�N��</label> 
				<input type="text" name="mail_id" id="mail_id"  readOnly class="text ui-widget-content ui-corner-all">
				<label for="mail_name">�˪O�W��</label> 
				<input type="text" name="mail_name" id="mail_name" value="�w�����\" class="text ui-widget-content ui-corner-all"> 
				<label for="mail_text">�˪����e</label> 
				<textarea name="mail_text" id="mail_text" value="�w�����W�w���\" class="form-control" rows="12"></textarea>
<!-- 				<input type="text" name="mail_text" id="mail_text" value="�w�����W�w���\" class="text ui-widget-content ui-corner-all" -->
<!-- 					style="height:250px">  -->
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1"
					style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>


	<script>
		$(function() {
			//���J�����ɡA���Q��getJSON��k�I�sEduJSON.do�A���^��Ʈw��ƨëإ�table���e
			$('#Mail_templateTable>tbody>tr').remove();
			$.getJSON('MailServletJSON.do', {"action":"getALLMail"}, function(datas) {
				//datas �N�O�@��JSON����
				$.each(datas, function(i, Mails) {
					//var edu_id = Edus.edu_id;
					
					//��줺�e
					$( "#Mail_templateTable>tbody" ).append( 
						"<tr>" +
				          "<td>" + Mails.mail_name + "</td>" +
				          "<td>" + Mails.mail_text + "</td>" +
				          "<td>" + "<button class='buttonUpdate'> "+"�ק�"+"</button>"+ "</td>" +
				          "<td>" + "<button class='buttonDelete'> "+"�R��"+"</button>" + "</td>" +
				        "</tr>" );
					console.log(Mails.mail_id);
					
				});
			})//���^��Ʈw��ƨëإ�table���e����
			
			
			
			//diolog�{�������H�U(�s�W)
			 var  form,MailInsertForm,MailUpdateForm,
			  mail_id = $( "#mail_id" ),
		      mail_name = $( "#mail_name" ),
		      mail_text = $( "#mail_text" ),
		      allFields = $( [] ).add( mail_id ).add( mail_name ).add( mail_text ),
		      tips = $( ".validateTips" );
		 //�b������ܰ϶��s�Wclass t->�ǤJ���@�q��r
		    function updateTips( t ) {
		      tips
		        .text( t )
		        .addClass( "ui-state-highlight" );
		      setTimeout(function() {
		        tips.removeClass( "ui-state-highlight", 1500 );
		      }, 500 );
		    }
		 //���Ҹ�ƪ��׬O�_�ŦX�W�ho->$('#���ID')����ơBn->���W�١Bmin->�̵u���סBmax->�̪�����
		    function checkLength( o, n, min, max ) {
		      if ( o.val().length > max || o.val().length < min ) {
		        o.addClass( "ui-state-error" );
		        updateTips( "���: " + n + "���ץ����� " +
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
		//���Ҫ���ƬO�_���~�}�l
		    function addData() {
		      var valid = true;
		      allFields.removeClass( "ui-state-error" );
			  valid = valid && checkLength( mail_name, "mail_name", 1, 10 );
		      valid = valid && checkLength( mail_text, "mail_text", 1, 250 );
		 		if ( valid ) {
		        $( "#Mail_templateTable tbody" ).append( "<tr>" +
		          "<td>" + mail_name.val() + "</td>" +
		          "<td>" + mail_text.val() + "</td>" +
		          "<td>" + "<button class='buttonUpdate'>"+"�ק�"+"</button>"+ "</td>" +
		          "<td>" + "<button class='buttonDelete'>"+"�R��"+"</button>" + "</td>" +
		        "</tr>" );
		        MailInsertForm.dialog( "close" );
		        MailUpdateForm.dialog( "close" );
		      }
		      return valid;
		    }
		  //���Ҫ���ƬO�_���~����
		 
		  //�]�w���e�׵�����ƶ}�l
		    MailInsertForm = $( "#dialog-form1" ).dialog({
		      autoOpen: false,
		      height: 600,
		      width: 400,
		      modal: true,
		      open: function() {
		          $('.ui-widget-overlay').addClass('custom-overlay');
		      },
		      close: function() {
		          $('.ui-widget-overlay').removeClass('custom-overlay');
		      },
		      buttons: {
		        "send": addData,
		        Cancel: function() {
		        	MailInsertForm.dialog( "close" );
		        }
		      },
		      close: function() {
		        form[ 0 ].reset();
		        allFields.removeClass( "ui-state-error" );
		      }
		    });
		  	//�]�w���e�׵�����Ƶ���
		  	form = MailInsertForm.find( "form" ).on( "submit", function( event ) {
		      event.preventDefault();
		      addData();
		    });
		 	//�j�wclick�ƥ�ϥΪ̷s�Wicon�A�}��dialog ���MailInsertForm
		    $( "#buttonAdd" ).button().on( "click", function() {
		    	MailInsertForm.dialog( "open" );
		    });//diolog�{����������
		    
		    
		    
			//diolog�{�������H�U(��s)
		 //�b������ܰ϶��s�Wclass t->�ǤJ���@�q��r
		    function updateTips( t ) {
		      tips
		        .text( t )
		        .addClass( "ui-state-highlight" );
		      setTimeout(function() {
		        tips.removeClass( "ui-state-highlight", 1500 );
		      }, 500 );
		    }
		
		
		
		 
		  //�]�w���e�׵�����ƶ}�l
		    MailUpdateForm = $( "#dialog-form2" ).dialog({
		      autoOpen: false,
		      height: 650,
		      width: 400,
		      modal: true,
		      open: function() {
		          $('.ui-widget-overlay').addClass('custom-overlay');
		      },
		      close: function() {
		          $('.ui-widget-overlay').removeClass('custom-overlay');
		      },
		      buttons: {
			        "send": addData,
			        Cancel: function() {
			        	MailUpdateForm.dialog( "close" );
			        }
			      },
		      close: function() {
		        form[ 0 ].reset();
		        allFields.removeClass( "ui-state-error" );
		      }
		    });
		  	//�]�w���e�׵�����Ƶ���
		  	form1 = MailUpdateForm.find( "form" ).on( "submit", function( event ) {
		      event.preventDefault();
		      addData();
		    });
		 	//�j�wclick�ƥ�ϥΪ̭ק�icon�A�}��dialog ���MailUpdateForm
		    $( "tbody" ).button().on( "click",".buttonUpdate", function() {
		    	MailUpdateForm.dialog( "open" );
		    });
			
			

		});//load��Ƶ���
	</script>
</body>
</html>
