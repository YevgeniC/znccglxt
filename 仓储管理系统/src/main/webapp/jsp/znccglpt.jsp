<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>智能仓储管理平台</title>
		<script src="../js/jquery-3.3.1.min.js"></script>
		<link rel="stylesheet" href="../css/znccglpt.css" rel="stylesheet"/>
	</head>
	<body>
		<div id="top">
			<div id="icon">
				<img id="u22_img" class="img " src="../picture/system/icon_u4.png">
			</div>
			<div id="name">智能仓储管理平台</div>
			<div id="head">
				<img id="u21_img" class="img" src="../picture/system/headimg_u21.png" tabindex="0" style="outline: none;">
			</div>
			<div id="LoginName">admin</div>
		</div>
		<div id="set">
			<ul>
				<li>个人中心</li>
				<li>选项设置</li>
				<li id="logout">退出登录</li>
			</ul>
		</div>
		<div id="left">
			<ul id="menu">
                <li id="1" class="list" target="iframe_a">入库管理</li>
                <li id="2" class="list" target="iframe_a">物品查询</li>
                <li id="3" class="list" target="iframe_a">物品盘点</li>
                <li id="4" class="list" target="iframe_a">出库管理</li>
                <li id="5" class="list" target="iframe_a">物品位置移动记录</li>
                <!--<li id="6" class="list" target="iframe_a">仓库管理</li>-->
            </ul>
		</div>
		<div id="right">
            <iframe src="" name="iframe_a" width="100%" height="92%" frameborder="0"></iframe>
            <form id="form1" action="" target="iframe_a" method="post"></form>
       </div>
	</body>
<script type="text/javascript">
	var Url = ["",
		"inManagement?超级管理员",
		"select?超级管理员",
		"inventory",
		"outManagement",
		"movesRecord",
		"warehouseManagement"
	];
	var isShow = 0;		//0为隐藏，1为显示
	$("#head").click(function (){
		if (0 == isShow) {
			$("#set").show();
			isShow = 1;		
		}else if (1 == isShow) {
			$("#set").hide();
			isShow = 0
		}
	});
	
		$(".list").bind("click",function(){
	//		$(this).attr("style","border-left: 3px solid #7FFF00;background-color: #526C85;");
			$(this).css("border-left","3px solid #7FFF00");
			$(this).css("background-color","#526C85");
	//		$(this).siblings().attr("style","border-left: 3px solid transparent;background-color: rgba(51, 68, 83, 1);");
			$(this).siblings().css("border-left","3px solid transparent");
			$(this).siblings().css("background-color","rgba(51, 68, 83, 1)");
			$('#form1').attr('action',Url[$(this).attr("id")]);
			$('#form1').submit();
		});
	
	$("#logout").click(function (){
		window.location.href = "login_1";
	});
</script>
</html>
