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


    	});


      	function fnSetPageing(curPage) {
    		$("#currentPageNo").val(curPage);
    		fnGoList("frm");
    	}



	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.compny.vacancy.msg6"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="vacancyIntvwList">
				<div class="bbs_info clearfix tab_confirm"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->

					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/vacancy/intvwList.do" method="post">
					<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
					<input type="hidden" id="condSeq" name="condSeq" value=""/>
					<div class="bbs_left bbs_count">
						<strong class="currently">${paginationInfo.currentPageNo}</strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
					</div>

					<div class="bbs_right bbs_category">
						<fieldset>

							<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
							<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text"><!-- on submit 방지 -->
							<input type="button" onclick="javascript:fnSetPageing('1');" value="Search" class="submit" />
						</fieldset>
					</div>
					</form>
				</div>
				<!-- //bbs_info -->
				<c:if test="${!empty resultList}">
					<c:forEach var="data" items="${resultList}" varStatus="status">
						이름:${data.userNm} || 나이:${data.age} || 성별:${data.genderNm} | 이력서제목:
						<a href="javascript:void(0);" onclick="fnGoCompnyResumeView('${data.resumeSeq}', '${data.vacancySeq}');">${data.resumeTitle}</a>
							학력:${data.eduDegreeNm} || 직종:${data.iscoNm} || 경력:
						<c:choose>
							<c:when test="${data.careerYn == 'Y'}">${data.totCareerTermYearCnt}</c:when>
							<c:otherwise>신입</c:otherwise>
						</c:choose>
						<a href="javascript:void(0);" onclick="fnVacancyView('${data.vacancySeq}','frm');">공고명:${data.vacancyTitle}</a> ||
						면접제의일자:${data.intvwDt}





					</c:forEach>
				</c:if>
				<!-- //bbs_basic list -->






				<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<div class="bbs_left bbs_count">
						<strong class="currently">1</strong>
						<span class="total">/&nbsp;1</span>
						<span class="order">
							<strong class="skip">Change list order</strong>
							<button type="button">Latest</button>
							<button type="button">View</button>
							<button type="button">like</button>
						</span>
					</div>
				</div>
				<!-- //bbs_info -->

				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list edu my clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<span class="check_box">
								<label for="#check1" class="skip">Select</label>
								<input type="checkbox" id="check1" />
							</span>
							<div class="contents_wrap">
								<div class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></div>
								<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
									<div class="title_box new"><!-- 새글일 경우 클래스 new 추가 -->
										<a href="" class="title">13/09/2019 01:00 PM <span>Online Interview</span></a>
									</div>
									<div class="cont_box">
										<div class="cont">
											<span class="con">SAMSUNG Cambodiagy</span>
										</div>
									</div>
									<div class="put_box">
										<a href="" class="link">Construction Project Planning Manager</a>
									</div>
									<div class="other_box type2">
										<span class="top_box">
											<span class="day">30</span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
										</span>
										<span class="bottom_box">
											<button type="button" class="bbs_btn type08 small">Accept</button>
											<button type="button" class="bbs_btn small">Reject</button>
										</span>
									</div>
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
					<span class="bbs_left">

					</span>
					<span class="bbs_right">
						<button type="button" class="bbs_btn delete">Delete</button>
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