<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html> 
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/UserMatchs.css" type="text/css">
</head>
<body>
	<p class = "cP1"> ��Ī �� ��ȸ </p>
	<c:if test = "${empty list}">
		<div class = "nm">
			<p> ������ ��Ī�� �������� �ʽ��ϴ� </p>
		</div>
	</c:if>
	<c:if test = "${!empty list}">
		<table class = "table">
	 		<thead>
				<tr>
					<th> ��¥ </th>
					<th> �ð� </th>
					<th> ��� </th>
					<th> �ο� </th>
					<th> ��Ȳ </th>
					<th> �÷��̾� ���� </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "match" items= "${list}">
				<tr>
					<td> ${match.match_date.substring(0, 10)} </td>
					<td> ${match.match_time} </td>
					<td> ${match.writer} </td>
					<td> ${match.playerCount} / ${match.player_max} </td>
					<td>
						<c:choose>
							<c:when test="${isMatchPast && match.playerCount >= match.player_min}">
					            <input type="button" class="status5" value="��ĪȮ��">
					        </c:when>
							 <c:when test="${isMatchPast}">
						        <input type="button" class="status4" value="����">
						    </c:when>
						    <c:when test="${match.playerCount == match.player_max}">
				                <input type="button" class="status2" value="����">
				            </c:when>
						    <c:when test="${match.playerCount >= match.player_min && match.playerCount < match.player_max}">
					        	<input type="button" class="status3" data-match-id="${match.match_id}" value="�����ӹ�">
					        </c:when>
							<c:when test="${match.playerCount >= 0 && match.playerCount <= player_min}">
				                <input type="button" class="status" data-match-id="${match.match_id}" value="��û����">
				            </c:when>
				 			<c:otherwise>
				 				<input type = "button" class = "status" data-match-id="${match.match_id}" value = "��û����">
				 			</c:otherwise>
						</c:choose> 
					</td>
					<td> <input type = "button" value = "����"> </td>
				</tr>
				</c:forEach>
			</tbody>
		</table> 
	</c:if>
</body>
</html>