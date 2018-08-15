<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>智能仓储管理系统</title>
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
            position: relative;
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
            top: -1px;
            right: 35px;
            bottom: 0;
            border-radius: 5%;
            background-color: #00B2EE;
            border: 1px solid #00B2EE;
        }
        /*大盒子*/
        #body{
            height: 1060px;
            width: 100%;
        }
        #a{
            width: 80%;
            height: 1060px;
        }
        #box1{
            width: 20%;
            height: 1030px;
            float: left;
            position: relative;
            top: 30px;
            background-color: rgb(238,238,238);
        }
        #box-a{
            width: 100%;
            height: 50px;
            color: white;
            font-size: 24px;
            line-height: 50px;
            text-align: center;
            background-color: rgb(74,170,221);
        }
        #box-b{
            width: 100%;
            height: 40px;
            line-height: 40px;
            text-align: center;
        }
        #box-c{
            /*li1*/
            width: 100%;
            height: 220px;
        }
        #box-d{
            /*li2*/
            width: 100%;
            height: 130px;
        }
        #box-e{
            /*li3*/
            width: 100%;
            height: 100px;
        }
        #box-f{
            /*li4*/
            width: 100%;
            height: 160px;
        }
        #ul li{
            height: 30px;
            color: rgb(153,153,153);
        }
        #ul font{
            cursor: pointer;
        }
        #box2{
            width: 80%;
            height: 100px;
            float: left;
            font-size: 30px;
            line-height: 100px;
        }
        #box2 b{
            padding-right: 23em;
        }
        #box3{
            width: 80%;
            height: 960px;
            float: left;
        }
        #box3 ul{
            list-style: none;
            float: left;
        }
        #box3 ul li:nth-child(1){
            width: 287px;
            height: 280px;
        }
        #box3 ul li:nth-child(2){
            height: 20px;
            line-height: 20px;
            text-align: center;
        }
        #box3 ul li:nth-child(3){
            height: 20px;
            line-height: 20px;
            text-align: center;
        }
        #box3 ul li img{
            width: 250px;
            height: 250px;
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
            color: white;
        }
        #logo ul li:nth-child(7):hover{
            background-color: white;
            color: black;
        }
        #touch:hover{
            background-color: white;
        }
    </style>
</head>
<body>
    <div id="title">
        <font style="padding-left: 5em;position: relative;top: 1px;">欢迎来到智能仓储管理系统</font>
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
        <ul>
            <li><a class="a2" href="/ssm/index">首页</a></li>
            <li><a class="a2" href="#">产品中心</a></li>
            <li><a class="a2" href="#">解决方案</a></li>
            <li><a class="a2" href="#">个性化服务</a></li>
            <li><a class="a2" href="#">关于我们</a></li>
            <li>
                <div id="touch"><a class="a2" href="#">联系我们</a></div>
            </li>
        </ul>
    </div>
    <div id="body">
        <center>
            <div id="a">
                <div id="box1">
                    <div id="box-a">产品展示</div>
                    <div id="box-b">
                        <ul id="ul">
                            <li onclick="initialSetImage();"><b><font>>全部</font></b></li>
                        </ul>
                    </div>
                    <div id="box-c">
                        <ul id="ul">
                            <li style="color: black"><b>RFID电子标签:</b></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>皮具RFID电子标签</font></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>鞋类RFID电子标签</font></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>服装RFID织唛标签</font></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>服装RFID吊牌标签</font></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>防盗RFID电子标签</font></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>洗衣RFID电子标签</font></li>
                        </ul>
                    </div>
                    <div id="box-d">
                        <ul id="ul">
                            <li style="color: black"><b>RFID读写设备:</b></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>RFID手持机&nbsp;&nbsp;&nbsp;</font></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>桌面式读写器&nbsp;</font></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>RFID试衣终端</font></li>
                        </ul>
                    </div>
                    <div id="box-e">
                        <ul id="ul">
                            <li style="color: black"><b>RFID写标设备:</b></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>RFID写标设备</font></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>RFID打印机&nbsp;&nbsp;&nbsp;</font></li>
                        </ul>
                    </div>
                    <div id="box-f">
                        <ul id="ul">
                            <li style="color: black"><b>RFID扫描通道:</b></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>RFID单箱扫描通道</font></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>RFID托盘扫描通道</font></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>RFID通道门禁&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></li>
                            <li onclick="javascript:var name=this.innerText;setImage(name);"><font>>RFID推车扫描通道</font></li>
                        </ul>
                    </div>
               </div>
               <div id="box2"><b>产品中心</b></div>
               <div id="box3"></div>
            </div>
        </center>
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
    <script type="text/javascript">
        //产品json数据
        var productJson={
            "productJsonList":[
                {
                    'brand':'>皮具RFID电子标签',
                    'name':'皮具行业专用RFID电子标签',
                    'url':'/picture/product1',
                    'price':'￥955起'
                },
                {
                    'brand':'>鞋类RFID电子标签',
                    'name':'鞋类行业专用RFID电子标签',
                    'url':'/picture/product2',
                    'price':'￥1355起'
                },
                {
                    'brand':'>服装RFID织唛标签',
                    'name':'服装RFID织唛标签',
                    'url':'/picture/product3',
                    'price':'￥1655起'
                },
                {
                    'brand':'>服装RFID织唛标签',
                    'name':'服装RFID吊牌标签',
                    'url':'/picture/product4',
                    'price':'￥1055起'
                },
                {
                    'brand':'>防盗RFID电子标签',
                    'name':'ROV--HT905UH RFID手持终端',
                    'url':'/picture/product5',
                    'price':'￥3155起'
                },
                {
                    'brand':'>防盗RFID电子标签',
                    'name':'ROV-C5000UH RFID手持终端',
                    'url':'/picture/product6',
                    'price':'￥2855起'
                },
                {
                    'brand':'>防盗RFID电子标签',
                    'name':'ROV-18008D 桌面式一体机',
                    'url':'/picture/product7',
                    'price':'￥4255起'
                },
                {
                    'brand':'>洗衣RFID电子标签',
                    'name':'ROV-2509 RFID洗衣电子标签',
                    'url':'/picture/product8',
                    'price':'￥843起'
                },
            ]
        };
        var product=document.getElementById("box3");
        var selectMenuName="";
        //初始化图片
        initialSetImage();
        function initialSetImage(){ 
            product.innerHTML="";
            var json=productJson.productJsonList;
            for (var i=0;i<json.length;i++){
                var obj=json[i];
                createImage(obj.name,obj.url,obj.price);
            }
        }
        //从json中读取对应数据用于创建图片
        function setImage(menuName){
            product.innerHTML="";
            var url="";
            var myName="";
            var json=productJson.productJsonList;
            for(var i=0;i<json.length;i++){
                var obj=json[i];
                if (menuName==obj.brand){
                    url=obj.url;
                    name=obj.name;
                    price=obj.price
                    createImage(name,url,price);
                }
            }
        }
        //创建图片
        function createImage(name,url,price){
            var myUl=document.createElement("ul");
            var myli1=document.createElement("li");
            var myli2=document.createElement("li");
            var myli3=document.createElement("li");
            var br=document.createElement("br");
            var a1=document.createElement("a");
            var a2=document.createElement("a");
            var myText=document.createTextNode(name);
            var myPrice=document.createTextNode(price);
            myli1.appendChild(a1);
            myli2.appendChild(a2);
            myli3.appendChild(myPrice);
            var Img=document.createElement("img");
            Img.setAttribute("src",url+".jpg");
            myli1.appendChild(Img);
            myUl.appendChild(myli1);
            myUl.appendChild(myli2);
            myUl.appendChild(myli3);
            a1.appendChild(Img);
            a1.setAttribute('href',name+".html");
            a2.appendChild(myText);
            a2.appendChild(br);
            a2.setAttribute("style","color:black");
            a2.appendChild(myPrice);
            a2.setAttribute('href',name+".html");
            product.appendChild(myUl);
        }
    </script>
</body>
</html>