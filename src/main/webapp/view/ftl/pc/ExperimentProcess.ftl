<html lang="en">

<head>
	<#assign ctx = request.contextPath />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="theme-color" content="#000000">
    <title>实验过程--编辑器</title>
    <link href="${ctx}/view/common/assets/pc/css/normalize.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/view/common/assets/pc/css/public.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/view/common/assets/pc/css/experimentProcess.css" rel="stylesheet" type="text/css">
	<#include "pc/common/base.ftl">
	<script src="${ctx}/view/common/js/ajaxfileupload.js?${date}"></script>
	<script src="${ctx}/view/common/assets/pc/js/guacamole-common-0.9.14-all.min.js"></script>
</head>

<body>
    <header>
        <div class="logo"></div>
        <div class="experiment-title">${expScheduleList[0].name}</div>
        <div class="user-box">
                <div class="user-info clearfix">
                    <img class="user-head src-head" src="${ctx}/view/common/assets/pc/image/icon_user_head.jpg">
                    <span class="user-nick">贾文佳</span>
                </div>
                <ul class="nav-user clearfix">
                    <li>
                        <a href="#">个人中心</a>
                    </li>
                    <li>
                        <a href="#">安全退出</a>
                    </li>
                </ul>
            </div>
    </header>

    <div class="big-container clearfix" style="margin-top: 20px; padding-bottom: 0">
        <div class="left-content" id="leftContent">
            <div class="icon-close-left" id="closeLeftContent"></div>

            <div>
                <div class="segment-header clearfix">
                    <div class="segment-select-title cur_point actived" id="tabTitle1">实验指导书</div>
                    <div class="segment-select-title cur_point" id="tabTitle2"> 实验报告在线编写</div>
                </div>
                <div class="segment-content">
					<#list expScheduleList as m> 
                    <div class="experiment-instruction" id="tabContent1">
                        <div>
                            <div class="header-title-1">实验概述</div>
                            <div class="header-title-3">${m.demand}</div>
                        </div>
                        <div style="margin-top: 20px;">
                            <div class="header-title-1">实验目标</div>
                            <div class="header-title-3">${m.target}</div>
                        </div>
                        <div style="margin-top: 20px;">
                            <div class="header-title-1">学前建议</div>
                            <div class="header-title-3">${m.content}</div>
                        </div>
                         <div>
                                <h1 class="header-title-1">附件列表</h1>
                                <#list expFileList as file>
                                        <a style="cursor:pointer;" href="${ctx}/localDownload?fileId=${file.fileId?c}"><p class="experiment-info">${file.fileName}</p></a>
                                 </#list>
                           </div>
                    </div>

                    <div class="experiment-instruction dis_n" id="tabContent2">

                        <div class="segment-second-header">
                            <div class="segment-second-title actived cur_point" id="littleTabTitle1">实验内容</div>
                            <div class="segment-second-title cur_point" id="littleTabTitle2">实验结果</div>
                        </div>

                        <div class="segment-second-body">
                            <div class="segment-second-content" id="littleTabContent1">
                                <#if m.reportTarget>
                                <div class="header-title-2">实验需求</div>
                                <div class="header-title-3">${m.reportTarget}</div>
                                </#if>
                
                                <#if expSoftwareList>
                                <div class="header-title-2">软硬件及环境</div>
                                <#list expSoftwareList as software>
                                        <p class="experiment-info">${software.name}</p>
                                </#list>
                				</#if>
                
                                <#if m.reportTarget>
                                <div class="header-title-2">实验目标</div>
                                <div class="header-title-3">${m.reportTarget}</div>
                                </#if>
                
                                <#if m.reportContent>
                                <div class="header-title-2">实验步骤</div>
                                <div class="header-title-3">${m.reportContent}</div>
                                </#if>
                            </div>
                            <div class="segment-second-content dis_n" id="littleTabContent2">
                                <div>
                                    <div class="header-title-2">实验结果</div>
                                    <textarea class="header-title-3 experiment-evaluate" id="result" <#if (studentRecord.grade)?if_exists>disabled="disabled" </#if> placeholder="请输入你的实验结果">${(studentRecord.result)!''}</textarea>
                                </div>

                                <div>
                                	<input id="fileId" value="${(studentRecord.fileId?c)!''}" type="hidden"/>
                                	<#if !(studentRecord.grade)?if_exists>
                                    <div class="experiment-uploadfile-button">
                                        <input class="input-uploadfile-button" type="file" accept="image/*" mutiple="mutiple" capture="exp" id="exp" onchange="readImg(this)" name="exp"/>
                                        <span class="experiment-uploadfile-text">选择文件</span>
                                    </div>
                                    </#if>
                                    <ul class="experiment-resource-list">
                                        <li>
                                            <div class="experiment-resource-download"><a href="${ctx}/localDownload?fileId=${(studentRecord.fileId?c)!''}"id="fileName">${studentRecord.fileName}</a></div>
                                            <!--<div class="experiment-delete-resource"id="delete"></div>-->
                                        </li>
                                    </ul>
                                </div>
                				<#if !(studentRecord.grade)?if_exists>
                                <div class="experiment-opera">
                                    <button class="btn-save"id="save">保存</button>
                                    <button class="btn-submit"id="submit">提交</button>
                                </div>
                                </#if>
                            </div>
                            </#list>
                        </div>

                    </div>
                </div>
            </div>
        </div>
	<#if expOperateList[0].name =="Juypter">
        <div class="right-content" id="rightContent" style="height: 598px;">
            <div class="icon-show-left" id="showLeftContent"></div>

            <div class="environment-top">
                <span class="environment-head fl" id="environmentHead">实验环境</span>
                <a href="javascript:volid(0);" class="stop-experiment fr" id="overTest">结束实验</a>
                <div class="countdown fr" id="btnExperimentOver">倒计时：<span id="experimentOverTime">${expScheduleList[0].countDown1}</span></div>
            </div>
			
            <div class="environment-content" id="experimentContent" style="display: block">
                <iframe width="100%" height="590" style="border: 1px solid #368ae3" id="jupyterIframe" src="http://117.50.17.174:8000/hub/login?username=jia"></iframe>
            </div>
         </div>
         
         <!-- 结束实验确认 -->
        <div class="experiment-over-prompt" id="overTestMsg">
            <div class="experiment-over-prompt-bg"></div>
            <div class="icon-close-experiment-over" id="overTestCloseBtn"></div>
            <div class="prompt">确定结束吗</div>
            <div style="height: 54px;">
                <button class="experiment-close-btn button-yellow fl" id="overTestYesBtn" style="margin-left: 50px">确定</button>
                <button class="experiment-close-btn button-blue fr" id="overTestNoBtn" style="margin-right: 50px">取消</button>
            </div>
        </div>
        <!-- 时间结束确认 -->
        <div class="experiment-over-prompt"  id="overTimeBox">
            <div class="experiment-over-prompt-bg"></div>
            <div class="prompt">本次实验已结束</div>
            <button class="experiment-over-btnsure button-yellow" id="overTimeBtn">确 定</button>
        </div>
        
     <#else>
         <div class="right-content" id="rightContent">
            <div class="icon-show-left" id="showLeftContent"></div>
            <div class="environment-top">
                <span class="environment-head fl">实验环境</span>
                <a href="javascript:volid(0);" class="stop-experiment fr" id="overTest">结束实验</a>
                <div class="countdown fr" id="btnExperimentOver">倒计时：<span id="experimentOverTime">${expScheduleList[0].countDown1}</span></div>
            </div>
            <div class="experiment-run" id="runExperimentContent">
                	<div class="icon-run" id="iconRunExperiment"></div>
            </div>

            <div class="environment-content" id="experimentContent">
                <div class="environment-content-tab" id="environmentTabID">
                    	<div class="environment-content-tab-title  cur_point posi1 selected">
                        	<span class="icon-close"></span>虚拟机1
                    	</div>
                    	<div class="environment-content-tab-title  cur_point posi1">
                        	<span class="icon-close"></span>虚拟机2
                    	</div>
                   		<div class="environment-content-tab-title cur_point posi1">
                        	<span class="icon-close"></span>虚拟机3
                    	</div>
                </div>
                <div class="virtual-container" id="environmentTabContainer">
                    	<div class="virtual-item" style="display: block;"></div>
                    	<div class="virtual-item" style="display: none;"></div>
                    	<div class="virtual-item" style="display: none;"></div>
                </div>
           	</div>
        </div>
            
        <div class="layout" id="layoutBox"></div>

        <!-- 开启虚拟机-弹窗  -->
        <div class="experiment-over-prompt" id="experimentPromptBox">
            <div class="experiment-over-prompt-bg"></div>
            <div class="icon-close-experiment-over" id="closeExperimentPromptBox"></div>
            <div class="prompt">本次实验即将开启3个虚拟机</div>
            <button class="experiment-over-btnsure button-yellow" id="experimentPromptBtn">确 定</button>
        </div>
		<!-- 倒计时时间弹框  -->
        <div class="experiment-over-prompt" id="stopTimeBox">
            <div class="experiment-over-prompt-bg"></div>
            <div class="icon-close-experiment-over" id="closetimeBox"></div>
            <div class="prompt">实验时间还剩五分钟!</div>
            <button class="experiment-over-btnsure button-yellow" id="timeBtn">确 定</button>
        </div>
        <!-- 结束实验确认 -->
        <div class="experiment-over-prompt" id="overTestMsg">
            <div class="experiment-over-prompt-bg"></div>
            <div class="icon-close-experiment-over" id="overTestCloseBtn"></div>
            <div class="prompt">确定结束吗</div>
            <div style="height: 54px;">
                <button class="experiment-close-btn button-yellow fl" id="overTestYesBtn" style="margin-left: 50px">确定</button>
                <button class="experiment-close-btn button-blue fr" id="overTestNoBtn" style="margin-right: 50px">取消</button>
            </div>
        </div>
        <!-- 时间结束确认 -->
        <div class="experiment-over-prompt"  id="overTimeBox">
            <div class="experiment-over-prompt-bg"></div>
            <div class="prompt">本次实验已结束</div>
            <button class="experiment-over-btnsure button-yellow" id="overTimeBtn">确 定</button>
        </div>
        <!-- 开启虚拟机-弹窗  -->
        <div class="experiment-over-prompt" id="experimentVirtualBox">
            <div class="experiment-over-prompt-bg"></div>
            <div class="icon-close-experiment-over" id="closeExperimentVirtualBox"></div>
            <div class="prompt">请选择</div>
            <div style="height: 54px;">
                <button class="experiment-close-btn button-yellow fl" id="closeVirtualBtn" style="margin-left: 50px">关闭</button>
                <button class="experiment-close-btn button-blue fr" id="restartVirtualBtn" style="margin-right: 50px">重启</button>
            </div>
        </div>
        </#if>
    </div>
    <script>
        $(function(){
			$("#environmentTabContainer").children().each(function(index,display){
                console.log('initial virtual start:' + index);
            
                //这里填写实现了隧道的servlet的访问地址。也就是服务端隧道的访问地址。
                var guac = new Guacamole.Client(
                    //new Guacamole.HTTPTunnel("tunnel")
                    new Guacamole.HTTPTunnel("http://aise.tmooc.cn:8080/my-guacamole/tunnel"+index)
                    //new Guacamole.HTTPTunnel("http://10.7.11.35:8080/my-guacamole/tunnel"+index)
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
                    guac.sendKeyEvent(1, keysym);
                };

                keyboard.onkeyup = function (keysym) {
                    guac.sendKeyEvent(0, keysym);
               	} 

                console.log('initial virtual end:' + index);
            })

            /*虚拟机的选项卡*/
            $("#environmentTabID").children().each(function(index,value){
                $(value).click(function(){
                    $(this).siblings().removeClass("selected");
                    $(this).addClass("selected");
                    
                    
                    var display = $(".virtual-item")[index];
                    $(display).show();
                    $(display).siblings().hide();
                })

            });
            getHeight();
            /*左侧大tab切换*/
            $("#tabTitle1").click(function(){
                $(this).next().removeClass("actived");
                $(this).addClass("actived");
                $("#tabContent1").show();
                $("#tabContent2").hide();
            })
            $("#tabTitle2").click(function(){
                $(this).prev().removeClass("actived");
                $(this).addClass("actived");
                $("#tabContent2").show();
                $("#tabContent1").hide();
            })

            /*左侧小切换*/
            $("#littleTabTitle1").click(function(){
                $(this).next().removeClass("actived");
                $(this).addClass("actived");
                $("#littleTabContent1").show();
                $("#littleTabContent2").hide();
            })
            $("#littleTabTitle2").click(function(){
                $(this).prev().removeClass("actived");
                $(this).addClass("actived");
                $("#littleTabContent2").show();
                $("#littleTabContent1").hide();
            })

            //左侧隐藏
            $("#closeLeftContent").click(function(){
                $("#leftContent").hide(500);
                $("#showLeftContent").show();
                $("#rightContent").animate({'width': '100%'}, 1000);
            })

            //显示左侧
            $("#showLeftContent").click(function(){
                $("#leftContent").show(500);
                $("#showLeftContent").hide();
                $("#rightContent").animate({'width': 'calc(100% - 380px)'}, 1000);
            })
			//运行按钮
            $("#iconRunExperiment").click(function(){
                $("#layoutBox").show();
                $("#experimentPromptBox").show();
            })
            //结束实验
            $("#overTest").click(function(){
            	$("#layoutBox").show();
                $("#overTestMsg").show();
            })
            //关闭时间弹窗
            $("#timeBtn").click(function(){
                $("#layoutBox").hide();
                $("#stopTimeBox").hide();
            })
            //关闭时间弹窗
            $("#closetimeBox").click(function(){
                $("#layoutBox").hide();
                $("#stopTimeBox").hide();
            })
            //关闭虚拟机弹窗-显示虚拟机
            $("#experimentPromptBtn").click(function(){
            	countTime();
                $("#layoutBox").hide();
                $("#experimentPromptBox").hide();
                var overTest = document.getElementById("overTest");
                overTest.style.display = "block";
                $("#runExperimentContent").hide();
                $("#experimentContent").show();
            })
            //关闭虚拟机弹窗
            $("#closeExperimentPromptBox").click(function(){
                $("#layoutBox").hide();
                $("#experimentPromptBox").hide();
            })			
            //关闭虚拟机-显示重启或关闭弹窗
            $("#environmentTabID .icon-close").click(function(){
                console.log(123);
                $("#layoutBox").show();
                $("#experimentVirtualBox").show();
            })
            //关闭-显示重启或关闭弹窗
            $("#closeExperimentVirtualBox").click(function(){
                $("#layoutBox").hide();
                $("#experimentVirtualBox").hide();
            })
            //关闭按钮--关闭虚拟机
            $("#closeVirtualBtn").click(function(){
                $("#layoutBox").hide();
                $("#experimentVirtualBox").hide();
            })
            //确定按钮--结束实验
            $("#overTestYesBtn").click(function(){
            	window.location.href="${ctx}/experiment-list";
            })
            //确定按钮--离开实验
            $("#overTimeBtn").click(function(){
            	window.location.href="${ctx}/experiment-list";
            })
            //取消按钮--结束实验
            $("#overTestNoBtn").click(function(){
                $("#layoutBox").hide();
                $("#overTestMsg").hide();
            })
            //关闭结束实验确认弹窗
            $("#overTestCloseBtn").click(function(){
                $("#layoutBox").hide();
                $("#overTestMsg").hide();
            })
          //显示实验总倒计时时间
            var allTime = "${expScheduleList[0].countDown1}"*60*60*1000;
            console.log(allTime);
            
            if(allTime >= 0){
               d = Math.floor(allTime/1000/60/60/24);
               h = Math.floor(allTime/1000/60/60%24);
               m = Math.floor(allTime/1000/60%60);
               s = Math.floor(allTime/1000%60);
               $("#experimentOverTime").html(d + "天" + h + "小时" + m + "分钟" + s + "秒");
           	}else {
               $("#experimentOverTime").html("00 : 00 : 00");
            }
           
        })

        
        function getHeight(){
            var iframeHeight = window.innerHeight;
            console.log(iframeHeight);
            $("#tabContent1").css("height", iframeHeight-160);
            $("#tabContent2").css("height", iframeHeight-160);
            $(".virtual-item").css("height", iframeHeight-160);
            $("#rightContent").css("height", iframeHeight-160);

            
            $("#experimentContent").css("height", iframeHeight-160);
            $("#jupyterIframe").css("height", iframeHeight-160);
        }
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
						fileId:fileId,
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
	console.log(token);
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
	      success: function(data) {
	      	console.log(data);
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
	debugger
	if(file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
		}
		reader.readAsDataURL(file.files[0]);
		uploadFile(file);
	} else {
		
	}
}

var restTime = "${expScheduleList[0].countDown1}"*60*60*1000;
/* 倒计时 **/
function countTime(){
	console.log(restTime);
        
	var d, h, m, s;
	
	if(Math.floor(restTime/1000) == 300){
		$("#stopTimeBox").show();
		console.log("时间弹框");
	}
	
	if(Math.floor(restTime/1000) == 0){
		$("#overTimeBox").show();
		//window.location.href="${ctx}/experiment-list";
	}

	if(restTime >= 0){
		d = Math.floor(restTime/1000/60/60/24);
		h = Math.floor(restTime/1000/60/60%24);
		m = Math.floor(restTime/1000/60%60);
		s = Math.floor(restTime/1000%60);
		$("#experimentOverTime").html(d + "天" + h + "小时" + m + "分钟" + s + "秒");

		setTimeout(countTime, 1000);
		restTime = restTime-1000;
	}else {
  		$("#experimentOverTime").html("00 : 00 : 00");
	}
	
}
	   
    </script>
    <script type="text/javascript" src="${ctx}/view/common/assets/pc/js/jquery-1.11.0.min.js" ></script>
        <script>
            $(function(){
                $(".user-box").hover(function(){
                    $(".nav-user").show();
                }, function(){
                    $(".nav-user").hide();
                })
            })
        </script>
</body>

</html>
