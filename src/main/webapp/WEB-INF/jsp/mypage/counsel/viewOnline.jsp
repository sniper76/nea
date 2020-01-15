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
						<span>${counselTagetNm} <spring:message code="counsel.msg.title2"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="counselView">

				<div class="bbs_basic view">
					<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/cpes/private/mypage/counsel/list.do" method="post">
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
							<li><span class="bbs_ico like"><spring:message code="counsel.msg.reg.like.cnt"/></span><span id="likeCnt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.likeCnt}" /></span></li>
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
					<div class="bbs_view_box">
						<p>
							<c:set var="cmt" value="${fn:replace(result.qustContent,crcn,br)}" />
							<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
							<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
							<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
							<c:out value="${cmt}" escapeXml="false"/>
						</p>
					</div>

					<div class="bbs_btn_wrap type2 clearfix">
						<div class="bbs_left">
							<h3 class="em_orange margin_t_0"><spring:message code="counsel.msg.ans.content"/></h3>
						</div>
						<div class="bbs_right small">
							<span class="bbs_ico time">Time</span> <c:out value="${result.ansRegDt}"/>
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
							<th scope="row"><spring:message code="counsel.msg.ans.content"/></th>
							<td colspan="3">
								<c:set var="cmt" value="${fn:replace(result.ansContent,crcn,br)}" />
								<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
								<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
								<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
								<c:out value="${cmt}" escapeXml="false"/>
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="counsel.msg.reg.like.attach"/></th>
							<td colspan="3">
								<a href=""><span class="bbs_ico down"><spring:message code="counsel.msg.download"/></span> ScreenShot and capture th whole page.pdf</a>
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

				</div>
				<!-- //bbs_basic view -->

				<div class="bbs_btn_wrap clearfix">
					<span class="bbs_left">
						<a href="javascript:fnGoList('frmSearch');" class="bbs_btn list"><spring:message code="button.list"/></a>
					</span>
					<span class="bbs_right">
						<c:if test="${result.modifyYn == 'Y' }">
						<a href="javascript:void(0);" onclick="javascript:fnGoMoveUrl('frmSearch','${pageContext.request.contextPath}/cpes/private/mypage/counsel/modify.do');" class="bbs_btn modify"><spring:message code="button.modify"/></a>
						<a href="javascript:void(0);" onclick="javascript:fnGoCounselDelete('${result.counselSeq}','MYPAGE_COUNSEL');" class="bbs_btn cancel"><spring:message code="button.delete"/></a>
						</c:if>
					</span>
				</div>
				<!-- //bbs_btn_wrap -->

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->