<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="${pageContext.request.contextPath }/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath }/js/report.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/report.css">


<title>�Ű�â</title>
</head>
<body>
<button class ="push" data-toggle="modal" data-target=".report-modal">���� ������ ��� â�� ��</button>

	<!-- ���â ����-->		
<div class="modal report-modal fade" style="display:none">
	 <div class="modal-dialog" role="document">
        <div class="modal-content"> <!-- ��� �������� ���Խ�ų �κ� -->
        	<h1 style="text-align:center;">��� �Ű�</h1>
        	<br>
        	
        	<p>
        	<span>��</span>�Ű����</p>
        	
        	<!-- �Ű���� ���� = report: title �κ� -->
        	<div id="title"> <!-- select�� �߾����� ������ �ȵż� �θ��ҷ� div ��� -->
			<select>
				<option disabled selected hidden>�Ű� ������ ������ �ּ���</option>
				<option value="�弳, ���� ǥ�� ���� ���Ե� ���">�弳, ���� ǥ�� ���� ���Ե� ���</option>
				<option value="���� ������">���� ������</option>
				<option value="�Խñ۰� ���� ���� ����">�Խñ۰� ���� ���� ����</option>
				<option value="���� ���� ���">���� ���� ���</option>
				<option value="���� �������� ���Ե� ���">���� �������� ���Ե� ���</option>
			</select>
			</div>
			
			<br>
			<div id="content"> <!-- textarea�� �Ӽ����� �߾ӿ� ��ġ��ų �� ��� �θ��ҷ� �� div -->
				<textarea placeholder ="&nbsp;&nbsp;������ �ۼ��� �ּ���." maxlength="300"></textarea>
			</div>
			
			<%--
			<br>
			
			<!-- ���� ���� ���� �κ� -->
			<div style="display:flex;  align-items: center; margin-left:150px">
				<input type="checkbox" style="margin-right:10px">
				<p style="text-align:center; margin:0;">�ش� ����� �ۼ��ڸ� <span>����</span>�ұ��?<p>
			</div>
			--%>
			
			<br>
			
			<div id="reportbutton">
				<button class="btn btn-danger">�Ű��ϱ�</button>
			</div>
			
			
		</div> <!-- modal-content -->
	</div> <!-- modal-dialog -->
</div> <!-- ���â �� -->


</body>
</html>