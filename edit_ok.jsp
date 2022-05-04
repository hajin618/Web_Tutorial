<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String idx=request.getParameter("idx");
	String pwd=request.getParameter("pwd");
	String content=request.getParameter("content");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","khj", "1234");
	String sql="select pwd from guest where id=?";
	PreparedStatement pstm=conn.prepareStatement(sql);
	pstm.setString(1, idx);
	ResultSet rs=pstm.executeQuery();
	rs.next();
	String goodpass=rs.getString("pwd").trim();
	
	if(pwd.equals(goodpass))
	{
		String strsql="update guest set content=? where id=?";
		pstm=conn.prepareStatement(strsql);
		pstm.setString(1, content);
		pstm.setString(2, idx);
		
		pstm.executeUpdate();
		rs.close();
		pstm.close();
		conn.close();
		
		response.sendRedirect("guest.jsp");
	}
	else
	{
		
	
%>
<script>
	alert("비밀번호 불일치");
	history.back();
</script>
<%}%>