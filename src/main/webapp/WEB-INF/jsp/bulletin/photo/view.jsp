<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {
			if("<c:out value="${connYn}"/>" != "Y") {//잘못된 접근
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

			if("<c:out value="${noData}"/>" == "Y") {//데이터없음
				alertify.alert("<spring:message code="counsel.msg.no.data"/>", function (e){
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
						<span><c:out value="${result.bulletinNm}"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="bulletinView">

				<div class="bbs_basic view">
					<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/bulletin/list.do" method="post">
					<input type="hidden" id="condBulletinMngSeq" name="condBulletinMngSeq" value="${param.condBulletinMngSeq}"/>
					<input type="hidden" id="condType" name="condType" value="${param.condType}"/>
					<input type="hidden" id="condText" name="condText" value="${param.condText}"/>
					<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
					<input type="hidden" id="condSeq" name="condSeq" value=""/>
					<input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo}"/>
					<input type="hidden" id="pageUnit" name="pageUnit" value="${param.pageUnit}"/>
					</form>
					<div class="bbs_title">
						<strong class="title"><c:out value="${result2.title}"/></strong>
						<div class="bbs_function">
						<c:if test="${result.likeYn == 'Y'}"><!-- 게시판설정에 좋아요가 있을경우 -->
							<span id="likeSpan">
							<c:choose>
								<c:when test="${loginYn == 'N'}">
									<span class="btn_like close"><spring:message code="counsel.msg.reg.like.cnt"/></span>
								</c:when>
								<c:when test="${result2.likeYn == 'Y'}">
									<span class="btn_like send" onclick="javascript:fnLike(LIKE_CATEGORY_BULLETIN,'${result2.bulletinSeq}','likeSpan','likeCnt', '${result2.likeSeq}');"><spring:message code="counsel.msg.reg.like.cnt"/></span>
								</c:when>
								<c:when test="${result2.likeYn == 'N'}">
									<button class="btn_like" onclick="javascript:fnLike(LIKE_CATEGORY_BULLETIN,'${result2.bulletinSeq}','likeSpan','likeCnt');"><spring:message code="counsel.msg.reg.like.cnt"/></button>
								</c:when>
							</c:choose>
							</span>
						</c:if>

						</div>
						<ul class="ico_box">
						<li><span class="bbs_ico time"><spring:message code="counsel.msg.reg.dt"/></span><c:out value="${result2.regDt}"/></li>
						<li><span class="bbs_ico view"><spring:message code="counsel.msg.reg.view.cnt"/></span><fmt:formatNumber type="number" maxFractionDigits="3" value="${result2.viewCnt}" /></li>
						<c:if test="${result.likeYn == 'Y'}">
						<li><span class="bbs_ico like"><spring:message code="counsel.msg.reg.like.cnt"/></span><span id="likeCnt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result2.likeCnt}" /></span></li>
						</c:if>
						</ul>
					</div>
					<!-- //bbs_title -->

					<div class="bbs_content"><c:out value="${result2.content}"/></div>
					<!-- //bbs_content -->

					<ul class="bbs_attachments">

					<c:if test="${result.fileYn == 'Y'}"><!-- 첨부파일 -->
					<li><a href="">ScreenShot and capture the whole Page.pdf</a></li>
					<li><a href="">ScreenShot and capture the whole Page.pdf</a></li>
					</c:if>
					</ul>
					<!-- //bbs_attachments -->

					<ul class="bbs_viewmove">

					<c:forEach var="data" items="${resultList}" varStatus="status">
						<c:choose>
							<c:when test="${data.nextYn == 'N'}">
								<li class="prev">
									<strong><spring:message code="bulletin.msg.prev"/></strong>
									<c:choose>
										<c:when test="${data.emptyYn == 'Y'}">
											<div><c:out value="${data.title}"/></div>
										</c:when>
										<c:otherwise>
											<a href="javascript:fnGoBulletinView('${data.bulletinSeq}');"><c:out value="${data.title}"/></a>
											<span class="ico_box">
												<span class="cont"><span class="bbs_ico time"><spring:message code="counsel.msg.reg.dt"/></span>${data.regDt}</span>
												<span class="cont"><span class="bbs_ico view"><spring:message code="counsel.msg.reg.view.cnt"/></span><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.viewCnt}" /></span>
											</span>
										</c:otherwise>
									</c:choose>
							</c:when>
							<c:otherwise>
								<li class="next">
									<strong><spring:message code="bulletin.msg.next"/></strong>
									<c:choose>
										<c:when test="${data.emptyYn == 'Y'}">
											<div><c:out value="${data.title}"/></div>
										</c:when>
										<c:otherwise>
											<a href="javascript:fnGoBulletinView('frmSearch','${data.bulletinSeq}');"><c:out value="${data.title}"/></a>
											<span class="ico_box">
												<span class="cont"><span class="bbs_ico time"><spring:message code="counsel.msg.reg.dt"/></span>${data.regDt}</span>
												<span class="cont"><span class="bbs_ico view"><spring:message code="counsel.msg.reg.view.cnt"/></span><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.viewCnt}" /></span>
											</span>
										</c:otherwise>
									</c:choose>
							</c:otherwise>
						</c:choose>
						</li>
					</c:forEach>

					</ul>
					<!-- //bbs_viewmove -->

				</div>
				<!-- //bbs_basic view -->

				<div class="bbs_btn_wrap clearfix">
					<span class="bbs_left">
						<a href="javascript:fnGoList('frmSearch');" class="bbs_btn list"><spring:message code="button.list"/></a>
					</span>
				</div>
				<!-- //bbs_btn_wrap -->
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->