var search;					//搜索内容
var goodsName;			//物品名称
var pid;							//入库单编号
var pageNo = 1;			//页码
var pageCount;				//总页数
var count;						//记录数
var isShow = 0;					//

$("#pageNo").val(pageNo);

//获取数据
var getData = function () {
	$.ajax({
		type:"post",
		url:"selectInventory",
		dataType:"JSON",
		data:{
			"search":search,
			"pageNo":pageNo
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
	var tablehtml = '<tr id="title"><td width="50%">物品名称</td><td width="50%">物品数量</td></tr>';
//	var tablehtml = '<tr id="title"><td width="45%">物品名称</td><td width="45%">物品数量</td><td width="10%">操作</td></tr>';
	for (var i=0; i<data.result.length;i++) {
		var info = data.result[i];
		if (i % 2 == 0) {
			tablehtml = tablehtml + '<tr><td>'+info.pname+'</td><td>'+info.sum+'</td></tr>';
		}else {
			tablehtml = tablehtml + '<tr style="background-color: rgb(204,204,204);"><td>'+info.pname+'</td><td>'+info.sum+'</td></tr>';
		}
//		tablehtml = tablehtml + '<td><button class="detail" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #15D6BA">详情</button></td></tr>';
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

//查询
$("#search").click(function (){
	search = $("#GoodsName").val();
	pageNo = 1;
	getData();
});

//点击显示物品详情
$("#showList").on('click','tr',function () {
	goodsName = $(this).children("td")[0].innerHTML;
//	console.log(goodsName);
	$.ajax({
		type:"post",
		url:"selectGoods",
		dataType:"JSON",
		data:{
			"pname":goodsName,
			"isAccurate":1
		},
		success:function (data){
//			console.log(data);
			stitchPopup(data);
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {
			console.log(XMLHttpRequest.status);
			console.log(textStatus);
		}
	});
	$("#detail").show().focus();
	$(".shandow").show().css('z-index', '11');
});
//详情 -> 失去焦点
$("#detail").blur(function () {
	$("#detail").hide();
	$(".shandow").hide().css('z-index','-1');
});

//弹窗表格拼接
var stitchPopup = function (data){
	var tablehtml = '<tr><th colspan="3">—————— 物品详情 ——————</th></tr>';
	tablehtml = tablehtml + '<tr><td>物品名称</td><td>物品数量</td><td>物品位置</td>/tr>';
	for (var i=0; i<data.result.length;i++) {
		tablehtml = tablehtml + '<tr><td>'+data.result[i].pname+'</td><td>'+data.result[i].pnum+'</td>';
		tablehtml = tablehtml + '<td>'+data.result[i].area+" - "+data.result[i].room+'</td>/tr>';
	}
	$("#detail").children("table").html(tablehtml);
}
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