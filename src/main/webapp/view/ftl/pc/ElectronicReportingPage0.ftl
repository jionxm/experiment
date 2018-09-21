
<html lang="en">

<head>
	<#assign ctx = request.contextPath />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="theme-color" content="#000000">
    <title>查看电子报告</title>
     <#include "pc/common/base.ftl">
    <link href="${ctx}/view/common/assets/pc/css/main.1672e1c4.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/view/common/js/ajaxfileupload.js?${date}"></script>
    <style>
        .electronicReporting-uploadfile-btn {
            position: relative;
        }
        .input-uploadfile-button {
            opacity: 0;
            width: 132px;
            height: 29px;
            position: absolute;
            left: 0;
            right: 0;
            background: #fff;
            color: #fff;
        }
    </style>
</head>

<body>
    <div class="App">
        <div class="App-header clearfix">
                <img  src="${ctx}/view/common/assets/pc/img/icon_logo.png" style="width: 93px;position: relative;top: 6px;"></img>
            <span class="App-header-title">AI实验操作系统</span>
        </div>
        <div class="electronicReporting">
            <div class="Segment">
                <div class="Segment-header clearfix">
                    <div class="Segment-selected Segment-select-first">
                        <a href="#" class="Segment-selected-title">电 子 报 告</a>
                    </div>
                    <div class="Segment-select Segment-select-end">
                        <a href="${ctx}/evaluation-achievement?exp=${expId}" class="Segment-select-title">成 绩 评 价</a>
                    </div>
                </div>
                
                <div class="Segment-content">
                    <div class="electronicReporting-container">
                    <#list expScheduleList as m>
                        <div class="headerline-title-1">实验内容</div>
                        
                        <div class="headerline-title-2" style="margin-left: 15px; margin-top: 22px;">实验的目的及要求</div>
                        <div class="headerline-title-3" style="margin-left: 15px; margin-top: 11px; line-height: 29px;"> ${m.demand}</div>
                        <div class="headerline-title-2" style="margin-left: 15px; margin-top: 22px;">软硬件及环境</div>
                        <#list expSoftwareList as software>
                        <div class="headerline-title-3" style="margin-left: 15px; margin-top: 11px; line-height: 29px;"> ${software.name}</div>
                        </#list>
                        <div class="headerline-title-2" style="margin-left: 15px; margin-top: 22px;">实验目标</div>
                        <div class="headerline-title-3" style="margin-left: 15px; margin-top: 11px; line-height: 29px;">${m.target}</div>
                        <div class="headerline-title-2" style="margin-left: 15px; margin-top: 22px;">实验内容与步骤</div>
                        <div class="headerline-title-3" style="margin-left: 15px; margin-top: 11px; line-height: 29px;"> ${m.content}</div>
                        <div class="electronicReporting-line"></div>
                        </#list>
                        <div class="headerline-title-1" style="margin-top: 22px;">实验结果
                        <textarea style="width: 100%; height: 200px; margin-top: 20px;"<#if (studentRecord.grade)?if_exists>disabled="disabled" </#if>placeholder="请输入你的实验结果" id="stuResult"name="result">${(studentRecord.result)!''}</textarea>
                        </div>
                        
                       
                        <div>
                            <div class="electronicReporting-uploadfile-container clearfix">
                            	<input id="fileId" value="${(studentRecord.fileId?c)!''}" type="hidden"/>
                                <div class="electronicReporting-uploadfile-container-item">
                                    <div class="headerline-title-2"id="download"style="cursor:pointer;">点击文件名下载</div>
                                </div>
                                <#if !(studentRecord.grade)?if_exists>
                                <div class="electronicReporting-uploadfile-btn">
                                    <input class="input-uploadfile-button" type="file" accept="image/*" mutiple="mutiple" capture="exp" id="exp" onchange="readImg(this)" name="exp"/>
                                    <span class="electronicReporting-uploadfile-btn-text">选择文件</span>
                                    
                                    
                                </div>
                                </#if>
                            </div>
                            <div class="electronicReporting-uploadfile clearfix">
                                <span class="electronicReporting-uploadfile-btn-text1"id="fileName"style="cursor:pointer;">${(studentRecord.fileName)!''}</span>
                            </div>
                         
                        </div>
        				<#if !(studentRecord.grade)?if_exists>
                        <div class="clearfix" style="margin-top: 30px;">
                            <div class="submt-btn clearfix">
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAPCAYAAADtc08vAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDphZWM0M2M0YS0wYzdkLTA1NGUtOGQ0YS0zMWNmMzA3NmU3ZTIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QkQ5MDI5NUU5ODdDMTFFODgwNzE4RkY0MDQ4MjMzRDAiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QkQ5MDI5NUQ5ODdDMTFFODgwNzE4RkY0MDQ4MjMzRDAiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3NGMxYjY5NS05MGVkLTRlMWUtYTAzZi00NDEwYjNiZDhlZWQiIHN0UmVmOmRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDowMjAzMTE0ZS1kMWYxLTExN2ItODU4Mi04MWI1OTZjZjNlYTMiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz5SF2iZAAABFElEQVR42sTTv0oDQRDH8c26Sfx3pJCAhX1KIQ8jgo2V2FjYSlot7GzsfQIbC5sgPkAEmwRBELFXUQs9Jet39Cesx4kRiwx8jhyzOzu7e6nEGBedc1u4xzwukGPCfYbHG27QxhweNP4o8FjFC/ZxgB0NnlWBKA0soIltHKMVlOjhHHfo49F9j0l0MMAVLjU282p3CkHtevdzWK6u36/WuU/adNrrsGRiVYs8F/KVdDVLTKNWUuBJZ2QLZWkiJHsc6vBOdR61wi1cYwm76dy0gMU6lvWeF7qwLWzisKyDr7hVqyOHd/+MsRb4+EJ9cr9/DZuX2SGeYU13XR2hq1z/CbvmrhXYwwxW9H3HXwoE2cDJuwADAEI7PSVARwBxAAAAAElFTkSuQmCC"
                                    class="submit_btn_title_img">
                                <span id="save" style="cursor:pointer;"class="submt-btn-text">保存</span>
                            </div>
                            <div class="submt-btn clearfix">
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDphZWM0M2M0YS0wYzdkLTA1NGUtOGQ0YS0zMWNmMzA3NmU3ZTIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QkVEMURDQjE5ODdDMTFFODgwNzE4RkY0MDQ4MjMzRDAiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QkVEMURDQjA5ODdDMTFFODgwNzE4RkY0MDQ4MjMzRDAiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3NGMxYjY5NS05MGVkLTRlMWUtYTAzZi00NDEwYjNiZDhlZWQiIHN0UmVmOmRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDowMjAzMTE0ZS1kMWYxLTExN2ItODU4Mi04MWI1OTZjZjNlYTMiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz47+OzxAAABFElEQVR42pTSz0oCURTH8TNqiIsIMtGNLVoFES3CCBcuEhGaZU/Qstb1Cr1AL9ATuK6NIGHYIloOuNWWIoGQRDZ+T50BEa/MHPgwf7i/OzNnjheG4a2IXCCPmbjLww9ecY2pRzjgZB9tpJFyhL9whCJ2MRDC73iBxOCH/1XWa33KL7ISr3qo/T2VykiyGuEZx9hLGtaqoouPVMJgzYITNFaF9fvv4S/dP0PHXv0AgXbwzUQdzWFsXfXtXt2uhyhFa1eFVQE9C9zZsY+dxXWusNIBerJggK3lNesaxtbSxCUq+MQpHlESG8W0jZ6rHqy7Whu24XY0JJs4xI0tcL2NTuKJnX9HYd35HFcx/rOGWva7ZC7AAMeJ8AwqafJ5AAAAAElFTkSuQmCC"
                                    class="submit_btn_title_img">
                                <span id="submit"style="cursor:pointer;" class="submt-btn-text">提交</span>
                            </div>
                        </div>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
		$('#fileName').click(function(){
		var fileId=$('#fileId').val();
		 window.location.href="${ctx}/localDownload?fileId="+fileId;
		})
		$('#download').click(function(){
		var fileId=$('#fileId').val();
		 window.location.href="${ctx}/localDownload?fileId="+fileId;
		})
	 	$('#save').click(function(){
		var id='${(studentRecord.id?c)!''}';
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
		var fileName = "file";
		var eq_scheduleId= '${expId}';
		console.log(eq_scheduleId);
		console.log(eq_scheduleId);
		var fileId=$('#fileId').val();
		var submit= "0";
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
    	    			alert("保存成功");
    	    			}
    	    			else{alert(data.msg);}
    	    			}
    	    	);
    	   
	   			
	})
	$('#submit').click(function(){
		var id='${(studentRecord.id?c)!''}';
	    var Mode;
	    if(id==null||id=='undefine'){
	    	Mode='Add';
	    	}else{
	    	Mode='Edit';
	    	}
		var stuResult=$("#stuResult").val();
		var studentId="${studentId}";
		var studentName="mz";
		var fileName = "file";
		var eq_scheduleId= '${expId}';
		console.log(eq_scheduleId);
		var fileId=$('#fileId').val();
		var submit= "1";
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
    	    			alert("提交成功");
    	    			}
    	    			else{alert(data.msg);}
    	    });
	  
	})
		function settime(fileid,token){
	$.ajaxFileUpload({  
	    url:'${ctx}/localUpload?token='+token,  
	    data:{accessType:"public",allowFile:"jpg,jpeg,gif,png,bmp,zip,pptx,py,ipynb,doc,docx,xls",maxSize:"9999999",uploadUrl:""},
	    secureuri:false,  
	    fileElementId:fileid,//file标签的id  
	    dataType: 'json',//返回数据的类型   
	    success: function (data) {
	    	console.log(data);
	    	if(data.status!=0){
	    	console.log(data);
	    	var fileNames=data.data.url.split("/");
	    	var fileName = fileNames[fileNames.length-1];
	    	console.log("fileName"+fileName);
	    	console.log(data.data.fileId);
	    		$("#fileName").html(fileName);
				$("#fileId").val(data.data.fileId);
		    	alert('上传成功');
	    	}
	    },
	    error: function (data) {  
	        alert('文件上传失败，请重新上传');  
	    }  
	});
}

function uploadFile(file){
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