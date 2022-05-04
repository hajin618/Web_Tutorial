<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
	<a href="write.html">글쓰기</a>
	<table border="1" width="600">
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","khj", "1234");
	
	String sql="select * from guest order by id desc";
	PreparedStatement pstm=conn.prepareStatement(sql);
	ResultSet rs=pstm.executeQuery();
	while(rs.next()){
		int id=rs.getInt("id");
		String name=rs.getString("name");
		String pwd=rs.getString("pwd");
		String email=rs.getString("email");
		String content=rs.getString("content");
		Timestamp writeday=rs.getTimestamp("writeday");
	%>
	<tr>
		<td><a href="mailTo:<%=email%>"><%=name%></a>(<%=writeday%>)</td>
		<td><a href="del.jsp?idx=<%=id%>">삭제</a> &nbsp;&nbsp;&nbsp;
			<a href="edit.jsp?idx=<%=id%>">수정</a>
		</td></tr>
	<tr>
	
	<td colspan="2"><%=content %></td>
	</tr>
	<%} 
	rs.close();
	pstm.close();
	conn.close();
	%>
	</table>
</center>
</body>
</html>