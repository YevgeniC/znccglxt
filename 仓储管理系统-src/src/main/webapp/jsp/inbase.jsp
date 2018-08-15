<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style type="text/css">
    	
        #body{
            width: 1100px;
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
            /*display: none;*/

        }
        #table{
            width: 340px;
            /*height: 190px;*/
            text-align: center;
            /*position: relative;*/
            margin: 15px;
            opacity: 0;
            transition: 1s;

        }
        #table tr td{
            width: 85px;
            height: 30px;
        }
        #table input{
            margin: 0;
            padding: 0;
            width: 85px;
            height: 30px;
        }
        #submit{
            position: relative;
            left: 35px;
            margin-top: -10px;
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
    		<div id="button" onclick="inb()">+新建入库单</div>
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
        <c:forEach var="inlibrary" items="${inlibrary}">
            <tr >
                <td>${inlibrary.pid}</td>
                <td><c:out value="${inlibrary.pnum}"></c:out></td>
                <td><c:out value="${inlibrary.pname}"></c:out></td>
                <td><c:out value="${inlibrary.fisid}"></c:out></td>
                <td><c:out value="${inlibrary.secid}"></c:out></td>
                <td><c:out value="${inlibrary.thiid}"></c:out></td>
                <td><c:out value="${inlibrary.lname}"></c:out></td>
                <td><c:out value="${inlibrary.indate}"></c:out></td>
        </c:forEach>
    </table>
    		
<!--     		<ul id="menu_s"> -->
<!--     		<li>物品编号</li> -->
<!--                     <li>物品数量</li> -->
<!--                     <li>物品名称</li> -->
<!--                     <li>存储编号</li> -->
<!--                     <li>货架编号</li> -->
<!--                     <li>仓库编号</li> -->
<!--                     <li>仓库名称</li> -->
<!--                     <li>入库时间</li> -->
<!--                     <li>操作</li> -->
<!--     		</ul> -->
<!--     	</div> -->
<!--     	<div id="cont"> -->
<!--     		<div class="item_1"> -->
    		
<%-- 	    			 <c:forEach var="inlibrary" items="${inlibrary}"> --%>
<!--             <tr> -->
<%--                 <td>${inlibrary.pid}</td> --%>
<%--                 <td><c:out value="${inlibrary.pnum}"></c:out></td> --%>
<%--                 <td><c:out value="${inlibrary.pname}"></c:out></td> --%>
<%--                 <td><c:out value="${inlibrary.fisid}"></c:out></td> --%>
<%--                 <td><c:out value="${inlibrary.secid}"></c:out></td> --%>
<%--                 <td><c:out value="${inlibrary.thiid}"></c:out></td> --%>
<%--                 <td><c:out value="${inlibrary.lname}"></c:out></td> --%>
<%--                 <td><c:out value="${inlibrary.indate}"></c:out></td> --%>
<!--                 </tr> -->
<%--         </c:forEach> --%>
<!-- 	    				<span style="color: #28D5B7">查看</span> -->
<!-- 	    				<span>|</span> -->
<!-- 	    				<span style="color: #FF6600">核对</span> -->
<!-- 	    				<span>|</span> -->
<!-- 	    				<span>取消</span> -->
	    	
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
    	</div>
        <div id="inbound">
            <table id="table" border="1">
                <tr>
                    <td colspan="4">货物入库单</td>
                </tr>
                <tr>
                    <td>名称</td>
                    <td  contenteditable="true"></td>
                    <td>编号</td>
                    <td  contenteditable="true"></td>
                </tr>
                <tr>
                    <td>规格</td>
                    <td  contenteditable="true"></td>
                    <td>数量</td>
                    <td  contenteditable="true"></td>
                </tr>
                <tr>
                    <td>类型</td>
                    <td  contenteditable="true"></td>
                    <td>定位卡号</td>
                    <td  contenteditable="true"></td>
                </tr>
                <tr>
                    <td>仓库编号</td>
                    <td  contenteditable="true"></td>
                    <td>货架号</td>
                    <td  contenteditable="true"></td>
                </tr>
            </table>
            <div id="submit">
                <div id="sure" onclick="sure()">新建入库单</div>
                <div id="cancel" onclick="clo()">取消</div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var i = document.getElementById('inbound');
        var t = document.getElementById('table');
        var b = document.getElementById('submit');
        function inb() {
            i.style.opacity='0.9';
            i.style.top='130px';
            i.style.left='165px';
            i.style.width='370px';
            i.style.height='260px';
            setTimeout(function(){
                t.style.opacity='1';
                b.style.opacity='1';
            },1000);
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

    </script>
</body>
</html>