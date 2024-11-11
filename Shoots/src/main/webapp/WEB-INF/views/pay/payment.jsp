<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>
	<script>
		 $(document).ready(function() {
	         var IMP = window.IMP;
	         IMP.init('imp35523152'); 
	
	         var merchant_uid = 'merchant_' + new Date().getTime();
	         
	         IMP.request_pay({
	             pg: 'html5_inicis',
	             pay_method: 'card', 
	             merchant_uid: merchant_uid,
	             name: '${matchId}' + ' �� ��ġ �÷��̾� ��û', 
	             amount: '${price}', 
	             buyer_email: '${userEmail}',  
	             buyer_name: '${userName}',  
	             buyer_tel: '${userTel}' 
	         }, function(rsp) {
	             if (rsp.success) {
	                 var msg = '������ �Ϸ�Ǿ����ϴ�.';
	                 msg += '����ID : ' + rsp.imp_uid;
	                 msg += '���� �ݾ� : ' + rsp.paid_amount;
	                 msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;

	                 $.ajax({
	                	type : "post",
	                	url : "../payments/addPayment",
	                	data : {
	                		matchId : '${matchId}',
	                		buyer : '${idx}',
	                		seller : '${seller}',
	                		paymentMethod : 'card',
	                		amount : rsp.paid_amount,
	                		status : 'SUCCESS',
	                		applyNum : rsp.apply_num,
	                		impUid : rsp.imp_uid,
	                		merchantUid : merchant_uid
	                	},
	                	success : function(response) {
	                		alert("������ �Ϸ�Ǿ����ϴ�.");
	                		location.href = '${pageContext.request.contextPath}/matchs/detail?match_id=' + ${matchId};
	                	},
	                	error : function (xhr, status, error) {
	                		alert("���� ���� ���忡 �����Ͽ����ϴ�.");
	                		location.href = '${pageContext.request.contextPath}/matchs/detail?match_id=' + ${matchId};
	                	}
	                	
	                 });
	                 
	             } else {
	                 var msg = '������ �����Ͽ����ϴ�.';
	                 msg += '�������� : ' + rsp.error_msg;
	                 alert(msg);
	                 location.href = "${pageContext.request.contextPath}/matchs/detail?match_id=" + ${matchId};	                 
	             }
	         });
	     });
	</script>
</body>
</html>