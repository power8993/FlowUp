<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   String ctxPath = request.getContextPath();
%>

<jsp:include page="document_main.jsp" />

<jsp:include page="document_box.jsp" />

<script type="text/javascript">

	$(document).ready(function(){
		
		$("h1#doc_title").text("결재 문서함");
		$("a.doc_search_btn").click(e=>{
			alert("ddd");
		});
		
	}); // end of $(document).ready(function(){})-------------------------------------------------
	
</script>

	<div>
		<table class="table">
			<thead>
				<tr>
					<th>
						<input type="checkbox" id="check_all"/>
					</th>
					<th>
						<span>기안일</span>
					</th>
					<th>
						<span>완료일</span>
					</th>
					<th>
						<span>긴급</span>
					</th>
					<th>
						<span>결재양식</span>
					</th>
					<th>
						<span>제목</span>
					</th>
					<th>
						<span>첨부</span>
					</th>
					<th>
						<span>기안자</span>
					</th>
					<th>
						<span>문서번호</span>
					</th>
					<th>
						<span>결재상태</span>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty requestScope.approvedList}">
					<c:forEach var="approved" items="${requestScope.approvedList}">
						<tr class="document" onclick="location.href='<%= ctxPath%>/document/documentView?documentNo=${approved.documentNo}&documentType=${approved.documentType}';">
							<td>
								<input type="checkbox" class="document_check" onclick='event.cancelBubble=true;'>
							</td>
							<td>
								<span>${approved.draftDate}</span>
							</td>
							<td>
								<span>${approved.approvalDate}</span>
							</td>
							<td>
								<c:if test="${approved.urgent == 1}"><span class="p-1 urgent">긴급</span></c:if>
							</td>
							<td>
								<span>${approved.documentType}</span>
							</td>
							<td>
								<span>${approved.subject}</span>
							</td>
							<td>
								<span></span>
							</td>
							<td>
								<span>${approved.name}</span>
							</td>
							<td>
								<span>${approved.documentNo}</span>
							</td>
							<td>
								<span>
									<c:if test="${approved.status == 0}">진행중</c:if>
									<c:if test="${approved.status == 1}">완료</c:if>
									<c:if test="${approved.status == 2}">반려</c:if>
								</span>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty requestScope.approvedList}">
					<tr>
						<td colspan="6"><span>결재 예정 문서가 없습니다.</span></td>
					</tr>
				</c:if>
			</tbody>
		</table>
		
	</div>
</div>
<jsp:include page="../../footer/footer.jsp" /> 