<html lang="en">

<head>
<#assign ctx = request.contextPath /> 
<#include "pc/common/base.ftl">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="theme-color" content="#000000">
<title>任务监控列表</title>
</head>
<body>
	<table border="1" width="50%" align="center">
		<tr id="domain">
			<th>用户唯一标示</th>
			<th>客户机uuid</th>
			<th>客户机状态</th>
			<th>实验id</th>
		</tr>
	</table>
</body>
 <script>
        $(function(){
        	var emulator;
        	var domainStoragePoolSrc;
        	var hostname;
        	var port;
        	var username;
        	var password;
        	var maxDomains;
        	var maxMemory;
        	var minDomains;
        	ajaxPost(APIS.frmServerList.query, 
	   				 {
	    			 }, function(data) {
	    				 console.log(data);
	    				 reder(data);	    				 
   	    			}
   	    	);

        	
        })
        function reder(data){
        	emulator=data.data.rows[0].emulator;
        	domainStoragePoolSrc=data.data.rows[0].domainStoragePoolSrc;
        	hostname=data.data.rows[0].ip;
        	port=data.data.rows[0].port;
        	username=data.data.rows[0].name;
        	password=data.data.rows[0].password;
        	maxDomains=data.data.rows[0].maxDomains;
        	maxMemory=data.data.rows[0].maxMemory;
        	minDomains=data.data.rows[0].minDomains;
        	$.ajax({
        		   url: 'http://39.105.110.193:8080/domain/list',
        		   type: 'post',
        		   dataType:'json',
        		   contentType:'application/json',
        		   data:JSON.stringify({		
        			   "serverInformationList":[ { 
        		          "emulator":emulator,
        		          "domainStoragePoolSrc":domainStoragePoolSrc,
        		          "hostname":hostname,
        		          "port":port,
        		          "username":username,
        		          "password":password,
        		          "maxDomains":maxDomains,
        		          "maxMemory":maxMemory,
        		          "minDomains":minDomains
        		          }]
   					}),
        		   success:function(data){
        			   if(data.code==200){
        			   console.log("请求成功");
        			   }
        			   console.log(data.data);
        			   reder2(data.data);     			   
        		   },
        		   error:function(data){
        		       console.log("请求失败");
        		   }
        		});
        	}
        function reder2(result){
        	var userUid;
        	var domainUuid;
        	var domainStatus;
        	var experimentUuid;
        	console.log(result[hostname].length);
        	/* for(var i=0;vin result){遍历json数组
        		console.log(result[p]);
        	} */
        	var html="";
        	for(var i=0;i<result[hostname].length;i++){       		
        		userUid=result[hostname][i].userUid;
        		domainUuid=result[hostname][i].domainUuid;
        		domainStatus=result[hostname][i].domainStatus;
        		if(domainStatus=="VIR_DOMAIN_RUNNING"){
        			domainStatus="运行中";
        		}else if(domainStatus=="VIR_DOMAIN_PAUSED"){
        			domainStatus="暂停中";
        		}else if(domainStatus=="VIR_DOMAIN_SHUTDOWN"){
        			domainStatus="关闭";
        		}
        		experimentUuid=result[hostname][i].experimentUuid;
        		html+="<tr>\n\t\t\t<td>"+userUid+"</td>\n\t\t\t<td>"+domainUuid+"</td>\n\t\t\t<td>"+domainStatus+"</td>\n\t\t\t<td>"+experimentUuid+"</td>\n\t\t</tr>\n";
        	}
        	 $("#domain").after(html); 
        }
        
</script>
</html>