<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="checkBean" class="mybean.data.Check_Record" scope="session"/>
<html>
<head>
    <title>物品盘点</title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
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
            width: 150px;
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
            list-style-type: none;
            color: #FFF;
            text-align: center;
        }
        #menu_s li{
            width: 140px;
            line-height: 50px;
            float: left;
        }
        #end{
            position: absolute;
            bottom: 0;
            margin-top: 2px;
            right: 10px;
            width: 383px;
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
    
</head>
<body>
    <div id="body">
        <div id="top">
            <form action="../../Check" method="post" id="form">
                <input type="submit" id="button" value="刷新" style="font-size: 16px; border:0; width: 150px; height: 30px; float: right; position: relative; top: 13px; left: -13px; background-color: #28D5B7; border-radius: 70px; text-align: center; line-height: 30px; color: #FFF; outline:none;">
            </form>
        </div>
        <div id="menu">
            <ul id="menu_s">  
                <li>货架编号</li>
                <li>物品类型</li>
                <li>物品名称</li>
                <li>所属区域</li>
                <li>物品数量</li>
            </ul>
        </div>
        <jsp:setProperty name="checkBean" property="nowPages" param="nowPages"/>
            <%
                out.print("<table cellspacing=0>");
                int sum=0;
                try{
                    String[][] table = checkBean.getRecord();
                    int totalRecord = table.length;
                    sum=totalRecord;
                    int pageSize = 7;
                    int totalPages = checkBean.getTotalPages();
                    if(totalRecord==0) {
                        totalPages=1;
                    }else if (totalRecord%pageSize==0) {
                        totalPages = totalRecord/pageSize;
                    }else{
                        totalPages = totalRecord/pageSize+1;
                    }
                    checkBean.setTotalPages(totalPages);
                    if (totalPages>=1) {
                        if(checkBean.getNowPages()<1)
                            checkBean.setNowPages(1);
                        if(checkBean.getNowPages()>checkBean.getTotalPages())
                            checkBean.setNowPages(checkBean.getTotalPages());
                        int index = (checkBean.getNowPages()-1)*pageSize;
                        int start = index;
                        int n=0;
                        for(int i=index;i<index+pageSize;i++){
                            n++;
                            if(i==totalRecord)break;
                            if(n%2==0){
                                out.print("<tr bgcolor=#E4E4E4>");
                                for(int j=0;j<5;j++){
                                    out.print("<td width=140 height=50>"+table[i][j]+"</td>");
                                }
                                out.print("</tr>");
                            }else{
                                out.print("<tr>");
                                for(int j=0;j<5;j++){
                                    out.print("<td width=140 height=50>"+table[i][j]+"</td>");
                                }
                                out.print("</tr>");
                            }
                        }
                    }
                }catch(Exception e){}
                out.print("</table>");
            %> 
            <div id="end">
            <table>
                <tr>
                    <td style="width: 68px;">
                        共<%=sum%>条记录
                    </td>
                    <td>|</td>
                    <td>
                        <form action="" method="post">
                            <input type="hidden" name="nowPages" value="<%=checkBean.getNowPages()-checkBean.getNowPages()+1%>">
                            <input type="submit" name="g" value="首页" style="border:0px; background-color: #FFF;">
                        </form>
                    </td>
                    <td>|</td>
                    <td>
                        <form action="" method="post">
                            <input type="hidden" name="nowPages" value="<%=checkBean.getNowPages()-1%>">
                            <input type="submit" name="g" value="上一页" style="border:0px; background-color: #FFF;">
                        </form>
                    </td>
                    <td>|</td>
                    <td>
                        <form action="" method="post">
                            <input type="hidden" name="nowPages" value="<%= checkBean.getNowPages()+1%>">
                            <input type="submit" name="g" value="下一页" style="border:0px; background-color: #FFF;">
                        </form>
                    </td>
                    <td>|</td>
                    <td>
                        <form action="" method="post">
                            <input type="hidden" name="nowPages" value="<%=checkBean.getNowPages()+checkBean.getTotalPages()%>">
                            <input type="submit" name="g" value="尾页" style="border:0px; background-color: #FFF;">
                        </form>
                    </td>
                    <td>|</td>
                    <td>第<jsp:getProperty name="checkBean" property="nowPages"/>页/共<jsp:getProperty name="checkBean" property="totalPages"/>页</td>
                    <td>
                        <form action="" method="post">
                            <input type="text" name="nowPages" id="inp" style="cursor: auto;">
                            <input type="submit" name="g" value="GO" id="GO">
                        </form>
                    </td>
                </tr>
            </table>
            </div>
    </div>
</body>
</html>