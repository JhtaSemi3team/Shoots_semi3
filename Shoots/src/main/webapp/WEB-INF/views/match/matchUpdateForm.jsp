<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../user/top.jsp"></jsp:include>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<script src = "https://code.jquery.com/jquery-3.7.1.js"></script>
	<link rel = "stylesheet" href = "${pageContext.request.contextPath}/css/matchUpdateForm.css" type = "text/css">
</head>
<body>
	<div> 
		<form action = "updateProcess" method = "post" id = "matchUpdateForm">
			<div class = "container">
				<h1> MATCH UPLOAD </h1>
				<input type = "hidden" id = "match_id" name = "match_id" value = "${match.match_id}">
				<div class = "d1">
					<div class = "d2"> 
						<span> ��¥ </span> <input type = "date" id = "match_date" name = "match_date" value = "${match.match_date.substring(0,10)}" required>
					</div>
					<div>
						<span> �ð� </span> 
						<select name="match_time" id="match_time" required>
                        </select>
					</div>
				</div>
				<hr>
				<div class = "d1">
					<div class = "d2">
						<span> �ο� </span> 
						<input type = "number" id = "player_min" class = "playerMm" name = "player_min" value = "${match.player_min}" placeholder = "�ּ�" min = "4" max = "20" required>
						<input type = "number" id = "player_max" class = "playerMm" name = "player_max" value = "${match.player_max}" placeholder = "�ִ�" min = "6" max = "20" required>
					</div>
					<div>
						<span> ���� </span> <input type = "number" id = "price" name = "price" value = "${match.price}" min = "1000" max = "100000" required>
					</div>
				</div>
				<hr>
				<div>
					<div class = "pD"> <span class = "pS"> �÷��̾� ���� </span>
						<label>
							<input type = "radio" id = "player_gender" class = "player_gender" name = "player_gender" value = "a" required> ��缺��
						</label>
						<label>
							<input type = "radio" id = "player_gender" class = "player_gender" name = "player_gender" value = "m"> ����
						</label>
						<label>
							<input type = "radio" id = "player_gender" class = "player_gender" name = "player_gender" value = "f"> ����
						</label>
					</div>
				</div>
				<hr>
				<div class = "d1">
					<span class = "Ds"> ���� ���� </span>
					<div class = "Dd2">
						
					</div>
				</div>
				<div>
					<input type = "submit" class = "uploadbBtn" value = "UPDATE" class = "btn btn-danger">
					<input type = "reset" value = "RESET" class = "resetBtn">
					<input type = "button" class = "backBtn" value = "BACK">
				</div>
			</div>
		</form>
	</div>
	<script>
		
		function populateTimeOptions() {
			var select = document.getElementById('match_time');
			for (var hour = 9; hour < 24; hour++) {
				for (var minute of [0, 30]) {
					var hourFormatted = hour.toString().padStart(2, '0');
					var minuteFormatted = minute.toString().padStart(2, '0');
					var time = hourFormatted + ":" + minuteFormatted;
	
					var option = document.createElement('option');
					option.value = time;
					option.textContent = time;
	
					select.appendChild(option);
	             }
	         }
	     }
	
		window.onload = function() {
			populateTimeOptions();

			var matchTime = "${match.match_time}";
			var select = document.getElementById('match_time');
			for (var option of select.options) {
				if (option.value === matchTime) {
					option.selected = true;
					break;
				}
			}
		};
		
		$("input[name='player_gender'][value='${match.player_gender}']").prop('checked', true);
				
		$('.backBtn').click(function(){
			location.href = location.href = "../matchs/detail?match_id=${match.match_id}";
		});
			
		$(function(){
		    $('#matchUpdateForm').submit(function(event){
		        event.preventDefault();

		        if (confirm("��Ī���� �����Ͻðڽ��ϱ�?")) {
		            location.href = "update?match_id=${match.match_id}",
		            this.submit();
		        }
		    });
		});

	</script>
</body>
</html>