
<%@page import="java.sql.*"%>
<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String position = request.getParameter("position");
		String date = request.getParameter("date");
		String team = request.getParameter("team");
		String sql="";
		String delete = "";
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			delete = String.format("delete from tbl_player_20221205 where player_id = '%s'", id);
			sql = String.format("insert into tbl_player_20221205 values('%s','%s','%s','%s','%s')", id, name, position, date, team);
			stmt.executeUpdate(delete);
			stmt.executeUpdate(sql);
		}catch(Exception e){
			e.printStackTrace();	
		}
%>	
<jsp:forward page="list.jsp"></jsp:forward>