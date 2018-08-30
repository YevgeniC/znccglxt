<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Select</title>
		<link rel="stylesheet" href="../css/select.css"/>
		<script src="../js/jquery-3.3.1.min.js"></script>
		<script src="../js/jquery.rotate.js"></script>
	</head>
	<body>
		<div class="shandow"></div>
		<div id="head">
			物品编号：<input id="GoodsID" type="text" />
			物品名称：<input id="GoodsName" type="text" />
			<span id="moreterms">更多条件</span>
			<img id="arrow" src="../picture/system/sousuomore.png"/>
			<div id="search">查询</div>
		</div>
		<div id="selectmore">
			物品位置：<select id="area">
				<option value="">--仓库号--</option>
				<option value="A1">A1</option>
				<option value="A2">A2</option>
				<option value="A3">A3</option>
			</select>
			<select id="room">
				<option value="">--房间号--</option>
				<option value="101">101</option>
				<option value="102">102</option>
				<option value="103">103</option>
			</select>
			入库时间：<input id="StartTime" type="date" />
			至 <input id="EndTime" type="date" />
		</div>
		<div id="middle">
			<div id="mtable">
				<table cellpadding='0' cellspacing='0' id='showList'>
					<tr id="title">
						<td>物品编号</td>
						<td>物品名称</td>
						<td>物品数量</td>
						<td>物品位置</td>
						<td>入库时间</td>
						<td>操作</td>
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
			</div>
			<div id="count">显示
				<select class="count">
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
				</select>
				条记录
			</div>
		</div>
		<div id="detail"  tabindex="0">
			<table>
				<!--<th colspan="2" style="text-align: center;">
					—————— <span id="thid">物品详情</span> ——————
				</th>
				<tr>
					<td>物品编号：<span id="id">1578948944</span></td>
					<td>物品名称：<span id="name">奶酪</span></td>
				</tr>
				<tr>
					<td>物品数量：<span id="num">14</span></td>
					<td>物品位置：<span id="address">A2 - 502</span></td>
				</tr>
				<tr>
					<td>入库时间：<span id="time">2018-08-13 15:25:26</span></td>
				</tr>
				<tr>
					<td>入库用户：<span id="person">Mike</span></td>
				</tr>-->
			</table>
			<div  id="operation"></div>
		</div>
		
	</body>
	<script src="../js/util/select.js"></script>
</html>
