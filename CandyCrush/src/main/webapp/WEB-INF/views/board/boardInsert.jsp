<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<style>
				body {

					width: 100%;
				}

				main {
					text-align: center;
					width: 270px;
					margin: 0 auto;
				}

				th {
					width: 80px;
				}
			</style>
			<main>
				<form action="boardInsert" method="post" name="insertForm" onsubmit="return false">
					<table>
						<tr>
							<th>글번호</th>
							<td><input type="text" name="bno" value="${bno}" readonly></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="writer"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="5" cols="22" name="contents"></textarea></td>
						</tr>
						<tr>
							<th>첨부이미지</th>
							<td><input type="text" name="image"></td>
						</tr>
					</table>
					<button type="submit">등록</button>
					<button type="button" onclick="location.href='getBoardList'">목록</button>
				</form>
				<script>
				function formOptionChk() {
					let title = document.getElementsByName("title")[0];
					let writer = document.getElementsByName("writer")[0];
					let contents = document.getElementsByName("contents")[0];

						if (title.value == "") {
							alert("제목이 입력되지 않았습니다");
							title.focus();
							return;
						}
						if (writer.value == "") {
							alert("작성자가 입력되지 않았습니다");
							writer.focus();
							return;
						}
						if (contents.value == "") {
							alert("내용이 입력되지 않았습니다");
							contents.focus();
							return;
						}

						insertForm.submit();
					}
					document.querySelector('button[type="submit"]').addEventListener('click', formOptionChk);
				</script>
			</main>