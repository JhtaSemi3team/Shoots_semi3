<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
	<style>
		input[type="text"], input[type="email"], input[type="password"]{width: 300px; border-radius: 30px; padding: 5px; padding-left: 10px; padding-right: 10px; margin-bottom: 10px; border: 1px solid #059669;}
		input{display: block; align-items: center;}
		form{border: 1px solid #059669; padding: 60px; border-radius: 30px; text-align: center; align-items: center; justify-content: center; justify-items:center;	}
		.row>.col{padding: 0px 6px;}
		.regularBtn {font-size :  12px; border-radius : 20px; border : 1px solid orange; width : 80px; height : 25px; color : orange ; background : white; margin-left : 10px; transition: background 0.3s, color 0.3s}
		.businessBtn {font-size :  12px; border-radius : 20px; border : 1px solid orange; width : 80px; height : 25px; color : orange ; background : white; margin-left : 10px; transition: background 0.3s, color 0.3s}
	</style>
	<script>
		function init() {
			$('#verify-block').css('display', 'none');
			 $("#verify-toggle-text").hide();
			 $('input[type=file]').hide();
			 $('#preview').attr('src', '${pageContext.request.contextPath}/img/profile.png');
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
			});//$('#signupform').submit  */
			
			$('input[type=file]').change(function(event){
			 	const file = event.target.files[0]; //ù��° ����
				const maxSizeInBytes = 5 * 1024 * 1024;
			 	
				if(file.size > maxSizeInBytes){
					alert("5MB ���� ũ��� ���ε� �ϼ���");
					$(this).val('');
					return;
				}
				
				const pattern = /(gif|jpg|jpeg|png)$/i; //i(ignore case) = ��ҹ��� ����.
				
				if(pattern.test(file.name)){
					$('#preview').show();
					$('#preview').attr('src', URL.createObjectURL(event.target.files[0]));
					$('#filename').text('���Ϻ���');
				}
				
				else{
					alert('image file(gif,jpg,jpeg,png) ���ϸ� �÷��ּ���.');
					$('#showImage > img').attr('src', '../image/profile.png');
					$(this).val('');
					$('input[name=check]').val('');
					return;
				}
				
			});//file change event
			
			$('#fileReset').click(function(e) {
				e.preventDefault();
				$('input[type=file]').val('');
				$('#preview').val('');
				$('#filename').text('����÷��');
				$('#preview').attr('src', '${pageContext.request.contextPath}/img/profile.png');
			});
			
		});//ready 
	</script>
</head>

<body>
	<jsp:include page="top.jsp"></jsp:include>
	<div class="container">
		<jsp:include page="RegularFormArea.jsp"></jsp:include>
	</div>
</body>
</html>