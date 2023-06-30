
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Information</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head >
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<body>
	<div class="container">
		<h1 style="font-weight:1000;width:300px; font-size: 20px; position: relative; left: 200px; top: 95px">会員を登録します。</h1>
		<p align="right">
			<button
				onclick="window.location.href = '/springmybatis/employee/login'" class="btn btn-outline-primary" style="font-weight:1000; margin-top: 50px; margin-right: 100px; border-radius: 8px;"
				>ログアウト</button>
		</p>

		<script type="text/javascript">
			function validateForm(){
				
				const employeeId = $("input[name=id]").val();
				
				var fullname=$("input[name=fullname]").val();
				
				if(fullname == ""|| fullname == null){
					alert("名前を入力してください。");
					document.myForm.fullname.focus();
					return false;
				}
				if((fullname.length < 5) || (fullname.length > 25)){
					alert("お名前は25文字以内で入力して下さい。");
					document.myForm.fullname.focus();
					return false;
				}


	
				var email=$("input[name=email]").val();
				if(email == "" || email == null){
					alert("メールを入力してください。");
					document.myForm.email.focus();
					return false;
				}

				if(email.length > 20){
					alert("メールアドレスは、20文字以内で正しく入力して下さい。");
					document.myForm.email.focus();
					return false;
				}
				let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
				if(!regex.test(email)){
					alert("メールが無効です。電子メールには拡張子 @abc.xyz が必要です。");
					document.myForm.email.focus();
					return false;
				}
				
				var phone=$("input[name=phone]").val();
				if(phone == "" || phone == null){
					alert("電話番号を入力してください。");
					document.myForm.phone.focus();
					return false;
				}
				
				let regex3 = new RegExp('[0-9]+');
				if(!regex3.test(phone) || phone.trim == null){
					alert("無効な電話番号");
					document.myForm.phone.focus();
					return false;
				}

				if(phone.length > 10){
					alert("電話番号は、数字10文字以内で入力して下さい。");
					document.myForm.phone.focus();
					return false;
				}
				window.location.href = '/springmybatis/employee/showconfirmupdate?employeeId=' + employeeId + "&phone=" + phone + "&fullname=" + fullname + "&email=" + email;
			}
		</script>
		
		<s:form name="myForm" action="updateProcess" var="e" modelAttribute="employee" style="margin-top: 100px;" onsubmit="return validateForm()">
			<style>
      			input {width: 500px;}
      			button {border-radius: 8px;}
      			label {width: 200px}
    		</style>
    		
			<div class="form-group" >
				<label style="visibility: hidden;">ID</label>
				<s:input name="id" display="hidden" path="id" class="form-control" placeholder="Enter Id" style="visibility: hidden; width: 400px; margin-top:-39px; margin-left: 450px"/>
			</div>
			
			<div class="form-group">
				<label style="font-weight:1000; width: 100px; position:relative; left:300px">名前</label>
				<s:input path="fullname" type="text" id="name" placeholder="Enter Fullname" class="form-control" name="fullname" style="width: 400px; margin-top:-39px; margin-left: 450px"/>		
				<c:if test="${not empty message}">
    				<span class="message" style="color:red;">${message}</span>
				</c:if>
			</div>

			<div class="form-group">
				<label style="font-weight:1000; width: 100px; position:relative; left:300px">メール</label>
				<s:input path="email" type="text" id="email" placeholder="Enter Email" class="form-control" style="width: 400px; margin-top:-39px; margin-left: 450px"/>
				<c:if test="${not empty message}">
    				<span class="message" style="color:red;">${message}</span>
				</c:if>
			</div>
				
			<div class="form-group">
				<label style="font-weight:1000; width: 100px; position:relative; left:300px">電話番号</label>
				<s:input path="phone" name="phone" type="text" id="phone" class="form-control" style="width: 400px; margin-top:-39px; margin-left: 450px"/>
				<c:if test="${not empty message}">
    				<span class="message" style="color:red;">${message}</span>
				</c:if>
			</div>
			
			<div class="container">
				<button onclick="return validateForm(); "  type="button" class="btn btn-outline-primary save" 
				style="font-weight:1000; position: relative; left: 600px; border-radius: 8px">確認</button>
        	</div>

		</s:form>
		<div >
			<button id="closeButton" class="btn btn-outline-primary" onclick="window.location.href = '/springmybatis/employee/listOfEmployee'"
			style="font-weight:1000; position: relative; left: 500px; top: -38px; border-radius: 8px">戻る</button>
		</div>
	</div>
	
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
<script src="javascript/myscripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>