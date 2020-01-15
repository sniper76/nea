<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
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

		function fnSetArea(areaCd) {
			$("#condAreaCd").val(areaCd);
			fnSetPageing("1");
		}

	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="eduTrnng.msg2"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="eduTrnngEduTrnngAreaList">
				<div class="bbs_info clearfix tab_confirm"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->

					<form id="frm" name="frm" action="${pageContext.request.contextPath}/eduTrnng/eduTrnngAreaList.do" method="post">
					<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
					<input type="hidden" id="condSeq" name="condSeq" value=""/>
					<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
					<input type="hidden" id="condAreaCd" name="condAreaCd" value="${param.condAreaCd}"/>
					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
					</div>
					<span class="order">
						<h3 class="h0 skip">Change list order</h3>
						<button type="button" onclick="javascript:fnSetSort('LATEST','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.latest"/></button>
						<button type="button" onclick="javascript:fnSetSort('VIEW','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.view"/></button>
						<button type="button" onclick="javascript:fnSetSort('POPULAR','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.view"/></button>
					</span>
					<div class="bbs_right bbs_category">
						<fieldset>
							<legend>Posts Search</legend>



							<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50"/>
							<input style="display:none; with:0px" title="hidden text"><!-- on submit 방지 -->
							<input type="button" onclick="fnSetPageing('1');" value="Search" class="submit" />
						</fieldset>
					</div>
					<c:forEach var="data" items="${resultList2}" varStatus="status">
						<a href="javascript:void(0);" onclick="fnSetArea('${data.lvlCd}');">${data.nm}</a><br/>
					</c:forEach>
					</form>
				</div>
				<!-- //bbs_info -->
				<c:if test="${!empty resultList}">
					<c:forEach var="data" items="${resultList}" varStatus="status">
						상태:${data.recrumtStsNm} || <a href="javascript:void(0);" onclick="fnEduTrnngView('${data.eduTrnngSeq}','frm');">${data.eduTrnngNm} || 지역:${data.addrNm} </a>

						<sec:authorize access="isAnonymous()">
							<a href="${pageContext.request.contextPath}/login.do?retUrl=${pageContext.request.contextPath}/eduTrnng/eduTrnngList.do">[북마크]</a>
						</sec:authorize>


						<div class="other_box">

							<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
								<span id="bkmkSapn_${status.count}"><button type="button" id="btnBkmk_${status.count}" onclick="fnBkmkType2('${data.bkmkSeq}','${data.eduTrnngSeq}',LIKE_CATEGORY_TRNCT,'btnBkmk_${status.count}','bkmkSapn_${status.count}');" class="interest <c:if test="${!empty data.bkmkSeq and data.bkmkSeq != ''}">on</c:if>">북마크등록/삭제</button>
								</span>
							</sec:authorize>
						</div>

						<br/>구분:${data.trnngNatnexpDivNm} || 코스:${data.skillJobProgramCorsNm}
						<br/>모집기간:${data.recurmtBgnDt} ~ ${data.recurmtEndDt} || 수강기간: ${data.eduBgnDt} ~ ${data.eduEndDt}
						<br/>관심수:${data.bkmkCnt} || 조회수:${data.viewCnt} ===================><br/><br/><br/>




					</c:forEach>
				</c:if>
				<!-- //bbs_basic list -->
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
				<!-- //pagination -->



			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->