<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    </script>
	<div class="bbs_basic">
		<form id="frm" name="frm" action="${pageContext.request.contextPath}/compny/vacancyContinueListAjax.do" method="post">
		<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
		<input type="hidden" id="condSeq" name="condSeq" value="${param.condSeq}"/>
		<ul class="recruitment_list type2 none_border clearfix">
			<c:forEach var="data" items="${resultList}" varStatus="status">
			<li>
				<div class="contents_wrap">
					<div class="contents_box">
						<div class="title_box"><!-- 새글일 경우 클래스 new 추가 -->
							<a href="javascript:void(0);" onclick="fnVacancyView('${data.vacancySeq}','frm');" class="title">${data.vacancyTitle}</a>
						</div>
						<div class="cont_box">
							<span class="cont">
								<span class="con">${data.employFormNm}</span>
								<span class="con"><spring:message code="compny.vacancy.msg.title8"/> : <strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></strong></span>
								<span class="con">${data.addrNm}</span>
								<span class="con"><spring:message code="compny.vacancy.msg.title18"/> : $<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.minSalaryAmt}" /> ~ $<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.maxSalaryAmt}" /></span>
							</span>
						</div>
						<div class="other_box">
							<span class="date">${data.remainDt}</span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
							<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
								<span id="bkmkSapn_${status.count}"><button type="button" id="btnBkmk_${status.count}" onclick="fnBkmkType2('${data.bkmkSeq}','${data.vacancySeq}',LIKE_CATEGORY_VACANCY,'btnBkmk_${status.count}','bkmkSapn_${status.count}');" class="interest <c:if test="${!empty data.bkmkSeq and data.bkmkSeq != ''}">on</c:if>">interest</button>
								</span>
							</sec:authorize>
						</div>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
		</form>
	</div>
	<!-- //bbs_basic list -->

	<c:if test="${empty resultList}">
	<div class="bbs_empty">
		<p>No Posts Yet</p>
		<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
	</div>
	<!-- //bbs_empty -->
	</c:if>

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
	</div>
	<!-- //pagination -->