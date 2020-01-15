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

    	function fnJobskView(seq) {
    		$("#condSeq").val(seq);
    		$("#frm").attr('action', "${pageContext.request.contextPath}/cpes/private/jobsk/view.do");
    		$("#frm").submit();
    	}


	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.jobsk.title28"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="jobskList">
	       		<form id="frm" name="frm"  method="post">
	       			<input type="hidden" id="pageDiv" name="pageDiv" value="LIST"/>
	       			<input type="hidden" id="condSeq" name="condSeq"/>
	       		</form>


				<div class="bbs_basic">
					<ul class="cv_list type2 clearfix">
						<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<div class="contents_box en"><!-- 영문 이력서일 경우 클래스 en , 크메르 이력서일 경우 클래스 kh 추가 -->
								<div class="title_box">
									<span class="state">
										<c:choose>
											<c:when test="${data.jobskStsNm ==  'C'}"><spring:message code="mypage.private.jobsk.title30"/></c:when>
											<c:when test="${data.jobskStsNm ==  'E'}"><spring:message code="mypage.private.jobsk.title31"/></c:when>
											<c:otherwise><spring:message code="mypage.private.jobsk.title32"/></c:otherwise>
										</c:choose>
									</span>
									<a href="javascript:void(0);" onclick="fnJobskView('${data.jobskReqSeq}');" class="title">
										<c:if test="${data.jcAgreeStsCd == 'JAS0000000003'}"><!-- 반려 -->
											[<spring:message code="compny.vacancy.msg.title75"/>]
										</c:if>
										${data.resumeTitle}
									</a>
									<div class="bbs_function">
										<c:if test="${data.jobskStsNm != 'E' and data.urgentJobseekYn !=  'Y'}"><!-- 종료가아니고 긴급 Y 알선신청 가능 -->
											<button type="button" onclick="jobsk.fnJobskUrgency('${data.resumeSeq}');" class="bbs_btn noround small"><spring:message code="mypage.private.jobsk.title37"/></button>
										</c:if>
										<c:if test="${data.jobskStsNm != 'E'}"><!-- 종료가아니면  -->
											<button type="button" onclick="jobsk.fnJobskStatChange();" class="bbs_btn noround small"><spring:message code="mypage.private.jobsk.title13"/></button>
										</c:if>
										<c:if test="${data.jobskStsNm != 'C'}"><!-- 구직활동중이 아니면  -->
											<button type="button" onclick="jobsk.fnJobskDelete('${data.jobskReqSeq}');" class="bbs_btn noround small"><spring:message code="button.delete"/></button>
										</c:if>

									</div>
								</div>
								<div class="cont_box">
									<span class="cont"><span class="bbs_ico time">Time</span>
										${data.regDt}~
										<c:choose>
											<c:when test="${data.jobskStsNm !=  'E'}"><spring:message code="mypage.private.jobsk.title32"/></c:when>
											<c:otherwise>${data.jobskEndDt}</c:otherwise>
										</c:choose>
									</span>
									<c:if test="${data.urgentJobseekYn ==  'Y'}">
										<span class="cont"><spring:message code="mypage.private.jobsk.title33"/></span>
									</c:if>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<!-- //bbs_basic list -->
				<c:if test="${empty resultList }">
				<div class="bbs_empty">
					<p><spring:message code="mypage.private.jobsk.title34"/></p>
				</div>
				</c:if>
				<!-- //bbs_empty -->

				<div class="bbs_btn_wrap clearfix">
					<span class="bbs_left">

					</span>
					<c:if test="${empty result or result.jcAgreeStsCd == 'JAS0000000003'}">
					<span class="bbs_right">
						<button type="button" onclick="fnGoMoveUrl('frm','${pageContext.request.contextPath}/cpes/private/jobsk/write.do');" class="bbs_btn type06"><spring:message code="mypage.private.jobsk.title12"/></button>
					</span>
					</c:if>
				</div>
				<!-- //bbs_btn_wrap -->



			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->