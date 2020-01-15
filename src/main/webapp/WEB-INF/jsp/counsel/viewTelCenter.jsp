<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<%
	pageContext.setAttribute("cr", "\r");
	pageContext.setAttribute("cn", "\n");
	pageContext.setAttribute("crcn", "\r\n");
	pageContext.setAttribute("sp", "&nbsp;");
	pageContext.setAttribute("br", "<br/>");
%>

    <script>
    	$(document).ready(function() {
			if("<c:out value="${counselTagetYn}"/>" != "Y") {
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}

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

			if("<c:out value="${result.viewYn}"/>" != "Y") {//비밀글일경우 작성자 본인만 접근 가능
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}

			//console.log("==============userExistYn="+"<c:out value="${userExistYn}"/>");
			//console.log("==============dataExistYn="+"<c:out value="${dataExistYn}"/>");
			//console.log("==============viewYn="+"<c:out value="${result.viewYn}"/>");
		});







	</script>

	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span>${counselTagetNm} <spring:message code="counsel.msg.title2"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="counselView">

				<div class="bbs_basic view">
					<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/cpes/private/counsel/list.do" method="post">
						<input type="hidden" id="condTargetCd" name="condTargetCd" value="${param.condTargetCd}"/>
						<input type="hidden" id="condCateDivCd" name="condCateDivCd" value="${param.condCateDivCd}"/>
						<input type="hidden" id="condType" name="condType" value="${param.condType}"/>
						<input type="hidden" id="condText" name="condText" value="${param.condText}"/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
						<input type="hidden" id="condSeq" name="condSeq" value="${param.condSeq}"/>
					</form>
					<div class="bbs_title">
						<strong class="title"><c:out value="${result.qustTitle}"/></strong>
						<div class="bbs_function">
							<span id="likeSpan">
							<c:choose>
								<c:when test="${result.secretYn == 'Y'}">
									<span class="btn_like close"><spring:message code="counsel.msg.reg.like.cnt"/></span>
								</c:when>
								<c:when test="${result.secretYn == 'N' && result.likeYn == 'Y'}">
									<span class="btn_like send" onclick="javascript:fnLike(LIKE_CATEGORY_COUNSEL,'${result.counselSeq}','likeSpan','likeCnt', '${result.likeSeq}');"><spring:message code="counsel.msg.reg.like.cnt"/></span>
								</c:when>
								<c:otherwise>
									<button class="btn_like" onclick="javascript:fnLike(LIKE_CATEGORY_COUNSEL,'${result.counselSeq}','likeSpan','likeCnt');"><spring:message code="counsel.msg.reg.like.cnt"/></button>
								</c:otherwise>
							</c:choose>
							</span>

						</div>
						<ul class="ico_box">
							<li><span class="bbs_ico user"><spring:message code="counsel.msg.reg.name"/></span><c:out value="${result.regNm}"/></li>
							<li><span class="bbs_ico time"><spring:message code="counsel.msg.reg.dt"/></span><c:out value="${result.qustRegDt}"/></li>
							<li><span class="bbs_ico view"><spring:message code="counsel.msg.reg.view.cnt"/></span><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.viewCnt}" /></li>
							<li><span class="bbs_ico like" id="likeCnt"><spring:message code="counsel.msg.reg.like.cnt"/></span><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.likeCnt}" /></li>
						</ul>
					</div>
					<!-- //bbs_title -->

					<div class="bbs_view count5">
						<ul class="clearfix">
							<li>
								<div class="contents_box">
									<strong class="title_box"><spring:message code="counsel.msg.member.division"/></strong>
									<span class="cont_box"><c:out value="${counselTagetNm}"/></span>
								</div>
							</li>
							<li>
								<div class="contents_box">
									<strong class="title_box"><spring:message code="counsel.msg.jobCenter"/></strong>
									<span class="cont_box"><c:out value="${result.qustJcNm}"/></span>
								</div>
							</li>
							<li>
								<div class="contents_box">
									<strong class="title_box"><spring:message code="counsel.msg.method"/></strong>
									<span class="cont_box"><c:out value="${result.counselMethodDivNm}"/></span>
								</div>
							</li>
							<li>
								<div class="contents_box">
									<strong class="title_box"><spring:message code="counsel.msg.openYn"/></strong>
									<span class="cont_box">

										<c:choose>
											<c:when test="${result.secretYn == 'Y'}">
												<spring:message code="counsel.msg.openYn.n"/>
											</c:when>
											<c:otherwise>
												<spring:message code="counsel.msg.openYn.y"/>
											</c:otherwise>
										</c:choose>
									</span>
								</div>
							</li>
							<li>
								<div class="contents_box">
									<strong class="title_box"><spring:message code="counsel.msg.stat.nm"/></strong>
									<span class="cont_box"><span class="bbs_statuses type02"><c:out value="${result.counselStsNm}"/></span></span>
								</div>
							</li>
						</ul>
					</div>
					<!-- //bbs_view -->


					<h3><spring:message code="counsel.msg.contents"/></h3>
					<table class="bbs_table">
						<caption>Consulting Write -  Preferred date , Other request</caption>
						<colgroup>
							<col style="width:15%;" />
							<col style="width:85%;" />
						</colgroup>
						<tbody>
						<tr>
							<th scope="row"><spring:message code="counsel.msg.datetime"/></th>
							<td>${result.hopeCounselDt} ${result.hopeCounselBgnTime}:00 ${result.hopeCounselBgnAmpm} - ${result.hopeCounselEndTime}:00 ${result.hopeCounselEndAmpm}</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="counsel.msg.other"/></th>
							<td>
								<c:set var="cmt" value="${fn:replace(result.qustEtcReq,crcn,br)}" />
								<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
								<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
								<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
								<c:out value="${cmt}" escapeXml="false"/>
							</td>
						</tr>
						</tbody>
					</table>
					<!-- //bbs_table -->

					<div class="bbs_btn_wrap type2 clearfix">
						<div class="bbs_left">
							<h3 class="em_orange margin_t_0"><spring:message code="counsel.msg.ans.content"/></h3>
						</div>
						<div class="bbs_right small">
							<span class="bbs_ico time"><spring:message code="counsel.msg.reg.dt"/></span> <c:out value="${result.ansRegDt}"/>
						</div>
					</div>
					<table class="bbs_table">
						<caption>Consulting Write - Preferred date , Other request</caption>
						<colgroup>
							<col style="width:15%;" />
							<col style="width:35%;" />
							<col style="width:15%;" />
							<col style="width:35%;" />
						</colgroup>
						<tbody>
						<tr>
							<th scope="row"><spring:message code="counsel.msg.datetime2"/></th>
							<td colspan="3">
								<c:if test="${!empty result.counselDt}">
								${result.counselDt} ${result.counselHour}:${result.counselMinute} ${result.counselAmpm}
								</c:if>
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="counsel.msg.alram"/></th>
							<td colspan="3">
								<c:set var="cmt" value="${fn:replace(result.counselNtce,crcn,br)}" />
								<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
								<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
								<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
								<c:out value="${cmt}" escapeXml="false"/>

							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="counsel.msg.ans.counsellor.nm"/></th>
							<td><c:out value="${result.ansRegNm}"/></td>
							<th scope="row"><spring:message code="counsel.msg.ans.counsellor.tel"/></th>
							<td><c:out value="${result.userTel}"/></td>
						</tr>
						</tbody>
					</table>
					<!-- //bbs_table -->

					<p class="bbs_write_bottom">* <spring:message code="counsel.msg.guide"/></p>

				</div>
				<!-- //bbs_basic view -->

				<div class="bbs_btn_wrap clearfix">
					<span class="bbs_left">
						<a href="javascript:fnGoList('frmSearch');" class="bbs_btn list"><spring:message code="button.list"/></a>
					</span>
					<span class="bbs_right">
						<c:if test="${result.modifyYn == 'Y' }">
						<a href="javascript:fnGoMoveUrl('frmSearch','${pageContext.request.contextPath}/cpes/private/counsel/modify.do');" class="bbs_btn modify"><spring:message code="button.modify"/></a>
						<a href="javascript:fnGoCounselDelete('${result.counselSeq}');" class="bbs_btn cancel"><spring:message code="button.delete"/></a>
						</c:if>
					</span>
				</div>
				<!-- //bbs_btn_wrap -->

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->