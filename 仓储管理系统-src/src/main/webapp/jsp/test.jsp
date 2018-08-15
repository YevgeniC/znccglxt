<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">  
 <HTML>  
 <HEAD>  
 <TITLE> New Document </TITLE>  
 <script>  
    //定义了城市的二维数组，里面的顺序跟省份的顺序是相同的。通过selectedIndex获得省份的下标值来得到相应的城市数组  
    var city=[  
    ["北京","天津","上海","重庆"],  
    ["南京","苏州","南通","常州"],  
    ["福州","福安","龙岩","南平"],  
    ["广州","潮阳","潮州","澄海"],  
    ["兰州","白银","定西","敦煌"]  
    ];  
  
    function getCity(){  
        //获得省份下拉框的对象  
        var sltProvince=document.form1.province;  
        //获得城市下拉框的对象  
        var sltCity=document.form1.city;  
          
        //得到对应省份的城市数组  
        var provinceCity=city[sltProvince.selectedIndex - 1];  
  
        //清空城市下拉框，仅留提示选项  
        sltCity.length=1;  
  
        //将城市数组中的值填充到城市下拉框中  
        for(var i=0;i<provinceCity.length;i++){  
         //Option(选项描述，选项值) 等价于 <option value="选项值" >选项描述</option>;  
            sltCity[i+1]=new Option(provinceCity[i],provinceCity[i]);  
        }  
    } 
    
    
//     List<String> Secid=(List<String>)request.getAttribute("Secid");
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
     function refresh(){
 		window.location = "/ssm/test";
 	}
     function OutLib(pid){
		//session.setAttribute("pid",pid);
		alert("pid:"+pid);
		//response.sendRedirect("/ssm/test"); 
		
     }
</script>  
</HEAD>  
  
<BODY>  
<!-- <FORM METHOD=POST ACTION="" name="form1">   -->
<!--         <SELECT NAME="province" onChange="getCity()">   -->
<!--             <OPTION VALUE="0">请选择所在省份 </OPTION>   -->
<!--             <OPTION VALUE="直辖市">直辖市 </OPTION>   -->
<!--             <OPTION VALUE="江苏省">江苏省 </OPTION>   -->
<!--             <OPTION VALUE="福建省">福建省 </OPTION>   -->
<!--             <OPTION VALUE="广东省">广东省 </OPTION>   -->
<!--             <OPTION VALUE="甘肃省">甘肃省 </OPTION>   -->
<!--         </SELECT>   -->
<!--         <SELECT NAME="city">   -->
<!--             <OPTION VALUE="0">请选择所在城市 </OPTION>   -->
<!--         </SELECT>   -->
<!--     </FORM>   -->
    
<FORM METHOD=GET ACTION="selectBy" name="form2">
<input type="radio" name="type" value="0">物品名称：
<input type="search" name="search" value="物品名称" onfocus="javascript:if(this.value=='物品名称')this.value='';" onblur="javascript:if(this.value=='')this.value='物品名称';" >
	<input type="radio" name="type" value="1">物品位置：
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
</FORM>	 

<table class="table table-bordered">
	            <c:forEach var="Library" items="${Library}">
		            <tr>
<%-- 		                <td width=140 height=50>${Library.pid}</td> --%>
		                <td width=140 height=50><c:out value="${Library.pname}"></c:out></td>
		                <td width=140 height=50><c:out value="${Library.pnum}"></c:out></td>
		                <td width=140 height=50><c:out value="${Library.fisid}"></c:out></td>
		                <td width=140 height=50><c:out value="${Library.secid}"></c:out></td>
		                <td width=140 height=50><c:out value="${Library.thiid}"></c:out></td>
<%-- 		                <td width=140 height=50><c:out value="${Library.count}"></c:out></td> --%>
		                <td>
		                	<button type="button" onclick="OutLib(${Library.pid})">删除</button>
		                </td>
		            </tr>
		        </c:forEach>
		    </table>
		    <% int count = (Integer)request.getAttribute("count");
		    	int totalpage = (Integer)request.getAttribute("totalpage");
		    %>
		   	 共<%=count%>条记录
		    <a href="/ssm/test.do?page=${page-1}">上一页</a> 
		    <a href="/ssm/test.do?page=${page+1}">下一页</a> 
		  	第${page}页
		   	 共 <%=totalpage%>页
		   	  
</BODY>  
</HTML>