<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2><span><spring:message code="mypage.compny.match.ttl01"/></span></h2>
			</div>
		</header>
    	<div id="contents">

			<c:if test="${vacanchMatchSet == null}">
			<div class="matching_box">
				<div class="box_wrap">
					<div class="contents_box">
						<div class="title_box">
							<span class="tit"><spring:message code="mypage.compny.match.msg02" /></span><!-- Tailored Matching -->
							<strong class="title"><spring:message code="mypage.compny.match.msg03" /></strong><!-- Please Set your preferred conditions <br />for finding your employee! -->
						</div>
						<div class="cont_box">
							<p><spring:message code="mypage.compny.match.msg04" /></p><!-- Set your preference on job seeker such as occupation, sector, location, etc., <br />then you will receive job seeker list based on your preference.  -->
						</div>
						<div class="put_box">
							<a href="javascript:fnGoMoveUrl('frm', '${pageContext.request.contextPath}/cpes/compny/match/matchResumeSetup.do')"><spring:message code="mypage.compny.match.msg01" /> </a>
						</div>
					</div>
				</div>
			</div>
			<!-- //matching_box -->
			</c:if>

			<c:if test="${vacanchMatchSet != null}">
			<div class="box type2 icon matching">
			    <div class="box_wrap">
			        <div class="title"><spring:message code="mypage.compny.match.msg05" /></div><!-- Please Set your preferred conditions for finding your employee! -->
			        <p><spring:message code="mypage.compny.match.msg06" /></p><!-- Set your preference on job seeker such as occupation, sector, location, etc., <br />then <span class="em_point">you will receive job seeker list based on your preference.</span> -->
					<a href="javascript:fnGoMoveUrl('frm', '${pageContext.request.contextPath}/cpes/compny/match/matchResumeSetup.do')" class="bbs_btn type01 matching_btn"><spring:message code="mypage.compny.match.msg07" /></a><!-- Set Tailored Matching -->
			    </div>
			</div>

			<div class="bbs_info clearfix">
				<div class="bbs_left bbs_count">
					<strong class="currently"><c:out value="${paginationInfo.currentPageNo}" /></strong>&nbsp;&nbsp;/
					<span class="total"><c:out value="${paginationInfo.totalPageCount}" /></span>
					<span class="order">
						<strong class="skip">Change list order</strong>
						<!-- Latest -->
						<button type="button" onclick="fnSearch('auto', 'LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button>
						<!-- Views -->
<%-- 						<button type="button" onclick="fnSearch('auto', 'VIEW')"><spring:message code="counsel.msg.sortBy.view"/></button> --%>
						<!-- Likes -->
<%-- 						<button type="button" onclick="fnSearch('auto', 'LIKE')"><spring:message code="counsel.msg.sortBy.like"/></button> --%>
					</span>
				</div>
			</div>
			<!-- //bbs_info -->

			<c:if test="${!empty resultList}">
			<div class="bbs_basic">
				<ul class="recruitment_list talent clearfix">
					<c:forEach var="data" items="${resultList}" varStatus="status">
					<li>
						<c:set var="genderCdClass" value="male"/><c:if test="${data.genderCd == 'GEN0000000002'}"><c:set var="genderCdClass" value="female"/></c:if>
						<div class="contents_wrap <c:out value="${genderCdClass}" />">
							<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/></div>
							<div class="contents_box">
								<div class="title_box">
									<span class="tit"><c:out value="${data.iscoCdListStr}" /></span>
									<a href="javascript:void(0);" onclick="fnGoCompnyResumeView('<c:out value="${data.resumeSeq}" />');" class="title"><c:out value="${data.resumeTitle}" escapeXml="false" /></a>
								</div>
								<div class="top_box">
									<span class="name"><c:out value="${masking:getNmMasking(data.userNm,'N')}" /></span>
									<span class="age">
										(<span><c:out value="${data.genderNm}" /></span> <span><c:out value="${data.age}" /></span>)
									</span>
								</div>
								<div class="cont_box">
									<span class="con">
										<c:choose>
											<c:when test="${data.careerYn == 'Y'}"><c:out value="${data.totCareerTermYearCnt}" /> year+</c:when>
											<c:otherwise><spring:message code="eduTrnng.msg4"/></c:otherwise>
										</c:choose>
									</span>
									<span class="con"><c:out value="${data.eduDegreeNm}" /></span>
									<span class="con"><c:out value="${data.addrNm}" /></span>
								</div>
								<div class="other_box">
									<span class="top_box">
										<span class="date type2"><strong><c:out value="${data.modDt}" /></strong> <spring:message code="comm.search.lbl09" /></span><!-- updated -->
										<span id="bkmkSapn_${status.count}">
											<button type="button" id="btnBkmk_${status.count}" onclick="fnBkmkType2('${data.bkmkSeq}','${data.resumeSeq}',LIKE_CATEGORY_RESUME,'btnBkmk_${status.count}','bkmkSapn_${status.count}');" class="interest <c:if test="${!empty data.bkmkSeq and data.bkmkSeq != ''}">on</c:if>">interest</button>
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
			</c:if>

			<c:if test="${empty resultList}">
			<div class="bbs_empty">
				<p><spring:message code="counsel.msg.no.data"/></p>
			</div>
			<!-- //bbs_empty -->
			</c:if>

			<div class="pagination">
				<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
			</div>
			<!--  //pagination -->
			</c:if>

		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<form id="frm" name="frm" method="post">
	<input type="hidden" name="currentPageNo" />
</form>

<script>
	$(document).ready(function(e) {

	});
	function fnSetPageing(pageNo) {
		if(!pageNo) pageNo = 1;

		var f = $("[name=frm]")[0];
		f.currentPageNo.value = pageNo;
		f.action = contextPath + "/cpes/compny/match/matchResumeList.do";
		f.submit();
	}
</script>