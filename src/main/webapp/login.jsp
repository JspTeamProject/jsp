<%--
  Created by IntelliJ IDEA.
  User: KENKEN0803
  Date: 2021-09-08
  Time: 오후 5:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
</head>
<body>
    <table style="margin-left : auto; margin-right : auto; text-align: center; border:solid coral 1px" >
        <form method="post" action="loginPro.jsp">
            <tr>
                <td>이름</td>
                <td><input type="text" name="name"></td>
                <td rowspan="2"><input style="height:50px;background:lightcoral; border:0px" type="submit" value="로그인"></td>
            </tr>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id"></td>
            </tr>
        </form>
    </table>
</body>
</html>
