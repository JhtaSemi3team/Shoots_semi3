<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/inquiry.css">


<title>���� �Խ���</title>
</head>
<body>
		<%--�Խñ��� �ִ� ��� --%>
		<c:if test="${listcount > 0 }">
			
			<table class="table">
				<caption>1:1 ���� �Խ��� 
				<span style="font-size:18px; float:right">�� ���� : ${listcount}</span>
				</caption>
				<thead>
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
									<a class="inquiryDetail" href="../inquiry/detail?inquiryid=${i.inquiry_id}"> 
										<c:if test="${i.title.length()>=20 }">
											<c:out value="${i.title.substring(0,20 )}..." />
										</c:if> 
										
										<c:if test="${i.title.length()<20 }">
											<c:out value="${i.title}" />
										</c:if>
									</a>
									<!-- �亯 ���� ǥ�� -->
					                <span>
					                    <c:if test="${i.hasReply}">
					                        [�亯�Ϸ�]
					                    </c:if>
					                </span>
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

							<%--�������� ID. �α����ؼ� �޾ƿ� ȸ�� ������ A��  --%>
							   <c:choose>
						            <c:when test="${userClassification == 'regular'}">
						               <td><div>${i.user_id}</div></td>
						            </c:when>
						            <c:when test="${userClassification == 'business'}">
						                <td><div>${i.business_id}</div></td>
						            </c:when>
						        </c:choose>
							
							<%--���� �����--%>
							<td><div>${i.register_date}</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<%--����¡ --%>
		<div class = "center-block">
				<ul class = "pagination justify-content-center">
					<li class = "page-item">
						<a href="javascript:go_inquiry(${page - 1})"
							class = "page-link ${page <= 1 ? 'gray' : '' }">
							&lt;&lt;
						</a>
					</li>
					<c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
						<li class = "page-item ${a == page ? 'active' : '' }">
							<a href="javascript:go_inquiry(${a})"
								class = "page-link">${a}</a>
						</li>
					</c:forEach>
					<li class = "page-item">
						<a href="javascript:go_inquiry(${page + 1})"
							class = "page-link ${page >= maxpage ? 'gray' : '' }">
							&gt;&gt;
						</a>
					</li>
				</ul>
			</div>
			<%--����¡ �� --%>
		</c:if>
		<%--<c:if test"${listcount > 0}"> end --%>
		<%--�Խñ��� ���� ��� --%>
		<c:if test="${listcount == 0 }">
			<h3 style="text-align: center">���� �����ֽ� ������ �����ϴ�.</h3>
		</c:if>
			
		<%--�����ϱ� ��ư ������ �۾��� �������� �̵� --%>
		<a href="../inquiry/write"><button type="button" class="btn btn-success float-right">�����ϱ�</button></a>

</body>

</html>