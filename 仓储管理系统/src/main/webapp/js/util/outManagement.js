var isShowAdd = 0;		//入库单显示状态；0为不显示，1位显示
var isShowDel = 0;		//删除弹窗显示状态；0为不显示，1位显示
var search;					//搜索内容
var pid;							//入库单编号
var pageNo = 1;			//页码
var pageSize = 10;		//页面显示记录条数
var pageCount;				//总页数
var count;						//记录数

$("#pageNo").val(pageNo);

//获取数据
var getData = function () {
	$.ajax({
		type:"post",
		url:"selectOutlibrary",
		dataType:"JSON",
		data:{
			"search":search,
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
	var tablehtml = '<tr id="title"><td>出库单号</td><td>物品名称</td><td>出库数量</td><td>物品去向</td><td>出库时间</td><td>操作</td></tr>';
	for (var i=0; i<data.result.length;i++) {
		var info = data.result[i];
		tablehtml = tablehtml +'<tr><td>'+info.pid+'</td><td>'+info.pname+'</td><td>'+info.pnum+'</td>';
		tablehtml = tablehtml + '<td>'+info.address+'</td><td>'+info.outTime+'</td>';
		tablehtml = tablehtml + '<td><button datafld="'+info.pid+'" class="detail" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #15D6BA">详情</button> |';
		tablehtml = tablehtml + '<button datafld="'+info.pid+'" class="delete" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #FF0000">删除</button></td></tr>';
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

//弹窗表格拼接
var stitchPopup = function (data){
		var tablehtml = '<tr><th colspan="4" style="text-align: center;">—————— <span id="thid">出库详情</span> ——————</th></tr>';
		tablehtml = tablehtml + '<tr><td width="80px">物品编号：</td><td id="id">'+data.result[0].pid+'</td><td width="80px">物品名称：</td><td id="name">'+data.result[0].pname+'</td></tr>';
		tablehtml = tablehtml + '<tr><td>物品数量：</td><td id="num">'+data.result[0].pnum+'</td><td>物品位置：</td><td id="location">'+data.result[0].area +' - '+data.result[0].room+'</td></tr>';
		tablehtml = tablehtml + '<tr><td>物品去向：</td><td colspan="3" id="address">'+data.result[0].address+'</td></tr>';
		tablehtml = tablehtml + '<tr><td>出库时间：</td><td id="time">'+data.result[0].outTime+'</td></tr>';
		tablehtml = tablehtml +'<tr><td>出库用户：</td><td id="person">'+data.result[0].outUser+'</td></tr>';
		$("#detail").children("table").html(tablehtml);
}

//详情
$("table").on('click','tr td .detail',function(){
	pid = $(this).attr("datafld");
	$.ajax({
		type:"post",
		url:'selectOutlibrary',
		dataType: 'json',
		data:{
			"search":pid
		},
		success:function (data) {
			console.log(data);
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

//显示删除弹窗
$("table").on('click','tr td .delete',function(){
	pid = $(this).attr("datafld");
	console.log(pid);
	if (0 == isShowDel) {
		$("#isDelete").show();
		isShowDel = 1;		
	}else if (1 == isShowDel) {
		$("#isDelete").hide();
		isShowDel = 0
	}
});
//删除 -> 是
$("#yes").click(function () {
	$.ajax({
		type:"post",
		url:"deleteOutlibrary",
		data:{
			"pid":pid,
		},
		success:function (data) {
			window.location.reload();
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {
			console.log(XMLHttpRequest.status);
			console.log(textStatus);
		}
	});
});
//删除 -> 否
$("#no").click(function(){
	$("#isDelete").hide();
	isShowDel = 0
});

//查询
$("#select").click(function (){
	pageNo = 1;
	search = $("#search").val();
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
$("#next").click(function(){
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
$("#previous").click(function(){
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
