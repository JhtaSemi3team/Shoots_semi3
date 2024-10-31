<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <style>
select.form-control {
	width: auto;
	margin-bottom: 2em;
	display: inline-block
}

.rows {
	text-align: right;
}

.gray {
	color: gray;
}

	body > div > table > thead > tr:nth-child(2) > th:nth-child(1){width:8%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(2){width:50%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(3){width:14%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(4){width:17%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(5){width:11%}
 </style>
 
<meta charset="EUC-KR">
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath}/js/list.js"></script>
<title>���� �Խ���</title>
</head>
<body>
 <div class="container">
 
  <%-- �Խñ��� �ִ� ��� --%>
  <c:if test="${readcount > 0 }">
  
   <table class="table table-striped">
    <thead>
     <tr>
      <th colspan="3">�����Խ���</th>
     </tr>
     
     <tr>
     	<th><div>�۹�ȣ</div></th>
     	<th><div>����</div></th>
     	<th><div>�ۼ���</div></th>
     	<th><div>�ۼ���</div></th>
     	<th><div>��ȸ��</div></th>
     </tr>
    </thead>
    <tbody>
    <c:set var="num" value="${listcount-(page-1)*limit}"/>
    <c:forEach var="p" items="${postlist}">
     <tr>
      <td><%-- �۹�ȣ --%>
       <c:out value="${num}"/><%-- num ��� --%>
       <c:set  var="num" value="${num-1}"/>		<%-- num=num-1; �ǹ� --%>
      </td>
      <td><%-- ���� --%>
      <div>
      <a href="detail?num=${p.post_id}">
		<c:if test="${p.title.length()>=20}">
			<c:out value="${p.title.substring(0,20)}..."/>
		</c:if>
		<c:if test="${p.title.length()<20}">
			<c:out value="${p.title}"/>
		</c:if>
	</a>[${p.cnt}]
      </div>
      </td>
	<td><div>${p.writer}</div></td><%-- �ۼ��� --%>
	<td><div>${p.register_date}</div></td><%-- �ۼ��� --%>
	<td><div>${p.readcount}</div></td><%-- ��ȸ�� --%>
      </tr>
      </c:forEach>
    </tbody>
   </table>
   </c:if> <%-- <c:if test="${readcount > 0 }"> end --%>
   
   
   <%-- �Խñ��� ���� ��� --%>
  <c:if test="${readcount  == 0 }">
  	<h3 style="text-align:center">��ϵ� ���� �����ϴ�.</h3>
  </c:if>
   <button type="button" class="btn btn-info float-right"> �� �� ��</button>
 </div> <%-- <div class="container"> end --%>
</body>
</html>