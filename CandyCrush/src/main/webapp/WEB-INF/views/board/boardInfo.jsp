<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<main>

	<table>
		<tr>
			<td>번호</td>
			<td>${boardInfo.bno}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${boardInfo.title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${boardInfo.writer}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea readonly>${boardInfo.contents}</textarea></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<c:choose>
				<c:when test="${not empty boardInfo.image}">
					<td><img
						src="<c:url value=" /resources/images/${boardInfo.image}" />"
						alt="이미지가안보임"></td>
				</c:when>
				<c:otherwise>
					<td></td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td>작성일자</td>
			<td><fmt:formatDate value="${boardInfo.regdate}"
					pattern="yyyy/MM/dd" /></td>
		</tr>
	</table>
	<button type="button"
		onclick="location.href='boardUpdate?bno=${boardInfo.bno}'">수정</button>
	<button type="button"
		onclick="location.href='boardDelete?bno=${boardInfo.bno}'">삭제</button>
</main>