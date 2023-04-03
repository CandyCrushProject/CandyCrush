<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
       
        <main>
            <h1>톱 페이지입니다.</h1>

            <ul>
                <li><a href="user/user.jsp">일반 사용자용 페이지로</a></li>
                <li><a href="admin/admin.jsp">관리자 전용 페이지로</a></li>
            </ul>
            <sec:authorize access="isAuthenticated()">
                <form action="logout" method="post">
                    <button>로그아웃</button>
                </form>
            </sec:authorize>
        </main>