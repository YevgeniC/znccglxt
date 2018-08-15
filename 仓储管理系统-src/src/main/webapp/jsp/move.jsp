<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style type="text/css">
    	*{
            margin: 0;
            padding: 0;
        }
        a{
        	text-decoration:none;
        	color:#000;
        	border:0;
        }
        table{
            border:0; 
            text-align: center;
            font-size: 13px;
        }
        #body{
        	margin: 8px;
            width: 700px;
            height: 524px;
            background-color: #FFF;
        }
        #top{
        	height: 56px;
        }
        #top input{
        	position: relative;
        	top: 13px;
        	left: 13px;
        	width: 120px;
        	height: 26px;
        	color: rgb(153, 153, 153);
        }
        #button{
        	width: 150px;
        	height: 30px;
        	float: right;
        	position: relative;
        	top: 13px;
        	right: 13px;
        	background-color: #28D5B7;
        	border-radius: 70px;
        	text-align: center;
        	line-height: 30px;
        	color: #FFF;
        }
        #button:hover{
        	cursor: pointer;
            background-color: #5ae0c9;
        }
        #menu{
        	height: 50px;
        	background-color: #334453;
        
        }
        #menu_s{
        	/*height: 50px;*/
        	padding: 0;
        	list-style-type: none;
        	color: #FFF;
        	text-align: center;
        	height:50px;
        }
        #menu_s li{
/*         	margin-left: 16px; */
        	width: 116.5px;
        	line-height: 50px;
        	float: left;
        }
        #img{
        	position:absolute;
        	top:200px;
        	left:243px;
        }
          #end{
            position: absolute;
            top:380px;
            margin-top: 2px;
            left:150px;
/*             width: 270px; */
            height: 40px;
            font-size: 12px;
            float: right;
        }
        #end input{
        	font-size: 16px; 
        	border:0; 
        	width: 150px; 
        	height: 30px; 
        	background-color: #28D5B7; 
        	border-radius: 70px; 
        	text-align: center; 
        	line-height: 30px; 
        	color: #FFF; 
        	outline:none;
        	margin-top:40px;
        	margin-left:107px;
        }
        #end input:hover{
        	cursor: pointer;
        }
        </style>
</head>
<body>
    <div id="body">
    	<div id="top">
	    	<form action="select" method="get" id="form" name="form1">

    		<input type="submit" id="button" value="返回" style="font-size: 16px; border:0; width: 150px; height: 30px; float: right; position: relative; top: 13px; left: -13px; background-color: #28D5B7; border-radius: 70px; text-align: center; line-height: 30px; color: #FFF; outline:none;">
			</form>
    	</div>
    	<div id="menu">
    		<ul id="menu_s">  
	                <li>物品编号</li>
	                <li>物品名称</li>
	                <li>物品数量</li>
	                <li>存储编号</li>
	                <li>货架编号</li>
	                <li>仓库编号</li>
	                
	            </ul>
	     <table class="table table-bordered">       
	        <c:forEach var="Library" items="${Library}">
	            <tr id="menu_s1">
	                <td width=116.5 height=50><c:out value="${Library.pid}"></c:out></td>
		            <td width=116.5 height=50><c:out value="${Library.pname}"></c:out></td>
		            <td width=116.5 height=50><c:out value="${Library.pnum}"></c:out></td>
		            <td width=116.5 height=50><c:out value="${Library.fisid}"></c:out></td>
		            <td width=116.5 height=50><c:out value="${Library.secid}"></c:out></td>
		            <td width=116.5 height=50><c:out value="${Library.thiid}"></c:out></td>
	               
	        </c:forEach>
    	</table>
	    	
    		</div>
   			<div id="img">
   				<img alt="move" src="../picture/进入系统/move.png"  style="">
   			</div>
    		<div id="end">
    		<form action="/ssm/MoveTo" name="form2">
    			<select name="thiid" onChange="getSecid()">
						<option value="0">请选择仓库编号</option>
						<option value="A1">A1</option>
						<option value="A2">A2</option>
						<option value="A3">A3</option>
						<option value="A4">A4</option>
					</select>
					<select name="secid">
						<option value="0">请选择货架编号</option>		
					</select>
					<select name="fisid">
					<%for(int i=0;i<21;i++){
						if(i==0){%>
						<option value="0">请选择位置编号</option>
						<%}else if(i<10){%>
						<option value="0<%=i%>">0<%=i%></option>
						<%}else{%>
						<option value="<%=i%>"><%=i%></option>
						<%}%>
					<%}%>
					</select>
					<c:forEach var="Library" items="${Library}">
					<input type="hidden" name="pid" value="${Library.pid}">
					</c:forEach>
					<input type="submit" value="移动">
			</form>
			
    	</div>
    </div>
<%--     <%int error = (Integer)request.getAttribute("error");%> --%>
<%--     <input type="hidden" id="error" value="<%=error%>"> --%>
    <script type="text/javascript">
        var secid=[
       	 ["01","02","03","04","05","06","07"],
       	 ["01","02","03","04","05","06","07","08"],
       	 ["01","02","03","04","05","06","07","08","09"],
       	 ["01","02","03","04","05","06","07","08","09","10"]
        ];
        function getSecid(){  
            //获得省份下拉框的对象  
            var sltThiid=document.form2.thiid;  
            //获得城市下拉框的对象  
            var sltSecid=document.form2.secid;  
              
            //得到对应省份的城市数组  
            var thiidSecid=secid[sltThiid.selectedIndex - 1];  
      
            //清空城市下拉框，仅留提示选项  
            sltSecid.length=1;  
      
            //将城市数组中的值填充到城市下拉框中  
            for(var i=0;i<thiidSecid.length;i++){  
             //Option(选项描述，选项值) 等价于 <option value="选项值" >选项描述</option>;  
                sltSecid[i+1]=new Option(thiidSecid[i],thiidSecid[i]);  
            }  
        }
        window.onload=function(){
            var error=document.getElementById('error').value;
            if (deleteerror==1) {
                alert("错误代码ERROR：01 \n删除失败");
            }
            
        };
        
        </script>
</body>
</html>