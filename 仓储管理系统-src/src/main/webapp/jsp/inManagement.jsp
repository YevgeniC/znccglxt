<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>inManagement</title>
		<link href="../css/inManagement.css" type="text/css" rel="stylesheet"/>
		<script src="../js/jquery-3.3.1.min.js"></script>
	</head>
	<body>
		<div id="top">
			<input id="search" type="search" placeholder="请输入入库单号或物品名称"/>
			<div id="add">+新建入库单</div>
		</div>
		<div id="middle">
			<div id="mtable">
				<table cellpadding='0' cellspacing='0' id='showList'>
					<tr id="title">
						<td>入库单号</td>
						<td>物品名称</td>
						<td>入库数量</td>
						<td>入库位置</td>
						<td>入库时间</td>
				<!--		<td>操作</td>-->
					</tr>
				</table>
			</div>
			<div id='fenye'>
				<div id='totalcount'>当前共N条记录</div>
				<div id="previous" class="fanye">上一页</div>
				<div id="next" class="fanye">下一页</div>
				<div id="pageCount">第N页 | 共N页</div>
				<input id="pageNo" type="text"/>
				<input id="Go" type="submit" value="GO"/>
				<span></span>
			</div>
		</div>
		<form method="POST" id="addInlibrary">
		<div id="addDetail">
			货物名称：<input  id="GoodsName" name="GoodsName" type="text"/><br/><br/>
			货物数量：<input  id="GoodsCount" name="GoodsCount" type="number" value="1" min="1"/><br/><br/>
			存放位置：
			<select id="area" name="area">
				<option>A1</option>
				<option>A2</option>
				<option>A3</option>
			</select>
			<select id="room" name="room">
				<option>101</option>
				<option>102</option>
				<option>103</option>
			</select>
			<div id="operation">
				<div id="save">保存</div>
				<div id="cancel">取消</div>
			</div>
		</div>
		</form>
		<!--<div id="isDelete">
			<div style="text-align: center;">是否删除该记录？</div>
			<div>
				<div id="yes">是</div>
				<div id="no">否</div>
			</div>
		</div>-->
	</body>
	<script src="../js/util/inManagement.js"></script>
</html>
