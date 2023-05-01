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
<section>
	<form>
		<table border="1px">
			<tr>
				<td>선수이름</td>
				<td>포지션</td>
				<td>팀이름</td>
				<td>경기장 이름</td>
				<td>좌석 수</td>
			</tr>
<%
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select player_name, player_position, t.team_name, s.stadium_name, seat_count from tbl_stadium_20221205 s, tbl_team_20221205 t, tbl_player_20221205 p  where p.team_id = t.team_id and t.stadium_id = s.stadium_id and seat_count >= 30000");
			while(rs.next()){
%>
				<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
				</tr>
<%			}
		}catch(Exception e){
			e.printStackTrace();	
}
%>	
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>