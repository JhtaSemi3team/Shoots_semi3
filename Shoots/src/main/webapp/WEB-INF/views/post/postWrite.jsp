<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/js/writeform.js"></script>
 <style>
  h1{font-size:1.5em; text-align:center; color:#1a92b9}
  .container{width:60%}
  label{font-weight:bold}
 </style>
<meta charset="EUC-KR">
<title>�Խ��� �۾���</title>
</head>
<body>
<div class="container">
  <form action="add" method="post" enctype="multipart/form-data"
  		name="postform">
  	<h1>�Խ��� �۾���</h1>
  	
  	
  	
  	<div class="form-group">
  		<label for="category" ></label>
  			<input type="radio" name="category" value="A" required><span>�����Խ���</span>
			<input type="radio" name="category" value="B" ><span>�߰�Խ���</span>
  	</div>
  	
  	<div class="form-group">
  		<label for="title">�� �ۼ�</label>
  		<input name="title" id="title" type="text" maxlength="100"
  				class="form-control" placeholder="������ �Է����ּ���">
  	</div>
  	
  	<div class="form-group">
  		<label for="content">����</label>
  		<textarea name="content" id="content"
  				rows="20" class="form-control" placeholder="������ �Է��ϼ���."></textarea>
  	</div>
  	
  	<div class="form-group">
  		<label>
  		����÷��
  		 <img src="${pageContext.request.contextPath}/img/attach.png" alt="����÷��">
  		 <input type="file" id="upfile" name="post_file">
  		</label>
  		<span id="filevalue"></span>
  	</div>
  	
  	<div class="form-group">
  		<button type=reset class="btn btn-danger">���</button>
  		<button type=submit class="btn btn-primary">���</button>
  	</div>
  	</form>
 </div>
</body>
</html>