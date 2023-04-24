<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<h1>제품조회</h1>
<% 
 try{
	 Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select max(t_no)+1 as t_no from tbl_inout_202002");
		rs.next();
%>
<form method="post" name="frm" action="action.jsp">
	<table border = "1px"> 
	<tr>
		<td>입출고번호</td>
		<td><input type="text" name="no" value="<%=rs.getString("t_no")%>" readonly/></td>
<%
}
catch(Exception e){
	e.printStackTrace();
}
%>
	</tr>
	<tr>
		<td>제품코드</td>
		<td><input type="text" name="code"/></td>
	</tr>
	<tr>
		<td>입출고구분</td>
		<td><input type="radio" name="incost" value="1">입고</input><input type="radio" name="incost" value="0"/>출고</td>
	</tr>
	<tr>
		<td>수량</td>
		<td><input type="text" name="count"/></td>
	</tr>
	<tr>
		<td>거래일자</td>
		<td><input type="date" name="date"/></td>
	</tr>
	<tr>
		<td>거래처</td>
		<td>
		<select name="company">
		<option value="0">거래처선택</option>
		<option value="10">서울공장</option>
		<option value="20">울산공장</option>
		<option value="30">부산상사</option>
		<option value="40">광주상사</option>
		<option value="50">대전상사</option>
		</select>
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="입출고등록" onclick="return check()"/><input type="button" value="다시쓰기" onclick="frm.reset()"/></td>
	</tr>
	</table>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>