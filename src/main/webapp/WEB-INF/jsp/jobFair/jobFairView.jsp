<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/CustomFunctionTag.tld" prefix="cFun" %>
<style>
	.popup { position: fixed; top: 0; right: 0; bottom: 0; left: 0; z-index: 12; background-color: rgba(0,0,0,0.1); display: none; }
	.popup >div { position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 12; }
</style>
<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2>
				<c:choose>
					<c:when test="${userAuthCd == 'ROLE_USER'|| userAuthCd == 'ROLE_STDIT'}">
						<span><spring:message code="jobfair.apply.view.ttl01"/></span>
					</c:when>
					<c:when test="${userAuthCd == 'ROLE_CMPNY'}">
						<span><spring:message code="jobfair.apply.view.ttl02"/></span>
					</c:when>
					<c:when test="${userAuthCd == 'ROLE_TRNCT'}">
						<span><spring:message code="jobfair.apply.view.ttl03"/></span>
					</c:when>
				</c:choose>
				</h2>
			</div>
		</header>
		<div id="contents">

			<div class="recruitment_bottom type3">
				<div class="contents_wrap ncpf ${cFun:changeFairDivClass(jobFairInfo.fairDivCd)}">
					<div class="img_box">
						<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=<c:out value="${fairImgPath}" />" alt="image" onerror="fnNoImage(this)" />
					</div>
					<div class="title_box">
						<div class="tit_box">
							<strong class="title"><c:out value="${jobFairInfo.fairNm }" escapeXml="false" /></strong>
							<span class="cont_box">
								<span class="cont interest"><c:out value="${jobFairInfo.bkmkCnt}" /></span>
							</span>
						</div>
					</div>
					<div class="contents_box">
						<ul class="none_float clearfix">
						<li>
							<div class="cont">
								<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title10" /></strong>
								<span class="con"><c:out value="${jobFairInfo.fairBgnDt}" /> ~ <c:out value="${jobFairInfo.fairEndDt}" /></span>
							</div>
						</li>
						<li>
							<div class="cont">
								<strong class="tit"><spring:message code="mypage.compny.profile.title12" /></strong>
								<span class="con"><c:out value="${jobFairInfo.addrNm}" /></span>
							</div>
						</li>
						<li>
							<div class="cont">
								<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title33" /></strong>
								<span class="con">
									<span><a href="tel:<c:out value="${jobFairInfo.tel1}" />" class="mobile_phone"><c:out value="${jobFairInfo.tel1}" /></a></span>
									<span><a href="tel:<c:out value="${jobFairInfo.tel2}" />" class="mobile_phone"><c:out value="${jobFairInfo.tel2}" /></a></span>
								</span>
							</div>
						</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //recruitment_bottom -->

			<div class="form_title">
				<div class="title"><spring:message code="jobfair.type.detail.title5" /></div>
			</div>

			<div class="h3"><spring:message code="resume.text.addrProvcCd" /><strong><c:out value="${jobFairInfo.jcNm}" escapeXml="false" /></strong></div>

			<h3><spring:message code="jobfair.type.detail.title12" /></h3>
			<p><c:out value="${jobFairInfo.fairDtlExplnNm}" escapeXml="false" /></p>

			<h3><spring:message code="noti" /></h3>
			<p><c:out value="${jobFairInfo.fairNoti}" escapeXml="false" /></p>

			<div class="form_view">
				<div class="view_box have_border">
					<div class="view_form">
						<strong class="title"><spring:message code="mypage.compny.profile.title12" /></strong>
						<p class="cont_box"><c:out value="${jobFairInfo.addrDtl}" /></p>
						<div class="margin_t_5">
							<button type="button" onclick="fnViewMap('<c:out value="${jobFairInfo.googleMapLink}"/>', 1024, 768, 'MapWin');" class="bbs_btn_map"><spring:message code="jobcenter.list.button1"/></button>
						</div>
					</div>
				</div>
				<!-- //view_box -->

				<div class="view_box">
					<div class="view_form">
						<strong class="title"><spring:message code="apply.term" /></strong>
						<p class="cont_box"><c:out value="${jobFairInfo.recurmtBgnDt}" /> ~ <c:out value="${jobFairInfo.recurmtEndDt}" /></p>
					</div>
				</div>
				<!-- //view_box -->

				<div class="view_box count2">
					<div class="view_form">
						<strong class="title"><spring:message code="jobfair.type.detail.title14" /></strong>
						<p class="cont_box">
							<span><a href="tel:<c:out value="${jobFairInfo.tel1}" />" class="mobile_phone"><c:out value="${jobFairInfo.tel1}" /></a></span> |
							<span><a href="tel:<c:out value="${jobFairInfo.tel2}" />" class="mobile_phone"><c:out value="${jobFairInfo.tel2}" /></a></span>
						</p>
					</div>
					<div class="view_form">
						<strong class="title"><spring:message code="login.stop.email" /></strong>
						<p class="cont_box"><c:out value="${jobFairInfo.email}" /></p>
					</div>
				</div>
				<!-- //view_box -->

				<div class="view_box">
					<div class="view_form images_list">
						<strong class="title"><spring:message code="jobfair.type.detail.title15" /></strong>
						<div class="cont_box">
							<c:forEach items="${sponsorImg}" var="file">
							<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${file.saveFilePath}" alt="image" onerror="fnNoImage(this)" />
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- //view_box -->

				<div class="view_box">
					<div class="view_form images_list">
						<strong class="title"><spring:message code="jobfair.type.detail.title16" /></strong>
						<div class="cont_box">
							<c:forEach items="${supporterImg}" var="file">
							<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${file.saveFilePath}" alt="image" onerror="fnNoImage(this)" />
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- //view_box -->

				<div class="view_box">
					<div class="view_form">
						<strong class="title"><spring:message code="jobfair.type.detail.title21" /></strong>
						<div class="cont_box">
							<c:forEach items="${boothImg}" var="file">
								<a href="javascript:fnImgViewPopup('<spring:message code="jobfair.type.detail.title21" />', '<c:out value="${file.saveFilePath}" />')" class="booth_view"><spring:message code="view.original" /></a>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- //view_box -->
			</div>
			<!-- //form_view -->

			<div class="bbs_btn_wrap clearfix">
				<div class="bbs_center">
					<a href="javascript:fnGo2List();" class="bbs_btn list"><spring:message code="button.list"/></a>
				</div>
			</div>
			<!-- //bbs_btn_wrap -->

		</div>
        <!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/jobFair/jobFairList.do" method="post">
	<input type="hidden" name="condFairDivCd"  value="<c:out value="${param.condFairDivCd}" />" />
	<input type="hidden" name="condType"       value="<c:out value="${param.condType}" />" />
	<input type="hidden" name="condText"       value="<c:out value="${param.condText}" />" />
	<input type="hidden" name="currentPageNo"  value="<c:out value="${param.currentPageNo}" />" />
	<input type="hidden" name="condSort"       value="<c:out value="${param.condSort}" />" />
	<input type="hidden" name="condSearchType" value="<c:out value="${param.condSearchType}" />" />
	<input type="hidden" name="viewMode"       value="<c:out value="${param.viewMode}" />" />
</form>

<script>
   	$(document).ready(function() {
		$('div#contents .tab_menu .clearfix li').removeClass('on');
		$('div#contents .tab_menu .clearfix li:eq(${tabNo})').addClass('on');
	});
   	function fnGo2List() {
		var viewMode = "<c:out value="${param.viewMode}" />";
		if(viewMode == "CALENDAR") {
   			document.location.href = "${pageContext.request.contextPath}/jobFair/jobFairCalendar.do?year=<c:out value="${param.year}" />&month=<c:out value="${param.month}" />";
		} else {
			fnGoList('frmSearch');
		}
   	}
</script>
