<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/mypage/privt/jobsk/jobsk.js"></script>
    <script>
    	$(document).ready(function() {
			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}
    	});

	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.jobsk.title"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="jobskIndex">
	       		<form id="frm" name="frm"  method="post">
	       			<input type="hidden" id="pageDiv" name="pageDiv" value="INDEX"/>
	       		</form>
				<div class="job_srch_info">
					<div class="title_box">
						<h3><spring:message code="mypage.private.jobsk.title2"/></h3>
						<p><spring:message code="mypage.private.jobsk.title3"/> <br /><spring:message code="mypage.private.jobsk.title4"/></p>
					</div>
					<div class="contents_box">
						<div class="box type4">
							<div class="box_wrap clearfix">
								<div class="cont_box">

									<c:choose>
										<c:when test="${empty result or result.jcAgreeStsCd == 'JAS0000000003'}">
											<strong class="title"><spring:message code="mypage.private.jobsk.title5"/> </strong>
											<p class="cont"><spring:message code="mypage.private.jobsk.title6"/> </p>
											<div class="put">
												<a href="javascript:void(0);" onclick="fnGoMoveUrl('frm','${pageContext.request.contextPath}/cpes/private/jobsk/write.do');" class="bbs_btn type06"><spring:message code="mypage.private.jobsk.title12"/></a>
											</div>
										</c:when>
										<c:when test="${result.jcAgreeStsCd == 'JAS0000000002'}">
											<strong class="title"><spring:message code="mypage.private.jobsk.title7"/> </strong>
											<p class="cont"><spring:message code="mypage.private.jobsk.title8"/> </p>
											<div class="put">
												<a href="javascript:void(0);" onclick="jobsk.fnJobskStatChange();" class="bbs_btn type06"><spring:message code="mypage.private.jobsk.title13"/></a>
											</div>
										</c:when>
										<c:when test="${result.jcAgreeStsCd == 'JAS0000000001'}">
											<strong class="title"><spring:message code="mypage.private.jobsk.title9"/> </strong>
											<p class="cont"><spring:message code="mypage.private.jobsk.title10"/>  <br /><spring:message code="mypage.private.jobsk.title11"/> </p>
											<div class="put">
												<a href="javascript:void(0);" onclick="jobsk.fnJobskStatChange();" class="bbs_btn type06"><spring:message code="mypage.private.jobsk.title13"/></a>
											</div>
										</c:when>
									</c:choose>
								</div>
								<div class="cont_box">
									<ul class="bu type2">
										<li><spring:message code="mypage.private.jobsk.title15"/></li>
										<li><spring:message code="mypage.private.jobsk.title16"/></li>
									</ul>
								</div>
							</div>
						</div>
						<ul class="bu list">
						<li>
							<strong><spring:message code="mypage.private.jobsk.title17"/> :</strong>
							<span><spring:message code="mypage.private.jobsk.title18"/></span>
						</li>
						<li>
							<strong><spring:message code="mypage.private.jobsk.title19"/> :</strong>
							<span><spring:message code="mypage.private.jobsk.title20"/></span>
						</li>
						</ul>
					</div>
					<div class="bbs_btn_wrap clearfix">
						<span class="bbs_left">
							<a href="javascript:void(0)" onclick="fnGoMoveUrl('frm','${pageContext.request.contextPath}/cpes/private/jobsk/list.do');" class="bbs_btn type02"><spring:message code="mypage.private.jobsk.title14"/></a>
						</span>
						<span class="bbs_right">
							<strong><spring:message code="counsel.msg.jobCenter"/> :</strong>
							<c:choose>
								<c:when test="${empty result}">
									<span>${result2}  <a href="tel:${result3}" class="mobile_phone">${result3}</a></span>
								</c:when>
								<c:when test="${!empty result and empty result.jcNm}">
									<span>${result2}  <a href="tel:${result3}" class="mobile_phone">${result3}</a></span>
								</c:when>
								<c:otherwise>
									<span>${result.jcNm}  <a href="tel:${result.jcTel}" class="mobile_phone">${result.jcTel}</a></span>
								</c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->