/**
 * 
 */


	// --DeBug專用 滾出所有東西
	function listAll(data){
		if(data!= 'undefined' && data instanceof Array || data instanceof Object){
		$.each(data, function(key,value){
				// 1.array
			if(value instanceof Array){
				console.log(key);
				listAll(value);	
				// 2.obj
			}else if(value instanceof Object){
				// 印出項目名稱
				console.log(key);
				listAll(value);
				// 3.value
			}else{
				console.log(key+" "+ value);
				if(key=='cell'){
				console.log("============next=============");
				}
			}
		})
		
		}else{
			//console.log("end●");
		}
	}
	
	// 幫助把csv檔案解析成[ [],[],......,[] ] 給datatables吃
	function processData(csv) {
        var allTextLines = csv.split(/\r\n|\n/);
        var lines = [];
        for (var i=1; i<allTextLines.length; i++) {
//        	if(i=0) continue;// 跳過標題
            var data = allTextLines[i].split(',');
            // 刷掉第一組
            if(i+1!=allTextLines.length){
            // 刷掉最後一組
                var tarr = [];
                console.log(data.length)
                for (var j=0; j<data.length; j++) {
                	j==0?tarr.push(data[j])									//first
                			:(j+1==data.length?tarr.push(data[j])			//last
                					:(tarr.push(data[j])));					//others
                	
                	
//                	j==0?tarr.push("["+"\""+data[j]+"\"")							//first
//                			:(j+1==data.length?tarr.push("\""+data[j]+"\""+"]")	//last
//                					:(tarr.push("\""+data[j]+"\"")));				//others
                	
                }
                lines.push(tarr);
            }
        }
        console.log(lines)
      return lines;
    }
	
	function updateData(csvArray,oneNewArray){
//		console.log(csvArray);
		// 判斷是否為array
		
//		console.log(oneNewArray);
		
		// 薪資料(一筆)
//		console.log(Array.isArray(oneNewArray));
		// 舊資料(多筆)
//		console.log(Array.isArray(csvArray));
		
//		取得修改後資料的名字
//		console.log(oneNewArray[0].defaultValue);
		// 查詢是否存在
		var index;
		var isExist = false;
		$.each(csvArray,function(i,oneArray){
//			console.log(oneArray);
			
//			console.log(oneArray[0]);
//			console.log(typeof(oneArray[0]));
//			console.log(oneNewArray[0].defaultValue);
//			console.log(typeof(oneNewArray[0].defaultValue));
//			console.log(i);
			
			 isExist |= (oneArray[0] == oneNewArray[0].defaultValue); 
			 if(isExist)index = i;
			 isExist = false;
		})
		var replaceArray=[];
		
		
		$.each(oneNewArray,function(k,tempData){
			replaceArray.push(tempData.value);
		});
			
		
		// 最後看看是否存在 如果存在就回傳所在位置
//		console.log(index);
//		console.log(csvArray);
//		console.log(csvArray[index]);
		csvArray.splice(index,0,replaceArray);
		csvArray.splice(index+1 ,1);
//		console.log(csvArray);
		return csvArray;
//		console.log(csvArray.splice(index,0,oneNewArray).splice(index+1,1));
		
		
//		console.log(typeof(csvArray));
//		$.each(csvArray)
		// 先找到
	}
	
	 /**
     *iniDataTables
     */        
     function iniDataTables(readerToArrayFit){
    	$('#example').DataTable({
    
	        "paging":   true,
	        "ordering": true,
	        "info":     true,				
	        "order": [[ 5, "asc" ]],		
	        "stateSave": false,				  
	        "pagingType": "full_numbers",	
	        "lengthChange": true,			 
	      	"autoWidth": true,	
        	"deferRender": false,        
        	"searchDelay": 350,
        	"select": {						
            	style: 'os',
            	blurable: true
        	},
        	"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        	 columns: [//應該寫成一支Object Array 方便不同表格的切換
        	            { title: "姓名" },
        	            { title: "年次" },
        	            { title: "性別" },
        	            { title: "學校" },
        	            { title: "組別" },
        	            { title: "座號" },
        	            { title: "E-mail" },
        	            { title: "已考(pc)" },
        	            { title: "成績(pc)" },
        	            { title: "日期(pc)" },
        	            { title: "成績(i)" },
        	            { title: "總成績" },
        	            { title: "最快上班日" },
        	            { title: "預期薪資" },
        	            { title: "Rank" },
        	            { title: "備註" },
        	            { title: "備註" },
        	            { title: "班級" }
        	        ], 
        	        
        	    	"language": {
        				"url":"../DataTables/i18n/zh_TW.json",			
        	            "lengthMenu": "Display _MENU_ records per page",
        	            "zeroRecords": "Nothing found - sorry",
        	            "info": "Showing page _PAGE_ of _PAGES_",
        	            "infoEmpty": "No records available",
        	            "infoFiltered": "(filtered from _MAX_ total records)",
        	            "decimal": ".",				
        	            "thousands": ","			
        	        },
        	    	"dom": '<"top"lf>rt<"bottom"Bip>',
        	     	"buttons": [
        	     	           'copy','csv', 'excel', 'pdf',
        	     	           
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
        	     	         ,{
        	     	        	extend: 'selected',				// 取得以選取row
        	     	        	text: '顯示',
        	     	        	action: function ( e, dt, button, config ) {
        	     	        		// 清空先前標籤
        	     	        		
        	     	        		$("#showMember table *").remove();
        	     	        		$("#formMember form *").remove();
        	     	        		
        	     	        		
        	     	        		
//        	     	             	alert( dt.rows( { selected: true } ).indexes().length +' row(s) selected' );
//        	     	             	alert( dt.rows( { selected: true } ).data()[0] +' row(s) selected' );
        	     	        		
        	     	        		// 取得使用者選取資料
        	     	            	var oneMember = dt.rows( { selected: true } ).data();
        	     	            	// 製作HTML標籤
        	     	            	var tableTemp = document.createElement('table');
        	     	            	var tableHead = document.createElement('thead');
        	     	            	tableTemp.setAttribute('cellspacing','0');
        	     	            	tableTemp.setAttribute('width','100%');
        	     	            	tableTemp.className='display table';
        	     	            	tableTemp.appendChild(tableHead);
        	     	            	
        	     	            	
        	     	            	// 將選取的考生 製作為table的形式
        	     	            	$.each(oneMember,function(i,member){	// 用foreach抓出已選取的rows內容
        	     	            		var tableRow = document.createElement('tr');
//        	     	            		console.log(member);				// 印出選取的rows
//        	     	            		alert($("#myModal p").text());
        	     	            		$.each(member,function(i,memberCol){
        	     	            			
        	     	            			var tableCol = document.createElement('th');
        	     	            			// 取得顯示內容
        	     	            			var textElement = document.createTextNode(memberCol);
        	     	            			// 包裝
        	     	            			tableCol.appendChild(textElement);
        	     	            			tableRow.appendChild(tableCol);
        	     	            		})
        	     	            			// 塞入
        	     	            		tableTemp.appendChild(tableRow);
        	     	            	})

        	     	            	
        	     	            	// 將HTML標籤塞進空div
        	     	            	$("#showMember").append(tableTemp);
        	     	            	
        	     	            	
        	     	            	
        	     	           	// 	按下按鈕後 跳出對話視窗 -- 可以打開任一種【風格】

        	     				// 1. 傳統dialog
//        	     	          	$("#dialog").dialog( "open" );
        	     	            	
        	     	         	// 2. bootstrap 的 modal 			參考: http://getbootstrap.com/javascript/#via-javascript
        	     	            $("#myModal").modal({"keyboard": true},{"show":true});
//        	     	         	$("#myModal").modal( "show" );

        	     	            	
        	     	        	}
        	     	    	}
        	     	        
        	     	        ,{
        	     	        	extend: 'selected',				// 取得以選取row
        	     	        	text: '編輯',
        	     	        	action: function ( e, dt, button, config ) {
        	     	        		$("#showMember table *").remove();
        	     	        		$("#formMember form *").remove();
        	     	        		
        	     	        		
//        	     	             	alert( dt.rows( { selected: true } ).indexes().length +' row(s) selected' );
//        	     	             	alert( dt.rows( { selected: true } ).data()[0] +' row(s) selected' );
        	     	        		
        	     	        		// 取得使用者選取資料
        	     	        		var oneMember = dt.rows( { selected: true } ).data();
        	     	        		// 製作HTML標籤
        	     	        		var formTemp = document.createElement('form');
        	     	        		var formField = document.createElement('fieldset');
        	     	        		formTemp.setAttribute('cellspacing','0');
        	     	        		formTemp.setAttribute('height','300');
        	     	        		formTemp.setAttribute('width','350');
//        	     	            	formTemp.className='display table';
        	     	        		formTemp.appendChild(formField);
        	     	        		
        	     	        		
        	     	        		// 將選取的考生 製作為form的形式
        	     	        		$.each(oneMember,function(i,member){	// 用foreach抓出已選取的rows內容
        	     	        			$.each(member,function(i,memberCol){
        	     	        				var formItemTitle = document.createElement('label');
        	     	        				var formItemInput = document.createElement('input');
        	     	        				// 捨定某些欄位不能更改
//        	     	        				i==1||i==0||i==2?formItemInput.readOnly = true:formItemInput.readOnly = false;
        	     	        				// 設定某些欄位才能更改
//        	     	        				i!=13&&i!=14&&i!=16&&i!=7?formItemInput.readOnly = true:formItemInput.readOnly = false;
        	     	        				
        	     	        				
        	     	        				formItemInput.readOnly = false;
        	     	        				
        	     	        				
        	     	        				
        	     	        				// 欄位名稱
        	     	        				var textElement02 = document.createTextNode(i);
//        	     	        				formItemInput.appendChild(textElement);
        	     	        				// 顯示欄位編號
        	     	        				formItemTitle.appendChild(textElement02);
        	     	        				formItemInput.setAttribute('type','text');
        	     	        				// 欄位值
        	     	        				var textElement = document.createTextNode(memberCol);
        	     	        				// 顯示欄位內容
        	     	        				formItemInput.setAttribute('value',textElement.data);
        	     	        				formItemInput.className = "form-control";
        	     	        				// 包裝
        	     	        				formField.appendChild(formItemTitle);
        	     	        				formField.appendChild(formItemInput);
        	     	        			})
        	     	        				// 塞入
        	     	        			formTemp.appendChild(formField);
        	     	        		})
        	     	        		
        	     	        		
        	     	        		// 將HTML標籤塞進空div
        	     	        		$("#formMember").append(formTemp);
        	     	        		// 編輯完成 -- 確認
        	     	        		$("#modifybtn").on('click',$("#formMember :input"),function(event){
        	     	        			// 按下確認鍵 必須要修改上傳csv按鈕會呼叫的方法
        	     	        			$("#uploadForm").prop("action", "javascript: uploadAndSubmitAfterEdit();");
        	     	        			var preparedForm = $("#formMember :input");
//        	     	        			console.log(preparedForm);
        	     	        			var oneNewArray = [];
        	     	            		$.each(preparedForm,function(i,oneNewForm){	
        	     	            		oneNewArray.push(oneNewForm);
//        	     	        			console.log($(oneNewForm).val());
        	     	            		});
//        	     	        			console.log(event);
//        	     	        			console.log(""+readerToArrayFit);
        	     	            		
        	     	            		
        	     	            		// 步驟
        	     	        			// 1.將舊的array給split
        	     	        			// 2.再找到必須修改的那一row
        	     	        			// 3.替換掉
        	     	            		
        	     	        			// 欲更新資資料
//        	     	        			console.log(oneNewArray);
        	     	            		
        	     	            		
        	     	            		// 舊資料、新資料
        	     	            		
        	     	            		// 1.離線編輯 【指有刷新dataTables部分】
        	     	        			var updatedArray = updateData(readerToArrayFit,oneNewArray);
//        	     	        			readerToArrayFit = updatedArray; 
//        	     	        			$('#example').DataTable.data.reload();
        	     	        			var table = $('#example').DataTable();
        	     	        			table.clear();
        	     	        			table.rows.add(updatedArray);
//        	     	        			table.data();
        	     	        			table.draw();
        	     	        			
//        	     	        			iniDataTables(updatedArray);

        	     	        			
        	     	        			
        	     	        			
        	     	        			// 2.寫入uploadForm
        	     	        
        	     	        	        	  file = updatedArray;
        	     	        	        	  // array轉回csv
//        	     	        	        	  console.log(file);
        	     	        	        	 console.log(file.join(",")); 
        	     	        	        	var renewCsv = exportToCsv("test01.csv",file);
//        	     	        	        	renewCsv = JSON.parse(renewCsv);
        	     	        	        	  globalv = renewCsv;
        	     	        	        	  
        	     	        	        	  
        	     	        	        	  
        	     	        	        	  
//        	     	        	        	  var reader = new FileReader();
//        	     	        	        	  
////        	     	        	        	 reader.readAsText(renewCsv,'UTF-8');
////        	     	        	        	 reader.readAsArrayBuffer(file);
//        	     	        	        	 
//        	     	        	        	 reader.onloadend = function(){
////        	     	        	        		 console.log(reader.result);
////        	     	        	        		globalv = reader.result;
//        	     	        	        	 };
        	     	        	        	  
        	     	        	        	  
        	     	        	        	  
        	     	        	        	 $("#modalClose").click();
        	     	        		});
        	     	        		
        	     	        		// 	按下按鈕後 跳出對話視窗 -- 可以打開任一種風格
        	     	        		
        	     	        		// 1. 傳統dialog
//        	     	          	$("#dialog").dialog( "open" );
        	     	        		
        	     	        		// 2. bootstrap 的 modal 			參考: http://getbootstrap.com/javascript/#via-javascript
        	     	        		// 單純顯示對話窗
//        	     	         		$("#myModal").modal( "show" );
        	     	        		
        	     	        		// 允許Esc跳出對話窗
        	     	        		$("#myModal").modal({"keyboard": true},{"show":true});
        	     	        	}
        	     	        }
        	     	    ],
        	        
        	        
        	        
        	        
 		"data":readerToArrayFit
 		 });
    };
    
    
    function exportToCsv(filename, rows) {
        var processrows = function (rows) {
            var finalVal = '';
            for (var j = 0; j < rows.length; j++) {
                var innerValue = rows[j] === null ? '' : rows[j].toString();
                if (rows[j] instanceof Date) {
                    innerValue = rows[j].toLocaleString();
                };
                var result = innerValue.replace(/"/g, '""');
                if (result.search(/("|,|\n)/g) >= 0)
                    result = '"' + result + '"';
                if (j > 0)
                    finalVal += ',';
                finalVal += result;
            }
            return finalVal + '\n';
        };

        var csvFile = '';
        for (var i = 0; i < rows.length; i++) {
            csvFile += processrows(rows[i]);
        }
        return csvFile;
    }

    
	
//  var blob = new Blob([csvFile], { type: 'text/csv;charset=utf-8;' });
//  console.log(blob);
//  if (navigator.msSaveBlob) { // IE 10+
//      navigator.msSaveBlob(blob, filename);
//  } else {
//      var link = document.createElement("a");
//      if (link.download !== undefined) { // feature detection
//          // Browsers that support HTML5 download attribute
//          var url = URL.createObjectURL(blob);
//          link.setAttribute("href", url);
//          link.setAttribute("download", filename);
//          link.style.visibility = 'hidden';
//          document.body.appendChild(link);
////          link.click();
//          document.body.removeChild(link);
//      }
//  }
//}

	
