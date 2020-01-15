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


			//comment list html
			fnCommentList("<c:out value="${result2.bulletinSeq}"/>","commentList","1","1");//최최 1페이지



			$("#frm").ajaxForm({
				dataType : AJAX_DATA_TYPE_JSON,
				beforeSubmit : function(formData, $form, options) {

					//제목,title
					if($("#title").val() == "") {
						alertify.alert("<spring:message code="counsel.errors.title"/>", function (e){
							$("#title").focus();
						});
						return false;
					}

					//내용,content
					if($("#content").val() == "") {
						alertify.alert("<spring:message code="counsel.errors.contents"/>", function (e){
							$("#content").focus();
						});
						return false;
					}



				},
				success : function(json, statusText, xhr, $form) {
					if (json.result.successYn == "Y") {
						alertify.alert("<spring:message code="counsel.msg.reg.ok"/>", function (e){
							fnGoMoveUrl('frmSearch', '${pageContext.request.contextPath}/community/list.do');
						});

					} else {
						if(json.result.statCd == "01") {
							alertify.alert("<spring:message code="bulletin.errors.login.after"/>", function (e){
								location.href= contextPath + "/community/list.do"
							});
							return false;
						} else {
							alertify.alert("<spring:message code="errors.ajax.fail"/>");
						}
					}
				},
				error : function(xhr) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			});

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

	       	<div id="contents" class="communityView">
				<div class="bbs_basic view">
					<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/community/list.do" method="post">
					<input type="hidden" id="condType" name="condType" value="${param.condType}"/>
					<input type="hidden" id="condText" name="condText" value="${param.condText}"/>
					<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
					<input type="hidden" id="condSeq" name="condSeq" value="${param.condSeq}"/>
					<input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo}"/>
					</form>
					<div class="bbs_title">
						<strong class="title"><c:out value="${result2.title}" escapeXml="false"/></strong>
						<div class="bbs_function">
							<c:if test="${result.likeYn == 'Y'}"><!-- 게시판설정에 좋아요가 있을경우 -->
								<span id="likeSpan">
								<c:choose>
									<c:when test="${loginYn == 'N'}">
										<span class="btn_like close"><spring:message code="counsel.msg.reg.like.cnt"/></span>
									</c:when>
									<c:when test="${result2.likeYn == 'Y'}">
										<span class="btn_like send" onclick="javascript:fnLike(LIKE_CATEGORY_COMMUNITY,'${result2.bulletinSeq}','likeSpan','likeCnt', '${result2.likeSeq}');"><spring:message code="counsel.msg.reg.like.cnt"/></span>
									</c:when>
									<c:when test="${result2.likeYn == 'N'}">
										<button class="btn_like" onclick="javascript:fnLike(LIKE_CATEGORY_COMMUNITY,'${result2.bulletinSeq}','likeSpan','likeCnt');"><spring:message code="counsel.msg.reg.like.cnt"/></button>
									</c:when>
								</c:choose>
								</span>
							</c:if>
						</div>
						<ul class="ico_box">
							<li><span class="bbs_ico user"><spring:message code="counsel.msg.reg.name"/></span><c:out value="${result2.regNm}"/></li>
							<li><span class="bbs_ico time"><spring:message code="counsel.msg.reg.dt"/></span><c:out value="${result2.regDt}"/></li>
							<li><span class="bbs_ico view"><spring:message code="counsel.msg.reg.view.cnt"/></span><fmt:formatNumber type="number" maxFractionDigits="3" value="${result2.viewCnt}" /></li>
							<c:if test="${result.likeYn == 'Y'}">
								<li><span class="bbs_ico like"><spring:message code="counsel.msg.reg.like.cnt"/></span><span id="likeCnt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result2.likeCnt}" /></span></li>
							</c:if>
						</ul>
					</div>
					<!-- //bbs_title -->

					<div class="bbs_content">
						<c:set var="cmt" value="${fn:replace(result2.content,crcn,br)}" />
						<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
						<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
						<!-- phj : 방법을 찾지 못해 임시로 처리 -->
						<c:set var="cmt" value="${fn:replace(cmt,'&lt;','<')}" />
						<c:set var="cmt" value="${fn:replace(cmt,'&gt;','>')}" />
						<%-- <c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" /> --%>
						<c:out value="${cmt}" escapeXml="false"/>
					</div>
					<!-- //bbs_content -->

					<ul class="bbs_attachments">
					<li><a href="">ScreenShot and capture the whole Page.pdf</a></li>
					<li><a href="">ScreenShot and capture the whole Page.pdf</a></li>
					</ul>
					<!-- //bbs_attachments -->

					<!-- comment -->
					<div class="bbs_reply">
						<div class="top_box">
							<h3 class="skip"><spring:message code="button.create"/></h3>
							<p><spring:message code="bulletin.msg.comment.nm"/>
								<strong id="orgCommentCnt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result2.commentCnt}" /></strong>
								<span id="commentByteCnt">0</span>/<span>300</span>
							</p>
						</div>
						<c:if test="${loginYn == 'Y'}">
						<div class="reply_form">
							<form id="orgCommentFrm" name="orgCommentFrm" action="${pageContext.request.contextPath}/bulletin/commentWrite.do" method="post">
								<fieldset>
									<legend>Write a comment</legend>
									<div class="reply_txt">
										<textarea id="content" name="content" title="Write a comment" onBlur="javascript:fnBytesHandler(this,'commentByteCnt',300);"></textarea>
									</div>
									<input type="button" onclick="javascript:fnCommentWrite('${result2.bulletinSeq}','','1','1','content');" value="<spring:message code="button.create"/>" class="submit" />
								</fieldset>
							</form>
						</div>
						</c:if>
						<!-- //reply_form -->

						<div id="commentList" class="reply_list"></div>
					</div>


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
											<a href="javascript:fnGoCommunityView('${data.bulletinSeq}');"><c:out value="${data.title}"/></a>
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
											<a href="javascript:fnGoCommunityView('frmSearch','${data.bulletinSeq}');"><c:out value="${data.title}"/></a>
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
				<c:if test="${result2.modifyYn == 'Y'}">
				<span class="bbs_right">
					<a href="javascript:void(0);" onclick="javascript:fnGoMoveUrl('frmSearch','${pageContext.request.contextPath}/community/modify.do');" class="bbs_btn modify"><spring:message code="button.modify"/></a>
					<a href="javascript:void(0);" onclick="javascript:fnGoBulletinDelete('frmSearch','${result2.bulletinSeq}');" class="bbs_btn delete"><spring:message code="button.delete"/></a>
				</span>
				</c:if>

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->