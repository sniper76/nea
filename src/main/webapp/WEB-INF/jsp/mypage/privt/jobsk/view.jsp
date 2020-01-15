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

			if("<c:out value="${dataExistYn}"/>" == "N") {//데이터가 존재하지않음
				alertify.alert("<spring:message code="info.nodata.msg"/>", function (e){
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

	       	<div id="contents" class="jobskView">
	       		<form id="frm" name="frm"  method="post">
	       		</form>

				<div class="job_srch_info">
					<div class="title_box">
						<h3><spring:message code="mypage.private.jobsk.title2"/></h3>
						<p><spring:message code="mypage.private.jobsk.title3"/> <br /><spring:message code="mypage.private.jobsk.title4"/></p>
					</div>
					<div class="contents_box">
						<div class="list_box">
							<ul class="clearfix">
								<li>
									<div class="cont_box">
										<strong class="title"><spring:message code="mypage.private.jobsk.title24"/></strong>
										<span class="cont">
											<c:choose>
												<c:when test="${result.nowWorkYn == 'Y'}"><spring:message code="compny.vacancy.msg.title13"/></c:when>
												<c:otherwise><spring:message code="compny.vacancy.msg.title14"/></c:otherwise>
											</c:choose>
										</span>
									</div>
								</li>
								<li>
									<div class="cont_box">
										<strong class="title"><spring:message code="mypage.private.jobsk.title25"/></strong>
										<span class="cont">
											<c:choose>
												<c:when test="${result.urgentJobseekYn == 'Y'}"><spring:message code="compny.vacancy.msg.title13"/></c:when>
												<c:otherwise><spring:message code="compny.vacancy.msg.title14"/></c:otherwise>
											</c:choose>
										</span>
									</div>
								</li>
								<li>
									<div class="cont_box">
										<strong class="title"><spring:message code="mypage.private.jobsk.title26"/></strong>
										<span class="cont">
											${result.resumeTitle}
										</span>
									</div>
								</li>
								<li>
									<div class="cont_box">
										<strong class="title"><spring:message code="mypage.private.jobsk.title35"/></strong>
										<span class="cont">
											<c:choose>
												<c:when test="${result.jobskStsNm ==  'C'}"><spring:message code="mypage.private.jobsk.title30"/></c:when>
												<c:when test="${result.jobskStsNm ==  'E'}"><spring:message code="mypage.private.jobsk.title31"/></c:when>
												<c:otherwise><spring:message code="mypage.private.jobsk.title32"/></c:otherwise>
											</c:choose>
											(${result.regDt} ~ ${result.jobskEndDt})
										</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="list_box02">
							<ul class="clearfix">
							<c:choose>
								<c:when test="${empty result}">
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="counsel.msg.jobCenter"/></strong>
											<span class="cont">${result2}</span>
										</div>
									</li>
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="member.join.step.two.compnay.msg11"/></strong>
											<span class="cont"></span>
										</div>
									</li>
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="counsel.msg.ans.counsellor.tel"/></strong>
											<span class="cont"><a href="tel:${result3}" class="mobile_phone">${result3}</a></span>
										</div>
									</li>
								</c:when>
								<c:when test="${!empty result and empty result.jcNm}">
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="counsel.msg.jobCenter"/></strong>
											<span class="cont">${result2}</span>
										</div>
									</li>
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="member.join.step.two.compnay.msg11"/></strong>
											<span class="cont"></span>
										</div>
									</li>
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="counsel.msg.ans.counsellor.tel"/></strong>
											<span class="cont"><a href="tel:${result3}" class="mobile_phone">${result3}</a></span>
										</div>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="counsel.msg.jobCenter"/></strong>
											<span class="cont">${result.jcNm}</span>
										</div>
									</li>
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="member.join.step.two.compnay.msg11"/></strong>
											<span class="cont">${result.jcUserNm}</span>
										</div>
									</li>
									<li>
										<div class="cont_box">
											<strong class="title"><spring:message code="counsel.msg.ans.counsellor.tel"/></strong>
											<span class="cont"><a href="tel:${result.jcTel}" class="mobile_phone">${result.jcTel}</a></span>
										</div>
									</li>
								</c:otherwise>
							</c:choose>
							</ul>
						</div>
						<p><spring:message code="mypage.private.jobsk.title36"/></p>
					</div>
				</div>
				<div class="bbs_btn_wrap clearfix">
					<span class="bbs_left">
						<a href="${pageContext.request.contextPath}/cpes/private/jobsk/list.do" class="bbs_btn list"><spring:message code="button.list"/></a>
					</span>
					<c:if test="${result.jobskStsCd != 'JSC0000000003' and result.priResumeYn == 'Y'}">
					<span class="bbs_right">
						<a href="javascript:void(0);" onclick="jobsk.fnJobskStatChange();" class="bbs_btn type02"><spring:message code="mypage.private.jobsk.title13"/></a>
					</span>
					</c:if>
				</div>

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->