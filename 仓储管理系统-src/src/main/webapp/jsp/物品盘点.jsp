<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	    <table class="table table-bordered">
        <thead>
        <tr>
         
            <td>物品数量</td>
            <td>物品名称</td>
        </tr>
        </thead>
        <c:forEach var="Library" items="${Library}">
            <tr >
                <td><c:out value="${Library.sum}"></c:out></td>
                <td><c:out value="${Library.pname}"></c:out></td>
        </c:forEach>
    </table>
</body>
</html>