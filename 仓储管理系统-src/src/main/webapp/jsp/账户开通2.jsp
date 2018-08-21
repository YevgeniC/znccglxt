<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>账户开通2</title>
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
            height: 630px;
            position: relative;
        }
        #box1{
            width: 325px;
            height: 440px;
            position: absolute;
            margin: auto;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
        #box1-0{
            width: 325px;
            height: 50px;
            font-size: 30px;
            line-height: 50px;
            text-align: center;
            position: relative;
            top: -50px;
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
            position: relative;
            top: -30px;
        }
        #box1-2{
            width: 200px;
            height: 30px;
            font-size: 16px;
            float: left;
            position: relative;
            top: -30px;
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
            top: 0px;
            background-color: #6B6B6B;
        }
        #box1-4{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 0px;
        }
        #box1-5{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            position: relative;
            top: 10px;
            background-color: #6B6B6B;
        }
        #box1-6{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 10px;
        }
        #box1-12{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            position: relative;
            top: 40px;
            background-color: #6B6B6B;
        }
        #box1-13{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 40px;
        }
        #box1-7{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            position: relative;
            top: 70px;
            background-color: #6B6B6B;
        }
        #box1-8{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 70px;
        }
        #box1-9{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            position: relative;
            top: 100px;
            background-color: #6B6B6B;
        }
        #box1-10{
            width: 201px;
            height: 30px;
            float: right;
            font-size: 16px;
            position: relative;
            top: 100px;
        }
        #box1-11{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 130px;
            left: 60px;
        }
        #blank{
            width: 120px;
            height: 32px;
            position: relative;
            top: 271px;
            opacity: 0.5;
            display: none;
            background-color: #CCCCCC;
        }
        #safe{
            width: 323px;
            height: 20px;           
            text-align: center;
            line-height: 20px;
            position: relative;
            top: 5px;
        }
        #safename{
            width: 120px;
            float: left;
        }
        #strength_L{
            width: 67px;
            float: left;
            background-color: #eeeeee;
            border-right: 1px dashed #6B6B6B;
        }
        #strength_M{
            width: 67px;
            float: left;
            background-color: #eeeeee;
        }
        #strength_H{
            width: 67px;
            float: left;
            background-color: #eeeeee;
            border-left: 1px dashed #6B6B6B;
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
    <div id="body1">
        <div id="box1">
            <div id="box1-0"><font>账号注册</font></div>
            <sf:form action="/ssm/doRegister" modelAttribute="user" method="post" name="load" onsubmit="return check(this);">
                <div id="box1-1">账户名称</div>
                <sf:input id="box1-2" type="text" path="username" required="true" placeholder="不支持中文和特殊字符" onclick="text()"/>
                <div id="box1-3">设置密码</div>
                <sf:input id="box1-4" type="password" path="password" required="true" placeholder="设置账号密码" onKeyUp="pwStrength(this.value)" onBlur="pwStrength(this.value)"/>
                <div id="safe">
                    <div id="safename">安全系数：</div>
                    <div id="strength_L" bgcolor="#eeeeee">低</div>
                    <div id="strength_M" bgcolor="#eeeeee">中</div>
                    <div id="strength_H" bgcolor="#eeeeee">高</div>
                </div>
                <div id="box1-5">确认密码</div>
                <input id="box1-6" type="password" name="password2" required="true" placeholder="重新输入密码">
                <div id="box1-12">真实姓名</div>
                <sf:input id="box1-13" type="text" path="realname" required="true" placeholder="请输入真实姓名"/>
                <div id="box1-7">手机号码</div>
                <sf:input id="box1-8" type="text" path="phonumber" required="true" placeholder="请输入手机号"/>
                <input id="box1-9" type="button" name="获取验证码" value="获取验证码" onClick="timedMsg()">
                <input id="box1-10" type="text" name="identifying" required="true" placeholder="请输入手机收到的验证码">
                <input id="box1-11" type="submit" value="下一步">
                <div id="blank"></div>
            </sf:form>
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
            <div id="QRcode1"><img src="/picture/QRcode1.png" width="100%" height="100%"></div>
            <div id="QRcode2"><img src="/picture/QRcode2.png" width="100%" height="100%"></div>
        </div>
        <div id="bottom-3"><font color="white">Copyright ©2016 广州罗维尼信息科技有限公司 版权所有 | 粤ICP备05001008号</font></div>
    </div>
    <!-- 密码强度 -->
    <script language=javascript>  
        function checkStrong(sPW){
            if(sPW.length<=3)
                return 1;
            else if(sPW.length<=6){
                return 2;
            }
            else if(sPW.length<=9){
                return 3;
            }
        }
        function pwStrength(pwd){    
            Dfault_color="#eeeeee";   
            L_color="#FF0000";
            M_color="#FF9900";
            H_color="#33CC00";
            if (pwd==null||pwd==''){    
                Lcolor=Mcolor=Hcolor=Dfault_color;  
            }    
            else{    
                S_level=checkStrong(pwd);    
                switch(S_level) {    
                case 0:    
                    Lcolor=Mcolor=Hcolor=Dfault_color;  
                    break;  
                case 1:    
                    Lcolor=L_color;  
                    Mcolor=Hcolor=Dfault_color;  
                    break;    
                case 2:    
                    Lcolor=Mcolor=M_color;    
                    Hcolor=Dfault_color;    
                    break;    
                default:    
                    Lcolor=Mcolor=Hcolor=H_color;    
                }    
            }    
            document.getElementById("strength_L").style.background=Lcolor;    
            document.getElementById("strength_M").style.background=Mcolor;    
            document.getElementById("strength_H").style.background=Hcolor;    
            return;  
        }  
    </script>
    <!-- 验证码 -->
    <script type="text/javascript">
        var time=3;
        var t;
        var x=Math.random();
        var pho;
        function timedMsg(){
            pho=document.getElementById('box1-8').value;
            if(pho==''){
                alert("请输入手机号用以接收验证码"+'\n');
            }
            else if(pho.length<11){
                alert("请输入正确的手机号"+'\n');
            }
            else if(pho.length>11){
                alert("请输入正确的手机号"+'\n');
            }
            else{
                if(time==0){
                    y=Math.floor(100000+x*899999);
                    document.getElementById("box1-9").value="获取验证码";
                    document.getElementById("blank").style.display="none";
                    time=10;
                    alert("您的手机号为："+pho+'\n'+'\n'+"随机验证码为："+y+'\n');
                    clearTimeout(t);
                }
                else{
                    document.getElementById("blank").style.display="block";
                    document.getElementById("box1-9").value="重新发送("+time+")"; 
                    time--;
                    t=setTimeout('timedMsg()',1000);
                }
            }
        }
    </script>
    <!-- 密码验证 -->
    <script>
        function check(form){
            var a=form.password;
            var b=form.password2;
            var c=Math.floor(100000+x*899999);
            var d=document.getElementById("box1-10").value;
            if (a.value!=b.value){
                b.oninvalid();
                return false;
            }
            if(c!=d){
                alert("验证码错误！请重新输入！");
                window.location.href="/ssm/账户开通2"; 
                window.event.returnValue=false;
            }
            return true;
        }
        onload=function(){
            var b=document.forms["load"].password2;
            b.oninvalid=function(){
                this.setCustomValidity("密码不一致，请重新输入");
            }
            b.oninput=function(){
                this.setCustomValidity("");
            }
        }
    </script>
    <script>
        document.getElementById("box1-9").onmouseover=function(){ 
            this.style.cursor='pointer';
        }
        document.getElementById("box1-11").onmouseover=function(){ 
            this.style.cursor='pointer';
        }
    </script>
</body>
</html>