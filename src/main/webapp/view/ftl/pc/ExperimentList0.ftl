<html lang="en">

<head>
	<#assign ctx = request.contextPath />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="theme-color" content="#000000">
    <title>实验列表</title>
    <link href="${ctx}/view/common/assets/pc/css/main.1672e1c4.css" rel="stylesheet" type="text/css">
   <#include "pc/common/base.ftl">
     <style>
        .text-opera {
            display: none;
        }
    </style>
</head>

<body>
    
    <div class="App" style="background: #010f1e url(${ctx}/view/common/assets/pc/img/bg_experiment_list_container.png) no-repeat ;background-size: 100%;">
        <div>
            <img  src="${ctx}/view/common/assets/pc/img/icon_logo.png"></img>
        </div>
       <div class="container">
            <div>
                <h3 class="text-header">AI课程</h3>
                <ul class="text-list clearfix">
                <#list aiList as ai>
                    <li>
                        <div class="text-top">
                            <img class="text-image" src="${ctx}/localDownload?fileId=${ai.picId?c}"/>
                            <div class="text-title">${ai.name}</div>
                            <div class="text-opera">
                                <a href="${ctx}/electronic-reporting-page?exp=${ai.id}" target="_blank" class="text-button default-button" style="margin-top: 38px;">查看报告</a>
                                <a href="${ctx}/evaluation-achievement?exp=${ai.id}" target="_blank"class="text-button default-button" style="margin-top: 25px;">查看成绩</a>
                            </div>
                        </div>
                        <div class="text-content">
                            <div class="text-time">截止时间: ${ai.endTime}</div>
                            <div class="text-people">
                                <img class="text-protrait fl" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAZCAIAAACgvKk3AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDphZWM0M2M0YS0wYzdkLTA1NGUtOGQ0YS0zMWNmMzA3NmU3ZTIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NUFCQzExMUE5ODUxMTFFODkzODE4M0EyRDI2QjY4NDEiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NUFCQzExMTk5ODUxMTFFODkzODE4M0EyRDI2QjY4NDEiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpmNjA5ZDg2Mi04NDkzLTQ4ZjAtOTJlZC1kM2FkNTVjNWFkNjAiIHN0UmVmOmRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDowMjAzMTE0ZS1kMWYxLTExN2ItODU4Mi04MWI1OTZjZjNlYTMiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz5zw04kAAABwUlEQVR42qyVzysEYRjHn/cZdna3aZNVa+22ktAmFzf+AQ7kH6DIUYojN+WCi4OUwoWchBQX5eQmKcnJilbWj902P8Zuu2Ye7xg/1hq2se/3NDNvz2ee532evg8jIrDSkUpbCdp/gNM0PWvGF0WCBjdr8UCnF2tdlkHAfuJOVJqM0t699W+MGIAOLxsKYrXzT5xGMH2pz12RDoXlQBgNYbePWeM4aziibycI7Kjfz0ZC+Pn69TR+YZvFtRCj+Rjl43aTtHRjm2VqKqofq/SF42VORHX4r3j42HkObiNOkRQUo8Mn2n+kd9x6nKBord294VI6HDwKwJlzipEUZQXQIJaBBw3wLguidJsBFJLaR4sJPZIwnCIxrHEyISwngl8G9DkgKAvANSsMzblrLxeQYNsbxMD1+FDGoli8AV0VH7iADHm2ZVcDAVSkHEcZDCA37v+xWj2st5J9MyjOnq3D8lLbLO7vM/UosR/2yQ+Ww1jlsMEKu9lKWMqd3G8tqHexzSaJX2rBsnk6fZVstdGYswKbzFxmi9e0kyRVyz8qK+GLkV+WxRr7FWfqhYC79lkaElngBXlLoc5lrFrp9+RfBRgAwj6eYoIiP1UAAAAASUVORK5CYII=">
                                <div class="text-name fl">${ai.teacherName}</div>
                                <a href="${ctx}/experiment-process?exp=${ai.id}" target="_blank"class="text-go-experiment default-button">去实验 ></a>
                            </div>
                        </div>
                    </li>
                    </#list>
                </ul>
            </div>
            <div>
                <h3 class="text-header">其他课程</h3>
                <ul class="text-list clearfix">
                <#list otherList as other>
                    <li>
                        <div class="text-top">
                            <img class="text-image" src="${ctx}/localDownload?fileId=${other.picId?c}">
                            <div class="text-title">${other.name}</div>
                            <div class="text-opera">
                                <a href="${ctx}/electronic-reporting-page?exp=${other.id}"target="_blank" class="text-button default-button" style="margin-top: 38px;">查看报告</a>
                                <a href="${ctx}/evaluation-achievement?exp=${other.id}" target="_blank"class="text-button default-button" style="margin-top: 25px;">查看成绩</a>
                            </div>
                        </div>
                        <div class="text-content">
                            <div class="text-time">截止时间: ${other.endTime}</div>
                            <div class="text-people">
                                <img class="text-protrait fl" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAZCAIAAACgvKk3AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDphZWM0M2M0YS0wYzdkLTA1NGUtOGQ0YS0zMWNmMzA3NmU3ZTIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NUFCQzExMUE5ODUxMTFFODkzODE4M0EyRDI2QjY4NDEiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NUFCQzExMTk5ODUxMTFFODkzODE4M0EyRDI2QjY4NDEiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpmNjA5ZDg2Mi04NDkzLTQ4ZjAtOTJlZC1kM2FkNTVjNWFkNjAiIHN0UmVmOmRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDowMjAzMTE0ZS1kMWYxLTExN2ItODU4Mi04MWI1OTZjZjNlYTMiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz5zw04kAAABwUlEQVR42qyVzysEYRjHn/cZdna3aZNVa+22ktAmFzf+AQ7kH6DIUYojN+WCi4OUwoWchBQX5eQmKcnJilbWj902P8Zuu2Ye7xg/1hq2se/3NDNvz2ee532evg8jIrDSkUpbCdp/gNM0PWvGF0WCBjdr8UCnF2tdlkHAfuJOVJqM0t699W+MGIAOLxsKYrXzT5xGMH2pz12RDoXlQBgNYbePWeM4aziibycI7Kjfz0ZC+Pn69TR+YZvFtRCj+Rjl43aTtHRjm2VqKqofq/SF42VORHX4r3j42HkObiNOkRQUo8Mn2n+kd9x6nKBord294VI6HDwKwJlzipEUZQXQIJaBBw3wLguidJsBFJLaR4sJPZIwnCIxrHEyISwngl8G9DkgKAvANSsMzblrLxeQYNsbxMD1+FDGoli8AV0VH7iADHm2ZVcDAVSkHEcZDCA37v+xWj2st5J9MyjOnq3D8lLbLO7vM/UosR/2yQ+Ww1jlsMEKu9lKWMqd3G8tqHexzSaJX2rBsnk6fZVstdGYswKbzFxmi9e0kyRVyz8qK+GLkV+WxRr7FWfqhYC79lkaElngBXlLoc5lrFrp9+RfBRgAwj6eYoIiP1UAAAAASUVORK5CYII=">
                                <div class="text-name fl">${other.teacherName}</div>
                                <a href="${ctx}/experiment-process?exp=${other.id}"target="_blank" class="text-go-experiment default-button">去实验 ></a>
                            </div>
                        </div>
                    </li>
                    </#list>
                </ul>
            </div>
        </div>
    </div>
    <script>
        /* 遮罩显示隐藏 */
        $(function(){
            $('.text-list li').hover(function(){
                $(this).find('.text-opera').show();
            }, function(){
                $(this).find('.text-opera').hide();
            })
        })
    </script>
</body>
    
</html>