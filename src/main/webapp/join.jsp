<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Join</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.wrap {
	 position:absolute;
  width:400px;
  height:400px;
  padding: 30px 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}
.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.input {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}
.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background-color: salmon;
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

</style>
</head>
<body>
<div class ="wrap">

	<form method="post" action="joinPro.jsp">
	<div class="textForm">
		<input type="text" name="id" class="input" placeholder="아이디">
	</div>
	<div class="textForm">
		<input type="text" name="name" class="input" placeholder="이름">
	</div>
	<div>
		<input type="submit" value="회원가입"  class="btn">
	</div>

	</form>
</div>

</body>
</html>
