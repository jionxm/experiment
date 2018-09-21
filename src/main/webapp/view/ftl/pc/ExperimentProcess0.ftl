<html lang="en">

<head>
	<#assign ctx = request.contextPath />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="theme-color" content="#000000">
    <title>实验过程</title>
    <#include "pc/common/base.ftl">
    <link href="${ctx}/view/common/assets/pc/css/main.1672e1c4.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/view/common/assets/pc/css/experimentProcess.css" rel="stylesheet" type="text/css">
 	<script src="${ctx}/view/common/js/ajaxfileupload.js?${date}"></script>
 	 <script type="text/javascript" src="${ctx}/view/common/assets/pc/js/guacamole-common-0.9.14-all.min.js" ></script>
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
        <div class="container_process clearfix" style="width: 100%; padding: 0 20px; max-width: 100%;">
            <div class="left-content" id="leftContent">
                <div class="icon-close-left" id="closeLeftContent"></div>
                <div class="Segment">
                    <div class="Segment-header clearfix">
                        <div class="Segment-selected Segment-select-first cur_point" id="tabTitle1">
                            <span class="Segment-selected-title">实验指导书</span>
                        </div>
                        <div class="Segment-select Segment-select-end cur_point" id="tabTitle2">
                            <span class="Segment-select-title">实验报告在线编写</span>
                        </div>
                    </div>
                    <div class="Segment-content">
                        <div class="experiment-instruction" id="tabContent1" style="overflow-y: scroll; overflow-x: visible;" >
                        <#list expScheduleList as m> 
                            <div>
                                <h1 class="second-title">实验概述</h1>
                                <p class="experiment-info">${m.demand} </p>
                            </div>
                            <div style="margin-top: 20px;">
                                <h1 class="second-title">实验目标</h1>
                                <p class="experiment-info">${m.target}</p>
                            </div>
                            <div style="margin-top: 30px;">
                                <h1 class="second-title">实验内容与步骤</h1>
                                <p class="experiment-info">${m.content}</p>
                            </div>
                            </#list>
                            <div>
                                <h1 class="second-title">附件列表</h1>
                                <#list expFileList as file>
                                        <a style="cursor:pointer;" href="${ctx}/localDownload?fileId=${file.fileId?c}"><p class="experiment-info">${file.fileName}</p></a>
                                 </#list>
                            </div>
                        </div>
                        <div class="experiment-instruction dis_n" id="tabContent2" style="padding-left: 35px; overflow-y: scroll; overflow-x: visible;">

                            <div class="segment-left-header">
                                <div class="segment-left-title selected cur_point" id="littleTabTitle1">实<br>验<br>内<br>容</div>
                                <div class="segment-left-title cur_point" id="littleTabTitle2">实<br>验<br>结<br>果</div>
                            </div>
                            <div class="segment-left-body">
                            	
                                <div class="segment-left-content" id="littleTabContent1">
                                	<#list expCase as m>
                                    <div>
                                        <h1 class="second-title"> ${m.name}</h1>
                                        <p class="experiment-info">实验名称：${m.egName} 学生名称  <#list studentRecord as stu> ${stu.studentName} </#list></p>
                                        <p class="experiment-info">指导教师：${m.teacherName}实验日期 ${m.updateTime}</p>
                                    </div>
        							</#list>
        							<#list expScheduleList as m>
                                    <div>
                                        <h1 class="second-title">实验内容</h1>
                                        <h1 class="second-title" style="font-size:14px;">实验的目的及要求</h1>
                                        <p class="experiment-info"> ${m.reportDemand}</p>
                                        <h1 class="second-title" style="font-size:14px;">软硬件及环境</h1>
                                        <#list expSoftwareList as software>
                                        <p class="experiment-info">${software.name}</p>
                                        </#list>
                                    </div>
                                    <div>
                                        <h1 class="second-title" style="font-size:14px;">实验目标</h1>
                                        <p class="experiment-info">${m.reportTarget} </p>
                                    </div>
        
                                    <div>
                                        <h1 class="second-title" style="font-size:14px;">实验内容与步骤</h1>
                                        <p class="experiment-info">${m.reportContent} </p>
                                    </div>
                                    </#list>
                                </div>
                               <div class="segment-left-content dis_n" id="littleTabContent2">
                                    <div>
                                        <h1 class="second-title">实验结果</h1>
                                        <textarea style="width: 100%; height: 200px; margin-top: 20px;"<#if (studentRecord.grade)?if_exists>disabled="disabled" </#if>placeholder="请输入你的实验结果" id="result">${(studentRecord.result)!''}</textarea>
                                    	<#if !(studentRecord.grade)?if_exists><button class="default-button btn-save-experiment" id="save">保存</button><button class="default-button btn-submit-experiment" id="submit">提 交</button></#if>
                                    </div>
                                    
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
										  <div>
                                			<span class="electronicReporting-uploadfile-btn-text1"id="fileName"style="cursor:pointer;">${(studentRecord.fileName)!''}</span>
                            			  </div>
										
									</div>
									
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-content" id="rightContent">
                <div class="icon-show-left" id="showLeftContent"></div>
                <div class="environment-top">
                    <h2 class="environment-title fl">实验环境</h2>
                    <div style="cursor: pointer;" class="countdown fr" id="btnExperimentOver">倒计时：<span class="fs16"  id="experimentOverTime">${expScheduleList[0].countDown}</span></div>
                    <a href="${ctx}/experiment-list" style="display: block; padding-left: 35px" class="stop-experiment fl">结束实验</a>
                </div>
                <#if expOperateList[0].name =="Juypter">
                <div class="experiment-run" id="iconRunExperiment"></div>
                <div class="environment-content" id="experimentContent">
                	<iframe width="100%" style="border:1px solid #368ae3" id="jupyterIframe"src="http://117.50.17.174:8000/hub/login?username=jia"></iframe>
                	<div class="environment-result dis_n" id="experimentResult">
                        <h1 class="second-title">实验结果</h1>
                        <img style="margin-top: 10px" src="${ctx}/view/common/assets/pc/img/bg_experiment_result.png"/>
                    </div>
                </div>
        	   <div class="layout" id="layoutBox"></div>
        	   <div class="experiment-over-prompt" id="experimentOverBox">
            	    <div class="icon-close-experiment-over" id="closeExperimentOverBox"></div>
            		<div class="prompt">您的实验<span style="color: #ff5d31; font-size: 12px"> 5 </span>分钟后结束<br>请及时保存提交实验报告</div>
            		<div class="experiment-over-btnsure default-button" id="experimentOverBtn">确 定<span class="arrow-bottom"></span></button>
        	   </div>
        	   <#else>
        	   <div class="experiment-run" id="iconRunExperiment2"></div>
                <div class="environment-content" id="experimentContent">
                    <div class="environment-content-tab" id="environmentTabID">
                        <div class="environment-content-tab-title  cur_point posi1 selected">
                            <span class="icon-close"></span>
                            虚拟机1
                        </div>
                        <div class="environment-content-tab-title  cur_point posi1">
                            <span class="icon-close"></span>
                            虚拟机2
                            <span class="no-read"></span>
                        </div>
                        <div class="environment-content-tab-title cur_point posi1">
                            <span class="icon-close"></span>
                            虚拟机3
                            <span class="no-read"></span>
                        </div>
                    </div>
                    <div class="virtual-container" id="environmentTabContainer">
                        <div class="virtual-item " style="display: block;">

                        </div>
                        <div class="virtual-item" style="display: none;">

                        </div>
                        <div class="virtual-item" style="display: none;">

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layout" id="layoutBox"></div>
        <div class="experiment-over-prompt" id="experimentPromptBox">
            <div class="icon-close-experiment-over" id="closeExperimentPromptBox"></div>
            <div class="prompt">本次实验即将开启3个虚拟机</div>
            <button class="experiment-over-btnsure default-button" id="experimentPromptBtn">确 定<span class="arrow-bottom"></span></button>
        </div>
        </#if>
    </div>
    <script>
    	 var tabindexid = 0;
        $(function(){
        	
        	var iframeHeight = window.innerHeight;
        	console.log(iframeHeight);
            $("#tabContent1").css("height", iframeHeight-160);
            $("#tabContent2").css("height", iframeHeight-160);
            $("#jupyterIframe").css("height", iframeHeight-160);
        
            /*初始化虚拟机 现在的功能是根据现有页面的 virtual-item的个数进行创建，实际情况，根据后端传回来的数据，进行虚拟键创建和tab的展示。*/
            $("#environmentTabContainer").children().each(function(index,display){
                console.log('initial virtual start:' + index);
            
                //这里填写实现了隧道的servlet的访问地址。也就是服务端隧道的访问地址。
                var guac = new Guacamole.Client(
                    new Guacamole.HTTPTunnel("http://10.7.11.35:8080/my-guacamole/tunnel" + index)
                );

                // 将显示虚拟机的节点添加到页面上
                display.appendChild(guac.getDisplay().getElement());

                // 错误处理的回调接口
                guac.onerror = function(error) {
                    //alert(error);
                };

                // 上边完毕后，执行连接操作。
                guac.connect();

                // 当关闭后要执行的操作放在这里
                window.onunload = function() {
                    guac.disconnect();
                }

                // 以下是对鼠标的配置，无特殊情况不可更改
                var mouse = new Guacamole.Mouse(guac.getDisplay().getElement());

                mouse.onmousedown =
                mouse.onmouseup   =
                mouse.onmousemove = function(mouseState) {
                    guac.sendMouseState(mouseState);
                };

                // 以下是对键盘的处理，无特殊情况不可更改
                var keyboard = new Guacamole.Keyboard(document);

                keyboard.onkeydown = function (keysym) {
                    console.log("onKeyDown:" + index);
                    if(index === tabindexid){
                        guac.sendKeyEvent(1, keysym);
                    }


                };

                keyboard.onkeyup = function (keysym) {
                    console.log("onkeyup:" + index);
                    if(index === tabindexid){
                        guac.sendKeyEvent(0, keysym);
                    }

                };

                console.log('initial virtual end:' + index);
            })

            /*虚拟机的选项卡*/
            $("#environmentTabID").children().each(function(index,value){
                $(value).click(function(){
                    tabindexid = index;
                    $(this).siblings().removeClass("selected");
                    $(this).addClass("selected");
                    
                    
                    var display = $(".virtual-item")[index];
                    $(display).show();
                    $(display).siblings().hide();
                })

            });
    	$('#fileName').click(function(){
		var fileId=$('#fileId').val();
		 window.location.href="${ctx}/localDownload?fileId="+fileId;
		})
    	$('#download').click(function(){
		var fileId=$('#fileId').val();
		 window.location.href="${ctx}/localDownload?fileId="+fileId;
		})
            /*左侧tab切换*/
        $("#tabTitle1").click(function(){
                $(this).next().removeClass("Segment-selected").addClass("Segment-select");
                $(this).removeClass("Segment-select").addClass("Segment-selected");
                $(this).next().children().removeClass("Segment-selected-title").addClass("Segment-select-title");
                $(this).children().removeClass("Segment-select-title").addClass("Segment-selected-title");
                $("#tabContent1").show();
                $("#tabContent2").hide();
            })
       $("#tabTitle2").click(function(){
                $(this).prev().removeClass("Segment-selected").addClass("Segment-select");
                $(this).removeClass("Segment-select").addClass("Segment-selected");
                $(this).prev().children().removeClass("Segment-selected-title").addClass("Segment-select-title");
                $(this).children().removeClass("Segment-select-title").addClass("Segment-selected-title");
                $("#tabContent2").show();
                $("#tabContent1").hide();
            })
            /*左侧小切换*/
       $("#littleTabTitle1").click(function(){
                $(this).next().removeClass("selected");
                $(this).addClass("selected");
                $("#littleTabContent1").show();
                $("#littleTabContent2").hide();
        })
        $("#littleTabTitle2").click(function(){
                $(this).prev().removeClass("selected");
                $(this).addClass("selected");
                $("#littleTabContent2").show();
                $("#littleTabContent1").hide();
        })

            

        $("#closeLeftContent").click(function(){
                $("#leftContent").hide(500);
                $("#showLeftContent").show();
                $("#rightContent").animate({'width': '100%'}, 1000);
        })

        $("#editorFullScreen").click(function(){
                $("#leftContent").hide(500);
                $("#showLeftContent").show();
                $("#rightContent").animate({'width': '100%'}, 1000);
            })

        $("#showLeftContent").click(function(){
                $("#leftContent").show(500);
                $("#showLeftContent").hide();
                $("#rightContent").animate({'width': 'calc(100% - 322px)'}, 1000);
        })
			 //运行按钮
        $("#iconRunExperiment2").click(function(){
                $("#layoutBox").show();
                $("#experimentPromptBox").show();
        })
              //关闭弹窗
        $("#experimentPromptBtn").click(function(){
                $("#layoutBox").hide();
                $("#experimentPromptBox").hide();
                $("#iconRunExperiment2").hide();
                $("#experimentContent").show();
                 countTime();
        })
            //结束实验
        $("#btnExperimentOver").click(function(){
                $("#layoutBox").show();
                $("#experimentOverBox").show();
        })
        $("#experimentOverBtn").click(function(){
                $("#layoutBox").hide();
                $("#experimentOverBox").hide();
        })
        $("#closeExperimentOverBox").click(function(){
                $("#layoutBox").hide();
                $("#experimentOverBox").hide();
       })

       $("#iconRunExperiment").click(function(){
                $("#iconRunExperiment").hide();
                $("#experimentContent").show();
                countTime();
       })
   })
       $('#save').click(function(){
		var id='${(studentRecord.id?c)!''}';
	    var Mode;
	    if(id==null||id=='undefine'||id==''){
	    	Mode='Add';
	    	}else{
	    	Mode='Edit';
	    	}
		var stuResult=$("#result").val();
		var studentId="${studentId}";
		var studentName="mz";
		var fileName = "file";
		var eq_scheduleId= '${expId}';
		console.log(eq_scheduleId);
		var fileId=$('#fileId').val();
		var submit= "0";
		ajaxPost(APIS.frmStudentRecord.save, 
	   				 {
	   				 	id: id,
	   				 	Mode:Mode,
	   				 	fileName: fileName,
						studentId: studentId,
						studentName: studentId,
						eq_scheduleId: eq_scheduleId,
						result: stuResult,
						fileId: fileId,
						submit: submit
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
	    if(id==null||id=='undefine'||id==''){
	    	Mode='Add';
	    	}else{
	    	Mode='Edit';
	    	}
		var stuResult=$("#result").val();
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
	   				 	Mode:Mode,
	   				 	fileName: fileName,
						studentId: studentId,
						studentName: studentId,
						eq_scheduleId: eq_scheduleId,
						result: stuResult,
						fileId: fileId,
						submit: submit

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
	    	var fileNames=data.data.url.split("/");
	    	var fileName = fileNames[fileNames.length-1];
	    	console.log("fileName"+fileName);
	    	console.log(data.data.fileId);
	    		$("#fileName").html(fileName);
				$("#fileId").val(data.data.fileId);
		    	alert('上传成功');
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
		}
		reader.readAsDataURL(file.files[0]);
		uploadFile(file);
	} else {
		
	}
}
/* 倒计时 **/
            function countTime(){
                var date = new Date();
                var now = date.getTime();
                var countDown = "${expScheduleList[0].countDown}";
                console.log(countDown);
                var endDate = new Date(countDown);
                console.log('endDate:'+endDate);
                var after = endDate.getTime() - now;
                
                var d, h, m, s;
                if(after >= 0){
                    d = Math.floor(after/1000/60/60/24);
                    h = Math.floor(after/1000/60/60%24);
                    m = Math.floor(after/1000/60%60);
                    s = Math.floor(after/1000%60);
                    $("#experimentOverTime").html(d + "天" + h + "小时" + m + "分钟" + s + "秒");

                    setTimeout(countTime, 1000);
                }else {
                    $("#experimentOverTime").html("00 : 00 : 00");
                }
            }
    </script>
	</body>
</html>