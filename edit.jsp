<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>

<%
String idx=request.getParameter("idx");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","khj", "1234");

String sql="select * from guest where id=?";
PreparedStatement pstm=conn.prepareStatement(sql);
pstm.setString(1,idx);
ResultSet rs=pstm.executeQuery();
rs.next();
int id=rs.getInt("id");
String name=rs.getString("name");
String pwd=rs.getString("pwd");
String email=rs.getString("email");
String content=rs.getString("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2>수정하기 (글 내용만 수정)</h2>
<form method="post" action="edit_ok.jsp">
<input type="hidden" name="idx" value="<%=idx%>">
<p>이름 : <input type="text" name="name" value=<%=name%>>
비밀번호 : <input type="password" name="pwd"></p>
<p>E-mail : <input type="text" name="email" size="50" value="<%=email%>"></p>
<p><textarea wrap="hard" rows="10" cols="70" name="content"><%=content%></textarea></p>
<p><input type="submit" value="글남기기"></p>
</form>


</html>
</body>
</html>