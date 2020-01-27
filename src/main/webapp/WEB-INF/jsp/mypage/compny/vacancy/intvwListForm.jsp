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






	</script>



	<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
		<div class="bbs_left bbs_count">
				<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
				<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
	<!-- 						<span class="order">
								<strong class="skip">Change list order</strong>
								<button type="button">Latest</button>
								<button type="button">View</button>
								<button type="button">like</button>
							</span> -->
		</div>
		<div class="bbs_right bbs_category">
			<form id="frm2" name="frm2" action="${pageContext.request.contextPath}/cpes/compny/vacancy/intvwList.do" method="post">
				<fieldset>
					<legend>Posts Search</legend>
					<select title="Select classification" id="condType" name="condType">
						<option value=""><spring:message code="counsel.msg.all"/></option>
						<c:forEach var="data2" items="${intvwStsCd}" varStatus="status2">
							<option value="${data2.dtlCd}" <c:if test="${param.condType == data2.dtlCd}">selected</c:if>>${data2.cdNm}</option>
						</c:forEach>
					</select>
					<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
					<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text"><!-- on submit 방지 -->
					<input type="button" onclick="javascript:fnSetPageing('1');" value="Search" class="submit" />
				</fieldset>
			</form>
		</div>
	</div>
	<!-- //bbs_info -->
	<c:if test="${!empty resultList}">
	<div class="bbs_basic">
		<ul class="recruitment_list my talent clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
		<c:forEach var="data" items="${resultList}" varStatus="status">
			<li>
				<c:set var="genderCdClass" value="male"/>
				<c:if test="${data.genderCd == 'GEN0000000002'}">
					<c:set var="genderCdClass" value="female"/>
				</c:if>
				<span class="check_box">
					<label for="chk_${status.count}" class="skip">Select</label>
					<input type="checkbox" id="chk_${status.count}" name="chk" value="${data.intvwSeq}_${data.applicSeq}" />
				</span>
				<div class="contents_wrap ${genderCdClass}"><!-- 남성일 경우 클래스 male 추가, 여성일 경우 클래스 female 추가 -->
					<div class="img_box">
						<c:choose>
							<c:when test="${data.displayYn == 'Y'}">
								<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/>
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/images/contents/icon_${genderCdClass}.png" alt="image" onerror="fnNoImage(this)"/>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="contents_box <c:if test="${data.referralYn == 'Y'}">recommend</c:if>"><!-- 잡센터 추천일 경우 클래스 recommend 추가 -->
						<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
							<span class="tit">${data.iscoNm}</span>
							<a href="javascript:void(0);" onclick="fnResumeOpen('${data.applicSeq}','${data.vacancySeq}','${data.resumeSeq}');" class="title">${data.resumeTitle}</a>
						</div>
						<div class="top_box">
							<span class="name">${masking:getNmMasking(data.userNm, data.displayYn)}</span>
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
							<c:if test="${!empty data.videoIntvwPatcptnSeq}">
							<button type="button" onclick="fnVideoIntvwOpen('${data.videoIntvwPatcptnSeq}','${data.vacancySeq}','dialogVideo');"  class="bbs_btn small">online interview</button>
							</c:if>
						</div>
						<div class="other_box type2">
							<span class="top_box">
								<span class="close">${data.intvwStsNm}</span>
							</span>
							<span class="bottom_box">
								<span class="date type3">${data.regDt}</span>
							</span>
						</div>
					</div>
				</div>
			</li>
		</c:forEach>
		</ul>
	</div>
	</c:if>
	<!-- //bbs_basic -->

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
			<button type="button" class="bbs_btn delete" onclick="fnDelIntvw()"><spring:message code="button.delete" /></button>
		</span>
	</div>
	<!--  //bbs_btn_wrap  -->

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
	</div>
	<!-- //pagination -->

