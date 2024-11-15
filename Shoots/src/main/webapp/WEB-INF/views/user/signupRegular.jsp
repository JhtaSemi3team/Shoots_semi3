<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
	<script>
		function init() {
 			$('#verify-block').css('display', 'none');
			$("#verify-toggle-text").hide();
			$("#preview").hide(); 
			$('button#btnRegular').addClass('btn-success');
		}
		
		function btnBusinessClick() {
			location.href = '${pageContext.request.contextPath}/user/signupBusiness';
		}
	
		$(function() {
			init();
			
			$('#send-email').click(function() {
				$('#verify-block').css('display', 'block');
				
				 $.post("${pageContext.request.contextPath}/user/signupProcess", {email: $('#email').val()},
					function(response) {
			            alert("이메일이 전송되었습니다.");
			            console.log(response);
			        }, "json").fail(function(response) {
			            alert("이메일 전송에 실패했습니다.");
			            console.log(response);
			            console.log(response.message);
			        }); //$.post
				 
			});//$('#send-email').click
			
			$('#check-email-verify').click(function() {
				$.ajax({
					url : "${pageContext.request.contextPath}/user/signupProcess",
					type : "POST",
					data : { key : $('#email-verify-text').val().trim() 
							},
					success : function(response){
						$('#verify-toggle-text').show().text("일치합니다!").css('color', 'green');
						$('#check-email-verify').prop('disabled', true);
						$('#email-verify-text').prop('readonly', true);
						${session.removeAttribute()}
					},
					error : function() {
						$('#verify-toggle-text').show().text("불일치 합니다.").css('color', 'red');
					},
					dataType : "json"
				}); //$.ajax
				 
			});//$('#check-email-verify').click
			
			$('#signupform').on('submit',function(e) {
				e.preventDefault();
				
				const data = $(this).serialize();
				let state;
				if ($('#btnGroupRB').find('.btn-success').first().attr('id') != null)
					state = $('#btnGroupRB').find('.btn-success').first().attr('id') == 'btnRegular' ? {'state' : 'regular'} : {'state' : 'business'};
				
				alert(`\${data + "&" + $.param(state)}`);
				$.ajax({
					url: $(this).attr('action'),
					method:$(this).attr('method'),
					data:`\${data + "&" + $.param(state)}`,
					success: function(resp) {
						alert('회원가입에 성공하셨습니다.');
						window.location.href = "${pageContext.request.contextPath}/user/login";
					},
					error: function(error) {
						console.error("서버 오류:", error);
						alert('회원가입에 실패하셨습니다.');
					}
				});//$.ajax
			});//$('#signupform').submit
			
		});//ready 
	</script>
</head>
<body class="container">
	<jsp:include page="top.jsp"></jsp:include>
    <jsp:include page="topUserSwitching.jsp"></jsp:include>
	<div id="switchingContext">
		<div id="regularContext">
			<form class="form-horizontal" method="post" action="signupProcess" id="signupform">
				<h2 style="text-align: center; color:green;">개인 회원가입(sign up)</h2>

				<font color='red'>*</font>표시는 필수 입력 사항입니다.
				<hr>

				<!-- name : id, pwd, name, RRN1, RRN2, gender, tel, email, nickname, profile? -->
				아이디(id)<font color='red'>*</font> <input type="text" name="id"
					id="id" class="form-control" placeholder="id...">

				비밀번호(password)<font color='red'>*</font> <input type="text"
					name="pwd" id="pwd" class="form-control" placeholder="pwd...">

				성함(name)<font color='red'>*</font> <input type="text" name="name"
					id="name" class="form-control" placeholder="name...">

				주민등록번호(RRN)<font color='red'>*</font>
				<div class="row mb-3">
					<div class="col">
						<input type="text" name="RRN" class="form-control"
							placeholder="앞자리(frontpart)" maxlength="6">
					</div>
					<div class="col-auto">
						<span>-</span>
					</div>
					<div class="col d-flex align-items-center">
						<input type="text" name="gender" class="form-control"
							placeholder="" maxlength="1" style="width: 40px;"> ******
					</div>
				</div>

				전화번호(tel)<font color='red'>*</font> <input type="text" name="tel"
					id="tel" class="form-control" placeholder="tel...">

				이메일(Email)<font color='red'>*</font> <input type="email"
					name="email" id="email" class="form-control" placeholder="받는 주소"
					value="<%="kdhmm0325"%>@naver.com" required> <input
					type="button" class="btn btn-primary" id="send-email"
					value="확인메일 전송(send verifycode)">

				<div id="verify-block" class="p-3"
					style="background-color: #d4edda;">
					Enter Verification code<font color='red'>*</font> <input
						type="text" class="form-control" id="email-verify-text"> <input
						type="button" class="btn btn-primary" id="check-email-verify"
						value="check"> <b id="verify-toggle-text"></b>
				</div>
				<br>
				<br>
				<hr>
					선택 사항입니다.
				<hr>
					닉네임(nickname) <input type="text" name="nickname" id="name"
					class="form-control" placeholder="name..."> <input
					type="submit" class="submit btn btn-primary">
			</form>

		</div><!--  	<div id="regularContext">   -->
	</div>
</body>
</html>
