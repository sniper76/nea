<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
    	});
	</script>




		<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
			<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
			<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
			<div class="bbs_right bbs_category">
				<fieldset>
					<input type="text" id="condText2" name="condText2" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
					<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text"><!-- on submit 방지 -->
					<input type="button" onclick="javascript:fnSetPageing('1');" value="Search" class="submit" />
				</fieldset>
			</div>
		</div>
		<!-- //bbs_info -->

		<c:if test="${!empty resultList}">
		<div class="bbs_basic">
			<ul class="recruitment_list talent clearfix">
			<c:forEach var="data" items="${resultList}" varStatus="status">
				<input type="hidden" id="htmlDataSet_${status.count}" name="htmlDataSet"
					data-applic-seq="${data.applicSeq}"
					data-vacancy-seq="${data.vacancySeq}"
					data-user-nm="${data.userNm}"
					data-age="${data.age}"
					data-gender-nm="${data.genderNm}"
					data-addr-nm="${data.addrNm}"
					data-applic-proc-cd="${data.applicProcCd}"
					data-reg-dt="${data.regDt}"
				>
				<li>
					<c:set var="genderCdClass" value="male"/>
					<c:if test="${data.genderCd == 'GEN0000000002'}">
						<c:set var="genderCdClass" value="female"/>
					</c:if>

					<div class="contents_wrap ${genderCdClass}"><!-- 남성일 경우 클래스 male 추가, 여성일 경우 클래스 female 추가 -->
						<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/></div>
						<div class="contents_box"><!-- 추천일 경우 클래스 referral 추가 -->
							<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
								<span class="tit">${data.iscoNm}</span>
								<a href="javascript:void(0);" onclick="fnResumeOpen('${data.applicSeq}','${data.vacancySeq}','${data.resumeSeq}');" class="title">${data.resumeTitle}</a>
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
							<div class="other_box type2">
								<span class="top_box">
									<span class="close">${data.applicProcNm}</span>
									<span>
										<label for="applicProcCd_${status.count}" class="skip">Category Selection</label>
										<select id="applicProcCd_${status.count}" name="applicProcCd" onchange="fnSetProcStat('htmlDataSet_${status.count}', this);">
											<c:forEach var="data2" items="${applicProcCd}" varStatus="status2">
												<option value="${data2.dtlCd}" <c:if test="${data.applicProcCd == data2.dtlCd}">selected</c:if>>${data2.cdNm}</option>
											</c:forEach>
										</select>
									</span>
									<button type="button" onclick="fnOnlineIntvw('${data.vacancySeq}','${data.resumeSeq}');" class="bbs_btn small">online interview</button>
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
		<!-- //bbs_basic list -->

		<c:if test="${empty resultList}">
		<div class="bbs_empty">
			<p><spring:message code="counsel.msg.no.data"/></p>
			<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
		</div>
		<!-- //bbs_empty -->
		</c:if>


