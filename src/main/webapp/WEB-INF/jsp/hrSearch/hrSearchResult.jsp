<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
	    $(document).ready(function() {

	    	var searchFlag = $('#searchFlag').val();
	    	var searchForm = null;

			if(searchFlag == "simple"){
		    	searchForm = $('#simpleSearchForm');
			}else if(searchFlag == "detail"){
				searchForm = $('#detailSearchForm');
			}

			searchForm.find('input[name=currentPageNo]').val($('#currentPageNo').val());

			$('.btn_sort').on('click', function(e){
				var sortFlag = $(e.target).html().toLowerCase();
				searchForm.find('input[name=sortFlag]').val(sortFlag);
				searchForm.submit();
			});

		});

		function fnSetPageing(curPage) {
			$("#currentPageNo").val(curPage);

			var searchFlag = $('#searchFlag').val();

			if(searchFlag == "simple"){
		    	$('#simpleSearchForm').find('input[name=currentPageNo]').val(curPage);
		    	$('#simpleSearchForm').submit();
			}else if(searchFlag == "detail"){
				$('#detailSearchForm').find('input[name=currentPageNo]').val(curPage);
				$('#detailSearchForm').submit();
			}
		}
	</script>
<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2><span>CV Search- Detail</span></h2>
			</div>
		</header>

		<div id="contents" class="hrSearchHrSearchResult">
			<input type="hidden" id="currentPageNo" value="${paginationInfo.currentPageNo}"/>
			<c:choose>
				<c:when test="${not empty param.searchFlag}">
					<input type="hidden" id="searchFlag" value="${param.searchFlag}"/>
				</c:when>
				<c:otherwise>
					<input type="hidden" id="searchFlag" value="simple"/>
				</c:otherwise>
			</c:choose>
			<div class="srch_box">
				<c:import url="${pageContext.request.contextPath}/cpes/compny/hrSearch/searchForm.do">
					<c:param value="${param}" name="HrSearchBean"></c:param>
				</c:import>
			</div>
			<!-- //srch_box -->

			<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
				<div class="bbs_left bbs_count">
					<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
					<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
					<span class="order">
						<h3 class="h0 skip">Change list order</h3>
						<button type="button" class="btn_sort">Latest</button>
						<button type="button" class="btn_sort">View</button>
						<button type="button" class="btn_sort">like</button>
					</span>
				</div>
			</div>
			<!-- //bbs_info -->

			<div class="bbs_basic">
				<ul class="recruitment_list talent clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<c:if test="${empty resultList }">
						<li class="bbs_empty">
							<p><spring:message code="counsel.msg.no.data"/></p>
						</li>
					</c:if>
					<c:forEach items="${resultList }" var="result">
						<li>
							<div class="contents_wrap male"><!-- 남성일 경우 클래스 male 추가, 여성일 경우 클래스 femail 추가 -->
								<div class="img_box">
									<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${result.filePath}" alt="image" onerror="fnNoImage(this)"/>
								</div>
								<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
									<c:choose>
										<c:when test="${result.newYn eq 'Y' }">
											<div class="title_box new"><!-- 새글일 경우 클래스 new 추가 -->
										</c:when>
										<c:otherwise>
											<div class="title_box">
										</c:otherwise>
									</c:choose>
										<span class="tit"><c:out value="${result.preferJobTitle }" /></span>
										<a href="javascript:void(0);" onclick="fnGoCompnyResumeView('${result.resumeSeq}');">
											<c:out value="${result.resumeTitle }" escapeXml="false" />
										</a>
									</div>
									<div class="top_box">
										<span class="name"><c:out value="${result.userNm }" /></span>
										<span class="age">
											(<span><c:out value="${result.genderNm }" /></span> <span><c:out value="${result.age }" /></span>)
										</span>
									</div>
									<div class="cont_box">
										<span class="con"><c:out value="${result.totCareerTermYearCnt }" />year+</span>
										<span class="con"><c:out value="${result.eduDegreeNm }" /></span>
										<span class="con"><c:out value="${result.addrNm }" /></span>
									</div>
									<div class="other_box">
										<span class="top_box">
											<span class="date type2"><strong><c:out value="${result.jcAgreeDt }" /></strong> updated</span>
											<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
										</span>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- //bbs_basic list -->

			<div class="pagination">
				<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
			</div>
			<!--  //pagination -->
		</div>
                <!-- //contents -->
	</article>
</main>