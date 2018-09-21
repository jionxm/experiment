
<html lang="en">

<head>
	<#assign ctx = request.contextPath />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="theme-color" content="#000000">
    <title>成绩评价</title>
    <link href="${ctx}/view/common/assets/pc/css/main.1672e1c4.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div class="App">
        <div class="App-header clearfix">
                <img  src="${ctx}/view/common/assets/pc/img/icon_logo.png" style="width: 93px;position: relative;top: 6px;"></img>
            <span class="App-header-title">AI实验操作系统</span>
        </div>
        <div class="container_achievement">
            <div class="Segment">
                <div class="Segment-header clearfix">
                    <div class="Segment-selected Segment-select-first">
                        <a href="#" class="Segment-selected-title">成 绩 评 价</a>
                    </div>
                    <div class="Segment-select Segment-select-end">
                        <a href="${ctx}/electronic-reporting-page?exp=${expId}" class="Segment-select-title">电 子 报 告</a>
                    </div>
                </div>
                <div class="Segment-content">
                    <div class="experiment-evaluation">
                        <div class="experiment-number">
                            <h1 class="second-title fl">实验成绩</h1>
                            <div class="number fl"><#if studentRecord.grade != "">
        																		${studentRecord.grade}
        																	  <#else>
        																	         暂无成绩
     																	      </#if> </div>
                        </div>
                        <div>
                            <h1 class="second-title">实验评价</h1>
                            <div>
                                <p class="evaluation-content"><#if studentRecord.comment != "">
        																		${studentRecord.comment}
        																	  <#else>
        																	         暂无实验评价
     																	      </#if> </p>
                            </div>
                            
                       
                </div>
            </div>
        </div>
    </div>
</body>

</html>