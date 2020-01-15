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
				<div class="contents_wrap ${cFun:changeFairDivClass(jobFairInfo.fairDivCd)}">
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

			<c:if test="${loginYn == 'Y'}">
				<div class="recruitment_btnbox">
					<div class="bbs_center">
						<c:if test="${jobFairInfo.fairStsCd == 'FAS0000000002'}">
							<c:choose>
								<c:when test="${jobFairInfo.applyCnt == null || jobFairInfo.applyCnt == 0}">
						<button type="button" name="participateBtn" class="button offer on"><spring:message code="apply.participate" /></button>
								</c:when>
								<c:otherwise>
						<span class="button offer"><spring:message code="apply.participate" /></span>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${userAuthCd == 'ROLE_CMPNY' || userAuthCd == 'ROLE_TRNCT'}">
							<c:if test="${jcAgreeStsCd == 'JAS0000000001'}">
						<button type="button" name="boothApplyBtn" class="button offer on"><spring:message code="apply.booth" /></button>
							</c:if>
						</c:if>
					</div>
				</div>
			</c:if>

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
								<a href="javascript:fnImgViewPopup('<spring:message code="jobfair.type.detail.title21" />', '<c:out value="${file.saveFilePath}" />')" class="booth_view"><spring:message code="jobfair.booth.layout" /></a>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- //view_box -->
			</div>
			<!-- //form_view -->

			<div class="bbs_btn_wrap clearfix">
				<div class="bbs_center">
					<a href="javascript:fnGoList('viewFrm');" class="bbs_btn list"><spring:message code="button.list"/></a>
				</div>
			</div>
			<!-- //bbs_btn_wrap -->

		</div>
        <!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<form id="viewFrm" name="viewFrm" action="${pageContext.request.contextPath}/jobFair/applyList.do" method="post">
	<input type="hidden" name="condSeq"        value="<c:out value="${param.condSeq}" />" />
	<input type="hidden" name="condFairDivCd"  value="<c:out value="${param.condFairDivCd}" />" />
	<input type="hidden" name="condType"       value="<c:out value="${param.condType}" />" />
	<input type="hidden" name="condText"       value="<c:out value="${param.condText}" />" />
	<input type="hidden" name="currentPageNo"  value="<c:out value="${param.currentPageNo}" />" />
	<input type="hidden" name="condSort"       value="<c:out value="${param.condSort}" />" />
	<input type="hidden" name="condSearchType" value="<c:out value="${param.condSearchType}" />" />
</form>

<script>
   	$(document).ready(function() {
		$('div#contents .tab_menu .clearfix li').removeClass('on');
		$('div#contents .tab_menu .clearfix li:eq(${tabNo})').addClass('on');

		<c:if test="${loginYn == 'Y'}">
			<c:if test="${jobFairInfo.fairStsCd == 'FAS0000000002' && (jobFairInfo.applyCnt == null || jobFairInfo.applyCnt == 0)}">
		$("[name=participateBtn]").click(function() {
			fnGoApply("<c:out value="${jobFairInfo.fairSeq}" />");
		});
			</c:if>
			<c:if test="${userAuthCd == 'ROLE_CMPNY' || userAuthCd == 'ROLE_TRNCT'}">
				<c:if test="${jcAgreeStsCd == 'JAS0000000001'}">
		$("[name=boothApplyBtn]").click(function() {
			fnBoothApply("<c:out value="${jobFairInfo.fairSeq}" />");
		});
				</c:if>
			</c:if>
		</c:if>
	});
	function fnGoApply(fairSeq) {
		alertify.confirm("<spring:message code="jobfair.apply.view.msg01"/>", function (e) {
			if (e) {
				$.ajax({
					url: contextPath + "/jobFair/applyPatcptnAjax.do",
					data: {
						"fairSeq": fairSeq
					},
					type: 'post',
					datatype: 'json'
				})
				.done(function(data) {
					if (data.result.successYn == "Y") {
						alertify.alert("<spring:message code="jobfair.apply.view.msg02"/>", function (e){
							fnGoList('viewFrm');
						});
					} else {
		 				var msg = "<spring:message code="errors.ajax.fail"/>";
						if(data.result.statCd == "NO_LOGIN") {
							msg = "<spring:message code="msg.session.out"/>";
						} else if(data.result.statCd == "ERR_FAIR_STS") {
							msg = "<spring:message code="jobfair.apply.msg01"/>"; //참가신청 가능한 상태가 아닙니다!
						} else if(data.result.statCd == "ERR_EXIST") {
							msg = "<spring:message code="jobfair.apply.msg02"/>"; //이미 참가신청 된 상태입니다!
						}
						alertify.alert(msg);
					}
				})
				.fail(function(xhr, status, errorThrown) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				});
			}
		});
	}
	<c:if test="${loginYn == 'Y'}">
		<c:if test="${userAuthCd == 'ROLE_CMPNY' || userAuthCd == 'ROLE_TRNCT'}">
			<c:if test="${jcAgreeStsCd == 'JAS0000000001'}">
	function fnBoothApply(fairSeq) {
// 		if($("#boothApplyPopup").length == 0) {
// 			$(document.body).append('<div id="boothApplyPopup"></div>');
// 		}
// 		$("#boothApplyPopup").load("${pageContext.request.contextPath}/jobFair/boothApplyPopup.do?condSeq="+fairSeq+" .popup", function(res, stat, xhr) {
// 			$("#booth-apply-popup").show();
// 			$.getScript(contextPath+"/js/jobFair/boothApplyPopup.js");
// 		});

		var f = $("[name=viewFrm]")[0];
		f.action = "${pageContext.request.contextPath}/jobFair/boothApply.do";
   		f.submit();
	}
			</c:if>
		</c:if>
	</c:if>
</script>
