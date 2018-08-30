<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>outManagement</title>
		<link rel="stylesheet" href="../css/outManagement.css"/>
		<script src="../js/jquery-3.3.1.min.js"></script>
	</head>
	<body>
		<div class="shandow"></div>
		<div id="top">
			<input id="search" type="text" placeholder="请输入出库单号或物品名称"/>
			<div id="select">查询</div>
		</div>
		<div id="middle">
			<div id="mtable">
				<table cellpadding='0' cellspacing='0' id='showList'>
					<tr id="title">
						<td>出库单号</td>
						<td>物品名称</td>
						<td>出库数量</td>
						<td>物品去向</td>
						<td>出库时间</td>
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
				<!--<th colspan="4" style="text-align: center;">
					—————— <span id="thid">出库详情</span> ——————
				</th>
				<tr>
					<td width="240px;">物品编号：<span id="id">1578948944</span></td>
					<td>物品名称：<span id="name">奶酪</span></td>
					<td width="80px">物品编号：</td>
					<td id="id">1578948944</td>
					<td width="80px">物品名称：</td>
					<td id="name">奶酪</td>
				</tr>
				<tr>
					<td>物品数量：<span id="num">14</span></td>
					<td>物品位置：<span id="address">A2 - 502</span></td>
					<td>物品数量：</td>
					<td id="num">14</td>
					<td>物品位置：</td>
					<td id="location">A2 - 502</td>
				</tr>
				<tr>
					<td colspan="2">物品去向：<span id="address">浙江省杭州市浙科院</span></td>
					<td>物品去向：</td>
					<td colspan="3" id="address">浙江省杭州市西</td>
				</tr>
				<tr>
					<td>出库时间：<span id="time">2018-08-13 15:25:26</span></td>
					<td>出库时间：</td>
					<td id="time">2018-08-13 15:25:26</td>
				</tr>
				<tr>
					<td>出库用户：<span id="person">Mike</span></td>
					<td>出库用户：</td>
					<td id="person">Mike</td>
				</tr>-->
			</table>
		</div>
		<div id="isDelete">
			<div style="text-align: center;">是否删除该记录？</div>
			<div>
				<div id="yes">是</div>
				<div id="no">否</div>
			</div>
		</div>
	</body>
<script type="text/javascript" src="../js/util/outManagement.js"></script>
</html>
