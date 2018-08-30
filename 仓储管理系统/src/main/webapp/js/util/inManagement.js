var isShowAdd = 0;		//入库单显示状态；0为不显示，1位显示
var isShowDel = 0;		//删除弹窗显示状态；0为不显示，1位显示
var search;					//搜索内容
var pid;							//入库单编号
var pageNo = 1;			//页码
var pageSize = 10;		//页面显示记录条数
var pageCount;				//总页数
var count;						//记录数
var realName = decodeURI(window.location.href.split("?")[1]);

pageNo = parseInt(pageNo);
$("#pageNo").val(pageNo);

//获取数据
var getData = function () {
	$.ajax({
		type:"post",
		url:"selectInlibrary",
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
	var tablehtml = '<tr id="title"><td>入库单号</td><td>物品名称</td><td>入库数量</td><td>入库位置</td><td>入库时间</td><td>入库用户</td></tr>';
	for (var i=0; i<data.result.length;i++) {
		var info = data.result[i];
		tablehtml = tablehtml +'<tr><td>'+info.pid+'</td><td>'+info.pname+'</td><td>'+info.pnum+'</td>';
		tablehtml = tablehtml + '<td>'+info.area+' - '+info.room+'</td><td>'+info.intime+'</td><td>'+info.inuser+'</td>';
//		tablehtml = tablehtml + '<td><button datafld="'+info.pid+'" class="detail" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #15D6BA">详情</button> |';
//		tablehtml = tablehtml + '<td><button datafld="'+info.pid+'" class="delete" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #FF0000">删除</button></td></tr>';
	}
	$("table").html(tablehtml);
}

//页码拼接
var stitchPage =function (data) {
	var count = data.count;
	pageCount = data.pageCount;
	$("#totalcount").text('当前共'+count+'条记录');
	$("#pageCount").text('第'+pageNo+'页 | 共'+pageCount+'页');
}

//显示新增入库单
$("#add").click(function(){
	if (0 == isShowAdd) {
		$("#addDetail").show();
		isShowAdd = 1;		
	}else if (1 == isShowAdd) {
		$("#addDetail").hide();
		isShowAdd = 0
	}
});
//新增入库单 -> 保存
$("#save").click(function(){
    var goodsName = $("#GoodsName").val();
	var goodsNum = $("#GoodsCount").val();
	var Area = $("#area").val();
	var room = $("#room").val();
	if ("" == goodsName) {
		alert("请输入物品名称");
	}else {
		//添加入库单
		$.ajax({
			url:"addInlibrary",
			data:{
				"goodsName":goodsName,
				"goodsNum":goodsNum,
				"area":Area,
				"room":room,
				"inUser":realName
			},
			type:"POST",
			success:function(data){
		        console.log(data);
				window.location.reload();
		  	},
		  	error:function(XMLHttpRequest, textStatus, errorThrown){
		  		console.log(XMLHttpRequest.status);
		  	}
		});
		
	}
});
//新增入库单 -> 取消
$("#cancel").click(function(){
	$("#addDetail").hide();
	$("#GoodsName").val("");
	$("#GoodsCount").val("1");
	$("#area:first option:first").attr("selected",true).siblings("option").attr("selected",false);		//重置select的值
	$("#room:first option:first").attr("selected",true).siblings("option").attr("selected",false);
	isShowAdd = 0
});

//查询
$("#search").keydown(function (e){
	//判断回车
	if (e.keyCode == 13) {
		pageNo = 1;
		search = $("#search").val();
		getData();
	}
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


