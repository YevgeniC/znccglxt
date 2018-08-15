<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>账户开通3</title>
    <style type="text/css">
        *{
            margin:0;
            padding:0;
        }
        ul,li{
            margin:0;
            padding:0;
            list-style-type: none;
        }
        a{
            text-decoration: none;
        }
        .a1{
            color: white;
        }
        .a2{
            color: black;
        }
        #title{
            width: 100%;
            height: 30px;
            color: white;
            font-size: 15px;
            line-height: 30px;
            background-color: #6B6B6B;
        }
        #title ul{
            float: right;
            text-align: center;
            position: relative;
            right: 30px;
        }
        #title ul li{
            width: 120px;
            float: left;
            position: relative;
        }
        #title ul li:nth-child(3){
            width: 200px;
        }
        #title ul li:hover ul{       
            display:block;          
        }
        #title ul li a{        
            display:block;   
        }                    
        #title ul li ul{      
            position:absolute;  
            top:30px;           
            left: 0px;
            display:none;       
        }           
        #menu{
            width: 120px;
            height: 120px;
            position: relative;
            z-index: 2;
            background-color: #CCCCCC;
        }
        #QRcode{
            width: 100px;
            height: 100px;
            position: absolute;
            margin: auto;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
        #logo{
            width: 100%;
            height: 80px;
            font-size: 18px;
            line-height: 80px;
            position: relative;
            z-index: 0;
            background-image: url(/picture/logo.png);
        }
        #logo ul{
            float: right;
            text-align: center;
        }
        #logo ul li{
            width: 100px;
            float: left;
        }
        #logo ul li:nth-child(6){
            width: 170px;
        }
        #touch{
            width: 100px;
            height: 40px;
            line-height: 40px;
            position: absolute;
            margin: auto;
            top: 0;
            right: 35px;
            bottom: 0;
            border-radius: 5%;
            background-color: #00B2EE;
            border: 1px solid #00B2EE;
        }
        #body1{
            width: 100%;
            height: 550px;
            text-align: center;
            position: relative;
        }
        #body2{
            width: 100%;
            height: 480px;
            text-align: center;
            position: relative;
        }
        #box1{
            width: 325px;
            height: 300px;
            position: absolute;
            margin: auto;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
        #box2{
            width: 325px;
            height: 230px;
            position: absolute;
            margin: auto;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
        #box1-1{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            background-color: #6B6B6B;
        }
        #box1-2{
            width: 200px;
            height: 30px;
            font-size: 16px;
            float: left;
            text-align: center;
        }
        #box1-3{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            position: relative;
            top: 30px;
            background-color: #6B6B6B;
        }
        #box1-4{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            text-align: center;
            position: relative;
            top: 30px;
        }
        #box1-5{
            width: 320px;
            height: 30px;
            float: left;
            font-size: 16px;
            text-align: center;
            position: relative;
            top: 60px;
        }
        #box1-9{
            width: 322px;
            height: 30px;
            float: left;
            font-size: 16px;
            line-height: 30px;
            text-align: center;
            position: relative;
            top: 90px;
            color: rgb(84,84,84);
            background-color: rgb(235,235,228);
            border:1px solid rgb(169,169,169);
        }
        #box1-6{
            width: 200px;
            height: 40px;
            color: white;
            font-size: 18px;
            position: relative;
            top: 120px;
            border: 1px solid black;
            background-color: #6B6B6B;
        }
        #box1-7{
            width: 320px;
            height: 30px;
            float: left;
            font-size: 16px;
            text-align: center;
            position: relative;
            top: 60px;
        }
        #box1-8{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 90px;
            left: 60px;
        }
        #bottom{
            width: 100%;
            height: 200px;
            background-size:100% 100%;
            background-image: url(/picture/bottom.jpg);
        }
        #bottom-1{
            width: 400px;
            height: 150px;
            float: left;
        }
        #bottom-2{
            width: 400px;
            height: 150px;
            float: right;
            position: relative;
            right: 33px;
        }
        #bottom-3{
            width: 100%;
            height: 50px;
            float: left;
            line-height: 50px;
            text-align: center;
            border-top: 1px dashed white;
        }
        #line3{
            width: 50px;
            height: 2px;
            position: relative;
            left: 70px;
            background-color: #00B2EE;
        }
        #line4{
            width: 260px;
            height: 2px;
            position: relative;
            left: 70px;
            background-color: white;
        }
        #bottom p{
            color: white;
            text-align: center;
        }
        #p1{
            font-size: 15px;
            padding-left: 13em;
        }
        #p2{
            font-size: 25px;
        }
        #p3{
            font-size: 45px;
        }
        #box{
            width: 100px;
            height: 40px;
            float: left;
            line-height: 40px;
            text-align: center;
            position: relative;
            top: 55px;
            color: white;
            border: 1px solid white;
        }
        #QRcode1{
            width: 120px;
            height: 120px;
            float: right;
            position: relative;
            top: 15px;
        }
        #QRcode2{
            width: 120px;
            height: 120px;
            float: right;
            position: relative;
            top: 15px;
            right: 30px;
        }
        #logo ul li:hover{
            background-color: #00EEEE;
            color: white;
        }
        #logo ul li:nth-child(7):hover{
            background-color: white;
            color: black;
        }
        #touch:hover{
            background-color: white;
        }
        #box:hover{
            color: #CCCCCC;
        }
    </style>
    
</head>
<body>
    <div id="title">
        <font style="padding-left: 5em">欢迎来到智能仓储管理系统</font>
        <ul>
            <li>
                <a class="a1" href="#">关注新浪微博</a>
                <ul>
                    <li>
                        <div id="menu">
                            <div id="QRcode"><img src="/picture/QRcode1.png" width="100%" height="100%"></div>
                        </div>
                    </li>
                </ul>
            </li>
            <li>
                <a class="a1" href="#">关注微信</a>
                <ul>
                    <li>
                        <div id="menu">
                            <div id="QRcode"><img src="/picture/QRcode2.png" width="100%" height="100%"></div>
                        </div>
                    </li>
                </ul>
            </li>
            <li><a class="a1" href="#">服务电话：020-26298802</a></li>
        </ul>
    </div>
    <div id="logo">
        <ul>
            <li><a class="a2" href="/ssm/index">首页</a></li>
            <li><a class="a2" href="/ssm/产品中心">产品中心</a></li>
            <li><a class="a2" href="#">解决方案</a></li>
            <li><a class="a2" href="#">个性化服务</a></li>
            <li><a class="a2" href="#">关于我们</a></li>
            <li>
                <div id="touch"><a class="a2" href="#">联系我们</a></div>
            </li>
        </ul>
    </div>
<% 
    String username=request.getParameter("username");
    String password=request.getParameter("password");
%>
    <div id="body1">
        <div id="body1">
                <div id="box1">
                <div id="box1-1">账户名称</div>
                <input id="box1-2" type="text" name="username" value="<%= username%>" disabled="true">
                <div id="box1-3">账户密码</div>
                <input id="box1-4" type="text" name="password" value="<%= password%>" disabled="true">
                <form action="/ssm/账户开通2">
                    <input id="box1-7" type="text" name="username" value="账号已被注册，请重新注册账号！" disabled="true">
                    <input id="box1-8" type="submit" name="submit" value="重新注册">
                </form>
            </div>
        </div>
    </div>
    <div id="bottom">
        <div id="bottom-1">
        <br>
            <p id="p1">Rovinj.cn</p>
            <p id="p2">时尚行业RFID应用专家</p>
            <div id="line3"></div>
            <div id="line4"></div>
            <p id="p3">020-26298802</p>
        </div>
        <div id="bottom-2">
            <div id="box">关注微博</div>
            <div id="QRcode1"><img src="picture/QRcode1.png" width="100%" height="100%"></div>
            <div id="QRcode2"><img src="picture/QRcode2.png" width="100%" height="100%"></div>
        </div>
        <div id="bottom-3"><font color="white">Copyright ©2016 广州罗维尼信息科技有限公司 版权所有 | 粤ICP备05001008号</font></div>
    </div>
</body>
</html>