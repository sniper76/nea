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
						<h2><span>Board photo</span></h2>
					</div>
                </header>

                <div id="contents" class="bulletinlist">
					<div class="bbs_info clearfix tab_confirm"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
						<form id="frm" name="frm" action="${pageContext.request.contextPath}/bulletin/list.do" method="post">
						<input type="hidden" id="condBulletinMngSeq" name="condBulletinMngSeq" value="${param.condBulletinMngSeq}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<input type="hidden" id="pageUnit" name="pageUnit" value="12"/>
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
						</div>
						</form>
					</div>
					<!-- //bbs_info -->

					<div class="bbs_photo">
						<ul class="clearfix"><!-- 한페이지 리스트 12개 -->
							<c:forEach var="data" items="${resultList}" varStatus="status">
								<li>
									<a href="javascript:fnGoBulletinView('frm','${data.bulletinSeq}');" class="contents_box">
										<span class="img_box"><img src="${pageContext.request.contextPath}/images/board/dummy2.png" alt="image" /></span>
										<strong class="title"><c:out value="${data.title}"/></strong>
										<span class="put_box clearfix">
											<span class="date"><span class="bbs_ico time"><spring:message code="counsel.msg.reg.dt"/></span><c:out value="${data.regDt}"/></span>
											<c:if test="${result.likeYn == 'Y'}">
											<span id="likeCnt_${status.count}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.likeCnt}" /></span>
											</c:if>
										</span>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- //bbs_photo -->

					<c:if test="${empty resultList}">
						<div class="bbs_empty">
							<p><spring:message code="counsel.msg.no.data"/></p>
							<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
						</div>
						<!-- //bbs_empty -->
					</c:if>

					<div class="pagination">
						<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
					</div>
                </div>
                <!-- //contents -->
            </article>
        </main>
	<!-- //main.colgroup -->