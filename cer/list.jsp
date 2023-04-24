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
<jsp:include page="header.jsp"></jsp:include>
<h1>제품조회</h1>
<form>
	<table border = "1px"> 
	<tr>
		<td>제품코드</td>
		<td>제품명</td>
		<td>사이즈</td>
	    <td>매입단가</td>
		<td>출고단가</td>
	</tr>
<%
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from tbl_product_202002");
		while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("P_CODE") %></td>
		<td><%=rs.getString("p_name") %></td>
		<td><%=rs.getInt("p_size") %></td>
	    <td><%=rs.getInt("p_incost") %></td>
		<td><%=rs.getInt("p_outcost") %></td>
	</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}

%>
	</table>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>