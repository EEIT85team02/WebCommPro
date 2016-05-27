/**
 * 點擊按鈕 跳出對話視窗
 */

// -- 1. 傳統dialog 
$( "#dialog" ).dialog({
    autoOpen: false,
    title: "修改考生資料",
    height: 300,
    width: 350,
    modal: true,
    buttons: {
      "Create an account": addUser,
      Cancel: function() {
        dialog.dialog( "close" );
      }
    },
    close: function() {
      form[ 0 ].reset();
      allFields.removeClass( "ui-state-error" );
    }
  });

  form = dialog.find( "form" ).on( "submit", function( event ) {
    event.preventDefault();
    addUser();
  });

  
  $( "#create-user" ).button().on( "click", function() {
    dialog.dialog( "open" );
  });
  
  
  
  
// -- 2. bootstrap 的 modal 
	// 當modal被開啟時觸發事件         	
	$("#myModal").on( 'shown.bs.modal',function(data){
//		$.each(data,function(i,data){	// 用foreach抓出已選取的rows內容
		
//			console.log('========='+i);
//			$("#myModal>p").text(i[j]);
			// 在myModal裡面插入一個form?
			
//		})
	});