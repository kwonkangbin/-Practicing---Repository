<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String sql = "";
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		sql = String.format("insert into tbl_inout_202002 values('%s', '%s', '%s', %s, '%s', '%s')", request.getParameter("no"), request.getParameter("code"), request.getParameter("incost"), request.getParameter("count"), request.getParameter("date"), request.getParameter("company"));
		stmt.executeUpdate(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<jsp:forward page="index.jsp"></jsp:forward>