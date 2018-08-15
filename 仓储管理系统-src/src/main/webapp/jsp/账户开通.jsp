<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>账户开通</title>
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
            height: 1080px;
            position: relative;
        }
        #box1{
            width: 1200px;
            height: 50px;
            font-size: 30px;
            line-height: 50px;
            text-align: center;
            position: absolute;
            margin: auto;
            top: 50px;
            left: 0;
            right: 0;
        }
        #box2{
            width: 1200px;
            height: 30px;
            font-size: 18px;
            line-height: 30px;
            text-align: center;
            position: absolute;
            margin: auto;
            top: 120px;
            left: 0;
            right: 0;
        }
        #box3{
            width: 1200px;
            height: 685px;
            position: absolute;
            margin: auto;
            top: 240px;
            left: 0;
            right: 0;
        }
        #box3-a{
            width: 255px;
            height: 400px;
            float: left;
            text-align: center;
            background-color: rgb(240,244,245);
            border-top: 10px solid rgb(76,210,199);
        }
        #box3-b{
            width: 255px;
            height: 400px;
            float: left;
            text-align: center;
            position: relative;
            left: 60px;
            background-color: rgb(240,244,245);
            border-top: 10px solid rgb(76,210,199);
        }
        #box3-c{
            width: 255px;
            height: 400px;
            float: left;
            text-align: center;
            position: relative;
            left: 120px;
            background-color: rgb(240,244,245);
            border-top: 10px solid rgb(76,210,199);
        }
        #box3-d{
            width: 255px;
            height: 400px;
            float: left;
            text-align: center;
            position: relative;
            left: 180px;
            background-color: rgb(240,244,245);
            border-top: 10px solid rgb(76,210,199);
        }
        #box3-g{
            width: 255px;
            height: 50px;
            position: absolute;
            top: -50px;
            left: 630px;
            color: white;
            font-size: 25px;
            line-height: 50px;
            text-align: center;
            background-color: #00B2EE;
        }
        #box3-h{
            width: 200px;
            height: 50px;
            text-align: center;
            line-height: 50px;
            position: relative;
            top: 40px;
            left: 27.5px;
            border-top: 1px dashed #CCCCCC;
        }
        #box3-i{
            width: 200px;
            height: 50px;
            text-align: center;
            line-height: 50px;
            font-weight: bold;
            position: relative;
            top: 40px;
            left: 27.5px;
            border-top: 1px dashed #CCCCCC;
            border-bottom: 1px dashed #CCCCCC;
        }
        #box3-j{
            width: 200px;
            height: 100px;
            text-align: center;
            line-height: 100px;
            position: relative;
            top: 55px;
            left: 27.5px;
        }
        #box3-e{
            width: 1200px;
            height: 280px;
            position: relative;
            top: 450px;
        }
        #box3-f{
            width: 1200px;
            height: 100px;
            position: relative;
            top: 450px;
        }
        #input{
            width: 250px;
            height: 30px;
            position: absolute;
            margin: auto;
            top: 35px;
            left: 0;
            right: 0;
        }
        #input1{
            width: 188px;
            height: 28px;
            float: left;
            border: 1px solid #6B6B6B;
        }
        #input2{
            width: 60px;
            height: 31px;
            float: right;
            color: white;
            position: relative;
            top: -1px;
            left: -1px;
            background-color: #6B6B6B;
        }
        #box3-k{
            width: 600px;
            height: 140px;
            position: absolute;
            top: 0;
            left: 0;
        }
        #box3-l{
            width: 600px;
            height: 140px;
            position: absolute;
            top: 0;
            right: 0;
        }
        #box3-m{
            width: 600px;
            height: 140px;
            position: absolute;
            left: 0;
            bottom: 0;
        }
        #box3-n{
            width: 600px;
            height: 140px;
            position: absolute;
            right: 0;
            bottom: 0;
        }
        #box3-o{
            width: 60px;
            height: 60px;
            position: relative;
            left: 20px;
        }
        #box3-p{
            width: 500px;
            height: 140px;
            position: relative;
            top: -60px;
            left: 100px;
        }
        #buy1{
            width: 120px;
            height: 40px;
            font-size: 16px;
            border-radius: 5%;
            color: white;
            border: 1px solid black;
            background-color: #6B6B6B;
        }
        #buy2{
            width: 120px;
            height: 40px;
            font-size: 16px;
            border-radius: 5%;
            color: white;
            border: 1px solid black;
            background-color: #6B6B6B;
        }
        #buy3{
            width: 120px;
            height: 40px;
            font-size: 16px;
            border-radius: 5%;
            color: white;
            border: 1px solid black;
            background-color: #6B6B6B;
        }
        #buy4{
            width: 120px;
            height: 40px;
            font-size: 16px;
            border-radius: 5%;
            color: white;
            border: 1px solid black;
            background-color: #6B6B6B;
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
                            <div id="QRcode"><img src="picture/QRcode1.png" width="100%" height="100%"></div>
                        </div>
                    </li>
                </ul>
            </li>
            <li>
                <a class="a1" href="#">关注微信</a>
                <ul>
                    <li>
                        <div id="menu">
                            <div id="QRcode"><img src="picture/QRcode2.png" width="100%" height="100%"></div>
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
        <div id="box1"><font>套餐与价格</font></div>
        <div id="box2"><font>根据不同的使用需求，我们提供了不同期限套餐供您选择，选择年付可获得一定优惠（同时包括更多终端数），所有套餐线路节点是一样的。</font></div>
        <div id="box3">
            <div id="box3-g">最受欢迎的套餐</div>
            <div id="box3-a"><br>
                <font size="6">包月</font><br><br>
                <font size="5">￥</font>
                <font size="6" style="font-weight: bold">188</font>
                <div id="box3-h">一个月，一台终端</div>
                <div id="box3-i"></div>
                <div id="box3-j">
                    <form action="/ssm/账户开通2">
                        <input type="submit" name="buy" value="点击购买" id="buy1">
                    </form>
                </div>
            </div>
            <div id="box3-b"><br>
                <font size="6">包季</font><br><br>
                <font size="5">￥</font>
                <font size="6" style="font-weight: bold">520</font>
                <div id="box3-h">三个月，一台终端</div>
                <div id="box3-i" style="color: #CD3700">优惠8%</div>
                <div id="box3-j">
                    <form action="/ssm/账户开通2">
                        <input type="submit" name="buy" value="点击购买" id="buy2">
                    </form>
                </div>
            </div>
            <div id="box3-c"><br>
                <font size="6">包年</font><br><br>
                <font size="5">￥</font>
                <font size="6" style="font-weight: bold">2000</font>
                <div id="box3-h">十二个月，两台终端</div>
                <div id="box3-i" style="color: #A020F0">优惠12%</div>
                <div id="box3-j">
                    <form action="/ssm/账户开通2">
                        <input type="submit" name="buy" value="点击购买" id="buy3">
                    </form>
                </div>
            </div>
            <div id="box3-d"><br>
                <font size="6">VIP不限时</font><br><br>
                <font size="5">￥</font>
                <font size="6" style="font-weight: bold">5000</font>
                <div id="box3-h">VIP用户不限时，五台终端</div>
                <div id="box3-i" style="color: #00CD00">优惠20%</div>
                <div id="box3-j">
                    <form action="/ssm/账户开通2">
                        <input type="submit" name="buy" value="点击购买" id="buy4">
                    </form>
                </div>
            </div>
            <div id="box3-e">
                <div id="box3-k">
                    <div id="box3-o"><img src="/picture/pic2.png" width="100%" height="100%"></div>
                    <div id="box3-p">
                        <font size="5">购买套餐支持哪些支付方式？</font><br><br>
                        <font>网站购买使用支付宝或PayPal结算，付款后系统自动开通套餐，安全便捷。如果您使用iOS设备，也可以通过App Store内购买（支持信用卡和网银）</font>
                    </div> 
                </div>
                <div id="box3-l">
                    <div id="box3-o"><img src="/picture/pic2.png" width="100%" height="100%"></div>
                    <div id="box3-p">
                        <font size="5">套餐里的“终端数”是什么意思？</font><br><br>
                        <font>套餐终端指的是同时连接数，不绑定设备。比如一年套餐帐号可以同时2个设备使用，互不影响。企业和团队用户可定制终端，具体请咨询客服。</font>
                    </div> 
                </div>
                <div id="box3-m">
                    <div id="box3-o"><img src="/picture/pic2.png" width="100%" height="100%"></div>
                    <div id="box3-p">
                        <font size="5">付费用户有哪些优势和特权？</font><br><br>
                        <font>付费会员可以使用全部线路节点，不与免费用户共享线路资源，无需每日续期，拥有更理想的带宽和稳定性，年付用户还支持多台设备同时使用。</font>
                    </div> 
                </div>
                <div id="box3-n">
                    <div id="box3-o"><img src="/picture/pic2.png" width="100%" height="100%"></div>
                    <div id="box3-p">
                        <font size="5">套餐有效期限是如何计算的？</font><br><br>
                        <font>支付成功后系统会自动开通套餐，即时生效。例如在1月20日购买包月套餐，服务期限则为1月20日至2月20日。到期后不会自动续费，需手动购买续费。</font>
                    </div> 
                </div>
            </div>
            <div id="box3-f">
                <div id="input">
                    <input id="input1" type="text" name="text" placeholder="优惠代码（促销活动期间适用）">
                    <input id="input2" type="button" name="button" value="应用">
                </div>   
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
            <div id="QRcode1"><img src="/picture/QRcode1.png" width="100%" height="100%"></div>
            <div id="QRcode2"><img src="/picture/QRcode2.png" width="100%" height="100%"></div>
        </div>
        <div id="bottom-3"><font color="white">Copyright ?2016 广州罗维尼信息科技有限公司 版权所有 | 粤ICP备05001008号</font></div>
    </div>
    <!-- 鼠标样式 -->
    <script>
        document.getElementById("buy1").onmouseover=function(){ 
            this.style.cursor='pointer';
        }
        document.getElementById("buy2").onmouseover=function(){ 
            this.style.cursor='pointer';
        }
        document.getElementById("buy3").onmouseover=function(){ 
            this.style.cursor='pointer';
        }
        document.getElementById("buy4").onmouseover=function(){ 
            this.style.cursor='pointer';
        }
        document.getElementById("input2").onmouseover=function(){ 
            this.style.cursor='pointer';
        }
    </script>
</body>
</html>