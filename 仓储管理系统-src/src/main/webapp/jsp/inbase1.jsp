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
        	height:50px;
        }
      	#menu_s li{
            /*margin-left: 16px;*/
            width: 100px;
            line-height: 50px;
            float: left;
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
            display:none;
            /*display: none;*/

        }
        #table{
            width: 450px;
            /*height: 190px;*/

            text-align: center;
            /*position: relative;*/
            margin: 15px;
            opacity: 0;
            transition: 1s;

        }
        #table tr td{
            width: 85px;
            height: 40px;
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
        #menu_s1 td{
        	height:47px;
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
        </style>
</head>
<body>
    <div id="body">
    	<div id="top">
    	
    		<div id="button" onclick="inb()">+新建入库单</div>
    	</div>
    	<div id="menu">
    	<ul id="menu_s">  
	                <li>物品编号</li>
	                <li>物品名称</li>
	                <li>物品数量</li>
	                <li>存储编号</li>
	                <li>货架编号</li>
	                <li>仓库编号</li>
	                <li>入库时间</li>
	            </ul>
        
        <table class="table table-bordered">
        <c:forEach var="inlibrary" items="${inlibrary}">
            <tr id="menu_s1">
                <td width=116.5>${inlibrary.pid}</td>
                <td width=116.5><c:out value="${inlibrary.pname}"></c:out></td>
                <td width=116.5><c:out value="${inlibrary.pnum}"></c:out></td>
                <td width=116.5><c:out value="${inlibrary.fisid}"></c:out></td>
                <td width=116.5><c:out value="${inlibrary.secid}"></c:out></td>
                <td width=116.5><c:out value="${inlibrary.thiid}"></c:out></td>
                <td width=116.5><c:out value="${inlibrary.indate}"></c:out></td>
               
        </c:forEach>
    </table>

    		<div id="end">
    		 <% int count = (Integer)request.getAttribute("count");
		    	int totalpage = (Integer)request.getAttribute("totalpage");
		    %>
		   	 共<%=count%>条记录 |
		    <a href="/ssm/inbase1.do?page=${page-1}">上一页</a> | 
		    <a href="/ssm/inbase1.do?page=${page+1}">下一页</a> | 
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
       
        
      <form action="addInlibrary" method="post"  name="form2">
            <table id="table" border="1">
                <tr>
                    <td colspan="4">货物入库单</td>
                </tr>
                        <!--                 第一行 -->
                <tr>     
                    <td>货物名称</td>
                     <td>   <select name="pname" style="height:20px;">
    				 <option value="Pencil">Pencil</option>
                     <option value="Pen">Pen</option>
                     <option value="Ruler">Ruler</option>
                     <option value="Eraser">Eraser</option>
                     <option value="Compasses">Compasses</option>
                     <option value="T-shirt">T-shirt</option>
                     <option value="Jeans">Jeans</option>
                     <option value="Shoes">Shoes</option>
                     <option value="Schoolbag">Schoolbag</option>
                     <option value="Hat">Hat</option>
                     <option value="Cup">Cup</option>
                      <option value="手机">手机</option>
                     </select>      
                                
                      </td>
                    <td>货物数量</td>
                    <td> 
                    <select name="pnum">
    				 <%for(int i=0;i<101;i++){
 						if(i==0){%> 
						<option value="0">请选择数量</option>
						<%}else{%>
						<option value="<%=i%>"><%=i%></option>
						<%}%>
					<%}%>
					
                    </select>
<!--                     <input type="text" style="border:0"> -->
                      </td>    
                </tr>
                  <!--                 第二行 -->
                <tr>
                    <td>仓库编号</td>
                          <td> <select name="thiid" onChange="getSecid()">
                           <option value="0">请选择仓库编号</option>
    				 <option value="A1">A1</option>
                     <option value="A2">A2</option>
                         <option value="A3">A3</option>
                     <option value="A4">A4</option>
                     </select>  </td>                
                    <td>货架编号</td>
                   <td><select name="secid">
                   <option value="0">请选择货架编号</option>
<!--     				 <option value="1">1</option> -->
<!--                      <option value="2">2</option> -->
<!--                          <option value="3">3</option> -->
<!--                      <option value="4">4</option> -->
<!--                           <option value="5">5</option> -->
<!--                      <option value="6">6</option> -->
<!--                      <option value="7">7</option> -->
<!--                           <option value="8">8</option> -->
<!--                      <option value="9">9</option> -->
<!--                           <option value="10">10</option> -->
                          </select>  </td>
                </tr>
                     <!--                 第三行 -->
                <tr>
                   <td>存储位置</td>
                  <td> <select name="fisid">
    				 <%for(int i=0;i<21;i++){
						if(i==0){%>
						<option value="0">请选择位置编号</option>
						<%}else if(i<10){%>
						<option value="0<%=i%>">0<%=i%></option>
						<%}else{%>
						<option value="<%=i%>"><%=i%></option>
						<%}%>
					<%}%>
                    </select>  </td>
     
   <tr>
   		
       <td colspan="4"> <input type="submit" value="添加">&nbsp;&nbsp;</td>  
         
         
      </tr>
         <tr>
            <td colspan="2"><input type="reset" value="重置">&nbsp;&nbsp;</td>
            
                 
                  <td colspan="2"> 
               <input type="button" name="g" value="取消" onclick="clo()" style="text-align: center;background-color: #28D5B7;border:0">
      </td>  
         </tr>
            </table>
            </form>
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
            i.style.opacity='1';
            i.style.top='130px';
            i.style.left='165px';
            i.style.width='500px';
            i.style.height='350px';
            setTimeout(function(){
                t.style.opacity='1';
                b.style.opacity='1';
            },300);
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