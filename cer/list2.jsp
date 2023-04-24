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
<h1>제품별이익통계</h1>
<form>
	<table border = "1px"> 
	<tr>
		<td>입출고번호</td>
		<td>제품코드</td>
		<td>제품명</td>
	    <td>입출고구분</td>
	    <td>수량</td>
		<td>거래처</td>
		<td>거래일자</td>
	</tr>
<%
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from tbl_inout_202002 i, tbl_product_202002 pro where i.p_code = pro.p_code");
		while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("t_no") %></td>
		<td><%=rs.getString("p_code") %></td>
		<td><%=rs.getString("p_name") %></td>
		<td><%=rs.getString("t_type") %></td>
	    <td><%=rs.getInt("t_cnt") %></td>
		<td><%=rs.getString("c_code") %></td>
		<td><%=rs.getDate("T_date") %></td>
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