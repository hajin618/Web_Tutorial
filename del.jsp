<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
String idx=request.getParameter("idx");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<center>
	<h2>글 삭제</h2>
	<form action="del_ok.jsp" action="post">
	<input type="hidden" name="idx" value="<%=idx%>">
		비밀번호 :<input type="password" name="pwd">
		&nbsp;&nbsp;
		<a href="guest.jsp">리스트로 돌아가기</a><br>
		<input type="submit" value="보내기">
	</form>
</center>

</body>
</html>