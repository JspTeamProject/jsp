<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<%
    Connection  conn = null;
    String server = "localhost";
    String database = "db01";
    String user_name = "root";
    String password = "1234";

    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    try {
        conn = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?useSSL=false", user_name, password);
        System.out.println("jdbc:mysql://" + server + "/" + database + "?useSSL=false" + user_name + password);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<%--<%@include file="dbconn.jsp" %>--%>

<%
    request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	

    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    int result = 0;

    try {
        String sql = "insert into member(id,name) values(?,?)";
        
        preparedStatement = conn.prepareStatement(sql);
        
        preparedStatement.setString(1, id);
        preparedStatement.setString(2, name);
        
        result = preparedStatement.executeUpdate();
        
		if(result != 0){		
%>
		<script>
			alert("회원가입 성공하셨습니다");
			location.href="index.jsp";
		</script>
<%			
		}else{
%>
			<script>
				alert("회원가입 실패하셨습니다");
				location.href="index.jsp";
			</script>
<%				
		}
        
    } catch (SQLException e) {
        out.print(e.getMessage());
%>
		<script>
			alert("ERROR");
		</script>
<%        
        
    } finally {
        if (preparedStatement != null) preparedStatement.close();
        if (conn != null) conn.close();
        if (resultSet != null) resultSet.close();
    }
%>