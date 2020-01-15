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

			fnSetSelecteBox("condType",'${param.condType}');


			//검색키워드 enter
			$("#condText").keypress(function( event ) {
				if( event.which == 13 ) {
					fnSetPageing("1");
				}
			});
		});


       	function fnSetPageing(curPage) {
       		$("#currentPageNo").val(curPage);
    		fnGoList("frm");
    	}

       	function fnGoView(seq) {
    		$("#condSeq").val(seq);
    		$("#frm").attr('action', "${pageContext.request.contextPath}/bulletin/view.do");
    		$("#frm").submit();
    	}

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

                <div id="contents" class="bulletinlist">
					<div class="bbs_info clearfix tab_confirm"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
						<form id="frm" name="frm" action="${pageContext.request.contextPath}/bulletin/list.do" method="post">
						<input type="hidden" id="condBulletinMngSeq" name="condBulletinMngSeq" value="${param.condBulletinMngSeq}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<div class="bbs_left bbs_count">
							<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
							<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
							<span class="order">
								<h3 class="h0 skip">Change list order</h3>
								<button type="button" onclick="javascript:fnSetSort('LATEST','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.latest"/></button>
								<button type="button" onclick="javascript:fnSetSort('VIEW','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.view"/></button>
								<c:if test="${result.likeYn == 'Y'}">
								<button type="button" onclick="javascript:fnSetSort('LIKE','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.like"/></button>
								</c:if>
							</span>
						</div>
						<div class="bbs_right bbs_category">
							<form method="get">
								<fieldset>
									<legend>Posts Search</legend>
									<select id="condType" name="condType" title="Select classification">
										<option value=""><spring:message code="counsel.msg.all"/></option>
										<option value="TITLE" ><spring:message code="counsel.msg.title"/></option>
										<option value="CONTENT" ><spring:message code="counsel.msg.contents"/></option>
										<option value="NAME" ><spring:message code="search.name"/></option>
									</select>
									<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50"/>
									<input style="display:none; with:0px" title="hidden text"><!-- on submit 방지 -->
									<input type="button" onclick="javascript:fnSetPageing('1');" value="Search" class="submit" />
								</fieldset>
							</form>
						</div>
						</form>
					</div>
					<!-- //bbs_info -->

					<div class="bbs_basic">
						<ul class="bbs_list clearfix bbs_summary">
							<c:forEach var="data" items="${resultList}" varStatus="status">
								<li>
									<div class="contents_box <c:if test="${data.ntcYn == 'Y'}">notice</c:if>"><!-- 공지일 경우 클래스 noitce 추가 -->
										<div class="img_box"><img src="${pageContext.request.contextPath}/images/board/dummy.png" alt=" image" /></div>
										<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새 게시물일 경우 클래스  new 추가 -->
											<a href="javascript:fnGoView('${data.bulletinSeq}')">
												<strong class="title"><c:out value="${data.title}"/></strong>
												<span class="cont">
													<c:choose>
														<c:when test="${fn:length(data.content) > 30}">
															<c:out value="${fn:substring(data.content,0,30)}"/>...
														</c:when>
														<c:otherwise>
															<c:out value="${data.content}"/>
														</c:otherwise>
													</c:choose>
												</span>
											</a>
											<div class="bbs_function">
												<c:if test="${result.likeYn == 'Y'}"><!-- 게시판설정에 좋아요가 있을경우 -->
													<span id="likeSpan_${status.count}">
													<c:choose>
														<c:when test="${loginYn == 'N'}">
															<span class="btn_like close"><spring:message code="counsel.msg.reg.like.cnt"/></span>
														</c:when>
														<c:when test="${data.likeYn == 'Y'}">
															<span class="btn_like send" onclick="javascript:fnLike(LIKE_CATEGORY_BULLETIN,'${data.bulletinSeq}','likeSpan_${status.count}','likeCnt_${status.count}', '${data.likeSeq}');"><spring:message code="counsel.msg.reg.like.cnt"/></span>
														</c:when>
														<c:when test="${data.likeYn == 'N'}">
															<button class="btn_like" onclick="javascript:fnLike(LIKE_CATEGORY_BULLETIN,'${data.bulletinSeq}','likeSpan_${status.count}','likeCnt_${status.count}');"><spring:message code="counsel.msg.reg.like.cnt"/></button>
														</c:when>
													</c:choose>
													</span>
												</c:if>
											</div>

										</div>
										<div class="cont_box">
											<span class="cont"><span class="bbs_ico time"><spring:message code="counsel.msg.reg.dt"/></span><c:out value="${data.regDt}"/></span>
											<span class="cont"><span class="bbs_ico view"><spring:message code="counsel.msg.reg.view.cnt"/></span><c:out value="${data.viewCnt}"/></span>
											<c:if test="${result.likeYn == 'Y'}">
												<span class="cont">
													<span class="bbs_ico like"><spring:message code="counsel.msg.reg.like.cnt"/></span>
													<span id="likeCnt_${status.count}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.likeCnt}" /></span>
												</span>
											</c:if>
											<c:if test="${result.fileYn == 'Y'}">
											<span class="cont">
												<span class="bbs_ico attachments"><spring:message code="counsel.msg.download"/>
													<span>2</span>
												</span>
											</span><!-- 첨부파일 있을 경우 표기 사용(첨부파일이 2개 이상일 경우 <span>2</span>) -->
											</c:if>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- //bbs_basic list -->

					<c:if test="${empty resultList}">
						<div class="bbs_empty">
							<p><spring:message code="counsel.msg.no.data"/></p>
							<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
						</div>
						<!-- //bbs_empty -->
					</c:if>
					<!-- //bbs_empty -->
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