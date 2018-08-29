<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Select</title>
		<link rel="stylesheet" href="../css/movesRecord.css" />
		<script src="../js/jquery-3.3.1.min.js"></script>
		<script src="../js/jquery.rotate.js"></script>
	</head>
	<body>
		<div id="head">
			移动记录编号：<input id="mID" type="text" />
			物品名称：<input id="GoodsName" type="text" />
			<span id="moreterms">更多条件</span>
			<img id="arrow" src="../picture/system/sousuomore.png"/>
			<div id="search">查询</div>
		</div>
		<div id="selectmore">
			负责人：<input id="moveUser" type="text" />
			移动时间：<input id="StartTime" type="date" />
			至 <input id="EndTime" type="date" />
		</div>
		<div id="middle">
			<div id="mtable">
				<table cellpadding="0" cellspacing="0" >
					<tr id="title">
						<td>移动记录编号</td>
						<td>物品名称</td>
						<td>物品移动数量</td>
						<td>物品原位置</td>
						<td>物品当前位置</td>
						<td>移动时间</td>
						<td>负责人</td>
					</tr>
				</table>
			</div>
			<div id="fenye">
				<div id='totalcount'>当前共N条记录</div>
				<div id="previous" class="fanye">上一页</div>
				<div id="next" class="fanye">下一页</div>
				<div id="pageCount">第N页 | 共N页</div>
				<input id="pageNo" type="text"/>
				<input id="Go" type="submit" value="GO"/>
			</div>
		</div>
		
	</body>
	<script src="../js/util/movesRecord.js"></script>
</html>
