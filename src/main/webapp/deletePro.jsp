<%--
  Created by IntelliJ IDEA.
  User: KENKEN0803
  Date: 2021-09-08
  Time: 오후 5:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    try {
        String sql = "delete from member where id =?";
        preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1, id);
        preparedStatement.executeUpdate();

    } catch (SQLException e) {
        out.print(e.getMessage());
    } finally {
        if (preparedStatement != null) preparedStatement.close();
        if (conn != null) conn.close();
        if (resultSet != null) resultSet.close();
        response.sendRedirect("list.jsp");
    }
%>