<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<title>Added Confirm</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<body>

	<div class="container">
		<h1 style="font-size: 20px; font-weight: 1000; position: relative; left: 100px; top: 95px">登録の完了。</h1>
		<p align="right">
			<button
				onclick="window.location.href = '/springmybatis/employee/login'" class="btn btn-outline-primary" style="position: relative; font-weight: 1000; left: -50px; top: 60px; border-radius: 8px;"
				>ログアウト</button>
		</p>
		
		<div style="color:red; position: relative; top: 100px; font-weight: 1000;" align="center">
			<label>登録が完了しました。</label> <br> <br> <br> <br>
			<button class="btn btn-outline-primary" style="border-radius: 8px; font-weight: 700;" onclick="window.location.href = '/springmybatis/employee/listOfEmployee'">OK</button>
		</div>
	</div>

</body>
</html>