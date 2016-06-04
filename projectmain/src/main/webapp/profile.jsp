<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        /*       
				$.getJSON('StudentProfileServlet?action=stu&',{'stu_id':id},function(data){
					$.each(data,function(key,val){
						
						 $("#stu_id").text(val.stu_id);
					
					
					})
				}); */
				$.getJSON('StudentProfileServlet?action=stu_add&',{'stu_id':id},function(data){
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
						 $("#test_startdate").text(val.test_startdate);
						 $("#test_hour_id").text(val.test_hour_id);
						 $("#stu_applytime").text(val.stu_applytime);
						 $("#member_statusVO").text(val.member_statusVO);
					})
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
			                        <td id="stu_age"></td>
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
                    	<a href="EditUserProfile.jsp" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
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
			                        <td id="test_startdate"></td>
			                      </tr>
			                      <tr>
			                        <td>Exam period</td>
			                        <td id="test_hour_id"></td>
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
                    	<a href="EditUserProfile.jsp" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
			            </div>
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
  