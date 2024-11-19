<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/UserInfo.css" type="text/css">
</head>
<body>
	<p class = "cP1"> �� ���� </p>
		<input type = "hidden" id = "idx" name =  "idx" value = "${idx}">
		<div class = "infoD">
			<div class = "infoD1">
				<c:if test = "${empty user.userfile}">
					<img src="${pageContext.request.contextPath}/img/info.png" class="infoI">
				</c:if>
				<c:if test="${not empty user.userfile}">
					<img src="${pageContext.request.contextPath}/userupload/${user.userfile}" class="infoIs">
                </c:if>
			</div>
			<div class = "infoD2">
				<table class = "table">
					<tr>
						<th> �̸� </th> <td> ${user.name} </td>
					</tr>
					<tr>
						<th> ���̵� </th> <td> ${user.id} </td>
					</tr>
					<tr>
						<th> �ֹε�Ϲ�ȣ </th> <td> ${user.RRN}
						<c:choose>
				            <c:when test="${user.gender == 2 or user.gender == 4}">
				                (��)
				            </c:when>
				            <c:when test="${user.gender == 1 or user.gender == 3}">
				                (��)
				            </c:when>
				        </c:choose>
						</td>
					</tr>
					<tr>
						<th> �̸��� </th> <td> ${user.email} </td>
					</tr>
					<tr>
						<th> ��ȭ��ȣ </th> <td> ${user.tel} </td>
					</tr>
				</table>
			</div>
			</div>
		<div class = "container2">
			<input type = "button" class = "updateBtn" value = "�� ���� ����">
		</div>
</body>
</html>