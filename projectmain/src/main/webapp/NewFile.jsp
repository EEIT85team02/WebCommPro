<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="author" content="Vitaliy Potapov">
        <meta http-equiv="cache-control" content="max-age=0" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
        <meta http-equiv="pragma" content="no-cache" />

        <title>X-editable Demo</title>

        <script src="assets/jquery/jquery-1.9.1.min.js"></script>  
        <script src="assets/mockjax/jquery.mockjax.js"></script>
        
        <!-- momentjs --> 
        <script src="assets/momentjs/moment.min.js"></script> 
        
        <!-- select2 --> 
        <link href="assets/select2/select2.css" rel="stylesheet">
        <script src="assets/select2/select2.js"></script>         

        <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]--> 
        
         
        <!-- bootstrap 3 -->
        <link href="assets/bootstrap300/css/bootstrap.css" rel="stylesheet">
        <script src="assets/bootstrap300/js/bootstrap.js"></script>

        <!-- bootstrap-datetimepicker -->
        <link href="assets/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet">
        <script src="assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>        
        
        <!-- x-editable (bootstrap 3) -->
        <link href="assets/x-editable/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet">
        <script src="assets/x-editable/bootstrap3-editable/js/bootstrap-editable.js"></script>

        <!-- select2 bootstrap -->
        <link href="assets/select2/select2-bootstrap.css" rel="stylesheet">
       
        <!-- typeaheadjs -->
        <link href="assets/x-editable/inputs-ext/typeaheadjs/lib/typeahead.js-bootstrap.css" rel="stylesheet">
        <script src="assets/x-editable/inputs-ext/typeaheadjs/lib/typeahead.js"></script>         
        <script src="assets/x-editable/inputs-ext/typeaheadjs/typeaheadjs.js"></script>         
        
        <link href="assets/demo-bs3.css" rel="stylesheet">
        
        <style type="text/css">       
            #comments:hover {
                background-color: #FFFFC0;
                cursor: text; 
            }
        </style>
        
        <script>
        var f = 'bootstrap3';
        </script>

        
        <!-- address input -->
        <link href="assets/x-editable/inputs-ext/address/address.css" rel="stylesheet">
        <script src="assets/x-editable/inputs-ext/address/address.js"></script> 
        
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

    </head>

    <body> 

        <div style="width: 80%; margin: auto;"> 
            <h1>X-editable Demo</h1>
            <hr>

            <h2>Settings</h2>
             <form method="get" id="frm" class="form-inline" action="demo.html">
                
                <label>
                    <span>Form style:</span>
                    <select id="f" class="form-control">
                        <option value="bootstrap3">Bootstrap 3</option>
                        <option value="bootstrap2">Bootstrap 2</option>
                        <option value="jqueryui">jQuery UI</option>
                        <option value="plain">Plain</option>
                    </select>
                </label>

                <label style="margin-left: 30px">Mode:
                    <select name="c" id="c" class="form-control">
                        <option value="popup">Popup</option>
                        <option value="inline">Inline</option>
                    </select>
                </label>

                <button type="submit" class="btn btn-primary" style="margin-left: 30px">refresh</button>
            </form>

            <hr>

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
            
            <div style="float: left; width: 50%">
                <h3>Console <small>(all ajax requests here are emulated)</small></h3> 
                <div><textarea id="console" class="form-control" rows="8" style="width: 70%" autocomplete="off"></textarea></div>
            </div>
           
            <div style="float: left">             
                <h3>More examples and tricks <small>(jsFiddle)</small></h3> 
                <ul>
                    <li><a href="http://jsfiddle.net/xBB5x/38" target="_blank">Submit data via PUT method</a></li>
                    <li><a href="http://jsfiddle.net/xBB5x/39" target="_blank">Autotext option for select</a></li>
                    <li><a href="http://jsfiddle.net/xBB5x/40" target="_blank">Display checklist as &lt;UL&gt;</a></li>
                    <li><a href="http://jsfiddle.net/xBB5x/62" target="_blank">Process JSON response</a></li>
                    <li><a href="http://jsfiddle.net/xBB5x/63" target="_blank">Editable column in table</a></li>
                    <li><a href="http://jsfiddle.net/xBB5x/64" target="_blank">MVC pattern in editable interface</a></li>
                    <li><a href="http://jsfiddle.net/xBB5x/194" target="_blank">Change buttons style</a></li>
                    <li><a href="http://jsfiddle.net/xBB5x/278" target="_blank">Display server response as element's text</a></li>
                    <li><a href="http://jsfiddle.net/xBB5x/297" target="_blank">Dependent SELECTs</a></li>
                    <li><a href="http://jsfiddle.net/xBB5x/331" target="_blank">Single regular checkbox</a></li>
                    <li><a href="http://jsfiddle.net/xBB5x/329" target="_blank">Live events: work with delegated targets</a></li>
                    <li><a href="http://jsfiddle.net/wQysh/8" target="_blank">SELECT2 remote source</a></li>
                </ul>
            </div>
            
            <footer class="footer" style="clear: both; padding-top: 10px">
                <hr>
                <p><a href="http://vitalets.github.com/x-editable">X-editable</a> &copy; Vitaliy Potapov 2012. Released under the MIT license.</p> 
            </footer>

        </div>
        
        <script src="assets/demo-mock.js"></script> 
        <script src="assets/demo.js"></script>         
        
    </body>
</html>