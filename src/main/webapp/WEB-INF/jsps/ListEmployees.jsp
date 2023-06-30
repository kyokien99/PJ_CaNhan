<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<title>List employee</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<body>

	<div class="container">
		<p align="right">
			<button
				onclick="window.location.href = '/springmybatis/employee/logout'" class="btn btn-outline-primary" style="font-weight:1000; margin-top: 50px; margin-right: 100px; border-radius: 8px;"
				>ログアウト</button>
		</p>
		<p align="left">
			<label style="font-weight:1000;">新規会員追加</label>
			<button
				onclick="window.location.href = '/springmybatis/employee/displayAddForm'" class="btn btn-outline-primary" style="margin-left: 50px; font-weight:1000; border-radius: 8px;"
				>追加</button>
		</p>
		<label style="font-weight:1000;">名前で会員を検索します。</label>
 	 	<form action="<c:url value="/employee/listOfEmployee/search"/>">
       		<input type="text" name="txt" value="${param.txt}" style="width:300px; ">
       		<button class="btn btn-outline-primary" style="font-weight:1000; border-radius: 8px;" >検索</button>
    	</form>


		<div>
		<table class="table table-striped table-bordered" style="margin-top: 20px; text-align: center">
			<thead>
				<tr>
					<th>ID</th>
					<th>名前</th>
					<th>メール</th>
					<th>電話番号</th>
					
				</tr>
			</thead>
			<c:forEach items="${employeeList}" var="e">
				<c:url var="updateLink" value="/employee/displayUpdateForm.html">
					<c:param name="employeeId" value="${e.id}" />
				</c:url>

				<c:url var="deleteLink" value="/employee/displayDeleteForm.html">
					<c:param name="employeeId" value="${e.id}" />
				</c:url>
				<tbody>
					<tr>

						<td><a href="${updateLink}">${e.id}</a></td>
						<td>${e.fullname}</td>
						<td>${e.email}</td>
						<td>${e.phone}</td>

						
					</tr>
					
				</tbody>
			</c:forEach>
			
		</table>
		</div>
		
		<div>
			
			<c:if test="${currentPage > 1}">
				<a href= "listOfEmployee?page=${currentPage - 1}">&laquo;</a>
			</c:if>
			
			<c:forEach begin="1" end="${totalPages}" var="i">
				<a href= "listOfEmployee?page=${i}">${i}</a>
			</c:forEach>
			 

			
			<c:if test="${currentPage < totalPages}">
    			<a href= "listOfEmployee?page=${currentPage + 1}">&raquo;</a>
			</c:if>
			
		</div>

	</div>

</body>
</html>