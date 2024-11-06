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
	
	         IMP.request_pay({
	             pg: 'html5_inicis',
	             pay_method: 'card', 
	             merchant_uid: 'merchant_' + new Date().getTime(),
	             name: ${matchId} + ' �� ��ġ �÷��̾� ��û', 
	             amount: ${price}, 
	             buyer_email: 'example@gmail.com',  
	             buyer_name: '������ �̸�',  
	             buyer_tel: '����ó', 
	             buyer_addr: '�ּ�',  
	             buyer_postcode: '�����ȣ'  
	         }, function(rsp) {
	             if (rsp.success) {
	                 var msg = '������ �Ϸ�Ǿ����ϴ�.';
	                 msg += '����ID : ' + rsp.imp_uid;
	                 msg += '���� �ݾ� : ' + rsp.paid_amount;
	                 msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
	
	                 pay_info(rsp);
	             } else {
	                 var msg = '������ �����Ͽ����ϴ�.';
	                 msg += '�������� : ' + rsp.error_msg;
	                 location.href = "../matchs/detail?match_id=" + ${matchId};
	                 
	                 alert(msg);
	             }
	         });
	     });
	</script>
</body>
</html>