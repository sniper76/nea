<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {

    	});


      	function fnSetPageing(curPage) {
    		$("#currentPageNo").val(curPage);
    		fnGoList("frm");
    	}

    	function fnDelOffer() {
    		var seqArr = new Array;

    		if(!$("input:checkbox[name=chk]").is(":checked") == true) {
				alertify.alert("<spring:message code="mypage.compny.applic.errors.msg"/>", function (e){

				});
				return false;
    		}

    		$("input:checkbox[name=chk]:checked").each(function() {
    			seqArr.push($(this).val())
			});

    		alertify.confirm("<spring:message code="compny.vacancy.msg.btn.delete"/>", function (e) {
    			if (e) {
    				$.ajax({
    					url: contextPath + "/cpes/private/applic/offerDelProcessAjax.do",
    					type: 'post',
    					data: {
    						condStr : seqArr.join(",")
    					},
    					datatype: 'json'
    				})
    				.done(function(data) {
    					if (data.result.successYn == "Y") {
    						alertify.alert("<spring:message code="counsel.msg.delete.success"/>", function (e){
    							fnSetPageing("1");
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
						<span><spring:message code="mypage.private.offer.title"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="applicOfferList">
				<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/private/applic/offerList.do" method="post">
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>

					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
						<span class="order">
							<h3 class="h0 skip"><spring:message code="counsel.msg.sort.change"/></h3>
							<button type="button" onclick="javascript:fnSetSort('LATEST','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.latest"/></button>
							<button type="button" onclick="fnSetSort('VIEW','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.view"/></button>
							<button type="button" onclick="javascript:fnSetSort('LIKE','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.like"/></button>
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
								<input type="checkbox" id="chk_${status.count}" name="chk" value="${data.offerSeq}_${data.resumeSeq}"/>
							</span>
							<div class="contents_wrap">
								<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.imagePath}" onerror="fnNoImage(this)" alt="image"></div>
								<%-- <div class="img_box"><img src="${pageContext.request.contextPath}/${data.imagePath}" onerror="fnNoImage(this)" alt="image"></div> --%>
								<c:set var="referralYnClass" value=""/>
								<c:if test="${data.referralYn == 'Y'}">
									<c:set var="referralYnClass" value="referral"/>
								</c:if>

								<div class="contents_box ${referralYnClass}"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
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
									<div class="other_box">
										<span class="top_box">
											<c:choose>
												<c:when test="${data.vacancyStsCd == 'VCS0000000002'}"><!-- 채용공고 마감 -->
													<span class="close">${data.vacancyStsNm}</span>
												</c:when>
												<c:otherwise>
													<span class="${data.remainDiv}">${data.remainDt}<c:if test="${data.remainDiv == 'hurry'}">Hour</c:if></span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
												</c:otherwise>
											</c:choose>
											<span id="bkmkSapn_${status.count}" class="top_box">
												<button type="button" id="btnBkmk_${status.count}" onclick="fnBkmkType2('${data.bkmkSeq}','${data.vacancySeq}',LIKE_CATEGORY_VACANCY,'btnBkmk_${status.count}','bkmkSapn_${status.count}');" class="interest <c:if test="${!empty data.bkmkSeq and data.bkmkSeq != ''}">on</c:if>"><spring:message code="mypage.compny.profile.title13"/></button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
											</span>

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
						<button type="button" onclick="fnDelOffer();" class="bbs_btn delete"><spring:message code="button.delete"/></button>
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