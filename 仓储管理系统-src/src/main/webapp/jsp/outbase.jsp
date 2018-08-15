<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <style type="text/css">
    	
        #body{
            width: 700px;
            height: 520px;
            background-color: #FFF;
        }
        #top{
        	height: 40px;
        }
        #top input{
        	padding: 0;
        	position: relative;
        	top: 13px;
        	left: 13px;
        	width: 150px;
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
        }
        #menu_s li{
        	margin-left: 16px;
        	width: 100px;
        	line-height: 50px;
        	float: left;
        }
        .item_1{
        	height: 50px;
        }
        .item_2{
        	height: 50px;
        	background-color: #E4E4E4;
        }
        #item_s{
        	margin:0; 
        	padding: 0;
        	list-style-type: none;
        	text-align: center;
        }
        #item_s li{
        	margin-left: 16px;
        	width: 100px;
        	font-size: 12px;
        	line-height: 50px;
        	float: left;
        }
        #end{
        	margin-top: 2px;
        	width: 400px;
        	height: 50px;
        	font-size: 12px;
        	float: right;
        }
        #inp{
        	width: 20px;
        	height: 10px;
        	text-align: center;

        }
        #go{
        	margin-top:1px; 
        	padding: 0;
        	position: relative;
        	left: -10px;
        	width: 28px;
        	height: 15px;
        	text-align: center;
        	border: 1px solid #CCC;
        	border-radius: 3px;
        	float: right;
        }
        #outbound{
            width: 0px;
            height: 0px;
            position: absolute;
            top: 50%;
            left: 50%;
            background-color: #FFF;
            opacity: 0.9;
            border: 2px solid #CCC; 
            transition: 1s;
        }
        #table{
            width: 340px;
            text-align: center;
            margin: 15px;
            opacity: 0;
            transition: 1s;
        }
        #table tr td{
            width: 85px;
            height: 30px;
        }
        #submit{
            position: relative;
            left: 35px;
            top: 15px;
            width: 300px;
            height: 50px;
            opacity: 0;
            transition: 1s;
        }
        #submit div{
            width: 120px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background-color: #28D5B7;
            border-radius: 5px;
            color: #FFF;
            margin:0 15px 0 15px;
            float: left;
        }
        #submit div:hover{
            cursor: pointer;
            background-color: #5ae0c9;
        }
    </style>
</head>
<body>
    <div id="body">
    	<div id="top">
    		<input type="search" name="" value="搜索" onfocus="javascript:if(this.value=='搜索')this.value='';" onblur="javascript:if(this.value=='')this.value='搜索';">
    		<div id="button" onclick="outb()">+新建出库单</div>
    	</div>
    	<div id="menu">
    	<table class="table table-bordered">
        <thead>
        <tr id="menu_s">
            <td>物品编号</td>
            <td>物品数量</td>
            <td>物品名称</td>
            <td>存储编号</td>
            <td>货架编号</td>
            <td>仓库编号</td>
            <td>仓库名称</td>
             <td>入库时间</td>
            <td>操作</td>
        </tr>
        </thead>
    	       <c:forEach var="outlibrary" items="${outlibrary}">
            <tr >
                <td>${outlibrary.pid}</td>
                <td><c:out value="${outlibrary.pnum}"></c:out></td>
                <td><c:out value="${outlibrary.pname}"></c:out></td>
                <td><c:out value="${outlibrary.fisid}"></c:out></td>
                <td><c:out value="${outlibrary.secid}"></c:out></td>
                <td><c:out value="${outlibrary.thiid}"></c:out></td>
                <td><c:out value="${outlibrary.lname}"></c:out></td>
                <td><c:out value="${outlibrary.outdate}"></c:out></td>
        </c:forEach>
    </table>
<!--     		<ul id="menu_s"> -->
<!--     			<li>物品编号</li> -->
<!--                 <li>物品类型</li> -->
<!--                 <li>入库时间</li> -->
<!--                 <li>出库时间</li> -->
<!--     			<li>物品去向</li> -->
<!--     			<li>状态</li> -->
<!--     		</ul> -->
<!--     	</div> -->
<!--     	<div id="cont"> -->
<!--     		<div class="item_1"> -->
<!--     			<ul id="item_s"> -->
<!-- 	    			<li>17060601</li> -->
<!-- 	    			<li>钢材</li> -->
<!-- 	    			<li>17/06/06 20:35</li> -->
<!-- 	    			<li>17/06/24 08:17</li> -->
<!-- 	    			<li style="color: #28D5B7">出口</li> -->
<!-- 	    			<li> -->
<!-- 	    				<span style="color: #FF6600">出库中</span> -->
<!-- 	    			</li> -->
<!--     			</ul> -->
    		</div>
    		<div class="item_2"></div>
    		<div class="item_1"></div>
    		<div class="item_2"></div>
    		<div class="item_1"></div>
    		<div class="item_2"></div>
    		<div id="end">
    			<span>当前共有6条记录</span>
    			<span>首页</span>
    			<span>|</span>
    			<span>上一页</span>
    			<span>|</span>
    			<span>下一页</span>
    			<span>|</span>
    			<span>尾页</span>
    			<span>|</span>
    			<span>第1页/共1页</span>
    			<input type="text" name="page" id="inp">
    			<div id="go">GO</div>
    		</div>
            <div id="outbound">
                <table id="table" border="1">
                    <tr>
                        <td colspan="2"><p style="text-align: center;font-size: 20px;margin: 10px">货物出库单</p></td>
                       
                    </tr>
                    <tr>
                        <td>定位卡号</td>
                        <td  contenteditable="true"></td>
                    </tr>
                </table>
                <div id="submit">
                    <div id="sure" onclick="sure()">新建出库单</div>
                    <div id="cancel" onclick="clo()">取消</div>
                </div>
            </div>
    	</div>
    </div>
    <script type="text/javascript">
        var o = document.getElementById('outbound');
        var t = document.getElementById('table');
        var b = document.getElementById('submit');
        function outb() {
            o.style.opacity='0.9';
            o.style.top='160px';
            o.style.left='165px';
            o.style.width='370px';
            o.style.height='200px';
            setTimeout(function(){
                t.style.opacity='1';
                b.style.opacity='1';
            },1000);
        }
        function sure(){
            o.style.opacity='0';
            t.style.opacity='0';
            b.style.opacity='0';
            setTimeout(function(){
                o.style.top='50%';
                o.style.left='50%';
                o.style.width='0px';
                o.style.height='0px';
            },1000);
        }
        function clo(){
            o.style.opacity='0';
            t.style.opacity='0';
            b.style.opacity='0';
            setTimeout(function(){
                o.style.top='50%';
                o.style.left='50%';
                o.style.width='0px';
                o.style.height='0px';
            },1000);
        }
    </script>
</body>
</html>