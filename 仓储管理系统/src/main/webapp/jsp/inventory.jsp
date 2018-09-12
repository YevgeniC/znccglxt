<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory</title>
        <link href="../css/inventory.css" type="text/css" rel="stylesheet"/>
		<script src="../js/jquery-3.3.1.min.js"></script>
    </head>
    <body>
    	<div class="shandow"></div>
    	<div id="shandow"></div>
    	<div id="top">
			<input id="GoodsName" type="text" placeholder="请输入物品名称"/>
			<select id="GoodsCategory" name="category" />
				<option>---物品类别---</option>
				<option>食品饮品</option>
				<option>生活用品</option>
				<option>学习用品</option>
				<option>建筑材料</option>
				<option>其他</option>
			</select>
			<div id="search">查询</div>
		</div>
		<div id="middle">
			<div id="mtable">
				<table cellpadding='0' cellspacing='0' id='showList'>
					<tr id="title">
						<td>物品名称</td>
						<td>物品数量</td>
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
				<th colspan="3">——————物品详情——————</th>
				<!--<tr>
					<td>物品名称</td>
					<td>物品数量</td>
					<td>物品位置</td>
				</tr>
				<tr>
					<td>肥宅快乐水</td>
					<td>111</td>
					<td>A2 - 103</td>
				</tr>-->
			</table>
		</div>
 	</body>
 	<script src="../js/util/inventory.js"></script>
</html>