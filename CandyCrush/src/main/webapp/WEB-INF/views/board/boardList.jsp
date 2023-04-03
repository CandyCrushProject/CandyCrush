<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
main {
	text-align: center;
	width: 602px;
	margin: 0 auto;
}

th {
	width: 150px;
}
</style>
<main>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${boardList }" var="bd">
				<tr onclick="location.href='getBoardInfo?bno=${bd.bno}'">
					<td>${bd.bno}</td>
					<td>${bd.title}</td>
					<td>${bd.writer}</td>
					<td><fmt:formatDate value="${bd.regdate}"
							pattern="yyyy년MM월dd일" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</main>