<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    String server = "localhost"; // MySQL 서버 주소
    String database = "db01"; // MySQL DATABASE 이름
    String user_name = "root"; //  MySQL 서버 아이디
    String password = "1234"; // MySQL 서버 비밀번호

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


//아래를 프로세스 파일에 임포트
<%--<%@include file="dbconn.jsp" %>--%>

<%
    request.setCharacterEncoding("UTF-8");

    String num = request.getParameter("num");

    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        String sql = "";
        preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1, num);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            String contents = resultSet.getString("content");
%>


<%
        }
    } catch (SQLException e) {
        out.print(e.getMessage());
    } finally {
        if (preparedStatement != null) preparedStatement.close();
        if (conn != null) conn.close();
        if (resultSet != null) resultSet.close();
    }
%>