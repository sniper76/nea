<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/mypage/privt/applic/referral.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery/jquery-ui.js"></script>
    <script>
    	$(document).ready(function() {


    	});


      	function fnSetPageing(curPage) {
    		$("#currentPageNo").val(curPage);
    		fnGoList("frm");
    	}


      	function fnReject(seq,seq2) {
      		$("#condSeq").val(seq);
      		$("#condSeq2").val(seq2);

      		$('#dialog').dialog({
      	    	title: '알선 거절사유',
      	      	modal: true,
      	      	width: '500',
      	      	height: '300'
      		});
/* 			$.ajax({
				url: contextPath + "/cpes/private/applic/referralRejectAjax.do",
				type: 'post',
				datatype: 'html'
			})
			.done(function(data) {
				console.log("===========data="+data);
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			}); */


    	}

      	function fnCloseReject() {
      		$("#dialog").dialog( "close" );
      	}

	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.referral.title"/></span>
					</h2>
				</div>
	      	</header>


	       	<div id="contents" class="applicReferralList">
				<div id="dialog" style="display:none">
				   <p>알선을 거절 하신 사유를 알려주시겠습니까? </p>
				   <p>보내주신 회신은 더욱 정확한 알선서비스에 도움이 됩니다. </p>
				   	사유:<select id="referralRejectCd" name="referralRejectCd">
				   			<option value=""><spring:message code="member.join.msg.choice"/></option>
				   			<c:forEach var="data" items="${referralRejectCd}" varStatus="status">
				   				<option value="${data.dtlCd}">${data.cdNm}</option>
				   			</c:forEach>
				   		</select>
				   		<a href="javascript:void(0);" onclick="referral.fnRejectReferral('PRIVATE');">확인</a>
				   		<a href="javascript:void(0);" onclick="fnCloseReject();">취소</a>
				</div>


				<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/private/applic/referralList.do" method="post">
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<input type="hidden" id="condSeq2" name="condSeq2" value=""/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSoret}"/>

					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
						<span class="order">
							<h3 class="h0 skip"><spring:message code="counsel.msg.sort.change"/></h3>
							<button type="button" onclick="fnSetSort('LATEST','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.latest"/></button>
							<button type="button" onclick="fnSetSort('VIEW','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.view"/></button>
							<button type="button" onclick="fnSetSort('LIKE','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.like"/></button>
						</span>
					</div>
					</form>
				</div>
				<!-- //bbs_info -->


				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list my clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<span class="check_box">
								<label for="chk_${status.count}" class="skip">Select</label>
								<input type="checkbox" id="chk_${status.count}" name="chk" value="${data.vacancySeq}_${data.resumeSeq}">
							</span>
							<div class="contents_wrap">
								<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.imagePath}" onerror="fnNoImage(this)" alt="image"></div>
								<%-- <div class="img_box"><img src="${pageContext.request.contextPath}/${data.imagePath}" onerror="fnNoImage(this)" alt="image"></div> --%>
								<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
										<span class="tit">${data.compnyNm}</span>
										<a href="javascript:void(0);" onclick="fnVacancyView('${data.vacancySeq}','frm');" class="title">${data.vacancyTitle}</a>
									</div>
									<div class="cont_box">
										<span class="con">${data.employFormNm}</span>
										<span class="con"><spring:message code="compny.vacancy.msg.title8"/>&nbsp;:&nbsp;<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></strong></span>
										<span class="con">${data.addrNm}</span>
										<span class="con">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.minSalaryAmt}" /> ~ $<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.maxSalaryAmt}" /></span>
									</div>
									<div class="other_box type2">
										<c:choose>
											<c:when test="${data.vacancyStsCd == 'VCS0000000002'}"><!-- 채용공고 마감 -->
												<span class="close">${data.vacancyStsNm}</span>
											</c:when>
											<c:otherwise>
												<span class="${data.remainDiv}">${data.remainDt}<c:if test="${data.remainDiv == 'hurry'}">Hour</c:if></span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
											</c:otherwise>
										</c:choose>
										<span class="bottom_box">
											<c:choose>
												<c:when test="${data.vacancyStsCd == 'VCS0000000001' and data.applicCnt < 1}"><!-- 채용공고 진행중이고 입사지원 하지 않은경우 입시지원가능 -->
													<button type="button" onclick="referral.fnReferralSave('${data.vacancySeq}','${data.resumeSeq}','PRIVATE');" class="bbs_btn type08 small" ><spring:message code="mypage.compny.applic.msg3"/></button>
													<button type="button" onclick="fnReject('${data.vacancySeq}','${data.resumeSeq}');" class="bbs_btn small"><spring:message code="mypage.compny.applic.msg4"/></button>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${data.referralStsCd == 'RFS0000000002'}"><!-- 거절 -->
															<spring:message code="mypage.compny.applic.msg4"/>
														</c:when>
														<c:when test="${data.referralStsCd == 'RFS0000000003'}"><!-- 수락 -->
															<spring:message code="mypage.compny.applic.msg3"/>
														</c:when>
													</c:choose>
												</c:otherwise>
											</c:choose>
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
						<button type="button" onclick="referral.fnDelReferral('PRIVATE');" class="bbs_btn delete"><spring:message code="button.delete"/></button>
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