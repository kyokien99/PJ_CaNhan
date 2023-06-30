
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
<title></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head >
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<body>
	<div class="container">
		<h1 style="font-size: 20px; position: relative; left: 200px; top: 95px">会社を登録します。</h1>
		<p align="right">
			<button
				onclick="window.location.href = '/springmybatis/employee/login'" class="btn btn-outline-primary" style="margin-top: 50px; margin-right: 100px; border-radius: 8px;"
				>ログアウト</button>
		</p>

		<script type="text/javascript">
			function validateForm(){
				var fullname=document.myForm.fullname.value;
				
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
	
				var email=document.myForm.email.value;
				if(email == "" || email == null){
					alert("メールを入力してください。");
					document.myForm.email.focus();
					return false;
				}

				if(email.length < 20){
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
				
				var phone=document.myForm.phone.value;
				if(phone == "" || phone == null){
					alert("電話番号を入力してください。");
					document.myForm.phone.focus();
					return false;
				}

				if(phone.length < 10){
					alert("電話番号は、数字10文字以内で入力して下さい。");
					document.myForm.phone.focus();
					return false;
				}
			}
		</script>
		
		<script>
			$(document).ready(function() {
				$(document).on('click', '.delete', function() {
			    var id = $(this).val();
			    var name = $('#name' + id).val();
			    var email = $('#email' + id).val();
			    var phone = $('#phone' + id).val();
			    $('#confirm').modal('show');
			    $( '#cname_td' ).html( name );
			    $( '#cemail_td' ).html( email );
			    $( '#cphone_td' ).html( phone );
				});
			});
		</script>

		<script>
			$(document).ready(function() {
				$(document).on('click', '.save', function() {
			    var id = $(this).val();
			    var name = $('#name' + id).val();
			    var email = $('#email' + id).val();
			    var phone = $('#phone' + id).val();
			    $('#edit').modal('show');
			    $( '#name_td' ).html( name );
			    $( '#email_td' ).html( email );
			    $( '#phone_td' ).html( phone );
				});
			});
		</script>
		
		<script>
			$(document).ready(function() {
				$(document).on('click', '.saveConfirm', function() {
					$('#notifiSave').modal('show');
				});
			});
		</script>
		
		<script>
			$(document).ready(function() {
				$(document).on('click', '.deleteConfirm', function() {
					$('#notifiDel').modal('show');
				});
			});
		</script>
		
	
		<s:form name="myForm" action="saveProcess" items="${employeeList}" var="e" modelAttribute="employee" style="margin-top: 100px;" onsubmit="return validateForm()">
			<c:url var="deleteLink" value="/employee/displayDeleteForm.html">
				<c:param name="employeeId" value="${e.id}" />
			</c:url>

			<style>
      			input {width: 500px;}
      			button {border-radius: 8px;}
      			label {width: 200px}
    		</style>
			<div class="form-group">
			<label>ID</label>
				<s:input display="hidden" path="id" class="form-control" style="width: 500px; margin-top:-39px; margin-left: 150px"/>
			</div>
			
			<div class="form-group">
				<label>名前</label>
				<s:input path="fullname" type="text" id="name" placeholder="Enter Fullname" class="form-control" name="fullname" style="width: 500px; margin-top:-39px; margin-left: 150px"/>		
				<c:if test="${not empty message}">
    				<span class="message" style="color:red;">${message}</span>
				</c:if>
			</div>

			<div class="form-group">
				<label>メール</label>
				<s:input path="email" type="text" id="email" placeholder="Enter Email" class="form-control" style="width: 500px; margin-top:-39px; margin-left: 150px"/>
				<c:if test="${not empty message}">
    				<span class="message" style="color:red;">${message}</span>
				</c:if>
			</div>
				
			<div class="form-group">
				<label>電話番号</label>
				<s:input path="phone" name="phone" type="text" id="phone" class="form-control" style="width: 500px; margin-top:-39px; margin-left: 150px"/>
				<c:if test="${not empty message}">
    				<span class="message" style="color:red;">${message}</span>
				</c:if>
			</div>
			
			<div class="container">
				<button   type="button" class="btn btn-outline-primary save" 
				style="position: relative; left: 200px; border-radius: 8px">確認</button>
	
			 <!-- Save modal -->
			<div class="modal" id="edit">
				<div class="modal-dialog">
					<div class="modal-content">

              		<!-- Modal Header -->
              			<div class="modal-header">
        					<h4>If you are sure of the information you entered, press the "OK" button</h4>
      					</div>

      				<!-- Modal body -->
     					<div class="modal-body" >
          					<table class="table table-bordered">
  								<tbody>

    								<tr>
      									<th scope="row">名前</th>
      									<td id="name_td"></td>
    								</tr>
    								<tr>
      									<th scope="row">メール</th>
      									<td id="email_td"></td>
    								</tr>
    								<tr>
      									<th scope="row">電話番号</th>
      									<td id="phone_td"></td>
    								</tr>
  								</tbody>
							</table>
						</div>
       
  						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">戻る</button>
							<button onclick="return validateForm();" class="btn btn-outline-primary saveConfirm"> 登録</button>
						</div>
						</div>
    				</div>
      			</div>
        	</div>
        	
        	<div>
        		<button type="button" class="btn btn-outline-primary delete" style="position: relative; left: 310px; top:-38px; border-radius: 8px">削除</button>
				<!-- Delete modal -->
        		<div class="modal" id="confirm">
					<div class="modal-dialog">
						<div class="modal-content">

              				<!-- Modal Header -->
              				<div class="modal-header">
        						<h4>Are you sure want to delete this Employee permanently?</h4>
      						</div>

      						<!-- Modal body -->
     						<div class="modal-body" >
          						<table class="table table-bordered">
  									<tbody>
    									<tr>
      										<th scope="row">Full name</th>
      										<td id="cname_td"></td>
    									</tr>
    									<tr>
      										<th scope="row">Email</th>
      										<td id="cemail_td"></td>
    									</tr>
    									<tr>
      										<th scope="row">Phone number</th>
      										<td id="cphone_td"></td>
    									</tr>	
  									</tbody>
								</table>
							</div>
       
  							<!-- Modal footer -->
							<div class="modal-footer">
								<a class="btn btn-outline-primary deleteConfirm" type="button" style="position: relative; border-radius: 8px" >OK</a>
								<button type="button"　 class="btn btn-outline-primary" style="border-radius: 8px" data-dismiss="modal">Back</button>
							</div>
						</div>
    				</div>
      			</div>
        	</div>
        	<!-- Notification modal -->
			<div class="modal" id="notifiDel">
				<div class="modal-dialog">
					<div class="modal-content">

      				<!-- Modal body -->
     					<div class="modal-body" >
							<label>Successful delete </label>
						</div>
       
  						<!-- Modal footer -->
						<div class="modal-footer">
							<a href="${deleteLink}${employee.id}" class="btn btn-outline-primary" type="button" style="position: relative; border-radius: 8px" >OK</a>
						</div>
						</div>
    				</div>
      			</div>		
		</s:form>
		<div >
			<button id="closeButton" class="btn btn-outline-primary" onclick="window.location.href = '/springmybatis/employee/login'"
			style="position: relative; left: 400px; top: -76px; border-radius: 8px">戻る</button>
		</div>
	</div>
	
	<script
		src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
<script src="javascript/myscripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>