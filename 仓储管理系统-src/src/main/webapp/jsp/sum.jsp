<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.*" %>
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
        #body{
            margin: 8px; 
            width: 700px;
            height: 524px;
            background-color: #FFF;
        }
        table{
            border:0; 
            text-align: center;
            font-size: 13px;
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
            /*margin-left: 16px;*/
            width: 350px;
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
       
        
</style>        
</head>
<body>
<div id="body">
		<div id="menu">
	    	<ul id="menu_s">  
	                <li>物品名称</li>
	                <li>物品数量</li>
	            </ul>
	            <table class="table table-bordered">
	            <c:forEach var="Library" items="${Library}">
		            <tr>
		                <td width=350 height=50><c:out value="${Library.pname}"></c:out></td>
		                <td width=350 height=50><c:out value="${Library.sum}"></c:out></td>
		            </tr>
		        </c:forEach>
		    </table>
	   </div>
	   <div id="end">
	        <% int count = (Integer)request.getAttribute("count");
      		    	int totalpage = (Integer)request.getAttribute("totalpage");   
 		    %>   
		   	 共<%=count%>条记录 |
		    <a href="/ssm/sum.do?page=${page-1}">上一页</a> | 
		    <a href="/ssm/sum.do?page=${page+1}">下一页</a> | 
		  	第${page}页 |
		   	 共 <%=totalpage%>页
		   	 </div>
		   	 </div>
</body>
</html>