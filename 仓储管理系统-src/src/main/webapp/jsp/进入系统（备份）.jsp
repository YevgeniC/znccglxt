<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>进入系统</title>
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
    #body{
      position: absolute;
      top: 50%;
      left: 50%;
      /*z-index: 1;*/
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
      position: absolute;
      top: 0;
      /*z-index: 10;*/
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
    #tuichu{
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
    #tuichu:hover{
      cursor: pointer;
      background-color: #FF0000;
    }
    #login{
      position: absolute;
      top: 50%;
      left: 50%;
      margin-top: -110px;
      margin-left: -150px;
      width: 300px;
      height: 200px;
      line-height: 80px;
    }
    #login input{
      width: 300px;
      height:50px;
      font-size: 20px;
      color: #CDC9C9;
    }
    #radio1{
      position: absolute;
      top: 160px;
      left: 70px;
    }
    #radio1_txt{
      position: absolute;
      top: 130px;
      left: 100px;
    }
    #radio2{
      position: absolute;
      top: 160px;
      left: 160px;
    }
    #radio2_txt{
      position: absolute;
      top: 130px;
      left: 190px;
    }
    #next{
      text-align: center;
      line-height: 40px;
      position: absolute;
      top: 200px;
      left: 0px;
      background-color: #28D5B7;
      border: 1px solid transparent;
      border-radius: 5px;
      cursor: pointer;
      font-size: 22px;
      /*font-family: 'Microsoft YaHei';*/
      color: #FFFFFF;
      transition: 1s;
    }
    #word{
      position: absolute;
      top: 450px;
      left:570px;
      right: 0;
      z-index: 999;
    }
    #next:hover{
      background-color: #5ae0c9;
    }
  </style>

</head>
<body>
  <div id="body">
      <img src="/picture/u0.png" style="width: 100%;height: 600px;">
      <div id="top">
        <div id="logo"><img src="/picture/进入系统/u28.png" style="width: 50px;height: 50px;margin:5px;"></div>
        <div id="C_name">智能仓储管理系统</div>
        <div id="tuichu" onclick="javascript:this.style.zIndex=15; this.style.fontSize='50px';
                                             this.style.color='#000'; this.innerHTML='Bye~';
                                             this.style.marginTop='-400px';this.style.marginRight='-120px';
                                             this.style.width='0';this.style.height='0';
                                             this.style.border='650px solid #FFF'; this.style.borderRadius='650px';
                                             setTimeout(function(){window.location.href='/ssm/index';},2000); ">&#10005</div>
      </div>
      <div id="login">
      <form action="/ssm/login" modelAttribute="login" method="post">
        <input id="id" type="text" value="用户名" name="username" required="required" 
                onfocus="javascript:if(this.value=='用户名')this.value='';"
                onblur="javascript:if(this.value=='')this.value='用户名';">
        <input id="pass" type="text" value="密码" name="password" required="true" 
                onfocus="javascript:if(this.value=='密码'){this.value='';this.type='password';}" 
                onblur="javascript:if(this.value==''){this.value='密码';this.type='text';}" 
                onKeyUp="CheckIntensity(this.value)">
        <input type="radio" id="radio1" name="type" required="true" value="1" style="width: 20px;height: 20px;"/>
        <font id="radio1_txt">用户</font>
        <input type="radio" id="radio2" name="type" required="true" value="0" style="width: 20px;height: 20px;"/>
        <font id="radio2_txt">管理员</font>
        <input id="next" type="submit" value="登录" onclick="submit()" style="color: white;width: 300px;height: 40px;font-size: 22px;">
      </form>
      </div>
  </div>
  <script type="text/javascript">
    function submit() {
      var a = document.getElementById('next');
        // a.style.opacity=0.3;
        a.style.color='#000';
        a.style.fontSize="50px";
        a.innerHTML="Welcome~";
        a.style.marginTop='-650px';
        a.style.marginLeft='-450px';
        a.style.width="0px";
        a.style.height="0px";
        a.style.border="600px solid #FFF"; 
        a.style.borderRadius="600px";
      setTimeout(function(){
        window.location.href="/ssm/home";
      },1500);
    }
  </script>
</body>
</html>