<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.Date" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<jsp:useBean id="outBean" class="mybean.data.Out_Record" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <title>出库管理</title>
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
            top: -13px;
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
            /*margin-left: 16px;*/
            width: 116px;
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
            width: 20px;
            height: 10px;
            text-align: center;
        }
        #go{
            margin-top:2px; 
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
        #outbound{
            width: 0px;
            height: 0px;
            position: absolute;
            top: 50%;
            left: 50%;
            background-color: #FFF;
            opacity: 0;
            border: 0; 
            /* */
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
            width: 100px;
            height: 37px;
            border-bottom: 1px solid #CCC;
        }
        #table input{
            margin: 0;
            padding: 0;
            width: 120px;
            height: 37px;
        }
    </style>
</head>
<body>
    <div id="body">
    	<div id="top">
            <form action="../../Out" method="post">
        		<input type="search" name="search" value="搜索" onfocus="javascript:if(this.value=='搜索')this.value='';" onblur="javascript:if(this.value=='')this.value='搜索';">
                <select name="menu" id="select">
                        <option value="OUT_NO">出库单号</option>
                        <option value="GOODS_NO">物品编号</option>
                        <option value="OUTTIME">出库时间</option>
                        <option value="WHERE">物品去向</option>
                </select>
            </form>
    		<!-- <div id="button" onclick="outb()">+新建出库单</div> -->
            <input type="button" id="button" value="+新建出库单" onclick="outb()" style="font-size: 16px; border:0; width: 150px; height: 30px; float: right; position: relative; top: -13px; left: -13px; background-color: #28D5B7; border-radius: 70px; text-align: center; line-height: 30px; color: #FFF; outline:none;">
    	</div>
        <div id="mid">
            <div id="menu">
                <ul id="menu_s">  
                    <li>出库单号</li>
                    <li>物品编号</li>
                    <li>出库时间</li>
                    <li>物品去向</li>
                </ul>
            </div>
            <jsp:setProperty name="outBean" property="nowPages" param="nowPages"/>
            <%
                out.print("<table cellspacing=0>");
                int sum=0;
                try{
                    String[][] table = outBean.getRecord();
                    int totalRecord = table.length;
                    sum = totalRecord;
                    int pageSize = 7;
                    int totalPages = outBean.getTotalPages();
                    if(totalRecord==0) {
                        totalPages=1;
                    }else if (totalRecord%7==0) {
                        totalPages = totalRecord/7;
                    }else{
                        totalPages = totalRecord/7+1;
                    }
                    outBean.setTotalPages(totalPages);
                    if (totalPages>=1) {
                        if(outBean.getNowPages()<1)
                            outBean.setNowPages(1);
                        if(outBean.getNowPages()>outBean.getTotalPages())
                            outBean.setNowPages(outBean.getTotalPages());
                        int index = (outBean.getNowPages()-1)*7;
                        int start = index;
                        int n=0;
                        for(int i=index;i<index+7;i++){
                            n++;
                            if(i==totalRecord)break;
                            if(n%2==0){
                                out.print("<tr bgcolor=#E4E4E4>");
                                for(int j=0;j<4;j++){
                                    out.print("<td width=175 height=50>"+table[i][j]+"</td>");
                                }
                                out.print("</tr>");
                            }else{
                                out.print("<tr>");
                                for(int j=0;j<4;j++){
                                    out.print("<td width=175 height=50>"+table[i][j]+"</td>");
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
                        <td td style="width: 68px;">
                            共<%=sum%>条记录
                        </td>
                        <td>|</td>
                        <td>
                            <form action="" method="post">
                                <input type="hidden" name="nowPages" value="<%=outBean.getNowPages()-outBean.getNowPages()+1%>">
                                <input type="submit" name="g" value="首页" style="border:0px; background-color: #FFF;">
                            </form>
                        </td>
                        <td>|</td>
                        <td>
                            <form action="" method="post">
                                <input type="hidden" name="nowPages" value="<%=outBean.getNowPages()-1%>">
                                <input type="submit" name="g" value="上一页" style="border:0px; background-color: #FFF;">
                            </form>
                        </td>
                        <td>|</td>
                        <td>
                            <form action="" method="">
                                <input type="hidden" name="nowPages" value="<%=outBean.getNowPages()+1%>">
                                <input type="submit" name="g" value="下一页" style="border:0px; background-color: #FFF;">
                            </form>
                        </td>
                        <td>|</td>
                        <td>
                            <form action="" method="post">
                                <input type="hidden" name="nowPages" value="<%=outBean.getNowPages()+outBean.getTotalPages()%>">
                                <input type="submit" name="g" value="尾页" style="border:0px; background-color: #FFF;">
                            </form>
                        </td>
                        <td>|</td>
                        <td>第<jsp:getProperty name="outBean" property="nowPages"/>页/共<jsp:getProperty name="outBean" property="totalPages"/>页</td>
                        <td>
                            <form action="" method="post">
                                <input type="text" name="nowPages" id="inp" style="cursor: auto;">
                                <input type="submit" name="g" value="GO" id="go">
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="outbound">
            <form action="" method="post">
                <table id="table" cellspacing=0>
                    <tr>
                        <td colspan="2">货物出库单</td>
                    </tr>
                    <tr>
                        <td>编号</td>
                        <td><input type="text" name="goods_no" style="border: 0" contenteditable="true"></td>
                    </tr>
                    <tr>
                        <td>去向</td>
                        <td><input type="text" name="where" style="border: 0" contenteditable="true"></td>
                    </tr>
                    <tr>
                        <td style="border: 0;height: 50px;">
                            <input type="submit" name="g" value="新建出库单" style="width: 120px;line-height: 40px;text-align: center;background-color: #28D5B7;border:0;border-radius: 5px;color: #FFF;margin:5px 15px 0 15px;cursor: pointer;">
                        </td>
                        <td style="border: 0;height: 50px;">
                            <input type="button" name="g" value="取消" onclick="clo()" style="width: 120px;line-height: 40px;text-align: center;background-color: #28D5B7;border:0;border-radius: 5px;color: #FFF;margin:5px 15px 0 15px;cursor: pointer;">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        var o = document.getElementById('outbound');
        var t = document.getElementById('table');
        var b = document.getElementById('submit');
        function outb() {
            o.style.opacity='1';
            o.style.top='160px';
            o.style.left='165px';
            o.style.width='370px';
            o.style.height='200px';
            o.style.border='2px solid #CCC';
            setTimeout(function(){
                t.style.opacity='1';
                b.style.opacity='1';
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
    <% 
        Connection con;
        Statement sql;
        String intitle=null;
        String insert_sql;
        ResultSet rs;
        String delete_sql;
        String goods_no=request.getParameter("goods_no"); 
        String where=request.getParameter("where");//从表单获得
       // out.print("goods_no："+goods_no+"<br>");
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){
            out.println("forget jdbc");
        }
        try{ 
            String uri="jdbc:mysql://127.0.0.1/智能仓储";
            String user="root"; //mysql用户名 
            String pwd=""; //mysql密码 
            con=DriverManager.getConnection(uri,user,pwd);
            sql=con.createStatement(); 
            delete_sql="delete from goods where goods_no='"+goods_no+"'";//删除
            rs=sql.executeQuery("select* from goods where goods_no='"+goods_no+"'");//查询
            if(!rs.next()){
                
            }else{  
                if(sql.execute(delete_sql)){ 
                
                }
                else{
                    rs=null;
                    rs=sql.executeQuery("SELECT OUT_NO from output where OUT_NO = (SELECT max(OUT_NO) FROM output)");//获取入库单最后一行
                    if(rs.next()){
                        String a = rs.getString(1);
                        a = a.trim();
                        String b = "";
                        for(int i=0;i<a.length();i++){      //获取入库单号的数字部分
                            if(a.charAt(i)>=48 && a.charAt(i)<=57){
                                b+=a.charAt(i);
                            }
                        }
                        if (Integer.parseInt(b)<9) {        //生成新的入库单号
                            intitle = "OUT00"+(Integer.parseInt(b)+1);
                        }else if (Integer.parseInt(b)>=9&&Integer.parseInt(b)<99) {
                            intitle = "OUT0"+(Integer.parseInt(b)+1);
                        }
                    }
                    insert_sql="insert into output values('"+intitle+"','"+goods_no+"','"+ft.format(dNow)+"','"+where+"')";
                    sql.execute(insert_sql);
                }
                sql.close();
                con.close();
            }       
        }catch(Exception e){} 
    %> 
</body>
</html>