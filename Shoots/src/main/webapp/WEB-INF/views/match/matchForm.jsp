<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../user/top.jsp"></jsp:include>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<script src = "https://code.jquery.com/jquery-3.7.1.js"></script>
	<link rel = "stylesheet" href = "${pageContext.request.contextPath}/css/matchForm.css" type = "text/css">
</head>
<body>
	<div>
		<form action = "add" method = "post" name = "matchForm">
			<div class = "container"> 
				<h3 class = "mu"> MATCH UPLOAD </h3>
				<input type = "hidden" id = "writer" name = "writer" value = "${idx}">
				<div class = "d1">
					<div class = "d2"> 
						<span> ��¥ </span> <input type = "date" id = "match_date" name = "match_date" required>
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
						<input type = "number" class = "playerMm" id = "player_min" name = "player_min" placeholder = "�ּ�" min = "4" max = "20" required>
						<input type = "number" class = "playerMm" id = "player_max" name = "player_max" placeholder = "�ִ�" min = "6" max = "20" required>
					</div>
					<div>
						<span> ���� </span> <input type = "number" id = "price" name = "price" min = "1000" max="50000" step="1000">
					</div>
				</div>
				<hr>
				<div>
					<div class = "pD"> <span class = "pS"> �÷��̾� ���� </span>
						<label>
							<input type = "radio" id = "player_gender" class = "player_gender" name = "player_gender" value = "a" checked required> ��缺��
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
						<pre><textarea class = "descriptionT" name = "description" id = "description"> ${user.description} </textarea></pre>
					</div>
				</div>
				<div>
					<input type = "submit" value = "UPLOAD" class = "btn btn-danger uploadbBtn">
					<input type = "reset" value = "RESET" class = "resetBtn">
					<input type = "button" value = "BACK" class = "backBtn">
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
	
		window.onload = populateTimeOptions;		 
		
		document.matchForm.onsubmit = function(event) {
		       var playerMin = parseInt(document.getElementById('player_min').value);
		       var playerMax = parseInt(document.getElementById('player_max').value);
	           var price = parseInt(document.getElementById('price').value);

		       if (playerMin > playerMax) {
		           alert('�ּ� �ο��� �ִ� �ο����� Ŭ �� �����ϴ�.');
		           event.preventDefault();
		           return;
		       }
		       
		       if (price % 1000 !== 0) {
	                alert('������ 1000�� ������ �Է��ؾ� �մϴ�.');
	                event.preventDefault();
	                return;
	            }
		       
		       if (price > 50000) {
	                alert('������ 50,000�� ���Ϸ� �����ؾ� �մϴ�.');
	                event.preventDefault();
	                return;
	            }
		   };
		    
		$('.backBtn').click(function(){
			location.href  = "../matchs/list";
		});
		
	</script>
</body>
</html>