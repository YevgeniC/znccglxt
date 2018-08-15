<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
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
        #select{
            height: 26px;
            position: relative;
            top: 13px;
            margin-left: 20px;
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
    </style>
</head>
<body>
    <div id="body">
        <div id="top">
            <input type="search" name="" value="搜索" onfocus="javascript:if(this.value=='搜索')this.value='';" onblur="javascript:if(this.value=='')this.value='搜索';">
            <select id="select">
                <option value="0">所属区域</option>
                <option value="1">货架编号</option>
                <option value="2">物品类型</option>
                <option value="3">物品编号</option>
                <option value="4">定位卡号</option>
                <option value="5">入库时间</option>
            </select>
            <div id="button">查询</div>
        </div>
        <div id="menu">
            <ul id="menu_s">
                <li>所属区域</li>
                <li>货架编号</li>
                <li>物品类型</li>
                <li>物品编号</li>
                <li>定位卡号</li>
                <li>入库时间</li>
            </ul>
        </div>
        <div id="cont">
            <div class="item_1">
                <ul id="item_s">
                    <li>A1</li>
                    <li>102</li>
                    <li>钢材</li>
                    <li>17060601</li>
                    <li>33502</li>
                    <li>17/06/06 20:35</li>
                </ul>
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
    </div>
</body>
</html>




<%
out.print("<table cellspacing=0>");
                while(rs.next()){
                    n++;
                    if(n%2==0){
                        out.print("<tr bgcolor=#E4E4E4>");
                            out.print("<td width=140 height=50>"+rs.getString(1)+"</td>");
                            out.print("<td width=140 height=50>"+rs.getString(2)+"</td>");
                            out.print("<td width=140 height=50>"+rs.getString(3)+"</td>");
                            out.print("<td width=140 height=50>"+rs.getString(4)+"</td>");
                            out.print("<td width=140 height=50>"+rs.getString(5)+"</td>");
                        out.print("</tr>");
                    }
                    else{
                        out.print("<tr>");
                            out.print("<td width=140 height=50>"+rs.getString(1)+"</td>");
                            out.print("<td width=140 height=50>"+rs.getString(2)+"</td>");
                            out.print("<td width=140 height=50>"+rs.getString(3)+"</td>");
                            out.print("<td width=140 height=50>"+rs.getString(4)+"</td>");
                            out.print("<td width=140 height=50>"+rs.getString(5)+"</td>");
                        out.print("</tr>");
                    }
                }
                out.print("</table>");
%>                