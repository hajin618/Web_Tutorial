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
	<h2>�� ����</h2>
	<form action="del_ok.jsp" action="post">
	<input type="hidden" name="idx" value="<%=idx%>">
		��й�ȣ :<input type="password" name="pwd">
		&nbsp;&nbsp;
		<a href="guest.jsp">����Ʈ�� ���ư���</a><br>
		<input type="submit" value="������">
	</form>
</center>

</body>
</html>