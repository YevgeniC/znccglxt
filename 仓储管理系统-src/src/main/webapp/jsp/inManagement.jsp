<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>inManagement</title>
		<link href="css/inManagement.css" type="text/css" rel="stylesheet"/>
		<script src="js/jquery-3.3.1.min.js"></script>
	</head>
	<body>
		<div id="top">
			<input id="search" type="search" />
			<div id="add">+新建入库单</div>
		</div>
		<div id="middle">
			<div id="mtable">
				<table cellpadding="0" cellspacing="0" >
					<tr id="title">
						<td>入库用户</td>
						<td>货物名称</td>
						<td>入库数量</td>
						<td>入库位置</td>
						<td>入库时间</td>
						<td>操作</td>
					</tr>
					<c:forEach var="inlibrary" items="${inlibrary}" varStatus="status">
						<tr id="${status.index}">
							<td><c:out value="${inlibrary.inUser}"></c:out></td>
							<td><c:out value="${inlibrary.pname}"></c:out></td>
							<td><c:out value="${inlibrary.pnum}"></c:out></td>
							<td><c:out value="${inlibrary.area} - ${inlibrary.room}"></c:out></td>
							<td><c:out value="${inlibrary.inTime}"></c:out></td>
							<td><button id="detail" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #15D6BA">详情</button> |
								<button id="delete" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #FF0000">删除</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="fenye">
				<span>当前共<%=(Integer)request.getAttribute("count")%>条记录</span>
				<span>首页</span>
				<span>上一页</span>
				<span>下一页</span>
				<span>尾页</span>
				<span>第N页|共N页</span>
				<input id="pageNo" type="text"/>
				<input type="submit" value="GO"/>
			</div>
		</div>
		<form action="add" method="post" name="add">
		<div id="addDetail">
			货物名称：<input  id="GoodsName" type="text" /><br/><br/>
			货物数量：<input  id="GoodsCount" type="text" /><br/><br/>
			存放位置：
			<select id="area">
				<option>A1</option>
				<option>A2</option>
				<option>A3</option>
			</select>
			<select id="room">
				<option>101</option>
				<option>102</option>
				<option>103</option>
			</select>
			<div>
				<div id="save">保存</div>
				<div id="cancel">取消</div>
			</div>
		</div>
		</form>
	</body>
<script type="text/javascript">
	var isShow = 0;
	$("#add").click(function(){
		if (0 == isShow) {
			$("#addDetail").show();
			isShow = 1;		
		}else if (1 == isShow) {
			$("#addDetail").hide();
			isShow = 0
		}
	});
	$("#save").click(function(){
		$("#addDetail").hide();
		isShow = 0
	});
	$("#cancel").click(function(){
		$("#addDetail").hide();
		$("#GoodsName").val("");
		$("#GoodsCount").val("");
		$("#area:first option:first").attr("selected",true).siblings("option").attr("selected",false);		//重置select的值
		$("#room:first option:first").attr("selected",true).siblings("option").attr("selected",false);
		isShow = 0
	});
</script>
</html>
