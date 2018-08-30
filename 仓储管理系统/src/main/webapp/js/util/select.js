var isShow = 0;				//查询条件显示
var isShowDetail = 0;	//详情显示
var goodsID;					//物品编号
var goodsName;			//物品名称
var Area;						//仓库号
var room;						//房间号
var startTime;				//开始时间
var endTime;					//结束时间
var pageNo = 1;			//页码
var pageSize = 10;		//页面显示记录条数
var pageCount;				//总页数
var count;						//记录数
var type;						//操作类型，修改：1、移动：2、出库：3
var theader = ['物品详情','物品移动','物品出库'];				//表头信息
var realName = decodeURI(window.location.href.split("?")[1]);
console.log(realName);

$("#pageNo").val(pageNo);

//更多条件展开
$("#moreterms,#arrow").click(function(){
	if (0 == isShow) {
		$("#selectmore").show();
		$("#arrow").rotate(180);
		$("#middle").css("top","120px");
		isShow = 1;		
	}else if (1 == isShow) {
		$("#selectmore").hide();
		$("#arrow").rotate(360);
		$("#middle").css("top","60px");
		isShow = 0
	}
});

//获取数据
var getData = function () {
	$.ajax({
		type:"post",
		url:"selectGoods",
		dataType:"JSON",
		data:{
			"pid":goodsID,
			"pname":goodsName,
			"area":Area,
			"room":room,
			"startTime":startTime,
			"endTime":endTime,
			"pageNo":pageNo,
			"pageSize":pageSize
		},
		success:function (data){
			console.log(data);
			stitchTable(data);
			stitchPage(data);
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {
			console.log(XMLHttpRequest.status);
			console.log(textStatus);
		}
	});
}
//加载页面获取数据
$(function () {
	getData();
});

//表格拼接
var stitchTable = function (data) {
	var tablehtml = '<tr id="title"><td>物品编号</td><td>物品名称</td><td>物品数量</td><td>物品位置</td><td>入库时间</td><td>操作</td></tr>';
	for (var i=0; i<data.result.length;i++) {
		var info = data.result[i];
		tablehtml = tablehtml +'<tr><td>'+info.pid+'</td><td>'+info.pname+'</td><td>'+info.pnum+'</td>';
		tablehtml = tablehtml + '<td>'+info.area+' - '+info.room+'</td><td>'+info.inlibrary.intime+'</td>';
		tablehtml = tablehtml + '<td><button datafld="'+info.pid+'" class="detail" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #15D6BA">详情</button> |';
		tablehtml = tablehtml + '<button datafld="'+info.pid+'" class="move" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #4876FF">移动</button> |';
		tablehtml = tablehtml + '<button datafld="'+info.pid+'" class="out" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #FF0000">出库</button></td></tr>';
	}
	$("#showList").html(tablehtml);
}

//页码拼接
var stitchPage =function (data) {
	var count = data.count;
	pageCount = data.pageCount;
	$("#totalcount").text('当前共'+count+'条记录');
	$("#pageCount").text('第'+pageNo+'页 | 共'+pageCount+'页');
}

//操作——详情 | 移动 | 出库
$("table").on('click','tr td button',function () {
	var opreation = $(this).attr("class");
	if ('detail' == opreation) {
		type = 0;
	}else if ('move' == opreation) {
		type = 1;
	} else{
		type = 2;
	}
	getTableData($(this).attr("datafld"),type);
	$("#detail").show().focus();
	$(".shandow").show().css('z-index', '11');
});
//详情 -> 失去焦点
$("#detail").blur(function () {
	if (0 == type) {
		$("#detail").hide();
		$(".shandow").hide().css('z-index','-1');
	}
});
//移动 | 出库 -> 取消
$("#detail").on('click','#cancel',function(){
	$("#detail").hide();
	$(".shandow").hide().css('z-index','-1');
});
//移动 | 出库 -> 数量超出范围
$("table").on('blur','tr td #num',function () {
	if ($(this).val() > $(this).attr("max")) {
			$(this).val($(this).attr("max"));
	}
	if ($(this).val() < 1) {
			$(this).val(1);
	}
});

//移动 | 出库
$("#detail").on('click','#save',function (){
	if (1 == type) {
		move();
	}else {
		out();
	}
});
//移动
var move = function () {
	if ($("#afterArea").val() == $("#location").text().split(" - ")[0] && $("#afterRoom").val() == $("#location").text().split(" - ")[1]) {
		alert("位置重复，请重新选择位置");
	}else {
		$.ajax({
			type:"post",
			url:'addmove',
			dataType: 'json',
			data:{
				"goodsID":$("#id").text(),
				"pname":$("#name").text(),
				"pnum":$("#num").val(),
				"max":$("#num").attr("max"),
				"beforeArea":$("#location").text().split(" - ")[0],
				"beforeRoom":$("#location").text().split(" - ")[1],
				"afterArea":$("#afterArea").val(),
				"afterRoom":$("#afterRoom").val(),
				"moveUser":realName
			},
			success:function (data) {
				console.log(data);
				window.location.reload();
			},
			error:function (XMLHttpRequest, textStatus, errorThrown) {
				console.log(XMLHttpRequest.status);
				console.log(textStatus);
			}
		});
	}
}
//出库
var out = function () {
	$.ajax({
			type:"post",
			url:'addOutlibrary',
			dataType: 'json',
			data:{
				"goodsID":$("#id").text(),
				"pname":$("#name").text(),
				"pnum":$("#num").val(),
				"max":$("#num").attr("max"),
				"area":$("#location").text().split(" - ")[0],
				"room":$("#location").text().split(" - ")[1],
				"address":$("#address").val(),
				"outUser":realName
			},
			success:function (data) {
				console.log(data);
				window.location.reload();
			},
			error:function (XMLHttpRequest, textStatus, errorThrown) {
				console.log(XMLHttpRequest.status);
				console.log(textStatus);
			}
		});
}

//弹窗数据获取
var getTableData = function (pid,type) {
	$.ajax({
		type:"post",
		url:'selectDetail',
		dataType: 'json',
		data:{
			"pid":pid
		},
		success:function (data) {
			console.log(data);
			stitchPopup(data,type);
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {
			console.log(XMLHttpRequest.status);
			console.log(textStatus);
		}
	});
}

//弹窗表格拼接
var stitchPopup = function (data,type){
	var tablehtml = '<tr><th colspan="2" style="text-align: center;">—————— <span id="thid">'+theader[type]+'</span> ——————</th></tr>';
	tablehtml = tablehtml + '<tr><td style="width: 240px;">物品编号：<span id="id">'+data.result[0].pid+'</span></td>';
	tablehtml = tablehtml + '<td>物品名称：<span id="name">'+data.result[0].pname+'</span></td></tr>';
	if (2 == type || 1 == type) {
		tablehtml = tablehtml + '<tr><td>物品数量：<input id="num" type="number" value="'+data.result[0].pnum+'" min="1" max="'+data.result[0].pnum+'"/></td>';
	}else {
		tablehtml = tablehtml + '<tr><td>物品数量：<span id="num">'+data.result[0].pnum+'</span></td>';
	}
	tablehtml = tablehtml + '<td>物品位置：<span id="location">'+data.result[0].area+" - "+data.result[0].room+'</span></td></tr>';
	if (2 == type) {
		tablehtml = tablehtml + '<tr><td colspan="2">物品去向：<input id="address" style="width:300px;"/></td></tr>';
	}else if (1 == type) {
		tablehtml = tablehtml + '<tr><td colspan="2">目标位置：<select id="afterArea" name="area"><option>A1</option><option>A2</option>'+
		'<option>A3</option></select><select id="afterRoom" name="room"><option>101</option><option>102</option><option>103</option>'+
		'</select></td></tr>';
	}else {
		tablehtml = tablehtml + '<tr><td>入库时间：<span id="time">'+data.result[0].inlibrary.intime+'</span></td></tr>';
		tablehtml = tablehtml + '<tr><td>入库用户：<span id="person">'+data.result[0].inlibrary.inuser+'</span></td></tr>';
	}
	$("#detail").children("table").html(tablehtml);
	if (0 == type) {
		$("#detail").children('div').html('');
	}else if (1 == type) {
		$("#detail").children('div').html('<div id="save">移动</div><div id="cancel">取消</div>');
	}else if (2 == type) {
		$("#detail").children('div').html('<div id="save">出库</div><div id="cancel">取消</div>');
	}
}

//查询
$("#search").click(function (){
	goodsID = $("#GoodsID").val().trim();
	goodsName = $("#GoodsName").val().trim();
	Area = $("#area").val();
	room = $("#room").val();
	startTime = $("#StartTime").val();
	endTime = $("#EndTime").val();
	pageNo = 1;	
	getData();
});

//页面记录数
$(".count").change(function () {
	console.log($(this).val());
	pageSize = $(this).val();
	pageNo = 1;
	$("#pageNo").val(pageNo);
	getData();
});
//下一页
$("#fenye").on("click","#next",function () {
	pageNo += 1;
	if (pageNo > pageCount) {
		pageNo = pageCount;
		alert("没有下一页");
	}else{
		$("#pageNo").val(pageNo);
		getData();
	}
});
//上一页
$("#fenye").on("click","#previous",function () {
	pageNo -= 1;
	if (pageNo < 1) {
		pageNo = 1;
		alert("没有上一页");
	}else{
		$("#pageNo").val(pageNo);
		getData();
	}
});
//页数跳转
$("#fenye").on("click","#Go",function () {
	var reg = new RegExp("^-?\\d+$");		//验证数字
	var target = $("#pageNo").val();
	console.log(target);
	if ("" == target) {
		alert("请输入页码");
		$("#pageNo").val("");
	}else if (!reg.test(target)){
		alert("请输入数字");
		$("#pageNo").val("");
	}else if (target > pageCount || target < 1) {
		alert("超出页码范围");
		$("#pageNo").val("");
	}else {
		pageNo = $("#pageNo").val();
		getData(); 
	}
});