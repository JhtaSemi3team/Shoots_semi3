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
			 $('input[type=file]').hide();
		}
	
		$(function() {
			init();
			
			$('#send-email').click(function() {
				$('#verify-block').css('display', 'block');
				
				 $.post("${pageContext.request.contextPath}/user/signupProcess", {email: $('#email').val()},
					function(response) {
			            alert("�̸����� ���۵Ǿ����ϴ�.");
			            console.log(response);
			        }, "json").fail(function(response) {
			            alert("�̸��� ���ۿ� �����߽��ϴ�.");
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
						$('#verify-toggle-text').show().text("��ġ�մϴ�!").css('color', 'green');
						$('#check-email-verify').prop('disabled', true);
						$('#email-verify-text').prop('readonly', true);
						${session.removeAttribute()}
					},
					error : function() {
						$('#verify-toggle-text').show().text("����ġ �մϴ�.").css('color', 'red');
					},
					dataType : "json"
				}); //$.ajax
				 
			});//$('#check-email-verify').click
			
/* 			$('#signupform').on('submit',function(e) {
				e.preventDefault();
				$.ajax({
					url: $(this).attr('action'),
					method:$(this).attr('method'),
					data:$(this).serialize(),
					success: function(resp) {
						alert('ȸ�����Կ� �����ϼ̽��ϴ�.');
						window.location.href = "${pageContext.request.contextPath}/user/login"; //�̵�
					},
					error: function(error) {
						console.error("���� ����:", error);
						alert('ȸ�����Կ� �����ϼ̽��ϴ�.');
					}
				});//$.ajax
			});//$('#signupform').submit */
			
			$('input[type=file]').change(function(event){
			/* 	const file = event.target.files[0]; //ù��° ����
				const maxSizeInBytes = 5 * 1024 * 1024;
				if(file.size > maxSizeInBytes){
					alert("5MB ���� ũ��� ���ε� �ϼ���");
					$(this).val('');
					return;
				}
				
				const pattern = /(gif|jpg|jpeg|png)$/i; //i(ignore case) = ��ҹ��� ����.
				if(pattern.test(file.name)){
					$('#filename').text(file.name);
					
					//createObjectURL()�� ���� file�� server�� upload���� �ʰ� browser���� �̸����� ����.
					const fileURL = URL.createObjectURL(file);
					$('#showImage > img').attr('src', fileURL);
				}
				
				else{
					alert('image file(gif,jpg,jpeg,png)�� �ƴ� ��� ���õ˴ϴ�.');
					$('#filename').text('');
					$('#showImage > img').attr('src', '../image/profile.png');
					$(this).val('');
					$('input[name=check]').val('');
				} */
				const file = event.target.files[0];
				$('#preview').show();
				$('#preview').attr('src', URL.createObjectURL(event.target.files[0]));
				$('#preview').css({'width' : '150px', 
									'height' : '150px'});
				$('#filename').text('file change...');
				
				
			});//file change event
			
			$('#fileReset').click(function(e) {
				e.preventDefault();
				$('input[type=file]').val('');
				$('#preview').hide();
				$('#preview').attr('src', '');
				$('#preview').val('');
				$('#filename').text('file upload...');
			});
			
			
		});//ready 
	</script>
</head>
<body class="container">
	<jsp:include page="top.jsp"></jsp:include>
	<form class="form-horizontal" method="post" enctype="multipart/form-data" action="updateProcess" id="signupform" >
		<h2 style="text-align: center;">ȸ������(sign up)</h2>
		
		<font color='red'>*</font>ǥ�ô� �ʼ� �Է� �����Դϴ�.<hr>
		
		<!-- name : id, pwd, name, RRN1, RRN2, gender, tel, email, nickname, profile? -->
		���̵�(id)<font color='red'>*</font>
		<input type="text" name="id" id="id" class="form-control" placeholder="id..." value="${userBean.id}" >
		
		��й�ȣ(password)<font color='red'>*</font>
		<input type="text" name="pwd" id="pwd" class="form-control" placeholder="pwd..."  value="${userBean.password}">
		
		����(name)<font color='red'>*</font>
		<input type="text" name="name" id="name" class="form-control" placeholder="name..." value="${userBean.name}">
		
		�ֹε�Ϲ�ȣ(RRN)<font color='red'>*</font>
        <div class="row mb-3">
            <div class="col">
                <input type="text" name="RRN" class="form-control" placeholder="���ڸ�(frontpart)" maxlength="6" value="${userBean.RRN}">
            </div>
            <div class="col-auto">
                <span>-</span>
            </div>
            <div class="col d-flex align-items-center">
                <input type="text" name="gender"  class="form-control" placeholder="" maxlength="1" style="width: 40px;" value="${userBean.gender}">
                	******
            </div>
        </div>
		
		��ȭ��ȣ(tel)<font color='red'>*</font>
		<input type="text" name="tel" id="tel" class="form-control" placeholder="tel..." value="${userBean.tel}">

		�̸���(Email)<font color='red'>*</font>
		<input type="email" name="email" id="email" class="form-control" placeholder="�޴� �ּ�" value="${userBean.email}" required >
		<input type="button" class="btn btn-primary" id="send-email" value="Ȯ�θ��� ����(send verifycode)">
		
		<div id="verify-block" class="p-3"  style="background-color: #d4edda;">
			Enter Verification code<font color='red'>*</font>
			<input type="text" class="form-control" id="email-verify-text">
			<input type="button" class="btn btn-primary" id="check-email-verify" value="check">
			<b id="verify-toggle-text"></b>
		</div><br><br>
		<hr>���� �����Դϴ�.<hr>
		�г���(nickname)
		<input type="text" name="nickname" id="name" class="form-control" placeholder="name..."  value="${userBean.nickname}">
		
		������ ����(profile image)<br>
		<label style="display: flex; flex-direction: column; position: relative; width:200px; height: 200px; border: 1px solid black; text-align: center" class="d-flex justify-content-center align-items-center">
			<img src="" id="preview">
			<span id="filename" class="btn btn-primary">file upload...</span>
			<span id="fileReset" class="btn btn-danger">file reset...</span>
			<input type="file" name="userFile">	
		</label>
		
		<input type="submit" class="submit btn btn-primary">
	</form>
</body>
</html>