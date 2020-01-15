<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {

    	});
    </script>
	<c:if test="${!empty resultList}">
	<div class="bbs_basic">
		<ul class="recruitment_list type2 clearfix">
		<c:forEach var="data" items="${resultList}" varStatus="status">
			<li>
				<div class="contents_wrap">
					<c:set var="trnngNatnexpDivCdClass" value="training"/>
					<c:if test="${data.trnngNatnexpDivCd == 'FDC0000000002'}">
						<c:set var="trnngNatnexpDivCdClass" value="scholarship"/>
					</c:if>

					<div class="contents_box ${trnngNatnexpDivCdClass}"><!-- 유료일 경우 클래스 training , 무료일 경우 클래스 scholarship 추가 -->
						<div class="title_box"><!-- 새글일 경우 클래스 new 추가 -->
							<a href="javascript:void(0);" onclick="fnEduTrnngView('${data.eduTrnngSeq}','frm');" class="title">${data.eduTrnngNm}</a>
						</div>
						<div class="cont_box">
							<span class="cont">
								<span class="con">${data.addrNm}</span>
								<span class="con">${data.skillJobProgramCorsNm}</span>
								<span class="con">
								<c:choose>
									<c:when test="${data.freePaidYn == 'N'}"><spring:message code="mypage.instt.eduTrnng.msg"/></c:when>
									<c:otherwise>${data.tuition}$</c:otherwise>
								</c:choose>
								</span>
							</span>
							<span class="cont">
								<span class="con"><spring:message code="mypage.instt.eduTrnng.title8"/> <strong>${data.recurmtBgnDt} ~ ${data.recurmtEndDt}</strong></span>
								<span class="con"><spring:message code="mypage.instt.eduTrnng.title9"/> <strong>${data.eduBgnDt} ~ ${data.eduEndDt}</strong></span>
							</span>
						</div>
						<div class="other_box">
							<span class="top_box">

								<c:set var="recrumtStsCdClass" value="recruiting"/>
								<c:if test="${data.recrumtStsCd == 'FDC0000000002'}">
									<c:set var="recrumtStsCdClass" value="close"/>
								</c:if>

								<span class="${recrumtStsCdClass}">${data.recrumtStsNm}</span><!-- 모집중일 때 클래스 recruiting 추가, 마감일 때 클래스 close 추가 -->
								<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
									<span id="bkmkSapn_${status.count}"><button type="button" id="btnBkmk_${status.count}" onclick="fnBkmkType2('${data.bkmkSeq}','${data.eduTrnngSeq}',LIKE_CATEGORY_TRNCT,'btnBkmk_${status.count}','bkmkSapn_${status.count}');" class="interest <c:if test="${!empty data.bkmkSeq and data.bkmkSeq != ''}">on</c:if>">interest</button>
									</span>
								</sec:authorize>

							</span>
						</div>
					</div>
				</div>
			</li>
		</c:forEach>
		</ul>
	</div>
	</c:if>
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