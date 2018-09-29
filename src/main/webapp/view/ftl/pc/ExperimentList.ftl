<html lang="en">

    <head>
		<#assign ctx = request.contextPath />
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="theme-color" content="#000000">
        <title>实验列表</title>
        <link href="${ctx}/view/common/assets/pc/css/normalize.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/view/common/assets/pc/css/public.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/view/common/assets/pc/css/experimentList.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="${ctx}/view/common/assets/pc/js/jquery-1.11.0.min.js" ></script>       
		<#include "pc/common/base.ftl">
	</head>

    <body>
        
        <header>
            <div class="logo"></div>
            <nav>
                <li>实验中心</li>
            </nav>
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

        <div class="container" style="margin-bottom: 60px;">
			<#if aiList>
            <div class="class-box">
                <div class="tips"></div>
                <#list aiList as ai>
                <#if ai.courseName>
                <h3>${ai.courseName }</h3>
                <h5></h5>

                <ul class="text-list clearfix">
					<#list aiList2 as ai2>
					<#if ai2.courseName==ai.courseName>
                    <li>
                        <img class="text-image" src="${ctx}/localDownload?fileId=${ai2.picId?c}">
                        <div class="text-content">
                            <div class="text-top">
                                <div class="text-title">${ai2.name}</div>
                                <div class="text-time">截止时间: ${ai2.endTime}</div>
                                <div class="text-opera">
                                    <a href="${ctx}/electronic-reporting-page?exp=${ai2.id}" target="_blank"class="button-default text-button mr12">报告</a>
                                    <a href="${ctx}/evaluation-achievement?exp=${ai2.id}"target="_blank" class="button-default text-button">成绩</a>
                                </div>
                            </div>
                            <div class="text-bottom">
                                <div class="text-people">老师: ${ai2.teacherName}</div>
                                <a <#if ai2.status=="1">href="${ctx}/experiment-process?exp=${ai2.id}" <#else>href="javascript:volid(0);"  style="background-color:#C0C0C0"</#if>target="_blank"class="text-go-experiment">去实验 ></a>
                            </div> 
                        </div>
                    </li>
                    </#if>
					</#list>                    
                </ul>
                </#if>
</#list>
            </div>
			</#if>
			<#if aiList2>
            <div class="class-box">
                <div class="tips"></div>
               
                <h3>其他实验课程</h3>
                <h5></h5>
				
                <ul class="text-list clearfix">
					<#list aiList2 as ai2>
				<#if (ai2.courseName)??>
				<#else>
                    <li>
                        <img class="text-image" src="${ctx}/localDownload?fileId=${ai2.picId?c}">
                        <div class="text-content">
                            <div class="text-top">
                                <div class="text-title">${ai2.name}</div>
                                <div class="text-time">截止时间: ${ai2.endTime}</div>
                                <div class="text-opera">
                                    <a href="${ctx}/electronic-reporting-page?exp=${ai2.id}" target="_blank"class="button-default text-button mr12">报告</a>
                                    <a href="${ctx}/evaluation-achievement?exp=${ai2.id}"target="_blank" class="button-default text-button">成绩</a>
                                </div>
                            </div>
                            <div class="text-bottom">
                                <div class="text-people">老师: ${ai2.teacherName}</div>
                                <a <#if ai2.status=="1">href="${ctx}/experiment-process?exp=${ai2.id}" <#else>href="javascript:volid(0);"  style="background-color:#C0C0C0"</#if>target="_blank"class="text-go-experiment">去实验 ></a>
                            </div> 
                        </div>
                    </li>
                    </#if>
                </#list>
					                    
                </ul>
            </div>
			</#if>
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