<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head >
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div align="center">
        <h2 style="font-size:30px; font-weight:1000">ログインID及びパスワードを入力してください</h2><br>
        <script type="text/javascript">
        	function validate(){
        		var username=document.formLogin.username.value;
				if(username == "" || username == null){
					alert("ログインIDを入力してください");
					document.formLogin.username.focus();
					return false;
				}
				<%--
				if(username.length < 6 || username.length >12){
					alert("Username between 6 and 12 characters");
					document.formLogin.username.focus();
					return false;
				}
				--%>
        		var password=document.formLogin.password.value;
				if(password == "" || password == null){
					alert("パスワードを入力してください");
					document.formLogin.password.focus();
					return false;
				}
				
				<%--
				if(password.length < 6 || password.length > 12){
					alert("Password between 6 and 12 characters");
					document.formLogin.password.focus();
					return false;
				}
				--%>
        	}
        </script>

        <s:form name="formLogin" method = "post" modelAttribute="tk" action="login" onsubmit="return validate()">
        
            <c:if test="${not empty message}">
    				<span class="message" style="color:red;">${message}</span>
			</c:if>

			
        	<div class="form-group">
        		<label style="font-weight: 1000; position:relative; left: -150px;">ログインID</label>
        		<input style="width:300px; position:relative; left: 80px; top: -40px" class="form-control" type="text" name="username">
        	</div>

			<br>
        	<div class="form-group">
        		<label style="font-weight: 1000; position:relative; left: -150px; top: -40px">パスワード </label>
        		<input style="width:300px; position:relative; left: 80px; top: -80px" class="form-control" type="password" name="password">
        	</div>

        	<br>
        	<button type="submit" class="btn btn-outline-primary" style="font-weight: 1000; position:relative; top: -100px" value="Login" onclick="return validate();">ログイン</button>

        </s:form>
    </div>
</body>
</html>																																																																	