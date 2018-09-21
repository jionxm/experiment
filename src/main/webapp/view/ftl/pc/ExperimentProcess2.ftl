<html lang="en">

<head>
    <meta charset="utf-8">
    <#assign ctx = request.contextPath />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="theme-color" content="#000000">
    <title>实验过程</title>
    <link href="${ctx}/view/common/assets/pc/css/main.1672e1c4.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/view/common/assets/pc/css/experimentProcess.css" rel="stylesheet" type="text/css">
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
            <div class="App-header-img"></div>
            <span class="App-header-title">AI实验操作系统</span>
        </div>
        <div class="container_process clearfix">
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
                        <div class="experiment-instruction" id="tabContent1">
                            <div>
                                <h1 class="second-title">实验概述</h1>
                                <p class="experiment-info">大数据时代，用户每天通过互联网都在产生海量的数据，然而未经处理的数据毫无价值。大数据开发工程师运用大数据的框架可将海量数据进行清洗处理转化为有价值的数据，这也让大数据开发工程师成为当下最火热的开发岗位。本实训课程结合真实开发项目，从系统环境到开发环境的搭建，从框架运用到底层原理的讲解到结合项目业务综合运用，从原始数据的产生到最终结果数据的展示，让学员学会项目的整体实现，并对大数据框架的运用和原理有较深的理解。通过这个项目，我们在深化知识点讲解的同时结合真实的业务，锻炼学员的真实开发能力，培养学员的大数据分布式思想。</p>
                                <ul
                                    class="label-blue clearfix">
                                    <li>日志收集模块</li>
                                    <li>日志清洗模块</li>
                                    <li>日志处理模块</li>
                                    <li>结果落地模块</li>
                                    <li>项目展示模块</li>
                                </ul>
                            </div>
                            <div style="margin-top: 20px;">
                                <h1 class="second-title">实验目标</h1>
                                <p class="experiment-info">1.	掌握Linux基本安装与使用，并掌握基本环境的搭建；</br>
2.	掌握Hadoop开发环境的搭建，可独立完成Hadoop伪分布式集群的搭建；</br>
3.	掌握Flume开发环境的搭建，并掌握配置Flume实现数据的复杂多级流动；</br>
4.	掌握分布式协调工具Zookeeper的搭建及使用，并对其原理有所了解；</br>
5.	熟悉Hive应用的基本框架，学会搭建Hive环境，了解Hadoop和Hive的关系；</br>
6.	熟练掌握Hive常用的Hql的语法，熟练编写Hql完成较复杂的业务逻辑，熟练编写Hive的UDF；</br>
7.	掌握运用Sqoop命令将数据从HDFS导出至关系型数据库Mysql。</br>
</p>
                            </div>
                            <div style="margin-top: 30px;">
                                <h1 class="second-title">学前建议</h1>
                                <ul class="advice-list">
                                    <li>
                                        <span class="advice-title">时间</span>
                                        <div class="advice-progress">
                                            <div class="percentage" style="width: 100%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="advice-title">知识</span>
                                        <div class="advice-progress">
                                            <div class="percentage" style="width: 75%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="advice-title">能力</span>
                                        <div class="advice-progress">
                                            <div class="percentage" style="width: 50%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="advice-title">复习</span>
                                        <div class="advice-progress">
                                            <div class="percentage" style="width: 10%;"></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="experiment-instruction dis_n" id="tabContent2">

                            <div class="segment-left-header">
                                <div class="segment-left-title selected cur_point" id="littleTabTitle1">实<br>验<br>内<br>容</div>
                                <div class="segment-left-title cur_point" id="littleTabTitle2">实<br>验<br>结<br>果</div>
                            </div>
                            <div class="segment-left-body">
                                <div class="segment-left-content" id="littleTabContent1">
                                    <div>
                                        <h1 class="second-title">Zebra项目实训</h1>
                                        <p class="experiment-info">实验名称：基于电信日志分析的大数据项目 学生名称 王小二</p>
                                        <p class="experiment-info">指导教师：王克晶 实验日期 2018-08-09</p>
                                    </div>
        
                                    <div>
                                        <h1 class="second-title">实验内容</h1>
                                        <h1 class="second-title" style="font-size:14px;">实验的目的及要求</h1>
                                        <p class="experiment-info">为了让学生了解、熟悉企业软件开发模式及流程，提高学生软件编程技术的实战能力，特制订达内院校专业实践课程方案。</br>
本实践课程采用案例驱动模式，并模拟企业的实际项目开发流程，通过指导老师来带领学生完成项目的前期调研、策划、需求分析、总体设计、详细设计、编码、测试、文档及PPT编写等环节的工作任务，协作完成一个项目的开发，提高学生的项目实战能力。</br>
本实践课程所要讲解并要求学生掌握的项目为达内时代科技集团（以下简称达内）自主研发的电信日志分析系统Zebra，该项目主要功能是收集用户在访问互联网时在电信基站产生的日志文件，并运用大数据的框架对其进行处理，最终进行展示。电信基站的日志包含大量用户行为信息，如用户所在的小区编号、用户的ip、用户的手机型号、系统型号、使用的应用、访问的地址、产生的流量等等，运用大数据的框架对这些数据进行清洗拿到与需求相关的数据，结合大数据的框架，并根据业务需求对这些数据进行处理，最终得到结果数据，利用导出工具将其导出到关系型数据库，运用大数据可视化技术对结果数据进行展示。通过整体的处理展示，我们可以清晰的分析出在某一段时间内某一个应用的受欢迎程度，也可以分析出某个网站在一段时间内的受欢迎度。 
</p>
                                        <h1 class="second-title" style="font-size:14px;">软硬件及环境</h1>
                                        <p class="experiment-info">云平台 或 本地服务器
数量：
最低3台，推荐5台
CPU：
最低：2核，推荐：4核
内存：
最低:2GB RAM，推荐：4GB RAM
磁盘：
最低：20GB 可用磁盘空间，推荐：40GB 可用磁盘空间</br>
软件要求：
CentOS6.5 64位
jdk-8u65-linux-x64
zookeeper-3.4.7
hadoop-2.7.1_64bit
apache-hive-1.2.0
apache-flume-1.6.0
sqoop-1.4.4.bin__hadoop-2.0.4-alpha
MySQL-5.6.29-1.linux
apache-tomcat-7.0.73</p>
                                    </div>
                                    <div>
                                        <h1 class="second-title" style="font-size:14px;">实验目标</h1>
                                        <p class="experiment-info">1.	掌握Linux基本安装与使用，并掌握基本环境的搭建；</br>
2.	掌握Hadoop开发环境的搭建，可独立完成Hadoop伪分布式集群的搭建；</br>
3.	掌握Flume开发环境的搭建，并掌握配置Flume实现数据的复杂多级流动；</br>
4.	掌握分布式协调工具Zookeeper的搭建及使用，并对其原理有所了解；</br>
5.	熟悉Hive应用的基本框架，学会搭建Hive环境，了解Hadoop和Hive的关系；</br>
6.	熟练掌握Hive常用的Hql的语法，熟练编写Hql完成较复杂的业务逻辑，熟练编写Hive的UDF；</br>
7.	掌握运用Sqoop命令将数据从HDFS导出至关系型数据库Mysql。</p>
                                    </div>
        
                                    <div>
                                        <h1 class="second-title" style="font-size:14px;">实验内容与步骤</h1>
                                        <p class="experiment-info">1.	日志收集模块
利用Flume对基站产生的日志进行收集，分发，并落地到HDFS。</br>
2.	日志清洗模块
结合项目需求，通过Hive将全量日志中项目所需的部分数据清洗出来，利用hive外部表进行管理。</br>
3.	日志处理模块
根据业务需求，编写hql语句处理日志数据，将结果存到hive的结果表中。</br>
4.	结果落地模块
利用sqoop将hdfs上存储的结果数据导出至mysql，便于后续查询展示。</br>
5.	项目展示模块
编写web项目，运用echarts技术对mysql中存储的结果数据进行展示。</br></p>
                                    </div>
                                </div>

                                <div class="segment-left-content dis_n" id="littleTabContent2">
                                    <div>
                                        <h1 class="second-title">实验结果</h1>
                                        <textarea style="width: 100%; height: 200px; margin-top: 20px;" placeholder="请输入你的实验结果"></textarea>
                                    	<button class="default-button btn-submit-experiment">提 交</button>
                                    </div>
                                    <div class="electronicReporting-uploadfile-container clearfix">
                                <div class="electronicReporting-uploadfile-container-item">
                                    <div class="headerline-title-2">点击上传文件</div>
                                </div>
                                <div class="electronicReporting-uploadfile-btn">
                                    <input class="input-uploadfile-button" type="file" />
                                    <span class="electronicReporting-uploadfile-btn-text">选择文件</span>
                                </div>
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
                    <div style="cursor: pointer;" class="countdown fr" id="btnExperimentOver">倒计时 00:05:00</div>
                    <a href="${ctx}/experiment-list" style="display: block; padding-left: 35px" class="stop-experiment fl">结束实验</a>
                </div>
                <div class="experiment-run" id="iconRunExperiment"></div>
                <div class="environment-content" id="experimentContent">
                    <div class="environment-content-tab">
                        <div class="environment-content-tab-title selected cur_point posi1"><span class="icon-close"></span>虚拟机1</div>
                        <div class="environment-content-tab-title cur_point posi2"><span class="icon-close"></span>虚拟机2<span class="no-read"></span></div>
                        <div class="environment-content-tab-title cur_point posi3"><span class="icon-close"></span>虚拟机3<span class="no-read"></span></div>
                    </div>
                    <img class="environment-image" src="${ctx}/view/common/assets/pc/img/bg_exertiment_environment2.png">
                </div>
            </div>
        </div>

        <div class="layout" id="layoutBox"></div>
        <div class="experiment-over-prompt" id="experimentPromptBox">
            <div class="icon-close-experiment-over" id="closeExperimentPromptBox"></div>
            <div class="prompt">本次实验即将开启3个虚拟机</div>
            <button class="experiment-over-btnsure default-button" id="experimentPromptBtn">确 定<span class="arrow-bottom"></span></button>
        </div>
    </div>

    <script type="text/javascript" src="${ctx}/view/common/assets/pc/js/jquery-1.11.0.min.js" ></script>
    <script>
        $(function(){
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
            //关闭左侧
            $("#closeLeftContent").click(function(){
                $("#leftContent").hide(500);
                $("#showLeftContent").show();
                $("#rightContent").animate({'width': '100%'}, 1000);
            })
            //显示左侧
            $("#showLeftContent").click(function(){
                $("#leftContent").show(500);
                $("#showLeftContent").hide();
                $("#rightContent").animate({'width': 'calc(100% - 322px)'}, 1000);
            })

            //运行按钮
            $("#iconRunExperiment").click(function(){
                $("#layoutBox").show();
                $("#experimentPromptBox").show();
            })
            //关闭弹窗
            $("#experimentPromptBtn").click(function(){
                $("#layoutBox").hide();
                $("#experimentPromptBox").hide();
                $("#iconRunExperiment").hide();
                $("#experimentContent").show();
            })
            $("#closeExperimentPromptBox").click(function(){
                $("#layoutBox").hide();
                $("#experimentPromptBox").hide();
                $("#iconRunExperiment").hide();
                $("#experimentContent").show();
            })

        })
    </script>
    
</body>

</html>