<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/mypage/compny/vacancy/vacancy.js"></script>
    <script>
    	$(document).ready(function() {



    	});



	</script>

	<div class="bbs_basic">
		<ul class="recruitment_list clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
		<c:forEach var="data" items="${todayList}" varStatus="status">
			<li>
				<div class="contents_wrap">
					<span class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="company logo" onerror="fnNoImage(this)" /></span>
					<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
						<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
							<span class="tit">${data.compnyNm}</span>
							<a href="javascript:void(0);" onclick="fnVacancyView2('${data.vacancySeq}');" class="title">${data.vacancyTitle}</a>
						</div>
						<div class="cont_box">
							<span class="con">${data.employFormNm}</span>
							<span class="con"><spring:message code="compny.vacancy.msg.title8"/>&nbsp;:&nbsp;<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></strong></span>
							<span class="con">${data.addrNm}</span>
							<span class="con">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.minSalaryAmt}" /> ~ $<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.maxSalaryAmt}" /></span>
						</div>
						<div class="other_box">
							<span class="top_box">
								<span class="${data.remainDiv}">${data.remainDt}<c:if test="${data.remainDiv == 'hurry'}">Hour</c:if></span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
								<span id="bkmkSapn_${status.count}" class="top_box">
									<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
									<button type="button" id="btnBkmk_${status.count}" onclick="fnBkmkType2('${data.bkmkSeq}','${data.vacancySeq}',LIKE_CATEGORY_VACANCY,'btnBkmk_${status.count}','bkmkSapn_${status.count}');" class="interest <c:if test="${!empty data.bkmkSeq and data.bkmkSeq != ''}">on</c:if>"><spring:message code="mypage.compny.profile.title13"/></button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
									</sec:authorize>
								</span>
							</span>
						</div>
					</div>
				</div>
			</li>
		</c:forEach>
		</ul>
	</div>
	<!-- //bbs_basic list -->

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
	</div>
	<!-- //pagination -->

