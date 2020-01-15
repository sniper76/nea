<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/mypage/privt/applic/referral.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery/jquery-ui.js"></script>
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


      	function fnReject(seq,seq2) {
      		$("#condSeq").val(seq);
      		$("#condSeq2").val(seq2);

      		$('#dialog').dialog({
      	    	title: '알선 거절사유',
      	      	modal: true,
      	      	width: '500',
      	      	height: '300'
      		});

    	}

      	function fnCloseReject() {
      		$("#dialog").dialog( "close" );
      	}

      	function fnCompnyReferral(seq) {
    		alertify.confirm("<spring:message code="mypage.compny.applic.msg"/>", function (e) {
    			if (e) {
    				$.ajax({
    					url: contextPath + "/cpes/compny/applic/referralReqProcessAjax.do",
    					type: 'post',
    					data: {
    						condSeq : seq
    					},
    					datatype: 'json'
    				})
    				.done(function(data) {
    					if (data.result.successYn == "Y") {
    						alertify.alert("<spring:message code="counsel.msg.update.ok"/>", function (e){
    							location.reload();
    						});


    					} else {
    		 				var msg = noMemberFailMsg;
    						if(data.result.statCd == "02") {
    							msg = systemMsg;
    						}
    						alertify.alert(msg);
    					}
    				})
    				.fail(function(xhr, status, errorThrown) {
    					alertify.alert(systemMsg);
    				});
    			}
    		});
      	}

	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.compny.applic.title2"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="applicVacancyList">
				<div id="dialog" style="display:none">
				   <p><spring:message code="mypage.compny.applic.msg8"/> </p>
				   <p><spring:message code="mypage.compny.applic.msg9"/> </p>
				   <spring:message code="mypage.compny.applic.msg10"/>:<select id="referralRejectCd" name="referralRejectCd">
				   			<option value=""><spring:message code="member.join.msg.choice"/></option>
				   			<c:forEach var="data" items="${referralRejectCd}" varStatus="status">
				   				<option value="${data.dtlCd}">${data.cdNm}</option>
				   			</c:forEach>
				   		</select>
				   		<a href="javascript:void(0);" onclick="referral.fnRejectReferral('COMPNY');">확인</a>
				   		<a href="javascript:void(0);" onclick="fnCloseReject();">취소</a>
				</div>

				<div class="box type2 icon job_referral">
				    <div class="box_wrap">
				        <p><span class="em_point"><spring:message code="instt.eduTrnng.nea.msg3"/></span> <br /><span class="em_point"><spring:message code="instt.eduTrnng.nea.msg4"/></span></p>
				    </div>
				</div>


				<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<div class="bbs_left bbs_count type2">
						<h3 class="title">Active job Vacancy <span class="nums"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalRecordCount}" /></span></h3>
					</div>
					<div class="bbs_right bbs_category">
						<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/applic/vacancyList.do" method="post">
							<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
							<input type="hidden" id="condSeq" name="condSeq" value=""/>
							<fieldset>
								<legend>Posts Search</legend>
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
					<ul class="recruitment_list type2 clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가, 직업훈련일 경우 클래스 type2 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<div class="contents_wrap">
								<div class="contents_box">
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
										<a href="javascript:void(0);" onclick="fnVacancyView('${data.vacancySeq}','frm');" class="title">${data.vacancyTitle}</a>
									</div>
									<div class="cont_box">
										<span class="cont">
											<span class="con">${data.employFormNm}</span>
											<span class="con"><spring:message code="compny.vacancy.msg.title8"/> : <strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></strong></span>
											<span class="con">${data.addrNm}</span>
											<span class="con">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.minSalaryAmt}" /> ~ $<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.maxSalaryAmt}" /></span>
										</span>
									</div>
									<div class="other_box type2">
										<span class="top_box">
											<c:choose>
												<c:when test="${data.vacancyStsCd == 'VCS0000000002'}"><!-- 채용공고 마감 -->
													<span class="close">${data.vacancyStsNm}</span>
												</c:when>
												<c:otherwise>
													<span class="${data.remainDiv}">${data.remainDt}<c:if test="${data.remainDiv == 'hurry'}">Hour</c:if></span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
												</c:otherwise>
											</c:choose>

										</span>
										<span class="bottom_box">
											<c:choose>
												<c:when test="${data.recrumtDiffcltYn == 'Y'}"><spring:message code="button.request.completed"/></c:when>
												<c:otherwise>
													<button type="button" onclick="fnCompnyReferral('${data.vacancySeq}');" class="bbs_btn type08 small"><spring:message code="button.request.completed"/></button>
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


				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->


			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->