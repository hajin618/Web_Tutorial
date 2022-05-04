<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<%@page import="java.sql.*"%>

<%
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String content=request.getParameter("content");
	Timestamp writeday=new Timestamp(System.currentTimeMillis());
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","khj", "1234");
	
	String sql="insert into guest (name, pwd, email, content, writeday) values(?,?,?,?,?)";
	PreparedStatement pstm=conn.prepareStatement(sql);
	pstm.setString(1, name);
	pstm.setString(2, pwd);
	pstm.setString(3, email);
	pstm.setString(4, content);
	pstm.setTimestamp(5, writeday);
	pstm.executeUpdate();
	response.sendRedirect("guest.jsp");
%>