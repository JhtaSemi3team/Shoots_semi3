<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath}/js/inquiryJs/inquirylist.js"></script>
<script src="${pageContext.request.contextPath}/css/inquiry.css"></script>
<jsp:include page = "/WEB-INF/views/user/top.jsp"/>

<title>���� �Խ���</title>
</head>
<body>
	<div class="container">
		<%--�Խñ��� �ִ� ��� --%>
		<c:if test="${listcount > 0 }">
			<div class="rows">
				<span>�ٺ���</span> <select class="form-control" id="viewcount">
					<option value="1">1</option>
					<option value="3">3</option>
					<option value="5">5</option>
					<option value="7">7</option>
					<option value="10" selected>10</option>
				</select>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="3">1:1 ���� �Խ���</th>
						<th colspan="2"><span>�� ���� : ${listcount}</span></th>
					</tr>
					<tr>
						<th><div>��ȣ</div></th>
						<th><div>���� ����</div></th>
						<th><div>������ ����</div></th>
						<th><div>������</div></th>
						<th><div>��¥</div></th>
					</tr>
				</thead>
				<tbody>
					<c:set var="num" value="${listcount-(page-1)*limit}" />
					<c:forEach var="i" items="${inquirylist}">
						<tr>
							<td>
								<%--��ȣ --%> <c:out value=" ${num }" />
								<%--num ��� --%> <c:set var="num" value="${num-1}" /> <%--num=num-1; �ǹ� --%>
							</td>
							<td>
								<%--���� --%>
								<div>
									<a href="detail?num=${i.inquiry_id}"> 
										<c:if test="${i.title.length()>=20 }">
											<c:out value="${i.title.substring(0,20 )}..." />
										</c:if> 
										
										<c:if test="${i.title.length()<20 }">
											<c:out value="${i.title}" />
										</c:if>
									</a> [${i.cnt}]
								</div>
							</td>
							<%--������ ���� : A�� ����, B�� ��� --%>
							 <td>
							    <div>
							        <c:choose>
							            <c:when test="${i.inquiry_type == 'A'}">
							                ����ȸ�� ����
							            </c:when>
							            <c:when test="${i.inquiry_type == 'B'}">
							                ���ȸ�� ����
							            </c:when>
							        </c:choose>
							    </div>
							</td>

							<%--�������� ID. �ʱ� ������ �������� �ĺ���ȣ����. 
							(���Ǳ� �ĺ���ȣ & ���Ǳ� �� ����� idx ��ȣ  2���� ���� �� �� user_id�� �̾ƿ�) --%>
							<td><div>${i.user_id}</div></td>
							
							<%--���� �����--%>
							<td><div>${i.register_date}</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class = "center-block">
            <ul class = "pagination justify-content-center">
               <li class = "page-item">
                  <a ${page > 1 ? 'href = list?page=' += (page - 1) : '' }
                     class = "page-link ${page <= 1 ? 'gray' : '' }">
                     &lt;&lt;
                  </a>
               </li>
               <c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
                  <li class = "page-item ${a == page ? 'active' : '' }">
                     <a ${a == page ? '' : 'href = list?page=' += a }
                        class = "page-link">${a}</a>
                  </li>
               </c:forEach>
               <li class = "page-item">
                  <a ${page < maxpage ? 'href = list?page=' += (page + 1) : '' }
                     class = "page-link" ${page >= maxpage ? 'gray' : '' }">
                     &gt;&gt;
                  </a>
               </li>
            </ul>
         </div>
		</c:if>
		<%--<c:if test"${listcounbt > 0}"> end --%>
		<%--�Խñ��� ���� ��� --%>
		<c:if test="${listcount == 0 }">
			<h3 style="text-align: center">��ϵ� ���� �����ϴ�.</h3>
		</c:if>

		<button type="button" class="btn btn-info float-right">�����ϱ�</button>
	</div>
	<%--<div class="container"> end --%>
</body>
</html>