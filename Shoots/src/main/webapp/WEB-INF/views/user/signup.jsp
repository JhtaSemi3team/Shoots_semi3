<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
		}
	
		$(function() {
			init();
			
			$('#send-email').click(function() {
				$('#verify-block').css('display', 'block');
				
				 $.post("${pageContext.request.contextPath}/user/signupProcess", {receiver: $('#receiver').val()},
					function(response) {
			            alert("�̸����� ���۵Ǿ����� ��.");
			            console.log(response);
			        }, "json").fail(function(response) {
			            alert("�̸��� ���ۿ� �����߽��ϴ�.");
			            console.log(response);
			            console.log(response.message);
			        }); //$.post
				 
			});
			$('#check-email-verify').click(function() {
				
				$.ajax({
					url : "${pageContext.request.contextPath}/user/signupProcess",
					type : "POST",
					data : { key : $('#email-verify-text').val().trim() 
							},
					success : function(response){
						$('#verify-toggle-text').show().text("��ġ�մϴ�!").css('color', 'green');
						${session.removeAttribute()}
					},
					error : function() {
						$('#verify-toggle-text').show().text("����ġ�մϴ�.").css('color', 'red');
					},
					dataType : "json"
				}); //$.ajax
				 
			});
		});
	</script>
</head>
<body class="container">
	<jsp:include page="top.jsp"></jsp:include>
	<%-- action="/JSP/mailSend" --%>
	<form class="form-horizontal" method="post" action="#" onsubmit="return false;">
		<h2 style="text-align: center;">ȸ������(sign up)</h2>
		
		<font color='red'>*</font>ǥ�ô� �ʼ� �Է� �����Դϴ�.<hr>
		
		���̵�(id)<font color='red'>*</font>
		<input type="text" name="id" id="id" class="form-control" placeholder="id..." >
		
		��й�ȣ(password)<font color='red'>*</font>
		<input type="text" name="pwd" id="pwd" class="form-control" placeholder="pwd..." >
		
		����(name)<font color='red'>*</font>
		<input type="text" name="name" id="name" class="form-control" placeholder="name..." >
		
		�ֹε�Ϲ�ȣ(RRN)<font color='red'>*</font>
        <div class="row mb-3">
            <div class="col">
                <input type="text" name="RRN1" class="form-control" placeholder="������� (YYMMDD)" maxlength="6">
            </div>
            <div class="col-auto">
                <span>-</span>
            </div>
            <div class="col">
                <input type="text" name="RRN2" class="form-control" placeholder="������ȣ (7�ڸ�)" maxlength="7">
            </div>
        </div>
		
		����(gender)<font color='red'>*</font>
		<input type="text" name="gender" id="gender" class="form-control" placeholder="gender..." >
		
		��ȭ��ȣ(tel)<font color='red'>*</font>
		<input type="text" name="tel" id="tel" class="form-control" placeholder="tel..." >

		�̸���(Email)<font color='red'>*</font>
		<input type="email" name="receiver" id="receiver" class="form-control" placeholder="�޴� �ּ�" value = "<%="kdhmm0325"%>@naver.com" required>
		<input type="button" class="btn btn-primary" id="send-email" value="Ȯ�θ��� ����(send verifycode)">
		
		<div id="verify-block" class="p-3"  style="background-color: #d4edda;">
			Enter Verification code<font color='red'>*</font>
			<input type="text" class="form-control" id="email-verify-text">
			<input type="button" class="btn btn-primary" id="check-email-verify" value="check">
			<b id="verify-toggle-text"></b>
		</div><br><br>
		���� �����Դϴ�.<hr>
		�г���(nickname)
		<input type="text" name="nickname" id="name" class="form-control" placeholder="name..." >
		
		������ ����(profile image)<br>
		<label style="display: flex; flex-direction: column; position: relative; width:200px; height: 200px; border: 1px solid black; text-align: center" class="d-flex justify-content-center align-items-center">
			<span>
				���� ÷��
				<input type="file" id="upfile" name="board_file" style="display: none;">
				<img src="${pageContext.request.contextPath}/img/attach.png" style="width: 20px; height: 20px;"><br>
				file upload
				<img src="${pageContext.request.contextPath}/img/attach.png" id="preview" style="width: 100px; height: 100px;"><br>
			</span>
		</label>
	</form>
</body>
</html>