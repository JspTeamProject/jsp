<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인 결과</title>
</head>
<body>
<%
    Connection conn = null;
    String server = "localhost"; // MySQL 서버 주소
    String database = "db01"; // MySQL DATABASE 이름
    String user_name = "root"; //  MySQL 서버 아이디
    String password = "1234"; // MySQL 서버 비밀번호
    
    request.setCharacterEncoding("UTF-8");
    String loginID = request.getParameter("id");
    String loginName = request.getParameter("name");

    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    try {
        conn = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?useSSL=false", user_name, password);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    Statement statement = null;
    ResultSet resultSet = null;
    statement = conn.createStatement();
    try {
        String sql = "select * from member where id = '" +loginID+"' and name = '"+loginName+"'";
        resultSet = statement.executeQuery(sql);

        String loginResult = "";
        while (resultSet.next()) {
            loginResult = resultSet.getString(1);
        }
        if(loginResult != ""){
%>
<h3 style="text-align: center"> <%= loginID %> 로그인에 성공하셨습니다.</h3>
<%
        }else{
%>
<h3 style="text-align: center"> 로그인 실패.</h3>
<%
        }
    } catch (SQLException e) {
        out.print(e.getMessage());
    } finally {
        if (statement != null) statement.close();
        if (conn != null) conn.close();
        if (resultSet != null) resultSet.close();
    }
%>
</body>
</html>
