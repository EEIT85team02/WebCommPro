<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!--  		<meta name="description" content="">
        <meta name="viewport" content="width=device-width"> -->
        <!-- 引入jQuery  and bootstrap css/js 檔案 -->
		<link href="css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
		<link href="css/maincontentdiv.css" rel="stylesheet" type="text/css" >
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery-ui.min.js"></script>
		<script src="js/bootstrap/bootstrap.min.js"></script> 

    <!--jquery-steps-master -->
      <link rel="stylesheet" type="text/css" href="css/jquery-steps-master/style.css" />
        <link rel="stylesheet" href="css/jquery-steps-master/normalize.css">
        <link rel="stylesheet" href="css/jquery-steps-master/main.css">
        <link rel="stylesheet" href="css/jquery-steps-master/jquery.steps.css">
        <script src="js/jquery-steps-master/lib/modernizr-2.6.2.min.js"></script>
        <script src="js/jquery-steps-master/lib/jquery-1.9.1.min.js"></script>
        <script src="js/jquery-steps-master/lib/jquery.cookie-1.3.1.js"></script>
        <script src="js/jquery-steps-master/build/jquery.steps.js"></script>  
   
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Roboto);

* {
    font-family: 'Roboto', sans-serif;
}

#login-modal .modal-dialog {
    width: 350px;
}

#login-modal input[type=text], input[type=password] {
	margin-top: 10px;
}

#div-login-msg,
#div-lost-msg,
#div-register-msg {
    border: 1px solid #dadfe1;
    height: 30px;
    line-height: 28px;
    transition: all ease-in-out 500ms;
}

#div-login-msg.success,
#div-lost-msg.success,
#div-register-msg.success {
    border: 1px solid #68c3a3;
    background-color: #c8f7c5;
}

#div-login-msg.error,
#div-lost-msg.error,
#div-register-msg.error {
    border: 1px solid #eb575b;
    background-color: #ffcad1;
}

#icon-login-msg,
#icon-lost-msg,
#icon-register-msg {
    width: 30px;
    float: left;
    line-height: 28px;
    text-align: center;
    background-color: #dadfe1;
    margin-right: 5px;
    transition: all ease-in-out 500ms;
}

#icon-login-msg.success,
#icon-lost-msg.success,
#icon-register-msg.success {
    background-color: #68c3a3 !important;
}

#icon-login-msg.error,
#icon-lost-msg.error,
#icon-register-msg.error {
    background-color: #eb575b !important;
}

#img_logo {
    max-height: 100px;
    max-width: 100px;
}

/* #########################################
   #    override the bootstrap configs     #
   ######################################### */

.modal-backdrop.in {
    filter: alpha(opacity=50);
    opacity: .8;
}

.modal-content {
    background-color: #ececec;
    border: 1px solid #bdc3c7;
    border-radius: 0px;
    outline: 0;
}

.modal-header {
    min-height: 16.43px;
    padding: 15px 15px 15px 15px;
    border-bottom: 0px;
}

.modal-body {
    position: relative;
    padding: 5px 15px 5px 15px;
}

.modal-footer {
    padding: 15px 15px 15px 15px;
    text-align: left;
    border-top: 0px;
}

.checkbox {
    margin-bottom: 0px;
}

.btn {
    border-radius: 0px;
}

.btn:focus,
.btn:active:focus,
.btn.active:focus,
.btn.focus,
.btn:active.focus,
.btn.active.focus {
    outline: none;
}

.btn-lg, .btn-group-lg>.btn {
    border-radius: 0px;
}

.btn-link {
    padding: 5px 10px 0px 0px;
    color: #95a5a6;
}

.btn-link:hover, .btn-link:focus {
    color: #2c3e50;
    text-decoration: none;
}

.glyphicon {
    top: 0px;
}

.form-control {
  border-radius: 0px;
}

</style>


<script type="text/javascript">


$(function() {
 
 var $formLogin = $('#login-form');
 var $formLost = $('#lost-form');
 var $formRegister = $('#register-form');
 var $divForms = $('#div-forms');
 var $modalAnimateTime = 300;
 var $msgAnimateTime = 150;
 var $msgShowTime = 2000;

 $("form").submit(function () {
     switch(this.id) {
         case "login-form":
             var $lg_username=$('#login_username').val();
             var $lg_password=$('#login_password').val();
             if ($lg_username == "ERROR") {
                 msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "error", "glyphicon-remove", "Login error");
             } else {
                 msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "success", "glyphicon-ok", "Login OK");
             }
             return false;
             break;
         case "lost-form":
             var $ls_email=$('#lost_email').val();
             if ($ls_email == "ERROR") {
                 msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "error", "glyphicon-remove", "Send error");
             } else {
                 msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "success", "glyphicon-ok", "Send OK");
             }
             return false;
             break;
         case "register-form":
             var $rg_username=$('#register_username').val();
             var $rg_email=$('#register_email').val();
             var $rg_password=$('#register_password').val();
             if ($rg_username == "ERROR") {
                 msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "error", "glyphicon-remove", "Register error");
             } else {
                 msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "success", "glyphicon-ok", "Register OK");
             }
             return false;
             break;
         default:
             return false;
     }
     return false;
 });
 
 $('#login_register_btn').click( function () { modalAnimate($formLogin, $formRegister) });
 $('#register_login_btn').click( function () { modalAnimate($formRegister, $formLogin); });
 $('#login_lost_btn').click( function () { modalAnimate($formLogin, $formLost); });
 $('#lost_login_btn').click( function () { modalAnimate($formLost, $formLogin); });
 $('#lost_register_btn').click( function () { modalAnimate($formLost, $formRegister); });
 $('#register_lost_btn').click( function () { modalAnimate($formRegister, $formLost); });
 
 function modalAnimate ($oldForm, $newForm) {
     var $oldH = $oldForm.height();
     var $newH = $newForm.height();
     $divForms.css("height",$oldH);
     $oldForm.fadeToggle($modalAnimateTime, function(){
         $divForms.animate({height: $newH}, $modalAnimateTime, function(){
             $newForm.fadeToggle($modalAnimateTime);
         });
     });
 }
 
 function msgFade ($msgId, $msgText) {
     $msgId.fadeOut($msgAnimateTime, function() {
         $(this).text($msgText).fadeIn($msgAnimateTime);
     });
 }
 
 function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass, $msgText) {
     var $msgOld = $divTag.text();
     msgFade($textTag, $msgText);
     $divTag.addClass($divClass);
     $iconTag.removeClass("glyphicon-chevron-right");
     $iconTag.addClass($iconClass + " " + $divClass);
     setTimeout(function() {
         msgFade($textTag, $msgOld);
         $divTag.removeClass($divClass);
         $iconTag.addClass("glyphicon-chevron-right");
         $iconTag.removeClass($iconClass + " " + $divClass);
		}, $msgShowTime);
 }
});
</script>


    <style>
        .user-row {
		    margin-bottom: 14px;
		}
		
		.user-row:last-child {
		    margin-bottom: 0;
		}
		
		.dropdown-user {
		    margin: 13px 0;
		    padding: 5px;
		    height: 100%;
		}
		
		.dropdown-user:hover {
		    cursor: pointer;
		}
		
		.table-user-information > tbody > tr {
		    border-top: 1px solid rgb(221, 221, 221);
		}
		
		.table-user-information > tbody > tr:first-child {
		    border-top: 0;
		}
		
		
		.table-user-information > tbody > tr > td {
		    border-top: 0;
		}
		.toppad
		{margin-top:20px;
		}
        
        </style>
        <script>
               
        $(document).ready(function() {
        	
        	
        	
        $(function ()
                {
                    $("#wizard").steps({
                        headerTag: "h2",
                        bodyTag: "section",
                        transitionEffect: "slideLeft",
                        enableFinishButton: false,
                        enablePagination: false,
                        enableAllSteps: true,
                        titleTemplate: "#title#",
                        cssClass: "wizard" ,
                        titleTemplate: '<span class="number">#index#.</span> #title#',
                        showFinishButtonAlways: false,
                        forceMoveForward: false
                    });
    				
					
                });
                
           /*      $.post(strUrl, {jsonData: JSON.stringify(formData)},
                		  function(response){
                		    if(response.status=='NOT OK') {
                		      alert("not ok");
                		    } else {
                		      alert('OK');
                		    }
                		  }, 'json');
                 */
                
                var id =<%=session.getAttribute("stu_id")%>;
            	 var add = null;
             /*  	$.getJSON('StudentProfileServlet?action=stu&',{'stu_id':id},function(data){
					$.each(data,function(key,val){
						
						 $("#stu_id").text(val.stu_id);
					
					
					})
				}); */
				
				
		if(id != null){
				$.getJSON('StudentProfileServlet?action=stu',{'stu_id':id},function(data){
					$.each(data,function(key,val){
						 $("#stu_id").text(val.stu_id);
						 console.log(val.stu_id);
						 $('#stu_name').text(val.stu_name);
						 $('#class_id').text(val.class_id);
						 $('#stu_name2').text(val.stu_name);
						 $("#stu_age").text(val.stu_age);
						 if ( val.stu_sex !='0'){
						 	$("#stu_sex").text("Male");
						 }else{
							 $("#stu_sex").text("Female");
						 }
						 $("#stu_sch").text(val.stu_sch);
						 $("#stu_email").text(val.stu_email);
						 $("#stu_workdate").text(val.stu_workdate);
						 
					})
	 
				});
		}else if(id != null && add != null){
				$.getJSON('StudentProfileServlet?action=stu_add&',{'stu_id':id},function(data){
					$.each(data,function(key,val){
						
						 $("#test_start").text(val.test_start);
						 $("#test_end").text(val.test_end);
						 $("#stu_applytime").text(val.stu_applytime);
						 $("#member_statusVO").text(val.member_statusVO);
						 
					})
	 
				});
		}	
				/* $("#editFrom").click(function(){
					console.log("------editFrom------")
					$.fancybox({//调用fancybox弹出层 
		                'type':'ajax', 
		                'href':'EditUserProfile.jsp?action=add&stu_id='+stu_id   
		        });
				}); */
				
				var JSONObject = <%=request.getSession().getAttribute("stu_AllListJSON")%>;
				console.log("JSONObject:"+JSON.stringify(JSONObject));
				var JSONObject2 = <%=request.getSession().getAttribute("stuListJSON")%>;
				console.log("JSONObject2:"+JSON.stringify(JSONObject2));
				
				
				
				$(document).on('click', '#editFrom', function () {
				
					console.log("------editFrom------")
					$.fancybox({//调用fancybox弹出层 
		                'type':'ajax', 
		                'href':'EditUserProfile.jsp?action=add&stu_id='+stu_id 
													                +'&stu_name='+stu_name
													                +'&class_id='+class_id
													                +'&stu_email='+stu_email
											//		                +'&stu_group='+stu_group
											//		                +'&stu_seatno='+stu_seatno
													                +'&stu_age='+stu_age
													                +'&stu_sch='+stu_sch
													                +'&stu_sex='+stu_sex
											//		                +'&test_start='+test_start
											//		                +'&test_end='+test_end
													                +'&stu_applytime='+stu_applytime
													                +'&member_statusVO='+member_statusVO
											//		                +'&emp_id='+emp_id
											//		                +'&confirm_time='+confirm_time
											//		                +'&stu_pre='+stu_pre
											//		                +'&stu_implement='+stu_implement
											//			                +'&stu_testtime='+stu_testtime
											//		                +'&stu_interview='+stu_interview
											//		                +'&stu_total='+stu_total
													                +'&stu_workdate='+stu_workdate
											//		                +'&stu_except='+stu_except
											//		                +'&stu_final='+stu_final
											//		                +'&stu_note1='+stu_note1
											//		                +'&stu_note2='+stu_note2
											//		                +'&pub_key='+pub_key
											//		                +'&pri_key='+pri_key
											//		                +'&cipher_text='+cipher_text
											//		                +'&log_pw='+log_pw
		        });
				});
				
				
        });
        </script>
    
    
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

     

        <div class="content" >
            <div id="wizard" class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xs-offset-0 col-sm-offset-0 col-md-offset-2 col-lg-offset-2 toppad">        
               <h2>基本資料</h2>                
	            <section>			

			        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-0 toppad" >
			          <div class="panel panel-info">
			            <div class="panel-heading">
			            <h3 class="panel-title" id="stu_name"></h3>
			            </div>
			            <div class="panel-body">
			              <div class="row">
			                <div class=" col-md-12 col-lg-12 "> 
			                  <table class="table table-user-information">
			                    <tbody >
			                      <tr>
			                        <td>ID:</td>
			                        <td id="stu_id"></td>
			                      </tr>
			                      <tr>
			                        <td>Class:</td>
			                        <td id="class_id"></td>
			                      </tr>
			                      <tr>
			                        <td>Date of Birth</td>
			                        <td id="stu_age"><td></td>
			                       
			                      </tr>
			                      <tr>
			                       <tr>
			                        <td>Gender</td>
			                        <td id="stu_sex"></td>
			                      </tr>
			                        <tr>
			                        <td>Graduated school</td>
			                        <td id="stu_sch"></td>
			                      </tr>
			                      <tr>
			                        <td>Email</td>
			                        <td id="stu_email"><a href="mailto:info@support.com"></a></td>
			                      </tr>
			                       <tr>
			                        <td>Date of Available</td>
			                        <td id="stu_workdate"></td>  
			                      </tr>
			                     
			                    </tbody>
			                  </table>
			                </div>
			              </div>
			            </div>
                    <div class="panel-footer">
                        <!-- <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a> -->
                    	<!-- <a href="EditUserProfile.jsp" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a> -->
                    </div>
		          </div>
		        </div>
		      
	                </section>

               <h2>預約資料</h2>
	            <section>
	          
			        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-0 toppad" >
			          <div class="panel panel-info">
			            <div class="panel-heading">
			            <h3 class="panel-title" id="stu_name2"></h3>
			            </div>
			            <div class="panel-body">
			              <div class="row">
			                <div class=" col-md-12 col-lg-12 "> 
			                  <table class="table table-user-information">
			                    <tbody>
			                      <tr>
			                        <td>Exam Date</td>
			                        <td id="test_start"></td>
			                      </tr>
			                      <tr>
			                        <td>Exam period</td>
			                        <td id="test_end"></td>
			                      </tr>
			                      <tr>
			                        <td>Registration</td>
			                        <td id="stu_applytime"></td>
			                      </tr>
			                      <tr>
			                      <tr>
			                        <td>Status</td>
			                        <td id="member_statusVO"></td>
			                      </tr>
			                    </tbody>
			                  </table>    
			                </div>
			              </div>
			              <div class="panel-footer">
                        <!-- <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a> -->
                    	<%-- <a href="<c:url value='/PWDChange.jsp' />" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"  ><i class="glyphicon glyphicon-edit">PASSWORDCHANGE</i></a> --%>
			            <!-- <a id="editFrom" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"  ><i class="glyphicon glyphicon-edit">PASSWORDCHANGE</i></a> -->
						<a href="#"  role="button" data-toggle="modal" data-target="#login-modal" data-original-title="Edit this user"  type="button" class="btn btn-sm btn-warning"  ><i class="glyphicon glyphicon-edit">PASSWORDCHANGE</i></a>
					   <!--  <a href="#" class="btn btn-primary btn-lg" role="button" data-toggle="modal" data-target="#login-modal">Open Login Modal</a> -->
					
			            </div>
			            <!-- BEGIN # MODAL LOGIN -->
					<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
			    	<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header" align="center">
								<img class="img-circle" id="img_logo" src="http://bootsnipp.com/img/logo.jpg">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</button>
							</div>
                
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                
                    <!-- Begin | Lost Password Form -->
                    <form id="lost-form" style="display:block;" action="CheckAccountAndPasswordServlet?action=change" method="post">
    	    		    <div class="modal-body">
		    				<div id="div-lost-msg">
                                <div id="icon-lost-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-lost-msg">Type your e-mail.</span>
                            </div>
		    				<input name="stu_email" id="lost_email" class="form-control" type="text" placeholder="E-Mail (type ERROR for error effect)" required>
            			</div>
		    		    <div class="modal-footer">
                            <div>
                                <button type="submit" class="btn btn-primary btn-lg btn-block"> 
                                
                                Send</button>
                            </div>
                            
		    		    </div>
                    </form>
                    <!-- End | Lost Password Form -->
                    
                </div>
                <!-- End # DIV Form -->
                
			</div>
		</div>
	</div>
    <!-- END # MODAL LOGIN -->
			            </div>
		          </div>
		        </div>
		     
	                </section>

        	<!--   <h2>Third Step</h2>
	                <section>
	                  <p>-----------------1-----------------</p>
	                </section>

               <h2>Forth Step</h2>
	                <section>
		             <p>-----------------1-----------------</p>
	                </section>  -->
            </div>
        </div>
  
