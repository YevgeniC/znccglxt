<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>智能仓储管理系统</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/dist/jquery.vm-carousel.css">
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
        #begin{
            width: 100%;
            height: 110px;
        }
        #title{
            width: 100%;
            height: 30px;
            color: white;
            font-size: 15px;
            line-height: 30px;
            background-color: #6B6B6B;
            position: fixed;
            top: 0;
            z-index : 10;
        }
        #title ul{
            float: right;
            text-align: center;
            position: relative;
            right: 30px;
            top: 1px;
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
            top: -1px;
            z-index: 20;
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
            position: fixed;
            top: 30px;
            z-index: 5;
            background-image: url(/picture/logo.png);
        }
        #logo ul{
            float: right;
            text-align: center;
            position: relative;
            top: 0px;
        }
        #logo ul li{
            width: 100px;
            float: left;
        }
        #logo ul li:nth-child(6){
            width: 170px;
        }
        #touch{
            width: 102px;
            height: 42px;
            line-height: 42px;
            position: absolute;
            margin: auto;
            top: -2px;
            right: 35px;
            bottom: 0;
            border-radius: 5%;
            background-color: #00B2EE;
            border: 1px solid #00B2EE;
        }
        #body1{
            height: 400px;
            width: 100%;
            position: relative;
        }
        #picture{
            width: 95%;
            height: 400px;
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
            overflow: hidden;
        }    
        #carousel{
            width: 10000px;
            position: absolute;
            top: 0px;
            left: 0px;
            transition: left 1s;
        }
        #carousel li{
            float: left;
        }
        #chooseul{
            left: 500px;
            position: absolute;
            bottom: 10px;
        }
        #chooseul li{
            width: 15px;
            height: 15px;
            float: left;
            position: relative;
            left: 58px;
            margin-left: 20px;
            border-radius: 15px;
            border: 1px solid white;
        }
        .btr{
            width: 15px;
            height: 15px;
            position: relative;
            top: -1px;
            left: -1px;
            cursor: pointer;
            border-radius: 15px;
            background-color: none;
        }
        #body2{
            width: 100%;
            height: 100px;
            font-size: 20px;
            position: relative;
        }
        #function{
            width: 95%;
            height: 100px;
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
            background-color: rgb(1,150,147);
        }
        #enter{
            width: 100%;
            height: 80px;
            position: absolute;
            margin: auto;
            top: 0;
            bottom: 0;
        }
        #enter img{
            vertical-align:middle;
        }
        #enter1{
            width: 24.9%;
            height: 80px;
            float: left;
            line-height: 80px;
            text-align: center;
            border-right: 1px dashed white;
        }
        #enter2{
            width: 24.9%;
            height: 80px;
            float: left;
            line-height: 80px;
            text-align: center;
        }
        #blank{
            width: 100%;
            height: 50px;
        }
        #body3{
            width: 100%;
            height: 400px;
            position: relative;
        }
        #ad{
            width: 95%;
            height: 400px;
            text-align: center;
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
            background-size:100% 100%;
            background-image: url(/picture/handshake.jpg);
        }
        #ad p{
            color: white;
            font-size: 40px;
            font-family: 隶书;
            line-height: 750px;
        }
        #body4{
            width: 100%;
            height: 500px;
            position: relative;
        }
        #cooperate{
            width: 95%;
            height: 500px;
            text-align: center;
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
        }
        #pic{
            width: 100%;
            height: 325px;
            background-size: 100% 100%;
            background-image: url(/picture/pic.jpg);
        }
        #pic font{
            color: white;
        }
        .container img{
            opacity: 0.6;
            border-radius: 50%;
        }
        .container{
            position: relative;
            top: 25px;
        }
        #picline{
            width: 80%;
            height: 175px;
            position: absolute;
            margin: auto;
            top: 325px;
            left: 0;
            right: 0;
            background-color: yellow;
            background-size: 100% 100%;
            background-image: url(/picture/line.png);
        }
        #line{
            width: 300px;
            height: 5px;
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
        }
        #line1{
            width: 100px;
            height: 5px;
            float: left;
            border-bottom: 2px solid #CCCCCC;
        }
        #line2{
            width: 100px;
            height: 4px;
            float: left;
            border-bottom: 4px solid #00B2EE;
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
        #process{      /*350*650*/
            width: 102px;
            height: 18px;
            position: fixed;
            top: 90px;
            left: 1212px;
            z-index: 9999;
            opacity: 0;
            transition: 1s;
            overflow: hidden;
            background-color: red;
        }
        #service1{
            width: 100%;
            height: 8.3333333333%;/*40px*/
            color: white;
            font-size: 20px;
            line-height: 40px;
            background-color: #6B6B6B;
        }
        #serpic{
            width: 6.153846154%;/*40px*/
            height: 100%;/*40px*/
            float: left;
            border-radius: 50%;
            background-size: 100% 100%;
            background-image: url(/picture/serpic1.png);
        }
        #serword{
            width: 87.69230769%;
            height: 100%;
            float: left;
            background-size: 100% 100%;
            background-image: url(/picture/serpic2.png);
        }
        #serout{
            width: 3.076923077%;/*20px*/
            height: 50%;/*20px*/
            float: right;
            position: relative;
            top: 25%;/*10px*/
            right: 10px;
            background-size: 100% 100%;
            background-image: url(/picture/out.png);
        }
        #service2{
            width: 100%;
            height: 68.75%;/*330*/
            background-size: 100% 100%;
            background-image: url(/picture/talk1.png);
        }
        #service3{
            width: 100%;
            height: 22.916666667%;/*110*/
            background-size: 100% 100%;
            background-image: url(/picture/talk2.png);
        }
        #out{
            width: 60px;
            height: 30px;
            position: relative;
            top: -40px;
            left: 505px;
        }
        #offer{
            width: 60px;
            height: 30px;
            position: relative;
            top: -40px;
            left: 515px;
        }
        a:hover{
            text-decoration: none;
        }
        #title a:hover{
            color: white;
        }
        #logo a:hover{
            color: black;
        }
        #body2 a:hover{
            color: white;
        }
        #logo ul li:hover{
            background-color: #00EEEE;
            color: black;
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
    <script src="/js/modernizr.js"></script>
    <style type="text/css">
        h2 {
            margin-bottom: 40px;
            margin-top: 40px;
        }
        .vmc-centered{
            padding: 10px 0;
        }
        .vmc-centered img{
            transition: all 0.3s ease;
        }
        .vmc-centered .vmc_active img{
            transform: scale(1.2);
        }
    </style>
</head>
<body>
    <div id="begin"></div>
    <div id="title">
        <font style="padding-left: 5em;position: relative;top: 2px;">欢迎来到智能仓储管理系统</font>
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
            <li style="font-size:15.3px;"><a class="a1" href="#">服务电话：020-26298802</a></li>
        </ul>
    </div>
    <div id="logo">
        <ul id="ul">
            <li><a class="a2" href="#">首页</a></li>
            <li><a class="a2" href="/ssm/产品中心">产品中心</a></li>
            <li>解决方案</a></li>
            <li>个性化服务</a></li>
            <li>关于我们</a></li>
            <li>
                <div id="touch"><a class="a2" href="#" onclick="service()">联系我们</a></div>
            </li>
        </ul>
    </div>
    <div id="body1">
        <div id="picture">
            <ul id="carousel">
                <li><img></li>
                <li><img></li>
                <li><img></li>
                <li><img></li>
            </ul>
            <ul id="chooseul">
                <li><div class="btr"></div></li>
                <li><div class="btr"></div></li>
                <li><div class="btr"></div></li>
                <li><div class="btr"></div></li>
            </ul>
        </div>
        <div id="process">
            <div id="service1">
                <div id="serpic"></div>
                <div id="serword"></div>
                <div id="serout" onclick="out()"></div>
            </div>
            <div id="service2"></div>
            <input id="service3" type="textarea" name="text">
            <input id="out" type="button" name="" value="关闭" onclick="out()">
            <input id="offer" type="button" name="" value="提交" onclick="submit()">
        </div>
    </div>
    <div id="body2">
        <div id="function">
            <div id="enter">
                <div id="enter1"><a class="a1" href="/ssm/产品中心"><img src="/picture/enter1.png">产品在线</a></div>
                <div id="enter1"><a class="a1" href="/ssm/账户开通"><img src="/picture/enter2.png">账户开通</a>
                </div>
                <div id="enter1"><a class="a1" href="/ssm/进入系统"><img src="/picture/enter3.png">进入系统</a></div>
                <div id="enter2"><a class="a1" href="#"  onclick="service()"><img src="/picture/enter4.png">在线客服</a></div>
            </div>  
        </div>      
    </div>
    <div id="blank"></div>
    <div id="body3">
        <div id="ad">
            <p><font>国内RFID首选，用户口碑业内领先</font></p>
        </div>
    </div>
    <div id="blank"></div>
    <div id="body4">
        <div id="cooperate">
            <div id="pic">
                <font size="5">合作客户</font><br>
                <font size="3">Cooperative client</font><br>
                <div id="line">
                    <div id="line1"></div>
                    <div id="line2"></div>
                    <div id="line1"></div>
                </div>
                <div class="container">
                    <ul class="vmcarousel-centered vmc-centered">
                        <li><img src="/picture/brand1.jpg" alt="" width="200"></li>
                        <li><img src="/picture/brand2.png" alt="" width="200"></li>
                        <li><img src="/picture/brand3.jpg" alt="" width="200"></li>
                        <li><img src="/picture/brand4.png" alt="" width="200"></li>
                        <li><img src="/picture/brand5.jpg" alt="" width="200"></li>
                       <li><img src="/picture/brand6.jpg" alt="" width="200"></li>
                    </ul>
                </div>
            </div>      
            <div id="picline"></div>
        </div> 
    </div>
    <div id="blank"></div>
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
    <!-- 对话框 -->
    <script type="text/javascript">
        function service(){ 
            document.getElementById("process").style.opacity="1";
            document.getElementById("process").style.top="120px";
            document.getElementById("process").style.left="350px";
            document.getElementById("process").style.width="650px";
            document.getElementById("process").style.height="480px";
        }
        function out(){
            document.getElementById("process").style.opacity="0";
            document.getElementById("process").style.top="90px";
            document.getElementById("process").style.left="1212px";
            document.getElementById("process").style.width="102px";
            document.getElementById("process").style.height="18px";
        }
        function submit(){

        }
    </script>
    <!-- 图片轮播 -->
    <script type="text/javascript">
        var imgarr=["/picture/carousel1.png","/picture/carousel2.png","/picture/carousel3.png","/picture/carousel4.jpeg"];
        var baseWidth=document.documentElement.clientWidth||document.body.clientWidth;
        window.onload=function(){
            var images=document.getElementById('carousel').getElementsByTagName('li');
            for (var i=0;i<imgarr.length;i++){
                images[i].getElementsByTagName('img')[0].src=imgarr[i];
                images[i].getElementsByTagName('img')[0].style.width=baseWidth*0.95+'px';
                images[i].getElementsByTagName('img')[0].style.height=400+'px';
            }
            change();
        }
        var timer=null;
        function change(){
            var index=1;
            var temp=0;
            var cosul=document.getElementById('chooseul').getElementsByTagName('li');
            var btns=document.getElementsByClassName('btr');
            btns[0].style.background="white";
            timer=setInterval(function changeimg(){
                var imgul=document.getElementById('carousel');
                imgul.style.left=-baseWidth*0.95*index+'px';
                btns[index].style.background="white";
                btns[temp].style.background="none";
                index++;
                temp++;
                if(index==4){
                    temp=3;
                    index=0;
                }
                if(temp==4){
                    temp=0;
                }
            },3000);
        }
        var btns=document.getElementsByClassName('btr');
        var cosul=document.getElementById('chooseul').getElementsByTagName('li');
        var imgul=document.getElementById('carousel');
        for (var i =0;i<btns.length; i++){
            btns[i].setAttribute('i',i);
            btns[i].onmousedown=function(){
                clear();
                clearInterval(timer);
                this.style.background='white';
                imgul.style.left=-baseWidth*0.95*parseInt(this.getAttribute('i'))+'px';
                var index=parseInt(this.getAttribute('i'));
                var temp=Math.abs(parseInt(this.getAttribute('i'))-1);
                timer=setInterval(function changeimg(){
                    var imgul=document.getElementById('carousel');
                    imgul.style.left=-baseWidth*0.95*index+'px';
                    btns[index].style.background="white";
                    btns[temp].style.background="none";
                    index++;
                    temp++;
                    if(index==4){
                        index=0;
                    }
                    if(index==1){
                        temp=0;
                    }
                    if(index==0){
                        temp=3
                    }
                },3000);
            }  
        }
        function clear(){
            var btns=document.getElementsByClassName('btr');
            for (var i=0;i<btns.length;i++){
                btns[i].style.background='none';                
            }
        }
    </script>
    <!-- 品牌轮播    -->
    <script src="/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="/dist/jquery.vm-carousel.js"></script>
    <script type="text/javascript">
        jQuery(function($){
            $('.vmcarousel-centered').vmcarousel({
                centered: true,
                start_item: 2,
                autoplay: false,
                infinite: false
            });
            $('.vmcarousel-centered-infitine').vmcarousel({
                centered: true,
                start_item: 1,
                autoplay: false,
                infinite: true
            });
            $('.vmcarousel-normal').vmcarousel({
                centered: false,
                start_item: 0,
                autoplay: false,
                infinite: false
            });
        });
    </script>
    <script>
        document.getElementById("serout").onmouseover=function(){ 
            this.style.cursor='pointer';
        }
        document.getElementById("ul").onmouseover=function(){ 
            this.style.cursor='pointer';
        }
    </script>
</body>
</html>