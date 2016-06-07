<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student_MaintainForm</title>
<!-- bootstrap -->
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-2.0.3.min.js"></script> 
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>  

    <!-- x-editable (bootstrap version) -->
    <link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.4.6/bootstrap-editable/css/bootstrap-editable.css" rel="stylesheet"/>
    <script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.4.6/bootstrap-editable/js/bootstrap-editable.min.js"></script>
	<script src='${pageContext.request.contextPath}/js/fullCalendar/moment.min.js'></script>
  
  <!-- typeaheadjs -->
    <link href="${pageContext.request.contextPath}/js/bootstrap/x-editable/inputs-ext/typeaheadjs/lib/typeahead.js-bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap/x-editable/inputs-ext/typeaheadjs/lib/typeahead.js"></script>         
    <script src="${pageContext.request.contextPath}/js/bootstrap/x-editable/inputs-ext/typeaheadjs/typeaheadjs.js"></script>  
    
    <!-- address input -->
        <link href="${pageContext.request.contextPath}/js/bootstrap/x-editable/inputs-ext/address/address.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/bootstrap/x-editable/inputs-ext/address/address.js"></script>                     
    <style type="text/css">
            body {
                padding-top: 50px;
                padding-bottom: 30px;
            }
            
            table.table > tbody > tr > td {
                height: 30px;
                vertical-align: middle;
            }
        </style>         
        
          <script>
        var f = 'bootstrap3';
        </script>
          <script>
            var c = window.location.href.match(/c=inline/i) ? 'inline' : 'popup';
            $.fn.editable.defaults.mode = c === 'inline' ? 'inline' : 'popup';

            $(function(){
                $('#f').val(f);
                $('#c').val(c);
                
                $('#frm').submit(function(){
                    var f = $('#f').val();
                    if(f === 'jqueryui') {
                        $(this).attr('action', 'demo-jqueryui.html');
                    } else if(f === 'plain') {
                        $(this).attr('action', 'demo-plain.html');
                    } else if(f === 'bootstrap2') {
                        $(this).attr('action', 'demo.html');
                    } else {
                        $(this).attr('action', 'demo-bs3.html');                        
                    }
                });
            });
        </script>        

	
<script type="text/javascript" >
	
	$(document).ready(function(){ 
		
		$(function(){
			  
			   //defaults
			   $.fn.editable.defaults.url = 'StudentProfileServlet?updateStum'; 

			    //enable / disable
			   $('#enable').click(function() {
			       $('#user .editable').editable('toggleDisabled');
			   });    
			    
			    //editables 
			    $('#username').editable({
			           url: 'StudentProfileServlet?action=updateStum',
			           type: 'json',
			           pk: 1,
			           name: 'stu_name',
			           title: 'Enter username'
			           
			    });
			    
			    $('#firstname').editable({
			        validate: function(value) {
			           if($.trim(value) == '') return 'This field is required';
			        }
			    });
			    
			    $('#sex').editable({
			        prepend: "not selected",
			        source: [
			            {value: 1, text: 'Male'},
			            {value: 2, text: 'Female'}
			        ],
			        display: function(value, sourceData) {
			             var colors = {"": "gray", 1: "green", 2: "blue"},
			                 elem = $.grep(sourceData, function(o){return o.value == value;});
			                 
			             if(elem.length) {    
			                 $(this).text(elem[0].text).css("color", colors[value]); 
			             } else {
			                 $(this).empty(); 
			             }
			        }   
			    });    
			    
			    $('#status').editable();   
			    
			    $('#group').editable({
			       showbuttons: false 
			    });   

			    $('#vacation').editable({
			        datepicker: {
			            todayBtn: 'linked'
			        } 
			    });  
			        
			    $('#dob').editable();
			          
			    $('#event').editable({
			        placement: 'right',
			        combodate: {
			            firstItem: 'name'
			        }
			    });      
			    
			    $('#meeting_start').editable({
			        format: 'yyyy-mm-dd hh:ii',    
			        viewformat: 'dd/mm/yyyy hh:ii',
			        validate: function(v) {
			           if(v && v.getDate() == 10) return 'Day cant be 10!';
			        },
			        datetimepicker: {
			           todayBtn: 'linked',
			           weekStart: 1
			        }        
			    });            
			    
			    $('#comments').editable({
			        showbuttons: 'bottom'
			    }); 
			    
			    $('#note').editable(); 
			    $('#pencil').click(function(e) {
			        e.stopPropagation();
			        e.preventDefault();
			        $('#note').editable('toggle');
			   });   
			   
			    $('#state').editable({
			        source: ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
			    }); 
			    
			    $('#state2').editable({
			        value: 'California',
			        typeahead: {
			            name: 'state',
			            local: ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
			        }
			    });   
			   
			   $('#fruits').editable({
			       pk: 1,
			       limit: 3,
			       source: [
			        {value: 1, text: 'banana'},
			        {value: 2, text: 'peach'},
			        {value: 3, text: 'apple'},
			        {value: 4, text: 'watermelon'},
			        {value: 5, text: 'orange'}
			       ]
			    }); 
			    
			    $('#tags').editable({
			        inputclass: 'input-large',
			        select2: {
			            tags: ['html', 'javascript', 'css', 'ajax'],
			            tokenSeparators: [",", " "]
			        }
			    });   

			    var countries = [];
			    $.each({"BD": "Bangladesh", "BE": "Belgium", "BF": "Burkina Faso", "BG": "Bulgaria", "BA": "Bosnia and Herzegovina", "BB": "Barbados", "WF": "Wallis and Futuna", "BL": "Saint Bartelemey", "BM": "Bermuda", "BN": "Brunei Darussalam", "BO": "Bolivia", "BH": "Bahrain", "BI": "Burundi", "BJ": "Benin", "BT": "Bhutan", "JM": "Jamaica", "BV": "Bouvet Island", "BW": "Botswana", "WS": "Samoa", "BR": "Brazil", "BS": "Bahamas", "JE": "Jersey", "BY": "Belarus", "O1": "Other Country", "LV": "Latvia", "RW": "Rwanda", "RS": "Serbia", "TL": "Timor-Leste", "RE": "Reunion", "LU": "Luxembourg", "TJ": "Tajikistan", "RO": "Romania", "PG": "Papua New Guinea", "GW": "Guinea-Bissau", "GU": "Guam", "GT": "Guatemala", "GS": "South Georgia and the South Sandwich Islands", "GR": "Greece", "GQ": "Equatorial Guinea", "GP": "Guadeloupe", "JP": "Japan", "GY": "Guyana", "GG": "Guernsey", "GF": "French Guiana", "GE": "Georgia", "GD": "Grenada", "GB": "United Kingdom", "GA": "Gabon", "SV": "El Salvador", "GN": "Guinea", "GM": "Gambia", "GL": "Greenland", "GI": "Gibraltar", "GH": "Ghana", "OM": "Oman", "TN": "Tunisia", "JO": "Jordan", "HR": "Croatia", "HT": "Haiti", "HU": "Hungary", "HK": "Hong Kong", "HN": "Honduras", "HM": "Heard Island and McDonald Islands", "VE": "Venezuela", "PR": "Puerto Rico", "PS": "Palestinian Territory", "PW": "Palau", "PT": "Portugal", "SJ": "Svalbard and Jan Mayen", "PY": "Paraguay", "IQ": "Iraq", "PA": "Panama", "PF": "French Polynesia", "BZ": "Belize", "PE": "Peru", "PK": "Pakistan", "PH": "Philippines", "PN": "Pitcairn", "TM": "Turkmenistan", "PL": "Poland", "PM": "Saint Pierre and Miquelon", "ZM": "Zambia", "EH": "Western Sahara", "RU": "Russian Federation", "EE": "Estonia", "EG": "Egypt", "TK": "Tokelau", "ZA": "South Africa", "EC": "Ecuador", "IT": "Italy", "VN": "Vietnam", "SB": "Solomon Islands", "EU": "Europe", "ET": "Ethiopia", "SO": "Somalia", "ZW": "Zimbabwe", "SA": "Saudi Arabia", "ES": "Spain", "ER": "Eritrea", "ME": "Montenegro", "MD": "Moldova, Republic of", "MG": "Madagascar", "MF": "Saint Martin", "MA": "Morocco", "MC": "Monaco", "UZ": "Uzbekistan", "MM": "Myanmar", "ML": "Mali", "MO": "Macao", "MN": "Mongolia", "MH": "Marshall Islands", "MK": "Macedonia", "MU": "Mauritius", "MT": "Malta", "MW": "Malawi", "MV": "Maldives", "MQ": "Martinique", "MP": "Northern Mariana Islands", "MS": "Montserrat", "MR": "Mauritania", "IM": "Isle of Man", "UG": "Uganda", "TZ": "Tanzania, United Republic of", "MY": "Malaysia", "MX": "Mexico", "IL": "Israel", "FR": "France", "IO": "British Indian Ocean Territory", "FX": "France, Metropolitan", "SH": "Saint Helena", "FI": "Finland", "FJ": "Fiji", "FK": "Falkland Islands (Malvinas)", "FM": "Micronesia, Federated States of", "FO": "Faroe Islands", "NI": "Nicaragua", "NL": "Netherlands", "NO": "Norway", "NA": "Namibia", "VU": "Vanuatu", "NC": "New Caledonia", "NE": "Niger", "NF": "Norfolk Island", "NG": "Nigeria", "NZ": "New Zealand", "NP": "Nepal", "NR": "Nauru", "NU": "Niue", "CK": "Cook Islands", "CI": "Cote d'Ivoire", "CH": "Switzerland", "CO": "Colombia", "CN": "China", "CM": "Cameroon", "CL": "Chile", "CC": "Cocos (Keeling) Islands", "CA": "Canada", "CG": "Congo", "CF": "Central African Republic", "CD": "Congo, The Democratic Republic of the", "CZ": "Czech Republic", "CY": "Cyprus", "CX": "Christmas Island", "CR": "Costa Rica", "CV": "Cape Verde", "CU": "Cuba", "SZ": "Swaziland", "SY": "Syrian Arab Republic", "KG": "Kyrgyzstan", "KE": "Kenya", "SR": "Suriname", "KI": "Kiribati", "KH": "Cambodia", "KN": "Saint Kitts and Nevis", "KM": "Comoros", "ST": "Sao Tome and Principe", "SK": "Slovakia", "KR": "Korea, Republic of", "SI": "Slovenia", "KP": "Korea, Democratic People's Republic of", "KW": "Kuwait", "SN": "Senegal", "SM": "San Marino", "SL": "Sierra Leone", "SC": "Seychelles", "KZ": "Kazakhstan", "KY": "Cayman Islands", "SG": "Singapore", "SE": "Sweden", "SD": "Sudan", "DO": "Dominican Republic", "DM": "Dominica", "DJ": "Djibouti", "DK": "Denmark", "VG": "Virgin Islands, British", "DE": "Germany", "YE": "Yemen", "DZ": "Algeria", "US": "United States", "UY": "Uruguay", "YT": "Mayotte", "UM": "United States Minor Outlying Islands", "LB": "Lebanon", "LC": "Saint Lucia", "LA": "Lao People's Democratic Republic", "TV": "Tuvalu", "TW": "Taiwan", "TT": "Trinidad and Tobago", "TR": "Turkey", "LK": "Sri Lanka", "LI": "Liechtenstein", "A1": "Anonymous Proxy", "TO": "Tonga", "LT": "Lithuania", "A2": "Satellite Provider", "LR": "Liberia", "LS": "Lesotho", "TH": "Thailand", "TF": "French Southern Territories", "TG": "Togo", "TD": "Chad", "TC": "Turks and Caicos Islands", "LY": "Libyan Arab Jamahiriya", "VA": "Holy See (Vatican City State)", "VC": "Saint Vincent and the Grenadines", "AE": "United Arab Emirates", "AD": "Andorra", "AG": "Antigua and Barbuda", "AF": "Afghanistan", "AI": "Anguilla", "VI": "Virgin Islands, U.S.", "IS": "Iceland", "IR": "Iran, Islamic Republic of", "AM": "Armenia", "AL": "Albania", "AO": "Angola", "AN": "Netherlands Antilles", "AQ": "Antarctica", "AP": "Asia/Pacific Region", "AS": "American Samoa", "AR": "Argentina", "AU": "Australia", "AT": "Austria", "AW": "Aruba", "IN": "India", "AX": "Aland Islands", "AZ": "Azerbaijan", "IE": "Ireland", "ID": "Indonesia", "UA": "Ukraine", "QA": "Qatar", "MZ": "Mozambique"}, function(k, v) {
			        countries.push({id: k, text: v});
			    }); 
			    $('#country').editable({
			        source: countries,
			        select2: {
			            width: 200,
			            placeholder: 'Select country',
			            allowClear: true
			        } 
			    });      


			    
			    $('#address').editable({
			        url: 'StudentProfileServlet',
			        value: {
			            city: "Moscow", 
			            street: "Lenina", 
			            building: "12"
			        },
			        validate: function(value) {
			            if(value.city == '') return 'city is required!'; 
			        },
			        display: function(value) {
			            if(!value) {
			                $(this).empty();
			                return; 
			            }
			            var html = '<b>' + $('<div>').text(value.city).html() + '</b>, ' + $('<div>').text(value.street).html() + ' st., bld. ' + $('<div>').text(value.building).html();
			            $(this).html(html); 
			        }         
			    });              
			         
			   $('#user .editable').on('hidden', function(e, reason){
			        if(reason === 'save' || reason === 'nochange') {
			            var $next = $(this).closest('tr').next().find('.editable');
			            if($('#autoopen').is(':checked')) {
			                setTimeout(function() {
			                    $next.editable('show');
			                }, 300); 
			            } else {
			                $next.focus();
			            } 
			        }
			   });
			   
			});
		
		
		
		
		$(function(){
		    //ajax mocks
		    $.mockjaxSettings.responseTime = 500; 
		    
		    $.mockjax({
		        url: 'StudentProfileServlet',
		        response: function(settings) {
		            log(settings, this);
		        }
		    });

		    $.mockjax({
		        url: '/error',
		        status: 400,
		        statusText: 'Bad Request',
		        response: function(settings) {
		            this.responseText = 'Please input correct value'; 
		            log(settings, this);
		        }        
		    });
		    
		    $.mockjax({
		        url: '/status',
		        status: 500,
		        response: function(settings) {
		            this.responseText = 'Internal Server Error';
		            log(settings, this);
		        }        
		    });
		  
		    $.mockjax({
		        url: '/groups',
		        response: function(settings) {
		            this.responseText = [ 
		             {value: 0, text: 'Guest'},
		             {value: 1, text: 'Service'},
		             {value: 2, text: 'Customer'},
		             {value: 3, text: 'Operator'},
		             {value: 4, text: 'Support'},
		             {value: 5, text: 'Admin'}
		           ];
		           log(settings, this);
		        }        
		    });
		    
		    function log(settings, response) {
		            var s = [], str;
		            s.push(settings.type.toUpperCase() + ' url = "' + settings.url + '"');
		            for(var a in settings.data) {
		                if(settings.data[a] && typeof settings.data[a] === 'object') {
		                    str = [];
		                    for(var j in settings.data[a]) {str.push(j+': "'+settings.data[a][j]+'"');}
		                    str = '{ '+str.join(', ')+' }';
		                } else {
		                    str = '"'+settings.data[a]+'"';
		                }
		                s.push(a + ' = ' + str);
		            }
		            s.push('RESPONSE: status = ' + response.status);

		            if(response.responseText) {
		                if($.isArray(response.responseText)) {
		                    s.push('[');
		                    $.each(response.responseText, function(i, v){
		                       s.push('{value: ' + v.value+', text: "'+v.text+'"}');
		                    }); 
		                    s.push(']');
		                } else {
		                   s.push($.trim(response.responseText));
		                }
		            }
		            s.push('--------------------------------------\n');
		            $('#console').val(s.join('\n') + $('#console').val());
		    }                 
		    
		});
	});
</script> 

</head>
<body>
<div class="content">

	<h2>Example</h2>   
            <div style="float: right; margin-bottom: 10px">
	            <label style="display: inline-block; margin-right: 50px"><input type="checkbox" id="autoopen" style="vertical-align: baseline">&nbsp;auto-open next field</label>
	            <button id="enable" class="btn btn-default">enable / disable</button>
            </div>
            <p>Click to edit</p>
            <table id="user" class="table table-bordered table-striped" style="clear: both">
                <tbody> 
                    <tr>         
                        <td width="35%">Simple text field</td>
                        <td width="65%"><a href="#" id="username" data-type="text" data-pk="1" data-title="Enter username">superuser</a></td>
                    </tr>
                    <tr>         
                        <td>Empty text field, required</td>
                        <td><a href="#" id="firstname" data-type="text" data-pk="1" data-placement="right" data-placeholder="Required" data-title="Enter your firstname"></a></td>
                    </tr>  
                    <tr>         
                        <td>Select, local array, custom display</td>
                        <td><a href="#" id="sex" data-type="select" data-pk="1" data-value="" data-title="Select sex"></a></td>
                    </tr>
                    <tr>         
                        <td>Select, remote array, no buttons</td>
                        <td><a href="#" id="group" data-type="select" data-pk="1" data-value="5" data-source="/groups" data-title="Select group">Admin</a></td>
                    </tr> 
                    <tr>         
                        <td>Select, error while loading</td>
                        <td><a href="#" id="status" data-type="select" data-pk="1" data-value="0" data-source="/status" data-title="Select status">Active</a></td>
                    </tr>  
                         
                    <tr>         
                        <td>Datepicker</td>
                        <td>
                        
                        <span class="notready">not implemented for Bootstrap 3 yet</span>
                        
                        </td>
                    </tr>
                    <tr>         
                        <td>Combodate (date)</td>
                        <td><a href="#" id="dob" data-type="combodate" data-value="1984-05-15" data-format="YYYY-MM-DD" data-viewformat="DD/MM/YYYY" data-template="D / MMM / YYYY" data-pk="1"  data-title="Select Date of birth"></a></td>
                    </tr> 
                    <tr>         
                        <td>Combodate (datetime)</td>
                        <td><a href="#" id="event" data-type="combodate" data-template="D MMM YYYY  HH:mm" data-format="YYYY-MM-DD HH:mm" data-viewformat="MMM D, YYYY, HH:mm" data-pk="1"  data-title="Setup event date and time"></a></td>
                    </tr> 
                    
                                         
                                        
                    <tr>         
                        <td>Textarea, buttons below. Submit by <i>ctrl+enter</i></td>
                        <td><a href="#" id="comments" data-type="textarea" data-pk="1" data-placeholder="Your comments here..." data-title="Enter comments">awesome
user!</a></td>
                    </tr> 
                    
                    
                    
                    
                    <tr>         
                        <td>Twitter typeahead.js</td>
                        <td><a href="#" id="state2" data-type="typeaheadjs" data-pk="1" data-placement="right" data-title="Start typing State.."></a></td>
                    </tr>                       
                                         
                                                        
                    <tr>         
                        <td>Checklist</td>
                        <td><a href="#" id="fruits" data-type="checklist" data-value="2,3" data-title="Select fruits"></a></td>
                    </tr>

                    <tr>         
                        <td>Select2 (tags mode)</td>
                        <td><a href="#" id="tags" data-type="select2" data-pk="1" data-title="Enter tags">html, javascript</a></td>
                    </tr>                    

                    <tr>         
                        <td>Select2 (dropdown mode)</td>
                        <td><a href="#" id="country" data-type="select2" data-pk="1" data-value="BS" data-title="Select country"></a></td>
                    </tr>  
                    
                    <tr>         
                        <td>Custom input, several fields</td>
                        <td><a href="#" id="address" data-type="address" data-pk="1" data-title="Please, fill address"></a></td>
                    </tr>                      
                                                                                                                
                    
                </tbody>
            </table>
            </div>
</body>
</html>