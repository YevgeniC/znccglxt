<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Select</title>
		<link rel="stylesheet" href="../css/select.css"/>
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/jquery.rotate.js"></script>
	</head>
	<body>
		<div id="head">
			物品编号：<input id="GoodsID" type="text" />
			物品名称：<input id="GoodsName" type="text" />
			<span id="moreterms">更多条件</span>
			<img id="arrow" src="images/sousuomore.png"/>
			<div id="select">查询</div>
		</div>
		<div id="selectmore">
			物品位置：<select id="area">
				<option>A1</option>
				<option>A2</option>
				<option>A3</option>
			</select>
			<select id="room">
				<option>101</option>
				<option>102</option>
				<option>103</option>
			</select>
			入库时间：<input id="StartTime" type="text" />
			至 <input id="EndTime" type="text" />
		</div>
		<div id="middle">
			<div id="mtable">
				<table cellpadding="0" cellspacing="0" >
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
							<td><c:out value=""></c:out></td>
							<td>
								<button datafld="${goods.pid}" class="detail" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #15D6BA">详情</button> |
								<button datafld="${goods.pid}" class="delete" style="border: 0; background-color: #00000000; cursor: pointer; font-size: 15px; color: #FF0000">出库</button>
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
	</body>
	<script src="../js/util/select.js"></script>
</html>
