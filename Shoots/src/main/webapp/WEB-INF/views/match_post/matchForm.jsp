<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	<div> 
		<form action = "add" method = "post" name = "matchForm">
			<h1> MATCH UPLOAD </h1>
			<input type = "hidden" id = "writer" name = "writer" value = "5">
			<div> ��¥ </div>
			<input type = "date" id = "match_date" name = "match_date" required>
			<div> �ð� </div>
			<input type = "time" id = "match_time" name = "match_time"required>
			<div> �ּ� �ο� </div>
			<input type = "number" id = "player_min" name = "player_min"required>
			<div> �ִ� �ο� </div>
			<input type = "number" id = "player_max" name = "player_max"required>
			<div> ���� </div>
			<input type = "number" id = "price" name = "price">
			<div> �÷��̾� ���� </div>
			<input type = "radio" id = "player_gender" name = "player_gender" value = "a" checked> ��� ����
			<input type = "radio" id = "player_gender" name = "player_gender" value = "m"> ����
			<input type = "radio" id = "player_gender" name = "player_gender" value = "f"> ����
			<div>
				<input type = "submit" value = "UPLOAD" class = "btn btn-danger">
				<input type = "reset" value = "RESET">
				<input type = "button" value = "BACK">
			</div>
		</form>
	</div>
</body>
</html>