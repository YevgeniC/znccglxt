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
        	width: 100px;
        	line-height: 50px;
        	float: left;
        }
        
          #end{
            position: absolute;
            bottom: 0;
            margin-top: 2px;
            right: 10px;
            width: 270px;
            height: 40px;
            font-size: 12px;
            float: right;
        }
      
        
        #inbound{
            width: 0px;
            height: 0px;
            position: absolute;
            top: 50%;
            left: 50%;
            /*margin-top: -150px;
            margin-left: -185px;*/
            background-color: #FFF;
            opacity: 0.9;
            border: 2px solid #CCC; 
            transition: 1s;
            display:none;
            /*display: none;*/

        }
        
        </style>
</head>
<body>
    <div id="body">
    	<div id="top">
	    	<form action="outbase1" method="get" id="form" name="form1">

    		<input type="submit" id="button" value="返回" style="font-size: 16px; border:0; width: 150px; height: 30px; float: right; position: relative; top: 13px; left: -13px; background-color: #28D5B7; border-radius: 70px; text-align: center; line-height: 30px; color: #FFF; outline:none;">
			</form>
    	</div>
    	<div id="menu">
    		<ul id="menu_s">  
	                <li>出库编号</li>
	                <li>物品名称</li>
	                <li>物品数量</li>
	                <li>存储编号</li>
	                <li>货架编号</li>
	                <li>仓库编号</li>
	                <li>出库时间</li>
	            </ul>
	     <table class="table table-bordered">       
	        <c:forEach var="outlibrary" items="${outlibrary}">
	            <tr id="menu_s1">
	                <td width=100 height=50><c:out value="${outlibrary.pid}"></c:out></td>
	                <td width=100 height=50><c:out value="${outlibrary.pname}"></c:out></td>
	                <td width=100 height=50><c:out value="${outlibrary.pnum}"></c:out></td>
	                <td width=100 height=50><c:out value="${outlibrary.fisid}"></c:out></td>
	                <td width=100 height=50><c:out value="${outlibrary.secid}"></c:out></td>
	                <td width=100 height=50><c:out value="${outlibrary.thiid}"></c:out></td>
	                <td width=100 height=50><c:out value="${outlibrary.outdate}"></c:out></td>
	               
	        </c:forEach>
    	</table>
	    	
    		</div>
    		
    		<div id="end">
    		 <% int count = (Integer)request.getAttribute("count");
		    	int totalpage = (Integer)request.getAttribute("totalpage");
		    %>
		   	 共<%=count%>条记录 |
		    <a href="/ssm/outbaseselectall?page=${page-1}">上一页</a> | 
		    <a href="/ssm/outbaseselectall?page=${page+1}">下一页</a> | 
		  	第${page}页 |
		   	 共 <%=totalpage%>页
<!--     			<span>当前共有6条记录</span> -->
<!--     			<span>首页</span> -->
<!--     			<span>|</span> -->
<!--     			<span>上一页</span> -->
<!--     			<span>|</span> -->
<!--     			<span>下一页</span> -->
<!--     			<span>|</span> -->
<!--     			<span>尾页</span> -->
<!--     			<span>|</span> -->
<!--     			<span>第1页/共1页</span> -->
<!--     			<input type="text" name="page" id="inp"> -->
<!--     			<div id="go">GO</div> -->
<!--     		</div> -->
    	</div>
        <div id="inbound">
        
<!--         <form action="addInlibrary" name="Inlibrary"> -->
        
<!--         <input type="text" name="pid"> -->
<!--          <input type="text" name="pnum"> -->
<!--          <input type="text" name="pname"> -->
<!--          <input type="text" name="fisid"> -->
<!--          <input type="text" name="secid"> -->
<!--          <input type="text" name="thiid"> -->
<!--          <input type="text" name="lname"> -->
<!--          <input type="text" name="indate"> -->
<!--           <input type="button" value="添加" onclick="addInlibrary"> -->
        
<!--         </form> -->
<!--             <div id="submit"> -->
<!--                 <div id="sure" onclick="sure()">新建入库单</div> -->
<!--                 <div id="cancel" onclick="clo()">取消</div> -->
<!--             </div> -->
        </div>
    </div>
    <script type="text/javascript">
        var i = document.getElementById('inbound');
        var t = document.getElementById('table');
        var b = document.getElementById('submit');
        function inb() {
		
        	i.style.display="block";
            i.style.opacity='0.9';
            i.style.top='130px';
            i.style.left='165px';
            i.style.width='500px';
            i.style.height='350px';
            setTimeout(function(){
                t.style.opacity='1';
                b.style.opacity='1';
            },1000);
        	window.panrent.document.getElementById("left").style.color="red";
        }
        function sure(){
            i.style.opacity='0';
            t.style.opacity='0';
            b.style.opacity='0';
            setTimeout(function(){
                i.style.top='50%';
                i.style.left='50%';
                i.style.width='0px';
                i.style.height='0px';
            },1000);
        }
        function clo(){
            i.style.opacity='0';
            t.style.opacity='0';
            b.style.opacity='0';
            setTimeout(function(){
                i.style.top='50%';
                i.style.left='50%';
                i.style.width='0px';
                i.style.height='0px';
            },1000);
        }
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
        </script>
</body>
</html>