<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<main class="colgroup" id="colgroup">
   	<article>
		<header class="sub_head">
			<div class="sub_title">
				<div class="sub_tab_menu count3">
					<ul class="clearfix">
						<li>
							<!-- Popular Companies -->
							<a href="#tab_contents1" onclick="fnTabChange('TODAY', this);"><spring:message code="jobseeker.vacancy.popular.company.ttl01" /></a>
						</li>
						<li>
							<!-- Company of the Month -->
							<a href="#tab_contents2" onclick="fnTabChange('MONTH', this);"><spring:message code="jobseeker.vacancy.popular.company.ttl02" /></a>
						</li>
						<li class="on">
							<!-- Company of the Cumulative -->
							<a href="#tab_contents3" onclick="fnTabChange('ACCUMULATE', this);"><spring:message code="jobseeker.vacancy.popular.company.ttl03" /></a>
						</li>
					</ul>
				</div>
				<!-- Popular Companies -->
				<h2><span><spring:message code="jobseeker.vacancy.popular.company.ttl01" /></span></h2>
			</div>
		</header>
		<div id="contents">
			<div class="srch_box">
				<div class="srch_area type3">
					<div class="box_wrap">
						<form name="searchFrm">
							<input type="hidden"name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
							<fieldset>
								<legend><spring:message code="button.search" /></legend>
								<div class="contents_box">
									<label for="isicCd" class="skip"><spring:message code="mypage.compny.profile.title11"/></label>
									<select id="isicCd" name="condDiv">
										<option value=""><spring:message code="mypage.compny.profile.title11"/></option>
										<c:forEach var="data" items="${isicList}" varStatus="status">
							   			<option value="${data.isicCd}" <c:if test="${param.condDiv == data.isicCd}">selected</c:if>>${data.nm}</option>
							   			</c:forEach>
									</select>
									<label for="locCd" class="skip"><spring:message code="resume.text.addrProvcCd"/></label>
									<select id="locCd" name="condArea">
										<option value=""><spring:message code="resume.text.addrProvcCd"/></option>
										<c:forEach var="data" items="${locList}" varStatus="status">
							   			<option value="${data.lvlCd}" <c:if test="${param.condArea == data.lvlCd}">selected</c:if>>${data.nm}</option>
							   			</c:forEach>
									</select>
									<button type="button" class="submit" onclick="fnSearch()"><spring:message code="button.search" /></button><!-- Search -->
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<!-- //srch_box -->

			<c:if test="${!empty resultList}">
			<div class="company_list">
				<ul class="clearfix">
					<c:forEach var="data" items="${resultList}" varStatus="status">
					<li>
						<div class="contents_box">
							<span class="nums <c:if test="${data.ranking <= 20}">top</c:if>"><c:out value="${data.ranking}" /></span>
							<span class="num_interest"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.bkmkCnt}" /></span>
							<span class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.logoFilePath}" alt="company logo" onerror="fnNoImage(this)" /></span>
							<a href="javascript:fnCompnyView('<c:out value="${data.compnySeq}" />');" class="title_box">
								<strong class="title"><c:out value="${data.compnyNm}" /></strong>
							</a>
							<span class="cont_box">
								<span class="cont"><c:out value="${data.isicNm}" />&nbsp;</span>
								<span class="cont"><c:out value="${data.locNm}" />&nbsp;</span>
							</span>
							<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
							<span id="bkmkSapn_${status.count}">
								<button type="button" id="btnBkmk_${status.count}" onclick="fnBkmkType2('${data.bkmkSeq}','${data.compnySeq}',LIKE_CATEGORY_COMPNY,'btnBkmk_${status.count}','bkmkSapn_${status.count}');" class="interest <c:if test="${!empty data.bkmkSeq and data.bkmkSeq != ''}">on</c:if>">interest</button>
							</span>
							</sec:authorize>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
			<!-- //company_list -->
			</c:if>

			<c:if test="${empty resultList}">
			<div class="bbs_empty">
				<p><spring:message code="counsel.msg.no.data"/></p>
			</div>
			<!-- //bbs_empty -->
			</c:if>

			<div class="pagination">
				<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSearch"/>
			</div>
			<!--  //pagination -->
       	</div>
       	<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<script>
   	$(document).ready(function() {
   	});

   	function fnTabChange(flag) {
   		if(flag == "MONTH") {
			document.location.href = contextPath + "/vacancy/popularCompnyMonth.do";
   		} else if(flag == "ACCUMULATE") {
			document.location.href = contextPath + "/vacancy/popularCompnyAccumulate.do";
   		} else {
			document.location.href = contextPath + "/vacancy/popularCompny.do";
   		}
   	}
   	function fnSearch(pageNo) {
   		if(pageNo == null || $.trim(pageNo) == '') currentPageNo = "1";

		var f = $("[name=searchFrm]")[0];
		f.action = contextPath + "/vacancy/popularCompny.do";
		f.currentPageNo = pageNo;
		f.submit();
   	}
</script>