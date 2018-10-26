<html lang="en">

    <head>
		<#assign ctx = request.contextPath />
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="theme-color" content="#000000">
        <title>实验报告</title>
		<#include "pc/common/base.ftl">
        <link href="${ctx}/view/common/assets/pc/css/normalize.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/view/common/assets/pc/css/public.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/view/common/assets/pc/css/electronicReporting.css" rel="stylesheet" type="text/css">
        <script src="${ctx}/view/common/js/ajaxfileupload.js?${date}"></script>
    </head>

    <body>
        
        <header>
            <div class="logo"></div>
            <div class="experiment-title">${expScheduleList[0].name}</div>
           <!--  <div class="user-box">
                <div class="user-info clearfix">
                    <img class="user-head src-head" src="${ctx}/view/common/assets/pc/image/icon_user_head.jpg">
                    <span class="user-nick">贾文佳</span>
                </div>
                <ul class="nav-user clearfix">
                    <li>
                        <a href="${ctx}/logOut">安全退出</a>
                    </li>
                </ul>
            </div> -->
            <#include "pc/common/user.ftl">
        </header>

        <div class="big-container">
            <ul class="segment-content clearfix">
                <li><a href="#" class="selected">电子报告</a></li>
                <li><a href="${ctx}/evaluation-achievement?exp=${expId}">成绩评价</a></li>
            </ul>

            <div class="electronicReporting">
				<#list expScheduleList as m>
                <div class="header-title-1">实验内容</div>

                <div class="header-title-2">实验的目的及要求</div>
                <div class="header-title-3">${m.demand}</div>

                <div class="header-title-2">软硬件及环境</div>
				<#list expSoftwareList as software>
                <div class="header-title-3">${software.name}</div>
				</#list>
                <div class="header-title-2">实验目标</div>
                <div class="header-title-3">${m.target}</div>

                <div class="header-title-2">实验内容与步骤</div>
                <div class="header-title-3">${m.content}</div>
				</#list>
                <div>
                    <div class="header-title-1">实验结果</div>
                    <textarea class="header-title-3 experiment-evaluate" id="stuResult"<#if (studentRecord.grade)?if_exists>disabled="disabled" </#if> placeholder="请输入你的实验结果">${(studentRecord.result)!''}</textarea>
                </div>

                <div>
               		 <#if !(studentRecord.grade)?if_exists>
                    <div class="experiment-uploadfile-button">
                        <input class="input-uploadfile-button" type="file" mutiple="mutiple" capture="exp" id="exp" onchange="readImg(this)" name="exp" />
                        <span class="experiment-uploadfile-text">选择文件</span>
                    </div>
                    </#if>
                    <ul class="experiment-resource-list">
                        <li>
							<input id="fileId" value="${(studentRecord.fileId?c)!''}" type="hidden"/>
                            <div class="experiment-resource-download"><a id="fileName"style="cursor:pointer;" >${(studentRecord.fileName)!''}</a></div>
                            <!--<div class="experiment-delete-resource"></div>-->
                        </li>
                    </ul>
                 </div>
				<#if !(studentRecord.grade)?if_exists>
                <div class="experiment-opera">
                    <button id="save" class="btn-save">保存</button>
                    <button id="submit" class="btn-submit">提交</button>
                </div>
				</#if>
            </div>
        </div>
          <!-- 上传文件添加loading -->
        <div class="upload-loading-box" id="loadingBox">
            <div class="wait" id="loadingWait">正在上传，请稍后...</div>
            <div class="success" id="loadingSuccess">上传成功</div>
            <div class="error" id="loadingError">文件上传失败</div>
        </div>
        <input id="record" value="${(studentRecord.id?c)!''}" type="hidden"/>
	<div class="exper-list-bg01"><img src="${ctx}/view/common/assets/pc/image/bg_list_01.png"/></div>
    <div class="exper-list-bg02"><img src="${ctx}/view/common/assets/pc/image/bg_list_02.png"/></div>
    <div class="exper-list-bg03"><img src="${ctx}/view/common/assets/pc/image/bg_list_03.png"/></div>
    </body>
	<script>
		function isNull( str ){
			if ( str == "" ) return true;
			var regu = "^[ ]+$";
			var re = new RegExp(regu);
			return re.test(str);
		}
		$(function(){
			$('#fileName').click(function(){
				var fileId=$('#fileId').val();
		 		window.location.href="${ctx}/localDownload?fileId="+fileId;
			})
	        $(".user-box").hover(function(){
	            $(".nav-user").show();
	        }, function(){
	            $(".nav-user").hide();
	        })
	    })
	    
	 	$('#save').click(function(){
		var id=$("#record").val();
		console.log(id);
	    var Mode;
	    if(id==null||id=='undefine'||id==''){
	    	Mode='Add';
	    	}else{
	    	Mode='Edit';
	    	}
	    	console.log(Mode);
		var stuResult=$("#stuResult").val();
		console.log(stuResult);
		var studentId="${studentId}";
		console.log(studentId);
		var studentName="mz";
		var fileName = '111';
		var eq_scheduleId= '${expId}';
		var fileId=$('#fileId').val();
		var submit= "0";
		console.log(stuResult.length);
		if(!isNull(fileName)&&!isNull(stuResult)){
			ajaxPost(APIS.frmStudentRecord.save, 
	   				 {
	   				 	id: id,
	   				 	Mode: Mode,
						studentId: studentId,
						studentName: studentName,
						eq_scheduleId: eq_scheduleId,
						result: stuResult,
						fileId: fileId,
						submit: submit,
						fileName:fileName
	    			 }, function(data) {
    	    			console.log(data);
    	    			
    	    			if(data.code==0){
    	    			$("#record").val(data.data.id);
    	    				Exp.showToast("保存成功");
    	    			}
    	    			else{
    	    				Exp.showToast(data.msg);
    	    			}
    	    			setTimeout(() => {
        					window.location.reload();
    					}, 3000);
    	    		}
    	    			
    	    	);
    	   }else{
    	   		Exp.showToast("实验结果或文件不能为空！");
    	   }
	   			
	})
	$('#submit').click(function(){
		var id=$("#record").val();
	    var Mode;
	    if(id==null||id=='undefine'||id==''){
	    	Mode='Add';
	    	}else{
	    	Mode='Edit';
	    	}
		var stuResult=$("#stuResult").val();
		var studentId="${studentId}";
		var studentName="mz";
		var fileName = $("#fileName").html();
		var eq_scheduleId= '${expId}';
		console.log(eq_scheduleId);
		var fileId=$('#fileId').val();
		var submit= "1";
		if(!isNull(fileName)&&!isNull(stuResult)){
			ajaxPost(APIS.frmStudentRecord.save, 
	   				 {
	   				 	id: id,
	   				 	Mode: Mode,
						studentId: studentId,
						studentName: studentName,
						eq_scheduleId: eq_scheduleId,
						result: stuResult,
						fileId: fileId,
						submit: submit,
						fileName:fileName

	    			 }, function(data) {
    	    			console.log(data);
    	    			if(data.code==0){
    	    				$("#record").val(data.data.id);
    	    				Exp.showToast("提交成功");
    	    			}
    	    			else{
    	    			Exp.showToast(data.msg);
    	    			}
    	    			setTimeout(() => {
        					window.location.reload();
    					}, 3000);
    	    			
    	    });
    	    }else{
    	    		Exp.showToast("实验结果或文件不能为空！");
    	    }
	  
	})
		function settime(fileid,token){
			  setTimeout(function(){
	            $("#loadingBox").hide();
	            $("#loadingWait").hide();
	            $("#loadingSuccess").hide();
	            $("#loadingError").hide();
        	  }, 5000);
	$.ajaxFileUpload({  
	    url:'${ctx}/localUpload?token='+token,  
	    data:{accessType:"public",module:"experiment",allowFile:"jpg,jpeg,gif,png,bmp,zip,pptx,py,ipynb,doc,docx,xls",maxSize:"9999999",uploadUrl:""},
	    secureuri:false,  
	    fileElementId:fileid,//file标签的id  
	    dataType: 'json',//返回数据的类型   
	    success: function (data) {
	    	console.log(data);
	    	if(data.status!=0){
		    	console.log(data);
		    	var fileName = data.data.filename;
		    	console.log("fileName"+fileName);
		    	console.log(data.data.fileId);
		    		$("#fileName").html(fileName);
					$("#fileId").val(data.data.fileId);
			    	$("#loadingBox").show();
					$("#loadingWait").hide();
					$("#loadingSuccess").show();
		    	}
	    },
	    error: function (data) {  
	        $("#loadingBox").show();
			$("#loadingWait").hide();
			$("#loadingError").show();
	    }  
	});
}

function uploadFile(file){
	debugger;
	var API_PROXY = '';
	var token = '';
	var tokenKey = 'OnClick_pForm_fileName_frmStudentRecord_fileUpload';
	var uiName = "frmStudentRecord";
	var fileid = file.id;
	console.log(file.id);
	$.ajax({
	      type: 'GET',
	      url:  API_PROXY + '/ui/' + uiName + '/app',
	      success: function(data) {;
	        if (data && data.token && data.token.items) {
	          var token = data.token.items[tokenKey];
	          if (token) {
	            console.log(token);
	            settime(fileid,token);
	          } else {
	            console.log('------------------------token的UiName配置错误-------------------');
	          }
	        } else {
	          console.log('------------------------token列表获取失败-----------------------');
	        }
	      }
	    });
	console.log(token);
}
 var date = new Date();
        var seperator1 = "-";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
      if (month >= 1 && month <= 9) {
         month = "0" + month;
      }
     if (strDate >= 0 && strDate <= 9) {
         strDate = "0" + strDate;
      }
     var h=date.getHours();       //获取当前小时数(0-23)
     var m=date.getMinutes();     //获取当前分钟数(0-59)
     var s=date.getSeconds();     //获取当前秒数
       //提价时间
     var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate +" "+ h + ":" + m + ":" + s; 
 
	console.log(currentdate);

function readImg(file) {
	if(file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
		console.log("file"+file);
		}
		reader.readAsDataURL(file.files[0]);
		uploadFile(file);
	} else {
		
	}
}
	
	
</script>
        
</html>