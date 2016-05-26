/**
 * DataTables主要功能
 */

$(document).ready(function() {
	
        // 多半是針對表格來做的設定			請參考: https://datatables.net/reference/option/
    var table =$('#exampleInner').DataTable( {
        "paging":   true,
        "ordering": true,
        "info":     true,				// 會把過濾後的結果顯示在左下角	參考: https://datatables.net/examples/basic_init/filter_only.html
//         "order": [[ 3, "desc" ]],		// 陣列中的第一個參數指預設要排序的欄位, 第二為從大排到小 故 Age欄位66,66,65,.......
        "stateSave": false,				// 基本上是存在session 但仍有許多callback 可供呼叫 	參考:https://datatables.net/examples/basic_init/state_save.html  
        "pagingType": "full_numbers",	// full_numbers 可以顯示第一頁,下一頁, 上一頁, 最後一頁, 頁碼. 參考:https://datatables.net/examples/basic_init/alt_pagination.html
        "lengthChange": true,			// full			可以顯示第一頁,下一頁, 上一頁, 最後一頁, 
        								// numbers		可以顯示 頁碼.
        								// simple		可以顯示  下一頁, 上一頁
        								// simple_numbers 可以顯示  下一頁, 上一頁, 頁碼.
        "autoWidth": true,	
        
        "deferRender": false,        
        
        "searchDelay": 350,
        
        "select": {						// 選到的row資料列 設定
            style: 'os',
            blurable: true
        },
        
        
        
		// 官方說明:
			
//     A 1D array of options which will be used for both the displayed option and the value, or
//     A 2D array in which the first array is used to define the value options and the second array the displayed options (useful for language strings such as 'All').
         "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],								
//          "pageLength": 25,        								
        								
       // 去server拿資料			參考:https://datatables.net/examples/data_sources/
       // 1. 純文字: Ajax sourced data 吃txt
       // 2. js物件: Javascript sourced data 吃js陣列
       // 3. 似乎是json(新版): Server-side processing
       // 4. 真正是json(應該): JSONP data source for remote do   參考: https://datatables.net/examples/server_side/jsonp.html   

       
       
       


//   	<!-- ●●●●●●先寫死試試看 -->
//   "data": [
//     [
//       "Airi",
//       "Satou",
//       "Accountant",
//       "Tokyo",
//       "28th Nov 08",
//       "$162,700"
//     ],
//     [
//       "Angelica",
//       "Ramos",
//       "Chief Executive Officer (CEO)",
//       "London",
//       "9th Oct 09",
//       "$1,200,000"
//     ]],


// 		<!-- ●●●●●●使用jQuery函數getJSON -->       
//         "data":$.getJSON("/Hibernate01/ListAllStudents.do",{},function(data){
//         		console.log(data);
        		
//         }),
//        請參考: https://datatables.net/examples/ajax/objects.html
  

// 		<!-- ●●●●●●使用ajax -->       
//         "ajax": {
//         	"type":"get",
//         	"url": "/Hibernate01/ListAllStudents.do",        								
//         	"DATASRC":"",
// 			"data":{},
//         	"dataType": "text",
// 			"success":function(data){
				
// 				console.log(data);
// 			}
// 		},

// 		<!-- ●●●●●●取資料 -->
        "processing": true,
        "serverSide": false,			// 注意 如果true, 則型別由server端決定		
        								// 官方解釋: Please note that if you are using server-side processing (serverSide) this option has no effect since the ordering and search actions are performed by a server-side script.
        								// 請參考: https://datatables.net/reference/option/columns.type
        "ajax" : "/Hibernate01/ListAllStudents.do"        								
        	,
   
        								
//          <!-- 顯示控制 -->
//         "scrollY": 600,				// 高度控制
//         "scrollX": true,				// 寬度控制	
        
//         	"scrollY": '50vh',			// 動態計算
//         "scrollCollapse": true,    	// 捲動軸    								
        								
        								
// 		<!-- 套用語言包 -->					
		"language": {
			"url":"../DataTables/i18n/zh_TW.json",			
            "lengthMenu": "Display _MENU_ records per page",
            "zeroRecords": "Nothing found - sorry",
            "info": "Showing page _PAGE_ of _PAGES_",
            "infoEmpty": "No records available",
            "infoFiltered": "(filtered from _MAX_ total records)",
            "decimal": ".",				// 數字要顯示的十進位
            "thousands": ","			// 每一千要顯示的
        },        								
        
// 	"buttons" : { 
// 			"buttons": [ 
// 			    { extend : 'excel', text : 'Save current page', className :"excelButton"}
// 			 ]
// 			},
 
//  buttons: [
//         {
//             extend: 'csv',
//             text: 'Copy all data',
//             exportOptions: {
//                 modifier: {
//                     search: 'none'
//                 }
//             }
//         }
//     ],
	
	
	
	// 官方原文 When using this method of initialisation, you may also wish to use the dom option to tell DataTables where to display the buttons - see below.
// 	"dom": 'lrtip',				// 告知DataTables要把按鈕擺在哪邊	參考: https://datatables.net/extensions/buttons/
// 	"dom": '<lf<t>ip>',				// 告知DataTables要把按鈕擺在哪邊	參考: https://datatables.net/extensions/buttons/
	"dom": '<"top"lf>rt<"bottom"Bip>',				// 告知DataTables要把按鈕擺在哪邊	參考: https://datatables.net/extensions/buttons/
	
// 										// 方法有兩種 1.DOM參數	2.直接插入 
										// 位置的設定:
											// 官方說明: Length and filter above, information and pagination below table:
											// 顯示長度、過濾搜尋在上面 中間夾著table 下面擺查詢結果、換頁 
											// "dom": '<lf<t>ip>'
										
											// 官方說明: Table summary in header, filtering, length and processing in footer, with a clearing element.:
											// 搜尋結果擺Header	過濾搜尋、顯示長度、進度擺在Footer
											// "dom": '<"top"i>rt<"bottom"flp><"clear">'

 	"buttons": [
        'copy','csv', 'excel', 'pdf',
        
        
     	// 列印功能
        									// 參考: https://datatables.net/reference/button/print
    	{									
    		extend:'print',	
            text: '列印 (alt+p)',
    		autoPrint: false,				// 取消預設的列印對話窗
    		key:{				
    			key:'p'
    			,altKey:true				// 組合鍵alt
    		}
    	}
        
        ,{
            extend: 'print',				// 單純列印目前頁面
            text: '列印 (p)',
            autoPrint: false,				// 取消預設的列印對話窗
    		key:{				
    			key:'p'
    		},
            exportOptions: {
                modifier: {
                    page: 'current'
                }
            }
        }
    
       	
        // 選取 row
        ,{
        	extend: 'selected',				// 取得以選取row
        	text: 'Count selected rows',
        	action: function ( e, dt, button, config ) {
//             	alert( dt.rows( { selected: true } ).indexes().length +' row(s) selected' );
//             	alert( dt.rows( { selected: true } ).data()[0] +' row(s) selected' );
            	var oneMember = dt.rows( { selected: true } ).data();
            	$.each(oneMember,function(i,member){	// 用foreach抓出已選取的rows內容
//            		console.log(member);				// 印出選取的rows
            		console.log(member);				// 印出選取的rows
//            		alert($("#myModal p").text());
            		$("#myModal p").text(member);
            	})

            	
            	
           	// 	按下按鈕後 跳出對話視窗 -- 可以打開任一種風格

			// 1. 傳統dialog
//          	$("#dialog").dialog( "open" );
            	
         	// 2. bootstrap 的 modal 			參考: http://getbootstrap.com/javascript/#via-javascript
         	$("#myModal").modal( "show" );

            	
        	}
    	}
    ],
    
		

			// 		<!-- 針對欄位來做的設定 -->
			"columnDefs" : [ { // 多個欄位排序 按著shift可以選擇多個欄位
				targets : [ 0 ],
				orderData : [ 0, 1 ]
			}, {
				targets : [ 1 ],
				orderData : [ 1, 0 ]
			}, { // 針對地2個欄位做隱藏 故看不見office
				"targets" : [ 2 ],
				"visible" : true,
				"searchable" : true
			}, {
				targets : [ 4 ],
				orderData : [ 4, 0 ]
			}, { 
				targets: [ 13 ],
				type: 'numeric-comma'  
				} 
			
			
			]
		});

		// 註冊點擊【rows】事件發生處理
// 		$('#example tbody').on('click', 'tr', function() {
// 			var data = table.row(this).data();
// 			alert('You clicked on ' + data[0] + '\'s row');
// 		});
	});
