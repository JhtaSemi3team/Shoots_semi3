<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="${pageContext.request.contextPath }/js/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<title>�Ű�â</title>

<style>
.modal-content {
    width: 700px;
    height: 400px;
}

.modal-content {
    border-radius: 40px;
    border: 3px solid #1FAF82;
}

</style>
</head>
<body>
<button class ="push" data-toggle="modal" data-target=".report-modal">���� ������ ��� â�� ��</button>

	<!-- ���â ����-->		
<div class="modal report-modal fade" style="display:none">
	<fieldset style="border-radius: 100px">
	 <div class="modal-dialog" role="document">
        <div class="modal-content"> <!-- ��� �������� ���Խ�ų �κ� -->
        	<h1 style="text-align:center;">�Խñ� �Ű�</h1>
        	<!-- �÷��̾�1 ���� -->
			<div class="player" id="p1">
			<span>
			<img src="${pageContext.request.contextPath}/img/reportHuman.png" width="80px"/>
			<label><input type="radio" class="personchoice">
			<h4>1�� �÷��̾�</h4> </label>
			</span>
			
			<select>
				<option disabled selected hidden>�Ű� ������ ������ �ּ���</option>
				<option>�弳, ��� ���� ����� ��������</option>
				<option>������ �÷���</option>
				<option>��ӽð� ���ؼ�</option>
				<option>�����Ľ�Įű ��Ŭ</option>
			</select>
			<input type="text" maxlength="100">
			</div> <!-- �÷��̾�1 �� -->
			
			
			<button class="btn btn-danger" style="width:60px;  font-size:10px">�Ű��ϱ�</button>
		</div> <!-- modal-content -->
	</div> <!-- modal-dialog -->
	</fieldset>
</div> <!-- ���â �� -->



<!--  ���â�� �÷��̾� ����� ���̺� ���·� ����� ���� �׽�Ʈ �κ�. ���� ���� ���â�� ��ħ -->
<table class="table table-striped">
	<caption>�Ű��� �÷��̾� ���</caption>
	<thead>
	
	</thead>

</table>



</body>
</html>