<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.btn {
  /* change bg color to get different hues    */
  background-color: salmon;
  color: white;
  padding: 2em 3em;
  border: none;
  transition: all .3s ease;
  border-radius: 5px;
  letter-spacing: 2px;
  text-transform: uppercase;
  outline: none;
  align-self: center;
  cursor: pointer;
  font-weight: bold;
}

.wrap {
	 position:absolute;
  
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}
</style>
    <title>JSP - Hello World</title>
</head>
<body>
<div class="wrap">
	<button onclick ="location.href='join.jsp'" class="btn">회원가입</button>
	<button onclick ="location.href='login.jsp'" class="btn">로그인</button>
	<button onclick ="location.href='list.jsp'" class="btn">회원목록</button>
</div>
</body>
</html>