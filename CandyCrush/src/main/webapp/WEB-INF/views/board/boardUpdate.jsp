<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<main>
				<form action="boardUpdate" method="post" name="updateForm" onsubmit="return false">
					<table>
						<tr>
							<td>번호</td>
							<td><input type="text" name="bno" value="${boardInfo.bno}" readonly></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value="${boardInfo.title}"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" name="writer" value="${boardInfo.writer}" readonly></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="contents">${boardInfo.contents}</textarea></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><input type="text" name="image" value="${boardInfo.image}"></td>
						</tr>
						<tr>
							<td>수정날짜</td>
							<td>
								<input type="date" name="updatedate">
							</td>
						</tr>
					</table>
					<button type="submit">등록</button>
					<button type="button" onclick="location.href='getBoardInfo?bno=${boardInfo.bno}'">취소</button>
				</form>
				<script>
					function formOptionChk() {
						let title = document.getElementsByName("title")[0];
						let contents = document.getElementsByName("contents")[0];

						if (title.value == "") {
							alert("제목이 입력되지 않았습니다");
							title.focus();
							return;
						}
						if (contents.value == "") {
							alert("내용이 입력되지 않았습니다");
							contents.focus();
							return;
						}

						updateForm.submit();
					}
					document.querySelector('button[type="submit"]').addEventListener('click', formOptionChk);
				</script>
			</main>