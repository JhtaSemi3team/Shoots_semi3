<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/js/jquery-3.7.1.js"></script>
<title>���� �Խ���</title>
<%--<jsp:include page = "header.jsp"/> --%>
</head>
<body>
<div class="container">
<%--�Խñ��� �ִ� ��� --%>
 <c:if test="${listcount > 0 }">
  <div class="rows">
   <span>�ٺ���</span>
   <select class="form-control" id="viewcount"> 
   	<option value="1">1</option>
   	<option value="3">3</option>
   	<option value="5">5</option>
   	<option value="7">7</option>
   	<option value="10" selected>10</option>
   </select>
  </div>
  <table class="table tabe-striped">
  	<thead>
   	 <tr>
   	 	<th colspan="3">MVC �Խ��� - list</th>
   	 	<th colspan="2"><span>�� ���� : ${listcount}</span></th>
   	 </tr>
  	 <tr>
  	 	<th><div>��ȣ</div></th>
  	 	<th><div>������ ����</div></th>
  	 	<th><div></div></th>
  	 	<th><div>��¥</div></th>
  	 	<th><div>��ȸ��</div></th>
  	 </tr>
  	</thead>
  	<tbody>
  	
  	</tbody>
  	<c:set var="num" value="${listcount-(page-1)*limit}"/>
  	<c:forEach var="b" items="${boardlist}">
  		<tr>
  		 <td><%--��ȣ --%>
  		 	<c:out value=" ${num }"/><%--num ��� --%>
  		 	<c:set var="num" value="${num-1}"/> <%--num=num-1; �ǹ� --%>
  		 </td>
  		<td> <%--���� --%>
  			<div>
  			 <%--�亯�� ���� �տ� ����ó�� �κ� --%>
  			 <c:if test="${b.board_re_lev > 0 }"> <%--����� ��� --%>
  			 	<c:forEach var="a" begin="0" end="${b.board_re_lev*2 }" step="1" >
  			 	&nbsp;
  			 	</c:forEach>
  			 	<img src ='${pageContext.request.contextPath}/image/line.gif'>
  			 </c:if>
  			 
  			 <a href="detail?num=${b.board_num }">
  			 	<c:if test="${b.board_subject.length()>=20 }">
  			 		<c:out value="${b.board_subject.substring(0,20 )}..."/>
  			 	</c:if>
  			 	<c:if test="${b.board_subject.length()<20 }">
  			 		<c:out value="${b.board_subject}"/>
  			 	</c:if>
  			 </a>
  			 	
								[${b.cnt}]
							</div>
						</td>
						<td><div>${b.board_name}</div></td>
						<td><div>${b.board_date}</div></td>
						<td><div>${b.board_readcount}</div></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="cetner-block">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a ${page > 1 ? 'href=list?page=' += (page-1) : ''} class="page-link ${page <=1 ? 'gray' : ''}">
						����&nbsp;
					</a>
				</li>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<li class="page-item ${a==page ? 'active' : ''}">
						<a ${a==page ? '' : 'href=list?page='+=a} class="page-link">
							${a}
						</a>
					</li>
				</c:forEach>
				<li class="page-item">
					<a ${page < maxpage ? 'href=list?page=' += (page + 1 ) : ''} class = "page-link ${page >= maxpage ? 'gray' : ''}">
						&nbsp;����
					</a>
				</li>
			</ul>
		</div>
	</c:if> <%--<c:if test"${listcounbt > 0}"> end --%>
	<%--�Խñ��� ���� ��� --%>
	<c:if test="${listcount == 0 }">
		<h3 style="text-align:center">��ϵ� ���� ����.</h3>
	</c:if>
	
	<button type="button" class="btn btn-info float-right">�� �� ��</button>
	</div> <%--<div class="container"> end --%>
</body>
</html>