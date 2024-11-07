<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../user/top.jsp"></jsp:include>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link rel = "stylesheet" href = "${pageContext.request.contextPath}/css/BusinessMypage.css" type = "text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css" type="text/css">
	<script src="${pageContext.request.contextPath}/js/businessJS/BusinessMypage.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
	<div class = "container0">
	
		<div class = "container0-1">
			<p class = "cP0-1"><a class = "cA0" > �츮���� </a></p>
			<div class="sub-tabs">
				<p class = "cP0-t"><a class = "cA0" onclick="toggleTab('stats-tab', this)"> ��Ī���� </a></p>
					<div id = "stats-tab" class = "tab-content" style = "display:none;">
						<p><a class = "cA0" onclick="loadBusinessStatistics()"> ��� </a></p>
						<p><a class = "cA0" onclick="loadBusinessSales()"> ���� </a></p>
						<p><a class = "cA0" onclick="loadBusinessMyposts()"> ��Ī �� ��ȸ </a></p>
					</div>
			</div>
			<p class = "cP0"><a class = "cA0" onclick="loadBusinessCustomer()"> ������ </a></p>
		</div>
		
		<div class = "container" id = "content-container">
			<p class = "cP1"> �������� </p>
			<table class = "table">
				<tr>
					<th> ����� </th> <td> ${businessUser.business_name} </td>
				</tr>
				<tr>
					<th> ����� ��ȣ </th> <td> ${businessUser.business_number} </td>
				</tr>
				<tr>
					<th> ��ġ </th> <td> ${businessUser.address} </td>
				</tr>
				<tr>
					<th> ��ǥ ��ȣ </th> <td> ${businessUser.req} </td>
				</tr>
				<tr>
					<th> ��� �̸��� </th> <td> ${businessUser.email} </td>
				</tr>
				<tr>
					<th> �ּ� </th> <td> (${businessUser.post})  ${businessUser.address} </td>
				</tr>
				<tr>
					<th> �������� </th> <td> ${businessUser.description} </td>
				</tr>
				<tr>
					<th> ���� </th> <td> ${businessUser.business_file} </td>
				</tr>
				<tr>
					<th> ������ </th> <td> ${businessUser.register_date.substring(0,4)}�� ${businessUser.register_date.substring(5,7)}�� ${businessUser.register_date.substring(8,10)}�� </td>
				</tr>
			</table>
			<div class = "container2">
				<input type = "button" class = "updateBtn" value = "���� ���� ����">
			</div>
		</div>
	</div>
</body>
</html>