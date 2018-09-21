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
		<#include "pc/common/base.ftl">
	</head>

    <body>
        
        <header>
            <div class="logo"></div>
            <nav>
                <li>学习中心</li>
            </nav>
        </header>

        <div class="container" style="margin-bottom: 60px;">

            <div class="class-box">
                <div class="tips"></div>
                <h3>实验在线课程</h3>
                <h5>参与人数：10人</h5>

                <ul class="text-list clearfix">
					<#list aiList as ai>
                    <li>
                        <img class="text-image" src="${ctx}/localDownload?fileId=${ai.picId?c}">
                        <div class="text-content">
                            <div class="text-top">
                                <div class="text-title">${ai.name}</div>
                                <div class="text-time">上课时间: ${ai.createTime}-${ai.endTime}</div>
                                <div class="text-opera">
                                    <a href="${ctx}/electronic-reporting-page?exp=${ai.id}" target="_blank"class="button-default text-button mr12">报告</a>
                                    <a href="${ctx}/evaluation-achievement?exp=${ai.id}"target="_blank" class="button-default text-button">成绩</a>
                                </div>
                            </div>
                            <div class="text-bottom">
                                <div class="text-people">老师: ${ai.teacherName}</div>
                                <a <#if ai.status=="0">href="${ctx}/experiment-process?exp=${ai.id}" <#else>href="javascript:volid(0);"</#if>target="_blank"class="text-go-experiment">去实验 ></a>
                            </div> 
                        </div>
                    </li>
					</#list>                    
                </ul>

            </div>


            <div class="class-box">
                <div class="tips"></div>
                <h3>实验在线课程</h3>
                <h5>参与人数：10人</h5>

                <ul class="text-list clearfix">
					<#list otherList as other>
                    <li>
                        <img class="text-image" src="${ctx}/localDownload?fileId=${other.picId?c}">
                        <div class="text-content">
                            <div class="text-top">
                                <div class="text-title">${other.name}</div>
                                <div class="text-time">上课时间: ${other.createTime}-${other.endTime}</div>
                                <div class="text-opera">
                                    <a href="${ctx}/electronic-reporting-page?exp=${other.id}" class="button-default text-button mr12">报告</a>
                                    <a href="${ctx}/evaluation-achievement?exp=${other.id}" class="button-default text-button">成绩</a>
                                </div>
                            </div>
                            <div class="text-bottom">
                                <div class="text-people">老师：${other.teacherName}</div>
                                <a <#if ai.status=="0">href="${ctx}/experiment-process?exp=${other.id}"<#else>href="javascript:volid(0);"</#if> class="text-go-experiment">去实验 ></a>
                            </div> 
                        </div>
                    </li>
					</#list>                    
                </ul>
            </div>

        </div>


    </body>
</html>