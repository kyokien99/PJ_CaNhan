
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
<title>Added confirm</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head >
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<body>
	<div class="container">
		<h1 style="width: 200px; font-weight: 1000; font-size: 20px; position: relative; left: 200px; top: 95px">会員を登録します。</h1>
		<h2 style="width: 600px; font-weight: 1000; font-size: 20px; position: relative; left: 200px; top: 95px">この内容でよろしければ、登録ボタンをクリックしてください。</h2>
		<p align="right">
			<button
				onclick="window.location.href = '/springmybatis/employee/login'" class="btn btn-outline-primary" style="font-weight: 1000; margin-top: 20px; margin-right: 100px; border-radius: 8px;"
				>ログアウト</button>
		</p>

		<table class="table table-bordered" style="position: relative; top: 100px; width: 600px; left: 200px">
			<tbody style="width: 300px">
				<tr>
					<th style="width: 100px" scope="row">名前</th>
					<td style="width: 300px" id="cname_td"></td>
				</tr>
				<tr>
					<th style="width: 100px" scope="row">メール</th>
					<td style="width: 300px" id="cemail_td"></td>
				</tr>
				<tr>
					<th style="width: 100px" scope="row">電話番号</th>
					<td style="width: 300px" id="cphone_td"></td>
				</tr>
			</tbody>
		</table>
		<s:form id="saveForm" name="myForm" action="updateProcess" var="e" modelAttribute="employee" style="margin-top: 100px;">
			

			<div>
				<button type="submit" class="btn btn-outline-primary" onclick="window.location.href = '/springmybatis/employee/displayUpdateForm.html?employeeId=' + employeeId"
				style="font-weight: 1000; position: relative; left: 500px; top: 50px; border-radius: 8px">登録</button>

			</div>
		</s:form>
				<button id="closeButton" class="btn btn-outline-primary" 
				style="font-weight: 1000; position: relative; left: 400px; top: 12px; border-radius: 8px">戻る</button>
	</div>
	
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
<script src="javascript/myscripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
	$( document ).ready(function() {
		//lấy thông tin sửa từ url confirm
		// /showconfirmadd?employeeId=12&phone=0234890457&fullname=Koyji22&email=koyji@dxc.com
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const id = urlParams.get('employeeId');
		const fullname = urlParams.get('fullname');
		const email = urlParams.get('email');
		const phone = urlParams.get('phone');
		
		// hiển thị thông tin được lấy từ url ra td tag
		$( '#cid_td' ).html( id );
		$( '#cname_td' ).html( fullname );
		$( '#cemail_td' ).html( email );
	    $( '#cphone_td' ).html( phone );
	    
	    // tạo các input type=hidden để submit form
	    var inputId = $("<input>").attr("type", "hidden").attr("name", "id").val(id);
	    var inputFullname = $("<input>").attr("type", "hidden").attr("name", "fullname").val(fullname);
	    var inputEmail = $("<input>").attr("type", "hidden").attr("name", "email").val(email);
	    var inputPhone = $("<input>").attr("type", "hidden").attr("name", "phone").val(phone);
	    
	    $('#saveForm').append(inputId);
	    $('#saveForm').append(inputFullname);
	    $('#saveForm').append(inputEmail);
	    $('#saveForm').append(inputPhone);
	});
</script>
</body>
</html>