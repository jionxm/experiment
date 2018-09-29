<html lang="en">

    <head>
		<#assign ctx = request.contextPath />
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="theme-color" content="#000000">
        <title>实验成绩</title>
        <link href="${ctx}/view/common/assets/pc/css/normalize.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/view/common/assets/pc/css/public.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/view/common/assets/pc/css/electronicReporting.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="${ctx}/view/common/assets/pc/js/jquery-1.11.0.min.js" ></script>
    </head>

    <body>
        
        <header>
            <div class="logo"></div>
            <div class="user-box">
                <div class="user-info clearfix">
                    <img class="user-head src-head" src="${ctx}/view/common/assets/pc/image/icon_user_head.jpg">
                    <span class="user-nick">贾文佳</span>
                </div>
                <ul class="nav-user clearfix">
                    <li>
                        <a href="${ctx}/logOut">安全退出</a>
                    </li>
                </ul>
            </div>
        </header>

        <div class="big-container">
            <ul class="segment-content clearfix">
                <li><a href="#" class="selected">成绩评价</a></li>
                <li><a href="${ctx}/electronic-reporting-page?exp=${expId}">电子报告</a></li>
            </ul>

            <div class="electronicReporting">
                <div class="header-title-1">实验成绩</div>
                <div class="experiment-count"><#if studentRecord.grade != "">
        									${studentRecord.grade}
											<#else>
												暂无成绩
     										</#if></div>

                <div class="header-title-1">实验评价</div>
                <div class="header-title-3"><#if studentRecord.comment != "">
        									${studentRecord.comment}
        									<#else>
        									暂无实验评价
     										</#if></div>
            </div>
        </div>

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