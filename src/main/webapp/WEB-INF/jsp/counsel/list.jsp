<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
			if("<c:out value="${counselTagetYn}"/>" != "Y") {//잘못된 접근
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}

			//검색키워드 enter
			$("#condText").keypress(function( event ) {
				if( event.which == 13 ) {
					fnSetPageing("1");
				}
			});

			fnSetSelecteBox("condType","<c:out value="${param.condType}"/>");


		});


    	function fnSetPageing(curPage) {
    		$("#currentPageNo").val(curPage);
    		fnGoList("frm");
    	}


    	function fnGoCounselView(seq) {
    		$("#condSeq").val(seq);
    		$("#frm").attr('action', "${pageContext.request.contextPath}/cpes/private/counsel/view.do");
    		$("#frm").submit();
    	}

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

	       	<div id="contents" class="counselList">
				<div class="bbs_info clearfix tab_confirm"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/private/counsel/list.do" method="post">
					<input type="hidden" id="condTargetCd" name="condTargetCd" value="${param.condTargetCd}"/>
					<input type="hidden" id="condCateDivCd" name="condCateDivCd" value="${param.condCateDivCd}"/>
					<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
					<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
					<input type="hidden" id="condSeq" name="condSeq" value=""/>
					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
						<span class="order">
							<h3 class="h0 skip"><spring:message code="counsel.msg.sort.change"/></h3>
							<button type="button" onclick="javascript:fnSetSort('LATEST','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.latest"/></button>
							<button type="button" onclick="javascript:fnSetSort('VIEW','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.view"/></button>
							<button type="button" onclick="javascript:fnSetSort('LIKE','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.like"/></button>
						</span>
					</div>
					<div class="bbs_right bbs_category">
						<fieldset>
							<legend><spring:message code="counsel.msg.search.cond"/></legend>
							<select id="condType" name="condType" title="Select classification">
								<option value=""><spring:message code="counsel.msg.all"/></option>
								<option value="TITLE" ><spring:message code="counsel.msg.title"/></option>
								<option value="CONTENT" ><spring:message code="counsel.msg.contents"/></option>
								<option value="NAME" ><spring:message code="search.name"/></option>
							</select>
							<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
							<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text"><!-- on submit 방지 -->
							<input type="button" onclick="javascript:fnSetPageing('1');" value="Search" class="submit" />
						</fieldset>
					</div>
					</form>
				</div>
				<!-- //bbs_info -->
				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="bbs_list clearfix"><!-- 리스트 페이지에서 첨부파일 다운로드 기능이 있는 경우 클래스 has_attachment 추가, 리스트 페이지에서 상태 표시 있을 경우 클래스 has_status 추가 -->

						<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<div class="contents_box"><!-- 공지일 경우 클래스 noitce 추가 -->
								<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새 게시물일 경우 클래스  new 추가 -->

									<c:choose>
										<c:when test="${data.secretYn == 'Y'}">
											<span class="bbs_statuses type01"><spring:message code="counsel.msg.openYn.n"/></span>
										</c:when>
										<c:otherwise>
											<span class="bbs_statuses type02"><spring:message code="counsel.msg.openYn.y"/></span>
										</c:otherwise>
									</c:choose>


									<c:choose>
										<c:when test="${data.viewYn == 'Y'}">
											<a href="javascript:fnGoCounselView('${data.counselSeq}');" class="title"><c:out value="${data.qustTitle}"/></a><!-- 댓글 있을 경우 comment 추가 -->
										</c:when>
										<c:otherwise>
											<c:out value="${data.qustTitle}"/>
										</c:otherwise>
									</c:choose>


									<div class="bbs_function">
										<span class="bbs_status type${data.counselStsCd}"><c:out value="${data.counselStsNm}"/></span><!-- 상태 변경에 따라 클래스 type01 .... type03 추가 -->
										<span id="likeSpan_${status.count}">
										<c:choose>
											<c:when test="${data.secretYn == 'Y'}">
												<span class="btn_like close"><spring:message code="counsel.msg.reg.like.cnt"/></span>
											</c:when>
											<c:when test="${data.secretYn == 'N' && data.likeYn == 'Y'}">
												<span class="btn_like send" onclick="javascript:fnLike(LIKE_CATEGORY_COUNSEL,'${data.counselSeq}','likeSpan_${status.count}','likeCnt_${status.count}', '${data.likeSeq}');"><spring:message code="counsel.msg.reg.like.cnt"/></span>
											</c:when>
											<c:otherwise>
												<button class="btn_like" onclick="javascript:fnLike(LIKE_CATEGORY_COUNSEL,'${data.counselSeq}','likeSpan_${status.count}','likeCnt_${status.count}');"><spring:message code="counsel.msg.reg.like.cnt"/></button>
											</c:otherwise>
										</c:choose>
										</span>

									</div>
								</div>
								<div class="cont_box">
									<span class="cont"><span class="bbs_ico online">${data.counselMethodDivNm}</span>${data.counselMethodDivNm}</span>
									<span class="cont"><span class="bbs_ico user"><spring:message code="counsel.msg.reg.name"/></span>${data.regNm}</span>
									<span class="cont"><span class="bbs_ico time"><spring:message code="counsel.msg.reg.dt"/></span>${data.qustRegDt}</span>
									<span class="cont"><span class="bbs_ico view"><spring:message code="counsel.msg.reg.view.cnt"/></span><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.viewCnt}" /></span>
									<span class="cont"><span class="bbs_ico like"><spring:message code="counsel.msg.reg.like.cnt"/></span>
										<span id="likeCnt_${status.count}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.likeCnt}" /></span>
									</span>
									<%-- <span class="cont"><span class="bbs_ico attachments"><spring:message code="counsel.msg.reg.like.attach"/><span>2</span></span></span><!-- 첨부파일 있을 경우 표기 사용(첨부파일이 2개 이상일 경우 <span>2</span>) --> --%>
								</div>

							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
				</c:if>
				<!-- //bbs_basic list -->
				<c:if test="${empty resultList}">
				<div class="bbs_empty">
					<p><spring:message code="counsel.msg.no.data"/></p>
					<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
				</div>
				<!-- //bbs_empty -->
				</c:if>


				<div class="bbs_btn_wrap clearfix">
					<span class="bbs_right">
						<a href="javascript:fnGoWrite('frm','${pageContext.request.contextPath}/cpes/private/counsel/write.do');" class="bbs_btn write"><spring:message code="button.create"/></a>
					</span>
				</div>
				<!-- //bbs_btn_wrap -->


				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->



			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->