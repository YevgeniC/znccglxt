var isShow = 0;			//查询条件显示
var mid;					//移动记录编号
var goodsName;		//物品名称
var moveUser;			//负责人姓名
var startTime;			//开始时间
var endTime;				//结束时间
var pageNo = 1;		//页码
var pageCount;			//总页数

$("#pageNo").val(pageNo);
//更多条件展开
$("#moreterms").click(function(){
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
		url:"selectmove",
		dataType:"JSON",
		data:{
			"mid":mid,
			"pname":goodsName,
			"moveUser":moveUser,
			 "startTime":startTime,
			 "endTime":endTime,
			 "pageNo":pageNo
		},
		success:function (data){
			console.log(data);
			stitchTable(data);
			stitchPage(data)
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
	var tablehtml = '<tr id="title"><td>移动记录编号</td><td>物品名称</td><td>物品移动数量</td><td>物品原位置</td><td>物品当前位置</td><td>移动时间</td><td>负责人</td></tr>';
	for (var i=0; i<data.result.length;i++) {
		var info = data.result[i];
		tablehtml = tablehtml +'<tr><td>'+info.mid+'</td><td>'+info.pname+'</td><td>'+info.pnum+'</td><td>'+info.beforeArea+' - '+info.beforeRoom+'</td>';
		tablehtml = tablehtml + '<td>'+info.afterArea+' - '+info.afterRoom+'</td><td>'+info.moveTime+'</td><td>'+info.moveUser+'</td></tr>';
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

//查询
$("#search").click(function (){
	mid = $("#mID").val().trim();	
	goodsName = $("#GoodsName").val().trim();
	moveUser = $("#moveUser").val().trim();
	startTime = $("#StartTime").val();
	endTime = $("#EndTime").val();
	pageNo = 1;
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
		pageNo =$("#pageNo").val();
		getData(); 
	}
});