<%--
  Created by IntelliJ IDEA.
  User: KENKEN0803
  Date: 2021-09-08
  Time: 오후 5:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="dbconn.jsp" %>
<html>
<head>
    <title>Member List</title>
</head>
<style>
    body {
        text-align: center;
    }

    table {
        margin: auto;
        width: 50%;
        border: 1px solid salmon;
    }

    th {
        border: 1px solid black;
    }

    td {
        border: 1px solid black;
        text-align: center;
    }

    tr:hover {
        background: burlywood;
    }

    .btn {
        width: 100%;
        height: 100%;
        background: salmon;
        border: none;
        border-radius: 5px;
    }
</style>
<body>
<h3>회원 목록</h3>
<hr/>
<table>
    <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    <%
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "select * from member";
            preparedStatement = conn.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
    %>
    <tr>
        <td><%=id%>
        </td>
        <td><%=name%>
        </td>
        <td>
            <form method="post" action="modifyPro.jsp" class="modifyForm">
                <input type="hidden" name="oldId" value="<%=id%>">
                <input type="hidden" name="newId" class="newId" value="">
                <input type="button" value="수정" class="btn" id="mod" onclick="doModify()">
            </form>
        </td>
        <td>
            <form method="post" action="deletePro.jsp" class="deleteForm">
                <input type="hidden" name="id" value="<%=id%>">
                <input type="button" value="삭제" class="btn" id="del" onclick="doDelete()">
            </form>
        </td>
    </tr>
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
</table>
<a href="index.jsp">홈페이지로 돌아가기</a>
<script>
    const newId = document.querySelector(".newId");
    const mod = document.querySelector("#mod");
    const del = document.querySelector("#del");
    const deleteForm = document.querySelector(".deleteForm");
    const modifyForm = document.querySelector(".modifyForm");

    const doModify = () => {
        const input = prompt("새 아이디를 입력 해 주세요");
        if (input) {
            newId.value = input;
            modifyForm.submit();
        } else {
            return false;
        }
    }
    const doDelete = () => {
        if (confirm("정말 삭제하시겠습니까?")) {
            deleteForm.submit();
        } else {
            return false;
        }
    }

</script>
</body>
</html>
