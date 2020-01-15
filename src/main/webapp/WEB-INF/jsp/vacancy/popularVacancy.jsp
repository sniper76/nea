<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

 <main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2><span><spring:message code="jobseeker.vacancy.popular.today.ttl01" /></span></h2>
			</div>
		</header>
		<div id="contents">
			<div class="srch_box">
				<div class="srch_area type3">
					<div class="box_wrap">
						<form name="searchFrm" id="searchFrm">
							<input type="hidden"name="currentPageNo" value="${paginationInfo.currentPageNo}" />
							<input type="hidden"name="condSeq" id="condSeq" />
							<fieldset>
								<legend><spring:message code="button.search" /></legend>
								<div class="contents_box">
									<!-- 직종 1 -->
									<label for="condIscoLvlOne" class="skip"><spring:message code="mypage.compny.applic.title6" /></label>
									<select id="condIscoLvlOne" name="condIsco" onchange="fnIscoCdList(this,'1','condIscoLvlOne','condIscoLvlTwo',null,null,null,'N');">
										<option value=""><spring:message code="mypage.compny.applic.title6" /></option>
										<c:forEach var="data" items="${iscoList}">
							   			<option value="${data.cd}" <c:if test="${param.condIsco == data.cd}">selected</c:if>>${data.cdNm}</option>
							   			</c:forEach>
									</select>
									<!-- 직종 2 -->
									<label for="condIscoLvlTwo" class="skip"><spring:message code="jobseeker.vacancy.popular.today.ttl02" /></label>
									<select id="condIscoLvlTwo" name="condDiv">
										<option value=""><spring:message code="jobseeker.vacancy.popular.today.ttl02" /></option>
										<c:forEach var="data" items="${isco2List}">
							   			<option value="${data.cd}" <c:if test="${param.condDiv == data.cd}">selected</c:if>>${data.cdNm}</option>
							   			</c:forEach>
									</select>
									<!-- 지역 -->
									<label for="serch_sel3" class="skip"><spring:message code="resume.text.addrProvcCd" /></label>
									<select id="serch_sel3" name="condArea">
										<option value=""><spring:message code="resume.text.addrProvcCd" /></option>
										<c:forEach var="data" items="${locList}">
							   			<option value="${data.lvlCd}" <c:if test="${param.condArea == data.lvlCd}">selected</c:if>>${data.nm}</option>
							   			</c:forEach>
									</select>
									<!-- Search -->
									<button type="button" class="submit" onclick="fnSearch()"><spring:message code="button.search" /></button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<!-- //srch_box -->

			<c:if test="${!empty resultList}">
			<div class="bbs_basic">
				<ul class="recruitment_list popularity clearfix">
					<c:forEach var="data" items="${resultList}" varStatus="status">
					<li>
						<div class="contents_wrap">
							<span class="nums <c:if test="${data.ranking <= 20}">top</c:if>"><c:out value="${data.ranking}" /></span>
							<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.logoFilePath}" alt="company logo" onerror="fnNoImage(this)" /></div>
							<div class="contents_box recruiting">
								<div class="title_box">
									<span class="tit"><c:out value="${data.compnyNm}" /></span>
									<a href="javascript:void(0);" onclick="fnVacancyView('<c:out value="${data.vacancySeq}" />','searchFrm')" class="title"><c:out value="${data.vacancyTitle}" /></a>
								</div>
								<div class="cont_box">
									<span class="con"><c:out value="${data.preferEmploymtTypeNm}" /></span>
									<span class="con">
										<spring:message code="compny.vacancy.msg.title8" />&nbsp;:&nbsp;
										<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></strong>
									</span>
									<span class="con"><c:out value="${data.addrFullNm}" /></span>
									<span class="con">
										$<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.minSalaryAmt}" /> ~
										$<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.maxSalaryAmt}" />
									</span>
								</div>
								<div class="other_box">
									<span class="top_box">
										<c:choose>
											<c:when test="${data.vacancyStsCd == 'VCS0000000002'}">
										<c:out value="${data.vacancyStsNm}" />
											</c:when>
											<c:otherwise>
										<span class="<c:out value="${data.remainDiv}" />"><c:out value="${data.remainDt}" /><c:if test="${data.remainDiv == 'hurry'}"><c:choose><c:when test="${data.remainDt == 1}">Hours</c:when><c:otherwise>Hours</c:otherwise></c:choose></c:if></span>
											</c:otherwise>
										</c:choose>
										<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
										<span id="bkmkSapn_${status.count}">
											<button type="button" id="btnBkmk_${status.count}" onclick="fnBkmkType2('${data.bkmkSeq}','${data.vacancySeq}',LIKE_CATEGORY_VACANCY,'btnBkmk_${status.count}','bkmkSapn_${status.count}');" class="interest <c:if test="${!empty data.bkmkSeq and data.bkmkSeq != ''}">on</c:if>">interest</button>
										</span>
										</sec:authorize>
									</span>
								</div>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
			<!-- //bbs_basic list -->
			</c:if>

			<c:if test="${empty resultList}">
			<div class="bbs_empty">
				<p><spring:message code="counsel.msg.no.data"/></p>
			</div>
			<!-- //bbs_empty -->
			</c:if>
		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<script>
   	$(document).ready(function() {
   	});
   	function fnSearch(pageNo) {
   		if(pageNo == null || $.trim(pageNo) == '') currentPageNo = "1";

		var f = $("[name=searchFrm]")[0];
		f.action = contextPath + "/vacancy/popularVacancy.do";
		f.currentPageNo = pageNo;
		f.submit();
   	}
</script>