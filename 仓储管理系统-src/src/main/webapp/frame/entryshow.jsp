<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.Date" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<jsp:useBean id="entryBean" class="mybean.data.Entry_Record" scope="session"/>
<HTML>
<head>
    <title>������</title>
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
        #inbound{
            width: 0px;
            height: 0px;
            position: absolute;
            top: 50%;
            left: 50%;
            /*margin-top: -150px;
            margin-left: -185px;*/
            background-color: #FFF;
            opacity: 0;
            border: 0; 
            /* */
            transition: 1s;
            /*display: none;*/
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
            height: 37px;
            border-bottom: 1px solid #CCC;
        }
        #table input{
            margin: 0;
            padding: 0;
            width: 85px;
            height: 37px;
        }
    </style>
</head>
<body>
    <div id="body">
        <div id="top">
            <form action="../../Entry" method="post">
                <input type="search" name="search" value="����" onfocus="javascript:if(this.value=='����')this.value='';" onblur="javascript:if(this.value=='')this.value='����';">
                <select name="menu" id="select">
                    <option value="INPUT_NO">��ⵥ��</option>
                    <option value="GOODS_NO">��Ʒ���</option>
                    <option value="INPUT_TYPE">��Ʒ����</option>
                    <option value="INPUT_NAME">��Ʒ����</option>
                    <option value="INPUT_SPEC">��������</option>
                    <option value="INPUT_TIME">���ʱ��</option>
                </select>
            </form>
            <div id="button" onclick="inb()">+�½���ⵥ</div>
        </div>
        <div id="mid">
            <div id="menu">
                <ul id="menu_s">  
                    <li>��ⵥ��</li>
                    <li>��Ʒ���</li>
                    <li>��Ʒ����</li>
                    <li>��Ʒ����</li>
                    <li>��������</li>
                    <li>���ʱ��</li>
                </ul>
            </div>
        <!--  
      <jsp:setProperty name="entryBean" property="nowPages" param="nowPages"/>
         -->
<!--                 out.print("<table cellspacing=0>"); -->
<!--                 int sum=0; -->
<!--                 try{ -->
<!--                     String[][] table = entryBean.getRecord(); -->
<!--                     int totalRecord = table.length; -->
<!--                     sum = totalRecord; -->
<!--                     int pageSize = 7; -->
<!--                     int totalPages = entryBean.getTotalPages(); -->
<!--                     if(totalRecord==0) { -->
<!--                         totalPages=1; -->
<!--                     }else if (totalRecord%7==0) { -->
<!--                         totalPages = totalRecord/7; -->
<!--                     }else{ -->
<!--                         totalPages = totalRecord/7+1; -->
<!--                     } -->
<!--                     entryBean.setTotalPages(totalPages); -->
<!--                     if (totalPages>=1) { -->
<!--                         if(entryBean.getNowPages()<1) -->
<!--                             entryBean.setNowPages(1); -->
<!--                         if(entryBean.getNowPages()>entryBean.getTotalPages()) -->
<!--                             entryBean.setNowPages(entryBean.getTotalPages()); -->
<!--                         int index = (entryBean.getNowPages()-1)*7; -->
<!--                         int start = index; -->
<!--                         int n=0; -->
<!--                         for(int i=index;i<index+7;i++){ -->
<!--                             n++; -->
<!--                             if(i==totalRecord)break; -->
<!--                             if(n%2==0){ -->
<!--                                 out.print("<tr bgcolor=#E4E4E4>"); -->
<!--                                 for(int j=0;j<6;j++){ -->
<!--                                     out.print("<td width=140 height=50>"+table[i][j]+"</td>"); -->
<!--                                 } -->
<!--                                 out.print("</tr>"); -->
<!--                             }else{ -->
<!--                                 out.print("<tr>"); -->
<!--                                 for(int j=0;j<6;j++){ -->
<!--                                     out.print("<td width=140 height=50>"+table[i][j]+"</td>"); -->
<!--                                 } -->
<!--                                 out.print("</tr>"); -->
<!--                             } -->
<!--                         } -->
<!--                     } -->
<!--                 }catch(Exception e){} -->
<!--                 out.print("</table>"); -->
      
<!--             <div id="end"> -->
<!--                 <table> -->
<!--                     <tr> -->
<!--                         <td td style="width: 68px;"> -->
<%--                             ��<%=sum%>����¼ --%>
<!--                         </td> -->
<!--                         <td>|</td> -->
<!--                         <td> -->
<!--                             <form action="" method="post"> -->
<%--                                 <input type="hidden" name="nowPages" value="<%=entryBean.getNowPages()-entryBean.getNowPages()+1%>"> --%>
<!--                                 <input type="submit" name="g" value="��ҳ" style="border:0px; background-color: #FFF;"> -->
<!--                             </form> -->
<!--                         </td> -->
<!--                         <td>|</td> -->
<!--                         <td> -->
<!--                             <form action="" method="post"> -->
<%--                                 <input type="hidden" name="nowPages" value="<%=entryBean.getNowPages()-1%>"> --%>
<!--                                 <input type="submit" name="g" value="��һҳ" style="border:0px; background-color: #FFF;"> -->
<!--                             </form> -->
<!--                         </td> -->
<!--                         <td>|</td> -->
<!--                         <td> -->
<!--                             <form action="" method=""> -->
<%--                                 <input type="hidden" name="nowPages" value="<%=entryBean.getNowPages()+1%>"> --%>
<!--                                 <input type="submit" name="g" value="��һҳ" style="border:0px; background-color: #FFF;"> -->
<!--                             </form> -->
<!--                         </td> -->
<!--                         <td>|</td> -->
<!--                         <td> -->
<!--                             <form action="" method="post"> -->
<%--                                 <input type="hidden" name="nowPages" value="<%=entryBean.getNowPages()+entryBean.getTotalPages()%>"> --%>
<!--                                 <input type="submit" name="g" value="βҳ" style="border:0px; background-color: #FFF;"> -->
<!--                             </form> -->
<!--                         </td> -->
<!--                         <td>|</td> -->
<%--                         <td>��<jsp:getProperty name="entryBean" property="nowPages"/>ҳ/��<jsp:getProperty name="entryBean" property="totalPages"/>ҳ</td> --%>
<!--                         <td> -->
<!--                             <form action="" method="post"> -->
<!--                                 <input type="text" name="nowPages" id="inp" style="cursor: auto;"> -->
<!--                                 <input type="submit" name="g" value="GO" id="go"> -->
<!--                             </form> -->
<!--                         </td> -->
<!--                     </tr> -->
<!--                 </table> -->
<!--             </div> -->
<!--         </div> -->
<!--         <div id="inbound"> -->
<!--             <form action="" method="post"> -->
<!--                 <table id="table" cellspacing=0> -->
<!--                     <tr> -->
<!--                         <td colspan="4" style="font-family: '����'; font-size: 20px; font-weight: bolder;">�� �� �� �� ��</td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>����</td> -->
<!--                         <td><input type="text" name="goods_name" style="border: 0" contenteditable="true"></td> -->
<!--                         <td>���</td> -->
<!--                         <td><input type="text" name="goods_no" style="border: 0" contenteditable="true"></td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>�ֿ���</td> -->
<!--                         <td><input type="text" name="goods_spec" style="border: 0" contenteditable="true"></td> -->
<!--                         <td>����</td> -->
<!--                         <td><input type="text" name="goods_sum" style="border: 0" contenteditable="true"></td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>����</td> -->
<!--                         <td colspan="3"><input type="text" name="goods_type" style="border: 0;width: 277px;" contenteditable="true"></td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td colspan="2" style="border: 0;height: 50px;"> -->
<!--                             <input type="submit" name="g" value="�½���ⵥ" style="width: 100px;line-height: 40px;text-align: center;background-color: #28D5B7;border:0;border-radius: 5px;color: #FFF;margin:5px 10px 0 10px;cursor: pointer;"> -->
<!--                         </td> -->
<!--                         <td colspan="2" style="border: 0;height: 50px;"> -->
<!--                             <input type="button" name="g" value="ȡ��" onclick="clo()" style="width: 100px;line-height: 40px;text-align: center;background-color: #28D5B7;border:0;border-radius: 5px;color: #FFF;margin:5px 10px 0 10px;cursor: pointer;"> -->
<!--                         </td> -->
<!--                     </tr> -->
<!--                 </table> -->
<!--             </form> -->
<!--         </div> -->
<!--     </div> -->
<!--     <script type="text/javascript"> -->
//         var i = document.getElementById('inbound');
//         var t = document.getElementById('table');
//         var b = document.getElementById('submit');
//         function inb() {
//             i.style.opacity='1';
//             i.style.top='150px';
//             i.style.left='165px';
//             i.style.width='370px';
//             i.style.height='231px';
//             i.style.border='2px solid #CCC';
//             setTimeout(function(){
//                 t.style.opacity='1';
//                 b.style.opacity='1';
//             },1000);
//         }
//         function clo(){
//             i.style.opacity='0';
//             t.style.opacity='0';
//             b.style.opacity='0';
//             setTimeout(function(){
//                 i.style.top='50%';
//                 i.style.left='50%';
//                 i.style.width='0px';
//                 i.style.height='0px';
//             },1000);
//         }
<!--     </script> -->
<%--     <%  --%>
//         Connection con;
//         Statement sql;
//         ResultSet rs;
//         String insert_sql;
//         String intitle=null;
//         String goods_no=request.getParameter("goods_no"); //�ӱ����
//         String goods_type=request.getParameter("goods_type"); //�ӱ����
//         String goods_name=request.getParameter("goods_name"); //�ӱ����
//         String goods_spec=request.getParameter("goods_spec"); //�ӱ����
//         String goods_sum=request.getParameter("goods_sum"); //�ӱ����
//         Date dNow = new Date( );
//         SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
//                // out.println(ft.format(dNow));
//         try{
//             Class.forName("com.mysql.jdbc.Driver");
//         }catch(Exception e){
//             out.println("forget jdbc");
//         }
//         try{ 
//             String uri="jdbc:mysql://127.0.0.1/���ִܲ�";
//             String user="root"; //mysql�û��� 
//             String pwd=""; //mysql���� 
//             con=DriverManager.getConnection(uri,user,pwd);
//             sql=con.createStatement(); 
//             insert_sql="insert into goods values('"+goods_no+"','"+goods_type+"','"+goods_name+"','"+goods_spec+"','"+goods_sum+"')"; //���
//             rs=sql.executeQuery("select* from goods where goods_no='"+goods_no+"'");//��ѯ
//             if(rs.next()){
//             }
//             else{
//                 if(sql.execute(insert_sql)){ 
                
//                 }
//                 else{
//                     rs = null;
//                     rs=sql.executeQuery("SELECT input_no from input where input_no = (SELECT max(input_no) FROM input)");//��ȡ��ⵥ���һ��
//                     while(rs.next()){
//                         String a = rs.getString(1);
//                         a = a.trim();
//                         String b = "";
//                         for(int i=0;i<a.length();i++){      //��ȡ��ⵥ�ŵ����ֲ���
//                             if(a.charAt(i)>=48 && a.charAt(i)<=57){
//                                 b+=a.charAt(i);
//                             }
//                         }
//                         //out.println("WN00"+(Integer.parseInt(b)+1));
//                         if (Integer.parseInt(b)<9) {        //�����µ���ⵥ��
//                             intitle = "WN00"+(Integer.parseInt(b)+1);
//                         }else if (Integer.parseInt(b)>=9&&Integer.parseInt(b)<99) {
//                             intitle = "WN0"+(Integer.parseInt(b)+1);
//                         }
//                     }
//                     insert_sql="insert into input values('"+intitle+"','"+goods_no+"','"+goods_type+"','"+goods_name+"','"+goods_spec+"','"+ft.format(dNow)+"')";
//                     sql.execute(insert_sql); 
//                 }
//                 sql.close(); 
//                 con.close(); 
//             }  
//         }catch(Exception e){} 
<%--     %>  --%>
</body>
</HTML>