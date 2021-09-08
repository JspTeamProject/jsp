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