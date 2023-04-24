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
		<td>제품코드</td>
		<td>제품명</td>
	    <td>출고수량</td>
		<td>출고매출이익</td>
	</tr>
<%
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from tbl_inout_202002 i,tbl_product_202002 pro where i.p_code = pro.p_code and t_type = 'O' or t_type = '0'" );
		while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("p_code") %></td>
		<td><%=rs.getString("p_name") %></td>
	    <td><%=rs.getInt("t_cnt") %></td>
		<td><%=rs.getString("p_outcost") %></td>
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