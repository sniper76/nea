<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/mypage/compny/vacancy/vacancy.js"></script>
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


    	function fnVacancyModify(seq,yn) {
    		$("#condSeq").val(seq);
    		$("#condTempYn").val(yn);
    		$("#frm").attr('action', "${pageContext.request.contextPath}/cpes/compny/vacancy/modify.do");
    		$("#frm").submit();
    	}

    	function fnTabChange(val,obj) {
    		var classStr = $(obj).parent().attr("class");
    		if(classStr != "on") {

	    		$("#condStatCd").val(val);
	    		$("#condType").val("");
	    		$("#condText").val("");
	    		fnSetPageing("1");
    		}
    	}

    	function fnGoApplicList(seq,stat) {
    		var $form = $('<form></form>');
    		var url = contextPath + "/cpes/compny/applic/list.do";

    		$form.attr('action', url);
    		$form.attr('method', 'post');
    		$form.appendTo('body');

    		var condSeq = "<input type=\"hidden\" name=\"condSeq\" value=\""+seq+"\">";
    		var condApplicProcCd = "<input type=\"hidden\" name=\"condApplicProcCd\" value=\""+stat+"\">";

    		$form.append(condSeq).append(condApplicProcCd);
    		$form.submit();
    	}

    	//condApplicProcCd

    	function fnVacancyCopy(seq) {
    		$("#condCopySeq").val(seq);
    		$("#frm").attr('action', "${pageContext.request.contextPath}/cpes/compny/vacancy/write.do");
    		$("#frm").submit();
    	}




    	function fnVacancyClose(seq) {
			alertify.confirm("<spring:message code="compny.vacancy.msg.btn.close"/>", function (e) {
				if (e) {
					$.ajax({
						url: contextPath + "/cpes/compny/vacancy/closeProcessAjax.do",
						type: 'post',
						data: {
							condSeq : seq
						},
						datatype: 'json'
					})
					.done(function(data) {
						if (data.result.successYn == "Y") {
							alertify.alert("<spring:message code="compny.vacancy.msg.title76"/>", function (e){
								fnTabChange('END');
							});

						} else {
							if(data.result.statCd == "01") {
								alertify.alert("<spring:message code="login.findId.no.data"/>");
							} else  {
								alertify.alert("<spring:message code="errors.ajax.fail"/>");
							}

						}
					})
					.fail(function(xhr, status, errorThrown) {
						alertify.alert("<spring:message code="errors.ajax.fail"/>");
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
						<span><spring:message code="compny.vacancy.msg.title68"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="companyVacancyList">
				<div class="tab_menu count5">
				    <ul class="clearfix">
				        <li <c:if test="${empty param or empty param.condStatCd or param.condStatCd == 'CONTINUE'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fnTabChange('CONTINUE',this);"><spring:message code="compny.vacancy.msg.title72"/> <span class="nums"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.continueCnt}" /></span></a></li>
				        <li <c:if test="${param.condStatCd == 'END'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fnTabChange('END',this);"><spring:message code="compny.vacancy.msg.title73"/> <span class="nums"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.endCnt}" /></span></a></li>
				        <li <c:if test="${param.condStatCd == 'WAIT'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fnTabChange('WAIT',this);"><spring:message code="compny.vacancy.msg.title75"/>/<spring:message code="compny.vacancy.msg.title74"/> <span class="nums"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.waitCnt}" /></span></a></li>
				        <li <c:if test="${param.condStatCd == 'TEMP'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fnTabChange('TEMP',this);"><spring:message code="compny.vacancy.msg.title65"/> <span class="nums"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.tempCnt}" /></span></a></li>
				        <li <c:if test="${param.condStatCd == 'ALL'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fnTabChange('ALL',this);"><spring:message code="counsel.msg.all"/> <span class="nums"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.totCnt}" /></span></a></li>
				    </ul>
				</div>

				<div id="tab_contents1" class="tab_contents">

					<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/vacancy/list.do" method="post">
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<input type="hidden" id="condTempYn" name="condTempYn" value=""/>
						<input type="hidden" id="condStatCd" name="condStatCd" value="${param.condStatCd}"/>
						<input type="hidden" id="condCopySeq" name="condCopySeq" value=""/>
						<div class="bbs_left bbs_count">
							<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
							<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
							<span class="order">
								<h3 class="h0 skip"><spring:message code="counsel.msg.sort.change"/></h3>
								<button type="button" onclick="fnSetSort('LATEST','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.latest"/></button>
								<button type="button" onclick="fnSetSort('END','condSort','frm','currentPageNo')"><spring:message code="compny.vacancy.msg.sortBy.end"/></button>
								<button type="button" onclick="fnSetSort('VIEW','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.view"/></button>
							</span>
						</div>
						<div class="bbs_right bbs_category">
							<fieldset>
								<legend><spring:message code="counsel.msg.search.cond"/></legend>
<%-- 								<select id="condType" name="condType" title="Select classification">
									<option value=""><spring:message code="counsel.msg.all"/></option>
									<option value="TITLE" ><spring:message code="counsel.msg.title"/></option>
									<option value="CONTENT" ><spring:message code="counsel.msg.contents"/></option>
									<option value="NAME" ><spring:message code="search.name"/></option>
								</select> --%>
								<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
								<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text"><!-- on submit 방지 -->
								<input type="button" onclick="javascript:fnSetPageing('1');" value="Search" class="submit" />
							</fieldset>
						</div>
					</form>
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
												<span class="con">${data.bgnDt} ~ ${data.endDt}</span>
											</span>
										</div>
										<div class="state_box">
											<div class="list_box clearfix count6">
												<c:choose>
													<c:when test="${data.jcAgreeStsCd == 'JAS0000000001'}">
														<div class="list_item">
															<a href="javascript:void(0);" onclick="fnGoApplicList('${data.vacancySeq}','')" class="cont_box">
																<strong class="title"><span><spring:message code="counsel.msg.all"/></span></strong>
																<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.jobTotCnt}" /></span>
															</a>
														</div>
		 												<div class="list_item">
															<a href="javascript:void(0);" onclick="fnGoApplicList('${data.vacancySeq}','NOT_OPEN')" class="cont_box">
																<strong class="title"><span><spring:message code="mypage.compny.vacancy.msg2"/></span></strong>
																<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.notOpenCnt}" /></span>
															</a>
														</div>
														<div class="list_item">
															<a href="javascript:void(0);" onclick="fnGoApplicList('${data.vacancySeq}','CHECK')" class="cont_box">
																<strong class="title"><span><spring:message code="mypage.compny.vacancy.msg3"/></span></strong>
																<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.checkCnt}" /></span>
															</a>
														</div>
														<div class="list_item">
															<a href="javascript:void(0);" onclick="fnGoApplicList('${data.vacancySeq}','DOC_PASS')" class="cont_box">
																<strong class="title"><span><spring:message code="mypage.compny.vacancy.msg4"/></span></strong>
																<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.docCnt}" /></span>
															</a>
														</div>
														<div class="list_item">
															<a href="javascript:void(0);" onclick="fnGoApplicList('${data.vacancySeq}','INTVW')" class="cont_box">
																<strong class="title"><span><spring:message code="offer.interview"/></span></strong>
																<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.intvwCnt}" /></span>
															</a>
														</div>
														<div class="list_item">
															<a href="javascript:void(0);" onclick="fnGoApplicList('${data.vacancySeq}','PASS')" class="cont_box">
																<strong class="title"><span><spring:message code="mypage.compny.vacancy.msg5"/></span></strong>
																<span class="cont type2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.yesCnt}" /></span>
															</a>
														</div>
													</c:when>
													<c:otherwise>
														<div class="list_item">
															<span class="cont_box">
																<strong class="title"><span><spring:message code="counsel.msg.all"/></span></strong>
																<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.jobTotCnt}" /></span>
															</span>
														</div>
		 												<div class="list_item">
															<span class="cont_box">
																<strong class="title"><span><spring:message code="mypage.compny.vacancy.msg2"/></span></strong>
																<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.notOpenCnt}" /></span>
															</span>
														</div>
														<div class="list_item">
															<span class="cont_box">
																<strong class="title"><span><spring:message code="mypage.compny.vacancy.msg3"/></span></strong>
																<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.checkCnt}" /></span>
															</span>
														</div>
														<div class="list_item">
															<span class="cont_box">
																<strong class="title"><span><spring:message code="mypage.compny.vacancy.msg4"/></span></strong>
																<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.docCnt}" /></span>
															</span>
														</div>
														<div class="list_item">
															<span class="cont_box">
																<strong class="title"><span><spring:message code="offer.interview"/></span></strong>
																<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.intvwCnt}" /></span>
															</span>
														</div>
														<div class="list_item">
															<span class="cont_box">
																<strong class="title"><span><spring:message code="mypage.compny.vacancy.msg5"/></span></strong>
																<span class="cont type2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.yesCnt}" /></span>
															</span>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="other_box type2">
											<span class="top_box">
												<c:set var="vacancyStsCdClass" value="recruiting"/>
												<c:if test="${data.vacancyStsCd == 'VCS0000000002'}">
													<c:set var="vacancyStsCdClass" value="close"/>
												</c:if>
												<span class="${vacancyStsCdClass}">
													${data.vacancyStsNm}
												</span><!-- 채용중일 때 클래스 recruiting 추가, 마감일 때 클래스 close 추가 -->
											</span>
											<span class="bottom_box">
												<c:choose>
													<c:when test="${data.tempYn == 'Y'}">
														<button onclick="fnVacancyModify('${data.vacancySeq}','Y');" class="bbs_btn small"><spring:message code="button.modify"/></button>
													</c:when>
													<c:when test="${data.modifyYn == 'Y'}">
														<button onclick="fnVacancyModify('${data.vacancySeq}','N');" class="bbs_btn small"><spring:message code="button.modify"/></button>
													</c:when>
												</c:choose>
												<c:if test="${data.statNm == 'C' or data.statNm == 'E' or data.statNm == 'W' or data.statNm == 'R'}">
													<button onclick="fnVacancyCopy('${data.vacancySeq}');" class="bbs_btn small"><spring:message code="mypage.compny.vacancy.msg16"/></button>
												</c:if>
												<c:if test="${data.statNm == 'C'}">
													<button onclick="fnVacancyClose('${data.vacancySeq}');" class="bbs_btn small"><spring:message code="button.close"/></button>
												</c:if>
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
							<button type="button" onclick="fnGoWrite('frm','${pageContext.request.contextPath}/cpes/compny/vacancy/write.do');" class="bbs_btn type01"><spring:message code="compny.vacancy.msg.title70"/></button>
						</span>
					</div>
					<!-- //bbs_btn_wrap -->

					<div class="pagination">
						<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
					</div>
					<!-- //pagination -->

				</div>
				<!--  //tab_contents1 -->
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->