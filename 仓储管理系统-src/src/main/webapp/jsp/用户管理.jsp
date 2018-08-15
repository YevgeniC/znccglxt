<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<HTML>
<head>
<script type="text/javascript"  src="http://spin.js.org/spin.min.js"></script>
<style type="text/css">
    *{
        margin: 0;
        padding: 0;
    }
    body{
        /*height: 100%;*/
        background-image: url(/picture/pic.jpg);
        background-size: cover;
        background-repeat: no-repeat;
        opacity: 1;
        overflow: hidden;
    }
    a{
        color: #FFF;
        text-decoration: none;
    }
    #wait{
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -300px;
        margin-left: -35%;
        width: 70%;
        height: 600px;
        background-color: #FFF;
        z-index: 10;
        opacity: 1;
        transition: 1s;
    }
    #body{
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -300px;
        margin-left: -35%;
        width: 70%;
        height: 600px;
        background-color: #FFF;
        overflow: hidden;
    }
    #top{
        width: 100%;
        height: 60px;
    }
    #logo{
        width: 60px;
        height: 60px;
        /*position: relative;*/
        margin-left: 25px;
        float: left;
    }
    #C_name{
        width: 150px;
        height: 60px;
        margin-left: 15px;
        line-height: 60px;
        font-size: 18px;
        float: left;
    }
    #U_name{
        width: 160px;
        height: 60px;
        text-align: center;
        line-height: 60px;
        font-size: 18px;
        margin-right: 60px;
        float: right;
    }
    #U_photo{
        width: 44px;
        height: 44px;
        position: absolute;
        right: 25px;
        /*border: 1px solid #999;*/
        /*float: right;*/
    }
    #U_photo:hover{
        cursor: pointer;
        box-shadow: 10px 10px 5px #999;
    }
    #set{
        width: 120px;
        height: 80px;
        position: absolute;
        top: 60px;
        right: 15px;
        background-color: #FFF;
        display: none;
        transition: 1s;
        border-radius: 5px;
        z-index: 999;
    }
    #set div{
        height: 40px;
        text-align: center;
        line-height: 40px;
        border: 1px solid #CCC;
    }
    #set div:nth-child(1){
        border-radius: 5px 5px 0px 0px;
    }
    #set div:nth-child(3){
        border-radius: 0px 0px 5px 5px;
        transition: 1s;
    }
    #set div:hover{
        cursor: pointer;
        background-color: #CCC;
    }
    #set a{
        text-decoration: none;
        color: #000;
    }
    #submit{
        width: 100%;
        height: 100%;
        float: left;
        font-size: 16px;
        text-align: center;
        line-height: 40px;
        background-color: white;
        border: none;
        border-radius: 5px 5px 0px 0px;
        cursor:pointer;
    }
    #left{
        width: 25%;
        height: 540px;
        background-color: rgba(51, 68, 83, 1);
        float: left;
    }
    #menu{
        margin-top: 40px;
        list-style: none;
        color: #FFF;
        text-align: center;
    }
    #menu li{
        height: 45px;
        line-height: 40px;
        margin-top: 10px;
        font-size: 18px;
    }
    #menu li:hover{
        cursor: pointer;
        /*border-left: 3px solid #7FFF00;*/
        background-color: #526C85;
    }
    #usermessage{
        height: 100%;
        width: 100%;
        border: none;
        color: white;
        font-size: 18px;
        background-color: rgba(51, 68, 83, 1);
    }
    #usermessage:hover{
        cursor: pointer;
        /*border-left: 3px solid #7FFF00;*/
        background-color: #526C85;
    }
    #border{
        height: 100%;
        width: 3px;
        background-color: #7FFF00;
        float: left;
    }
    #right{
        width: 75%;
        height: 540px;
        /*background-color: #CCC;*/
        float: left;
        position: relative;
    }
    #userinfo{
        position: absolute;
        margin: auto;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        width: 90%;
        height: 95%;
    }
    #userinfo table{
        font-size: 18px;
    }
</style>
</head>
<body>
<%
   String username = (String)session.getAttribute("username");
%>
    <!--     <div id="wait"></div>       //等待画面-->    
    <div id="body">
        <div id="top">
            <div id="logo"><img src="/picture/进入系统/u28.png" style="width: 50px;height: 50px;margin:5px;"></div>
            <div id="C_name">智能仓储管理系统</div>
            <div id="U_name"><%=username%>【管理员】</div>
            <div id="U_photo" onclick="show()"><img src="/picture/进入系统/1.jpeg" style="width: 44px;height: 44px;margin:8px;border-radius:5px"></div>
        </div>
        <div id="set" value=0>
            <div>
                <form action="adhome">
                    <input type="hidden" name="username" value="<%=username%>">
                    <input id="submit" type="submit" value="返回" 
                    onmouseover="this.style.backgroundColor='#CCC';" 
                    onmouseout="this.style.backgroundColor='white';">
                </form>
            </div>
            <div id="div2" style="display: none;">选项设置</div>
            <div onclick="out()">退出</div>
        </div>
        <div id="left">
            <ul id="menu">
                <li>
                    <form action="个人中心">
                        <input type="hidden" name="username" value="<%=username%>">
                        <input type="submit" id="usermessage" value="个人中心">
                    </form>
                </li>
                <li style="background-color: #526C85;">
                    <div id="border"></div>
                    <a href="#">用户信息</a>
                </li>
                <li><a href="/ssm/用户增加">用户增加</a></li>
                <!-- <li><a href="/ssm/用户删除">用户删除</a></li> -->
            </ul>
        </div>
        <div id="right">
            <div id="userinfo">
                <h2>用户中心</h2>
                <div style="width: 100%;height: 10px;"></div>
                <center>
                    <table>
                        <tr align="center">
                            <td width=50 height=50>Id</td>
                            <td width=100 height=50>账户名称</td>
                            <td width=100 height=50>账户密码</td>
                            <td width=100 height=50>真实姓名</td>
                            <td width=100 height=50>电话号码</td>
                            <td width=50 height=50>权限</td>
                            <td width=100 height=50>上级管理员</td>
                            <td width=50 height=50></td>
                        </tr>
                        <c:forEach var="user" items="${users}">
                            <tr align="center">
                                <td height=50><c:out value="${user.id}"/></td>
                                <td height=50><c:out value="${user.username}"/></td>
                                <td height=50><c:out value="${user.password}"/></td>
                                <td height=50><c:out value="${user.realname}"/></td>
                                <td height=50><c:out value="${user.phonumber}"/></td>
                                <td height=50><c:out value="${user.type}"/></td>
                                <td height=50><c:out value="${user.director}"/></td>
                                <td height=50>
                                    <form action="/ssm/doDeleteUser" method="post">
                                        <input type="hidden" name="id" value="${user.id}" style="width: 50px;">
                                        <input type="hidden" name="director" value="<%=username%>"/>
                                        <input type="submit" value="删除" style="width: 50px;">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </center>
            </div>
        </div>
    </div>
</body>


<%
String updateerror="null";
request.getSession().setAttribute("updateerror", updateerror);
// 将updateerror重置为null
String deleteerror="null";
request.getSession().setAttribute("deleteerror", deleteerror);
// 将deleteerror重置为null
String adderror="null";
request.getSession().setAttribute("adderror", adderror);
// 将adderror重置为null
%>


<script type="text/javascript">
    var b = document.getElementById('set');
    function show(){
        x = b.getAttribute('value');
        if(x==0){
            b.setAttribute('value','1');
            b.setAttribute('style','display:block');
        } else if(x==1){
            b.setAttribute('value','0');
            b.setAttribute('style','display:none');
        }
    }
    function out(){
        var a = document.getElementById('set').getElementsByTagName('div')[2];
        // a.style.opacity=0.3;
        b.style.color="#FFF";
        a.style.fontSize="50px";
        a.innerHTML="Bye~";
        a.style.marginTop='-500px';
        a.style.marginLeft='-1050px';
        a.style.width="0px";
        a.style.height="0px";
        a.style.border="650px solid #FFF"; 
        a.style.borderRadius="650px";
        setTimeout(function(){
            window.location.href="/ssm/进入系统";
        },2000);
        document.getElementById('submit').style.display='none';
        document.getElementById('div2').style.display='none';
    }
    var opts = {
        lines: 11,
        length: 13,
        width: 7,
        radius: 13,
        corners: 1,
        rotate: 0,
        direction: 1,
        color: '#333',
        speed: 1, 
        trail: 34,
        shadow: false,
        hwaccel: false,
        className: 'spinner',
        zIndex: 2e9,
        top: '50%',
        left: '50%'
    };
    var target = document.getElementById('wait');
    var spinner = new Spinner(opts).spin(target);
    window.onload=init;
        function init(){
            var w = document.getElementById('wait')
            setTimeout(function(){
                w.style.opacity='0';
            },1000);
            setTimeout(function(){
                w.style.zIndex='-1';
            },2000);
        }
</script>
</HTML>