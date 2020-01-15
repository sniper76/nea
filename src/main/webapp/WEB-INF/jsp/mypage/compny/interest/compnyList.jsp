<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}


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
						<span><spring:message code="mypage.compny.interest.title2"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="interestCompnyList">
				<div class="bbs_info clearfix tab_confirm"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/interest/compnyList.do" method="post">
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
					</form>
					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
					</div>
				</div>
				<!-- bbs_info  -->
				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list talent clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
						<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
			<!-- 				<span class="check_box">
								<label for="#check3" class="skip">Select</label>
								<input type="checkbox" id="check3" />
							</span> -->
							<c:set var="genderCdClass" value="male"/>
							<c:if test="${data.genderCd == 'GEN0000000002'}">
								<c:set var="genderCdClass" value="female"/>
							</c:if>


							<div class="contents_wrap ${genderCdClass}"><!-- 남성일 경우 클래스 male 추가, 여성일 경우 클래스 female 추가 -->
								<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/></div>
								<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
										<span class="tit">${data.iscoNm}&nbsp;</span>
										<c:choose>
											<c:when test="${data.useYn == 'Y'}">
												<a href="javascript:void(0);" onclick="fnGoCompnyResumeView('${data.resumeSeq}');" class="title">${data.resumeTitle}</a>
											</c:when>
											<c:otherwise><spring:message code="eduTrnng.msg5"/></c:otherwise>
										</c:choose>
									</div>
									<div class="top_box">
										<span class="name">${data.userNm}</span>
										<span class="age">
											(<span>${data.genderNm}</span> <span>${data.age}</span>)
										</span>
									</div>

									<div class="cont_box">
										<span class="con">
											<c:choose>
												<c:when test="${data.careerYn == 'Y'}">${data.totCareerTermYearCnt} year+</c:when>
												<c:otherwise><spring:message code="eduTrnng.msg4"/></c:otherwise>
											</c:choose>
										</span>
										<span class="con">${data.eduDegreeNm}</span>
										<span class="con">${data.addrNm}</span>
									</div>
									<div class="other_box">
										<span id="bkmkSapn_${status.count}" class="top_box">
											<button type="button" id="btnBkmk_${status.count}" onclick="fnBkmkType2('${data.userBkmkSeq}','${data.resumeSeq}',LIKE_CATEGORY_RESUME,'btnBkmk_${status.count}','bkmkSapn_${status.count}');" class="interest <c:if test="${!empty data.userBkmkSeq and data.userBkmkSeq != ''}">on</c:if>"><spring:message code="mypage.compny.profile.title13"/></button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
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
			<!-- 		<span class="bbs_right">
						<button type="button" class="bbs_btn delete">Delete</button>
					</span> -->
				</div>
				<!--  //bbs_btn_wrap  -->

				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->