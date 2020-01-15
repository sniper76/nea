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




    	function fnTabChange(val, obj) {
    		var classStr = $(obj).parent().attr("class");
    		if(classStr != "on") {
	    		$("#condStatCd").val(val);
	    		fnSetPageing("1");
    		}
    	}



		function fnModifyEduTrnng(seq) {
    		$("#condSeq").val(seq);
    		$("#frm").attr('action', "${pageContext.request.contextPath}/cpes/instt/eduTrnng/modify.do");
    		$("#frm").submit();
		}

		function fnDelEduTrnng(seq) {
    		alertify.confirm("<spring:message code="compny.vacancy.msg.btn.delete"/>", function (e) {
    			if (e) {
    				$.ajax({
    					url: contextPath + "/cpes/instt/eduTrnng/deleteProcessAjax.do",
    					type: 'post',
    					data: {
    						condSeq : seq
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

		function fnCloseEduTrnng(seq) {
    		alertify.confirm("<spring:message code="mypage.instt.eduTrnng.title24"/>", function (e) {
    			if (e) {
    				$.ajax({
    					url: contextPath + "/cpes/instt/eduTrnng/closeProcessAjax.do",
    					type: 'post',
    					data: {
    						condSeq : seq
    					},
    					datatype: 'json'
    				})
    				.done(function(data) {
    					if (data.result.successYn == "Y") {
    						alertify.alert("<spring:message code="mypage.instt.eduTrnng.title25"/>", function (e){
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
						<span><spring:message code="mypage.instt.eduTrnng.title"/></span>
					</h2>
				</div>
	      	</header>
	       	<div id="contents" class="insttEduTrnngList">
				<div class="tab_menu">
				    <ul class="clearfix">
				        <li <c:if test="${empty param.condStatCd or param.condStatCd eq 'CONTINUE'}">class="on"</c:if>><a href="javascript:void(0)" onclick="fnTabChange('CONTINUE',this);"><spring:message code="gnb.menu.vacancy.title7"/> <span class="nums"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.continueCnt}" /></span></a></li>
				        <li <c:if test="${param.condStatCd eq 'END'}">class="on"</c:if>><a href="javascript:void(0)" onclick="fnTabChange('END',this);"><spring:message code="button.close"/> <span class="nums"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.endCnt}" /></span></a></li>
				        <li <c:if test="${param.condStatCd eq 'WAIT'}">class="on"</c:if>><a href="javascript:void(0)" onclick="fnTabChange('WAIT',this);"><spring:message code="compny.vacancy.msg.title74"/>/<spring:message code="compny.vacancy.msg.title74"/> <span class="nums"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.waitCnt}" /></span></a></li>
				        <li <c:if test="${param.condStatCd eq 'ALL'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fnTabChange('ALL',this);"><spring:message code="counsel.msg.all"/> <span class="nums"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.totCnt}" /></span></a></li>
				    </ul>
				</div>

				<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->

					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
						<span class="order">
							<h3 class="h0 skip"><spring:message code="counsel.msg.sort.change"/></h3>
							<button type="button" onclick="javascript:fnSetSort('LATEST','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.latest"/></button>
							<button type="button" onclick="javascript:fnSetSort('END','condSort','frm','currentPageNo')"><spring:message code="compny.vacancy.msg.sortBy.end"/></button>
							<button type="button" onclick="javascript:fnSetSort('VIEW','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.view"/></button>
						</span>
					</div>
					<div class="bbs_right bbs_category">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/instt/eduTrnng/list.do" method="post">
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<input type="hidden" id="condStatCd" name="condStatCd" value="${param.condStatCd}"/>
						<fieldset>
							<legend>Posts Search</legend>
							<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
							<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text" /><!-- on submit 방지 -->
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
								<c:set var="trnngNatnexpDivCdClass" value="training"/>
								<c:if test="${data.trnngNatnexpDivCd == 'FDC0000000002'}">
									<c:set var="trnngNatnexpDivCdClass" value="scholarship"/>
								</c:if>

								<div class="contents_box ${trnngNatnexpDivCdClass}"><!-- 사전고용일 경우 클래스 employement , 스킬일 경우 클래스 skill 추가 -->
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
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
									<div class="other_box type2">
										<c:set var="recrumtStsCdClass" value="recruiting"/>
										<c:if test="${data.recrumtStsCd == 'FDC0000000002'}">
											<c:set var="recrumtStsCdClass" value="close"/>
										</c:if>
										<span class="top_box">
											<span class="${recrumtStsCdClass}">${data.recrumtStsNm}</span><!-- 모집중일 때 클래스 recruiting 추가, 마감일 때 클래스 close 추가 -->
										</span>
										<span class="bottom_box">
										<c:choose>
											<c:when test="${data.jcAgreeStsCd == 'JAS0000000002'}">
												<button type="button" class="bbs_btn small" onclick="fnDelEduTrnng('${data.eduTrnngSeq}');"><spring:message code="button.delete"/></button>
											</c:when>
											<c:when test="${data.jcAgreeStsCd == 'JAS0000000003'}">
												<button type="button" class="bbs_btn small" onclick="fnDelEduTrnng('${data.eduTrnngSeq}');"><spring:message code="button.delete"/></button>
												<button type="button" class="bbs_btn small" onclick="fnModifyEduTrnng('${data.eduTrnngSeq}');"><spring:message code="button.modify"/></button>
											</c:when>
											<c:when test="${data.jcAgreeStsCd == 'JAS0000000001' and data.recrumtStsCd == 'SC0000000002'}">
												<button type="button" class="bbs_btn small" onclick="fnCloseEduTrnng('${data.eduTrnngSeq}');"><spring:message code="button.close"/></button>
											</c:when>
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
						<a href="javascript:fnGoWrite('frm','${pageContext.request.contextPath}/cpes/instt/eduTrnng/write.do');" class="bbs_btn write"><spring:message code="mypage.instt.eduTrnng.title2"/></a>
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