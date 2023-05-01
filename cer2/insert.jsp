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
<section>
<form name="frm" method="post" action="action.jsp">
		<table border="1px">
			<tr>
				<td>선수ID</td>
<%try{ 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select MAX(player_id)+1 as id from tbl_player_20221205");
	rs.next();
%>
				<td><input type="text" name = "id" value="<%=rs.getInt("id") %>" readonly="readonly"/></td>
<% 
} catch(Exception e){
	e.printStackTrace();
}
%>
			</tr>
			<tr>
				<td>선수이름</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>포지션</td>
				<td>
				<input type="radio" name="position" value="GK"/>골키퍼
				<input type="radio" name="position" value="DF"/>수비수
				<input type="radio" name="position" value="MF"/>미드필더	
				<input type="radio" name="position" value="FW"/>공격수
				</td>
			</tr>
			<tr>
				<td>선수등록일</td>
				<td>
					<input type="text" name="date"/>
				</td>
			</tr>
			<tr>
				<td>소속팀</td>
				<td>
				<select name="team">
						<option value="K00">무소속</option>
						<option value="K01">울산현대</option>
						<option value="K02">삼성블루윙즈</option>
						<option value="K03">스틸러스</option>
						<option value="K04">유나이티드</option>
						<option value="K05">현대모터스</option>
						<option value="K06">부산소마고</option>
						<option value="K07">드래곤즈</option>
						<option value="K08">일화천마</option>
						<option value="K09">FC서울</option>
						<option value="K10">시티즌</option>
						<option value="K11">경남FC</option>
						<option value="K12">광주상무</option>
						<option value="K13">강원FC</option>
						<option value="K14">제주유나이티드FC</option>
						<option value="K15">대구FC</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="추가" onclick="return check()">
					<input type="button" value="취소" onclick="reset()">
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>