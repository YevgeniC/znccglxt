<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>物品查询</title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        a{
        	text-decoration:none;
        	color:#000;
        	border:2px #ccc solid;
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
/*             line-height: 56px; */
        }
        #top input{  
            position: relative;  
            top: 13px;  
            left: 13px;  
            width: 120px;  
            height: 26px;  
            color: rgb(153, 153, 153); 
        }  
		#top select{
			position: relative;  
            top: 13px; 
            margin: 0 0 0 13px;
			width: 120px;  
            height: 26px;  
            color: rgb(153, 153, 153);
		}
        #button:hover{
            cursor: pointer;
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
        #end input:hover{
           cursor: pointer;
        }
        #inp{
            margin-top:1px; 
            width: 24px;
            height: 14px;
            text-align: center;
        }
        #go{
            margin-top:1px; 
            padding: 0;
            position: relative;
            left: 2px;
            width: 28px;
            height: 14px;
            line-height: 14px;
            text-align: center;
            border: 1px solid #CCC;
            border-radius: 3px;
            float: right;
        }
    </style>
    <script>
	function refresh(){
		window.location = "/ssm/select";
	}
	
    //定义了货架的二维数组，里面的顺序跟仓库的顺序是相同的。通过selectedIndex获得仓库的下标值来得到相应的货架数组 
	var secid=[
   	 ["01","02","03","04","05","06","07"],
   	 ["01","02","03","04","05","06","07","08"],
   	 ["01","02","03","04","05","06","07","08","09"],
   	 ["01","02","03","04","05","06","07","08","09","10"]
    ];
    function getSecid(){  
        //获得仓库下拉框的对象  
        var sltThiid=document.form1.thiid;  
        //获得货架下拉框的对象  
        var sltSecid=document.form1.secid;  
        //得到对应仓库的货架数组  
        var thiidSecid=secid[sltThiid.selectedIndex - 1];  
        //清空货架下拉框，仅留提示选项  
        sltSecid.length=1;
        //将货架数组中的值填充到货架下拉框中  
        for(var i=0;i<thiidSecid.length;i++){  
         //Option(选项描述，选项值) 等价于 <option value="选项值" >选项描述</option>;  
            sltSecid[i+1]=new Option(thiidSecid[i],thiidSecid[i]);  
        }  
    }
    function OutLib(pid){
		//session.setAttribute("pid",pid);
		alert("pid:"+pid);
		//response.sendRedirect("/ssm/test"); 
		
     }
	</script>
</head>
<body>
	<div id="body">
	        <div id="top">
	            <form action="selectBy" method="get" id="form" name="form1">
	            	<input type="radio" name="type" value="0" style="position:relative; width:15px; height:15px; top:15px;">
	            	<input type="search" name="search" value="请输入物品名称" onfocus="javascript:if(this.value=='请输入物品名称')this.value='';" onblur="javascript:if(this.value=='')this.value='请输入物品名称';">
	                <input type="radio" name="type" value="1" style="position:relative; width:15px; height:15px; top:15px; margin-left: 10px;">
					
					<select name="thiid" onChange="getSecid()">
						<option value="0">请选择仓库编号</option>
						<option value="A1">A1</option>
						<option value="A2">A2</option>
						<option value="A3">A3</option>
						<option value="A4">A4</option>
				<%-- <%
						List<String> Thiid=(List<String>)request.getAttribute("Thiid");
						for(int i=0;i<Thiid.size();i++){
				%>
						<option value="<%=Thiid.get(i)%>"><%=Thiid.get(i)%></option>
				<%
					}
				%>	 --%>
					</select>
					<select name="secid">
						<option value="0">请选择货架编号</option>		
					</select>
					  
	                <img alt="刷新" src="../picture/进入系统/u252.png" onclick="refresh()" style="position:relative;top:15px;right:-60px;cursor:pointer;">
                	<input type="submit" id="button" value="查询" style="font-size: 16px; border:0; width: 150px; height: 30px; float: right; position: relative; top: 13px; left: -13px; background-color: #28D5B7; border-radius: 70px; text-align: center; line-height: 30px; color: #FFF; outline:none;">
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
	                <li>操作</li>
	            </ul>
	            <table class="table table-bordered">
	            <c:forEach var="Library" items="${Library}">
		            <tr>
		                <td width=100 height=50>${Library.pid}</td>
		                <td width=100 height=50><c:out value="${Library.pname}"></c:out></td>
		                <td width=100 height=50><c:out value="${Library.pnum}"></c:out></td>
		                <td width=100 height=50><c:out value="${Library.fisid}"></c:out></td>
		                <td width=100 height=50><c:out value="${Library.secid}"></c:out></td>
		                <td width=100 height=50><c:out value="${Library.thiid}"></c:out></td>
		                <td width=100 height=50>
		                	<button type="button" class="button" onclick="OutLib(${Library.pid})">出库</button>
		                </td>
		            </tr>
		        </c:forEach>
		    </table>
	        </div>
	        <div id="end">
	        <% int count = (Integer)request.getAttribute("count");
		    	int totalpage = (Integer)request.getAttribute("totalpage");
		    %>
		   	 共<%=count%>条记录 |
		    <a href="/ssm/select.do?page=${page-1}">上一页</a> | 
		    <a href="/ssm/select.do?page=${page+1}">下一页</a> | 
		  	第${page}页 |
		   	 共 <%=totalpage%>页
<!--             <table> -->
<!--                 <tr> -->
<!--                     <td style="width: 68px;"> -->
<%--                         共<%=sum%>条记录 --%>
<!--                     </td> -->
<!--                     <td>|</td> -->
<!--                     <td> -->
<!--                         <form action="" method="post"> -->
<%--                             <input type="hidden" name="nowPages" value="<%=checkBean.getNowPages()-checkBean.getNowPages()+1%>"> --%>
<!--                             <input type="submit" name="g" value="首页" style="border:0px; background-color: #FFF;"> -->
<!--                         </form> -->
<!--                     </td> -->
<!--                     <td>|</td> -->
<!--                     <td> -->
<!--                         <form action="" method="post"> -->
<%--                             <input type="hidden" name="nowPages" value="<%=checkBean.getNowPages()-1%>"> --%>
<!--                             <input type="submit" name="g" value="上一页" style="border:0px; background-color: #FFF;"> -->
<!--                         </form> -->
<!--                     </td> -->
<!--                     <td>|</td> -->
<!--                     <td> -->
<!--                         <form action="" method="post"> -->
<%--                             <input type="hidden" name="nowPages" value="<%= checkBean.getNowPages()+1%>"> --%>
<!--                             <input type="submit" name="g" value="下一页" style="border:0px; background-color: #FFF;"> -->
<!--                         </form> -->
<!--                     </td> -->
<!--                     <td>|</td> -->
<!--                     <td> -->
<!--                         <form action="" method="post"> -->
<%--                             <input type="hidden" name="nowPages" value="<%=checkBean.getNowPages()+checkBean.getTotalPages()%>"> --%>
<!--                             <input type="submit" name="g" value="尾页" style="border:0px; background-color: #FFF;"> -->
<!--                         </form> -->
<!--                     </td> -->
<!--                     <td>|</td> -->
<%--                     <td>第<jsp:getProperty name="checkBean" property="nowPages"/>页/共<jsp:getProperty name="checkBean" property="totalPages"/>页</td> --%>
<!--                     <td> -->
<!--                         <form action="" method="post"> -->
<!--                             <input type="text" name="nowPages" id="inp" style="cursor: auto;"> -->
<!--                             <input type="submit" name="g" value="GO" id="GO"> -->
<!--                         </form> -->
<!--                     </td> -->
<!--                 </tr> -->
<!--             </table> -->
            </div>
    </div>
</body>
</html>