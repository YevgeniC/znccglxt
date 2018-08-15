<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>进入系统</title>
    <style type="text/css">
        *{
            margin:0;
            padding:0;
        }
        #body{
            width: 100%;
            height: 637px;
            opacity: 1;
            overflow: hidden;
            position: relative;
            background-size: cover;
            background-repeat: no-repeat;
            background-image: url(/picture/pic.jpg);
        }
        #box{
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: auto;
            width: 70%;
            height: 600px;
            background-color: #FFF;
            background-image: url(/picture/u0.png);
        }
        #top{
            width: 100%;
            height: 60px;
        }
        #logo{
            width: 60px;
            height: 60px;
            float: left;
            margin-left: 25px;
        }
        #logo img{
            width: 50px;
            height: 50px;
            margin: 5px;"
        }
        #C_name{
            width: 200px;
            height: 60px;
            margin-left: 15px;
            line-height: 60px;
            font-size: 20px;
            float: left;
        }
        #quit{
            position: absolute;
            top: 0px;
            right: 0px;
            width: 30px;
            height: 30px;
            color: #FFF;
            text-align: center;
            line-height: 30px;
            transition: 1s;
        }
        #quit:hover{
            cursor: pointer;
            background-color: #FF0000;
        }
        #login{
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: auto;
            width: 300px;
            height: 210px;
        }
        #username{
            width: 297px;
            height:50px;
            font-size: 20px;
            color: #CDC9C9;
        }
        #password{
            width: 297px;
            height:50px;
            font-size: 20px;
            margin-top: 20px;
            color: #CDC9C9;
        }
        ::-webkit-input-placeholder{
            color: #CDC9C9;
        }
        #radio1{
            width: 20px;
            height: 20px;
            margin-top: 10px;
            position: absolute;
            left: 60px;
        }
        #radio1_txt{
            margin-top: 10px;
            position: absolute;
            left: 90px;
        }
        #radio2{
            width: 20px;
            height: 20px;
            margin-top: 10px;
            position: absolute;
            right: 105px;
        }
        #radio2_txt{
            margin-top: 10px;
            position: absolute;
            right: 50px;
        }
        #button{
            color: white;
            width: 300px;
            height: 40px;
            color: #FFFFFF;
            font-size: 22px;
            line-height: 40px;
            text-align: center;
            background-color: #28D5B7;
            border-radius: 5px;
            border: 1px solid transparent;
            cursor: pointer;
            margin-top: 40px;
        }
        #button:hover{
            background-color: #5ae0c9;
        }
    </style>
</head>
<body>
    <div id="body">
        <div id="box">
            <div id="top">
                <div id="logo">
                    <img src="/picture/进入系统/u28.png">
                </div>
                <div id="C_name">智能仓储管理系统</div>
                <div id="quit" onclick="javascript:this.style.zIndex=15; 
                                             this.style.width='0';this.style.height='0';this.innerHTML='Bye~';
                                             this.style.fontSize='50px';this.style.color='#000'; 
                                             this.style.marginTop='-400px';this.style.marginRight='-120px';
                                             this.style.border='650px solid #FFF';this.style.borderRadius='650px';
                                             setTimeout(function(){window.location.href='/ssm/index';},2000); ">&#10005</div>
            </div>
            <div id="login">
                <form action="/ssm/doLogin" modelAttribute="login" method="post">
                    <input id="username" type="text" placeholder="用户名" name="username" required="true"
                    onfocus="javascript:if(this.placeholder=='用户名')this.placeholder='';"
                    onblur="javascript:if(this.placeholder=='')this.placeholder='用户名';">
                    <input id="password" type="password" placeholder="密码" name="password" required="true"
                    onfocus="javascript:if(this.placeholder=='密码')this.placeholder='';"
                    onblur="javascript:if(this.placeholder=='')this.placeholder='密码';">
                    <input type="radio" id="radio1" name="type" required="true" value="1"/>
                    <font id="radio1_txt">用户</font>
                    <input type="radio" id="radio2" name="type" required="true" value="0"/>
                    <font id="radio2_txt">管理员</font>
                    <input id="button" type="submit" value="登录">
                </form>
            </div>
        </div>
    </div>

<%
String loginerror=(String)request.getSession().getAttribute("loginerror"); 
%>
<input type="hidden" id="loginerror" value="<%=loginerror%>">



<script language="javascript">
    window.onload=function(){
        var loginerror=document.getElementById('loginerror').value;
        if (loginerror==0) {
            //登录成功时使loginerror=0，这样登录成功后退出系统到登录页面时loginerror=0不会弹出弹窗
        }
        else if (loginerror==1) {
            alert("错误代码ERROR：01\n用户名或密码错误");
        }
        else if (loginerror==2) {
            alert("错误代码ERROR：02\n用户不存在");
        }
    }
</script>

<%
String adderror="null";
request.getSession().setAttribute("adderror", adderror);
// 每次进入系统时将adderror重置为null
%>

</body>
</html>