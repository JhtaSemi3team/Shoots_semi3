<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p class = "cP1"> �������� </p>
	<input type = "hidden" id = "idx" name =  "idx" value = "${idx}">
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
			<th> ��ǥ ��ȣ </th> <td> ${businessUser.tel} </td>
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
</body>
</html>