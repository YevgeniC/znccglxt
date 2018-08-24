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
						<td>货物编号</td>
						<td>货物名称</td>
						<td>货物数量</td>
						<td>货物位置</td>
						<td>入库时间</td>
						<td>操作</td>
					</tr>
					<c:forEach var="goods" items="${goods}" varStatus="status">
						<tr id="${status.index}" class="data">
							<td><c:out value="${goods.pid}"></c:out></td>
							<td><c:out value="${goods.pname}"></c:out></td>
							<td><c:out value="${goods.pnum}"></c:out></td>
							<td><c:out value="${goods.area} - ${goods.room}"></c:out></td>
							<td><c:out value="${goods.inlibrary.intime}"></c:out></td>
							<td>
								<button datafld="${goods.pid}" class="detail" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #15D6BA">详情</button> |
								<button datafld="${goods.pid}" class="move" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: 	#4876FF">移动</button> |
								<button datafld="${goods.pid}" class="out" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #FF0000">出库</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id='fenye'>
				<div id='totalcount'>当前共<%=(Integer)request.getAttribute("count")%>条记录</div>
				<div id="first" class="fanye">首页</div>
				<div id="previous" class="fanye">上一页</div>
				<div id="next" class="fanye">下一页</div>
				<div id="last" class="fanye">尾页</div>
				<div id="pageCount" datafld="<%=(Integer)request.getAttribute("pageCount")%>">
					第<%=(Integer)request.getAttribute("pageNo")%>页|
					共<%=(Integer)request.getAttribute("pageCount")%>页
				</div>
				<input id="pageNo" type="text"/>
				<input id="Go" type="submit" value="GO"/>
				<span></span>
			</div>
		</div>
		<div id="detail"  tabindex="0">
			<table>
				<th colspan="2" style="text-align: center;">
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
				</tr>
			</table>
		</div>
		<div id="outbound"  tabindex="0">
			<table>
				<th colspan="2" style="text-align: center;">
					—————— <span id="thid">出		库</span> ——————
				</th>
				<tr>
					<td style="width: 240px;">物品编号：<span id="id">1578948944</span></td>
					<td>物品名称：<span id="name">你说你M呢</span></td>
				</tr>
				<tr>
					<td>物品数量：<input id="num" type="number" value="1" min="1" max="10"/></td>
					<td>物品位置：<span id="address">A2 - 502</span></td>
				</tr>
				<tr>
					<td colspan="2">物品去向：<input style="width: 75%;" required="required"></input></td>
				</tr>
			</table>
			<div id="operation">
				<div id="save">保存</div>
				<div id="cancel">取消</div>
			</div>
		</div>
	</body>
	<script src="../js/util/select.js"  charset="GBK"></script>
</html>
