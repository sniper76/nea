<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {

			$('div#contents .tab_menu .clearfix li').removeClass('on');
			$('div#contents .tab_menu .clearfix li:eq(${tabNo})').addClass('on');

			$("#condText1").keypress(function( event ) {
				if( event.which == 13 ) {
		    		fnGoSrch(1);
				}
			});
			$("#condText2").keypress(function( event ) {
				if( event.which == 13 ) {
		    		fnGoSrch(2);
				}
			});
			$("#condText3").keypress(function( event ) {
				if( event.which == 13 ) {
		    		fnGoSrch(3);
				}
			});
			$("#condText4").keypress(function( event ) {
				if( event.which == 13 ) {
		    		fnGoSrch(4);
				}
			});
		});

    	function fnTabChange(val, isTab) {
    		if(isTab) {
           		$('form#frm input#condSort').val('');
    		}
    		$("#tabNo").val(val);
    		fnSetPageing("1");
    	}

       	function fnSetPageing(curPage) {
       		$("#currentPageNo").val(curPage);
       		if($("#tabNo").val() == 1) {
       			$("#pageUnit").val(12);
       		}
       		else {
       			$("#pageUnit").val(10);
       		}
    		fnGoList("frm");
    	}

       	function fnGoSrch(tabNo) {
       		$('form#frm input[name=condText]').val($('input#condText'+tabNo).val());
       		fnTabChange(tabNo, true);
       	}

       	function fnSortOrder(tabNo, condSort) {
       		$('form#frm input[name=condText]').val($('input#condText'+tabNo).val());
       		$('form#frm input#condSort').val(condSort);
       		fnTabChange(tabNo, false);
       	}

       	function fnGoView(tabNo, seq) {
       		var viewUrl = '${pageContext.request.contextPath}';
       		switch(tabNo) {
       		case 1:
       			viewUrl += '/compny/view.do';
       			break;
       		case 2:
       			viewUrl += '/vacancy/view.do';
       			break;
       		case 3:
       			viewUrl += '/instt/view.do';
       			break;
       		}
       		var f = $("form#frm");
       		f.empty();

       		f.append($('<input/>').attr('name', 'condSeq').attr('type','hidden').val(seq));
			f.attr('action', viewUrl);
			f.attr('method', "post");
	   		f.submit();
       	}

		function fnGoBack() {
			var returnUrl = "<c:out value="${param.returnUrl}" />";
			var f = $("[name=frm]")[0];

			if(!returnUrl) {
				returnUrl = "${pageContext.request.contextPath}/jobFair/typeList.do";
				f.tabNo.value = f.pTabNo.value;
				f.condText.value = '';
				f.condSort.value = '';
			}

			f.action = returnUrl;
			f.method = "post";
			if(!f.currentPageNo.value || !f.currentPageNo.value == "") {
				f.currentPageNo.value = "1";
			}
			if(!f.pageUnit.value || !f.pageUnit.value == "") {
				f.pageUnit.value = (f.tabNo.value == "1") ? "12" : "10";
			}
	   		f.submit();
		}
	</script>
	<main class="colgroup" id="colgroup">
		<article>
			<header class="sub_head">

				<div class="sub_title">
					<h2><span><spring:message code="jobfair.type.detail.title1"/></span></h2>
				</div>
			</header>

           <div id="contents">
           <form id="frm" name="frm" action="${pageContext.request.contextPath}/jobFair/view.do" method="post" hidden="true">
           <input type="hidden" id="tabNo" name="tabNo" value="${tabNo }" />
           <input type="hidden" id="pTabNo" name="pTabNo" value="${pTabNo }" />
           <input type="hidden" id="condSeq" name="condSeq" value="${param.condSeq }" />
           <input type="hidden" id="condSort" name="condSort" value="${param.condSort }" />
           <input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo }" />
           <input type="hidden" id="pageUnit" name="pageUnit" value="" />
           <input type="hidden" id="condFairDivCd" name="condFairDivCd" value="${param.condFairDivCd }" />
			<!-- 추가 항목 -->
			<input type="hidden" name="returnUrl" value="${param.returnUrl}" />
			<input type="hidden" name="year" value="${param.year}" />
			<input type="hidden" name="month" value="${param.month}" />
			<input type="hidden" name="condType" value="<c:out value="${param.condType}" />" />
			<input type="hidden" name="condText" value="<c:out value="${param.condText}" />" />
			<input type="hidden" name="condSearchType" value="<c:out value="${param.condSearchType}" />" />
           </form>

				<div class="recruitment_bottom type3">
					<div class="contents_wrap ${cFun:changeFairDivClass(jobFairInfo.fairDivCd)}">
						<div class="img_box"><img src="${pageContext.request.contextPath}${jobFairInfo.filePath}" alt="company logo" onerror="fnNoImage(this)"/></div>
						<div class="title_box">
							<div class="tit_box">
								<strong class="title"><c:out value="${jobFairInfo.fairNm }" escapeXml="false"/></strong>

								<span class="cont_box">
									<span class="cont interest"><fmt:formatNumber type="number" maxFractionDigits="3" value="${jobFairInfo.bkmkCnt}" /></span>
								</span>
							</div>
						</div>
						<div class="contents_box">
							<ul class="none_float clearfix">
							<li>
								<div class="cont">
									<strong class="tit"><spring:message code="jobfair.type.detail.title2"/></strong>
									<span class="con"><c:out value="${jobFairInfo.fairBgnDt }" /> ~ <c:out value="${jobFairInfo.fairEndDt }" /></span>
								</div>
							</li>
							<li>
								<div class="cont">
									<strong class="tit"><spring:message code="jobfair.type.detail.title3"/></strong>
									<span class="con"><c:out value="${jobFairInfo.addrNm }" /></span>
								</div>
							</li>
							<li>
								<div class="cont">
									<strong class="tit"><spring:message code="jobfair.type.detail.title4"/></strong>
									<span class="con">
										<span><a href="tel:000000000" class="mobile_phone"><c:out value="${jobFairInfo.tel1 }" /></a></span>
										<span><a href="tel:000000000" class="mobile_phone"><c:out value="${jobFairInfo.tel2 }" /></a></span>
									</span>
								</div>
							</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- //recruitment_bottom -->

				<div class="recruitment_btnbox">
					<div class="bbs_center" id="bkmkDiv">
					<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
						<button type="button" id="btnBkmk" class="button save <c:if test="${!empty result.bkmkSeq}">on</c:if>" onclick="fnBkmk('${jobFairInfo.bkmkSeq}','${jobFairInfo.fairSeq}', LIKE_CATEGORY_FAIR, 'bkmkDiv', 'btnBkmk');"><spring:message code="button.save"/></button>
						</sec:authorize>
					</div>
				</div>

				<div class="tab_menu action count5 margin_t_40 margin_b_0">
				    <ul class="clearfix">
				        <li><a onclick="fnTabChange('0',true);"><spring:message code="jobfair.type.detail.title5"/></a></li>
						<c:if test="${jobFairInfo.fairCompnyViewYn == 'Y' }">
				        <li><a onclick="fnTabChange('1',true);"><spring:message code="jobfair.type.detail.title6"/></a></li>
						</c:if>
						<c:if test="${jobFairInfo.fairVacancyViewYn == 'Y' }">
						<li><a onclick="fnTabChange('2',true);"><spring:message code="jobfair.type.detail.title7"/></a></li>
						</c:if>
						<c:if test="${jobFairInfo.fairInsttViewYn == 'Y' }">
						<li><a onclick="fnTabChange('3',true);"><spring:message code="jobfair.type.detail.title8"/></a></li>
						</c:if>
						<c:if test="${jobFairInfo.fairWorkshopViewYn == 'Y' }">
						<li><a onclick="fnTabChange('4',true);"><spring:message code="jobfair.type.detail.title9"/></a></li>
						</c:if>
				    </ul>
				</div>

				<c:choose>
					<c:when test="${tabNo == 1 }">
				<div id="tab_contents2" class="tab_contents">

				<div class="bbs_info clearfix margin_t_20">
				<div class="bbs_left bbs_count">
					<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
					<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalRecordCount}" /></span>
					<span class="order">
						<h3 class="h0 skip"><spring:message code="jobfair.type.detail.title10"/></h3>
						<button type="button" onclick="fnSortOrder(1, 'LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button>
						<button type="button" onclick="fnSortOrder(1, 'POPULAR')"><spring:message code="counsel.msg.sortBy.like"/></button>
					</span>
				</div>
				<div class="bbs_right bbs_category">
						<fieldset>
								<input type="text" id="condText1" name="condText1" value="${param.condText }" class="input_text" title="Please enter your search term." placeholder="Please enter your search term." />
								<input type="submit" onclick="fnGoSrch(1)" value='<spring:message code="button.search"/>' class="submit" />
							</fieldset>
					</div>
				</div>
				<!-- //bbs_info -->

				<div class="company_list">
					<ul class="clearfix">
				<c:if test="${!empty resultList}">
				<c:forEach var="employer" items="${resultList}" varStatus="status">
				<li>
					<div class="contents_box">
						<span class="img_box"><img src="${pageContext.request.contextPath}${employer.filePath}" alt="image" onerror="fnNoImage(this)"/></span>
						<a href="javascript:void(0)" onclick="fnGoView(1,'${employer.compnySeq}')" class="title_box">
							<strong class="title"><c:out value="${employer.compnyNm }" /></strong>
						</a>
						<span class="cont_box">
							<span class="cont"><c:out value="${employer.isicNm }" /></span>
							<span class="cont"><c:out value="${employer.addrNm }" /></span>
						</span>
											<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
                           <span id="bkmkSapn_c_${status.count}"><button type="button" id="btnBkmk_c_${status.count}" onclick="fnBkmkType2('${employer.bkmkSeq}','${employer.compnySeq}',LIKE_CATEGORY_COMPNY,'btnBkmk_c_${status.count}','bkmkSapn_c_${status.count}');" class="interest <c:if test="${!empty employer.bkmkSeq and employer.bkmkSeq != ''}">on</c:if>">interest</button>
                           </span>
                        </sec:authorize>
					</div>
				</li>
				</c:forEach>
				</c:if>
					</ul>
				</div>

				<c:if test="${empty resultList}">
					<div class="bbs_empty">
						<p><spring:message code="counsel.msg.no.data"/></p>
					</div>
					<!-- //bbs_empty -->
				</c:if>
				<!-- //company_list -->

					<c:if test="${!empty resultList}">
				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->
				</c:if>

				</div>
				<!-- //tab_contents2 -->
					</c:when>
					<c:when test="${tabNo == 2 }">
				<div id="tab_contents3" class="tab_contents">

				<div class="bbs_info clearfix margin_t_20">
				<div class="bbs_left bbs_count">
					<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
					<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalRecordCount}" /></span>
					<span class="order">
						<h3 class="h0 skip"><spring:message code="jobfair.type.detail.title10"/></h3>
						<button type="button" onclick="fnSortOrder(2, 'LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button>
						<button type="button" onclick="fnSortOrder(2, 'VIEW')"><spring:message code="counsel.msg.sortBy.view"/></button>
						<button type="button" onclick="fnSortOrder(2, 'POPULAR')"><spring:message code="counsel.msg.sortBy.like"/></button>
					</span>
				</div>
				<div class="bbs_right bbs_category">
						<fieldset>
								<input type="text" id="condText2" name="condText2" value="${param.condText }" class="input_text" title="Please enter your search term." placeholder="Please enter your search term." />
								<input type="submit" onclick="fnGoSrch(2)" value='<spring:message code="button.search"/>' class="submit" />
							</fieldset>
					</div>
				</div>
				<!-- //bbs_info -->

				<div class="bbs_basic">
					<ul class="recruitment_list clearfix">
				<c:if test="${!empty resultList}">
				<c:forEach var="vacancy" items="${resultList}" varStatus="status">
				<li>
					<div class="contents_wrap">
						<div class="img_box"><img src="${pageContext.request.contextPath}${vacancy.filePath}" alt="image" onerror="fnNoImage(this)"/></div>
						<div class="contents_box">
							<div class="title_box ${cFun:changeNewClass(vacancy.newYn)}">
								<span class="tit"><c:out value="${vacancy.compnyNm }" /></span>
								<a href="javascript:void(0)" onclick="fnGoView(2,'${vacancy.vacancySeq}')" class="title"><c:out value="${vacancy.vacancyTitle }" /></a>
							</div>
							<div class="cont_box">
								<span class="con"><c:out value="${vacancy.employFormNm }" /></span>
								<span class="con"><c:out value="${vacancy.recrumtMemb }" /></span>
								<span class="con"><c:out value="${vacancy.addrNm }" /></span>
								<span class="con">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${vacancy.minSalaryAmt}" /> ~ $<fmt:formatNumber type="number" maxFractionDigits="3" value="${vacancy.maxSalaryAmt}" /></span>
							</div>
							<div class="other_box">
								<span class="top_box">
									<span class="${vacancy.remainDiv}"><c:out value="${vacancy.remainDt }" /><c:if test="${vacancy.remainDiv == 'hurry'}">Hour</c:if></span>

								<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
		                           <span id="bkmkSapn_v_${status.count}"><button type="button" id="btnBkmk_v_${status.count}" onclick="fnBkmkType2('${vacancy.bkmkSeq}','${vacancy.vacancySeq}',LIKE_CATEGORY_VACANCY,'btnBkmk_v_${status.count}','bkmkSapn_v_${status.count}');" class="interest <c:if test="${!empty vacancy.bkmkSeq and vacancy.bkmkSeq != ''}">on</c:if>">interest</button>
		                           </span>
		                        </sec:authorize>
								</span>
							</div>
						</div>
					</div>
				</li>
				</c:forEach>
				</c:if>
					</ul>
				</div>
				<!-- //bbs_basic -->
				<c:if test="${empty resultList}">
					<div class="bbs_empty">
						<p><spring:message code="counsel.msg.no.data"/></p>
					</div>
					<!-- //bbs_empty -->
				</c:if>

					<c:if test="${!empty resultList}">
				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->
				</c:if>

				</div>
				<!-- //tab_contents3 -->
					</c:when>
					<c:when test="${tabNo == 3 }">
				<div id="tab_contents4" class="tab_contents">

				<div class="bbs_info clearfix margin_t_20">
				<div class="bbs_left bbs_count">
					<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
					<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalRecordCount}" /></span>
					<span class="order">
						<h3 class="h0 skip"><spring:message code="jobfair.type.detail.title10"/></h3>
						<button type="button" onclick="fnSortOrder(3, 'LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button>
						<button type="button" onclick="fnSortOrder(3, 'POPULAR')"><spring:message code="counsel.msg.sortBy.like"/></button>
					</span>
				</div>
				<div class="bbs_right bbs_category">
						<fieldset>
								<input type="text" id="condText3" name="condText3" value="${param.condText }" class="input_text" title="Please enter your search term." placeholder="Please enter your search term." />
								<input type="submit" onclick="fnGoSrch(3)" value='<spring:message code="button.search"/>' class="submit" />
							</fieldset>
					</div>
				</div>
				<!-- //bbs_info -->

				<div class="bbs_basic">
					<ul class="recruitment_list edu clearfix">
				<c:if test="${!empty resultList}">
				<c:forEach var="eduInstt" items="${resultList}" varStatus="status">
				<li>
					<div class="contents_wrap">
						<div class="img_box"><img src="${pageContext.request.contextPath}${eduInstt.filePath}" alt="image" onerror="fnNoImage(this)"/></div>
						<div class="contents_box ngo">
							<div class="title_box">
								<a href="javascript:void(0)" onclick="fnGoView(3, '${eduInstt.insttSeq}')" class="title"><c:out value="${eduInstt.insttNm }" /></a>
							</div>
							<div class="cont_box">
								<span class="cont">
									<span class="con"><c:out value="${eduInstt.insttOwnerNm }" /></span>
									<span class="con"><c:out value="${eduInstt.insttTypeNm }" /></span>
								</span>
								<span class="cont">
									<span class="con"><c:out value="${eduInstt.addrNm }" /></span>
									<span class="con"><a href="tel:000000000" class="mobile_phone"><c:out value="${eduInstt.tel1 }" /></a></span>
								</span>
							</div>
							<div class="other_box">
								<span class="top_box">
									<%-- <button type="button" class="interest on"><spring:message code="jobfair.type.detail.title11"/></button> --%>

									<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
			                           <span id="bkmkSapn_i_${status.count}"><button type="button" id="btnBkmk_i_${status.count}" onclick="fnBkmkType2('${eduInstt.bkmkSeq}','${eduInstt.insttSeq}',LIKE_CATEGORY_INSTT,'btnBkmk_i_${status.count}','bkmkSapn_i_${status.count}');" class="interest <c:if test="${!empty eduInstt.bkmkSeq and eduInstt.bkmkSeq != ''}">on</c:if>">interest</button>
			                           </span>
			                        </sec:authorize>
								</span>
							</div>
						</div>
					</div>
				</li>
				</c:forEach>
				</c:if>
					</ul>
				</div>
				<!-- //bbs_basic -->
				<c:if test="${empty resultList}">
					<div class="bbs_empty">
						<p><spring:message code="counsel.msg.no.data"/></p>
					</div>
					<!-- //bbs_empty -->
				</c:if>

					<c:if test="${!empty resultList}">
				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->
				</c:if>

				</div>
				<!-- //tab_contents4 -->
					</c:when>
					<c:when test="${tabNo == 4 }">
				<div id="tab_contents5" class="tab_contents">

				<div class="bbs_info clearfix margin_t_20">
				<div class="bbs_left bbs_count">
					<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
					<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalRecordCount}" /></span>
					<span class="order">
						<h3 class="h0 skip"><spring:message code="jobfair.type.detail.title10"/></h3>
						<button type="button" onclick="fnSortOrder(4, 'LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button>
						<button type="button" onclick="fnSortOrder(4, 'VIEW')"><spring:message code="counsel.msg.sortBy.view"/></button>
						<button type="button" onclick="fnSortOrder(4, 'POPULAR')"><spring:message code="counsel.msg.sortBy.like"/></button>
					</span>
				</div>
				<div class="bbs_right bbs_category">
						<fieldset>
								<input type="text" id="condText4" name="condText4" value="${param.condText }" class="input_text" title="Please enter your search term." placeholder="Please enter your search term." />
								<input type="submit" onclick="fnGoSrch(4)" value='<spring:message code="button.search"/>' class="submit" />
							</fieldset>
					</div>
				</div>
				<!-- //bbs_info -->

				<div class="bbs_basic">
					<ul class="recruitment_list edu clearfix">
				<li>
					<div class="contents_wrap">
						<div class="img_box"><img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt="image" /></div>
						<div class="contents_box training">
					<div class="title_box">
						<a href="javascript:void(0)" class="title">Construction Project Planning Manager</a>
					</div>
					<div class="cont_box">
						<span class="cont">
							<span class="con">Phnom Penh</span>
							<span class="con">Training Course</span>
							<span class="con">$300</span>
						</span>
						<span class="cont">
							<span class="con">Recruting <strong>08/10/2019~08/11/2019</strong></span>
							<span class="con">Training <strong>08/10/2019~08/11/2019</strong></span>
						</span>
					</div>
					<div class="other_box">
						<span class="top_box">
							<span class="recruiting">Recruiting</span>
							<button type="button" class="interest on"><spring:message code="jobfair.type.detail.title11"/></button>
								</span>
							</div>
						</div>
					</div>
				</li>
					</ul>
				</div>
				<!-- //bbs_basic -->

					<c:if test="${!empty resultList}">
				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->
				</c:if>

				</div>
				<!-- //tab_contents5 -->
					</c:when>
					<c:otherwise>

				<div id="tab_contents1" class="tab_contents">

				<div class="h3"><spring:message code="jobfair.type.detail.title25"/> <strong><c:out value="${jobFairInfo.jcNm }" /></strong></div>

				<h3><spring:message code="jobfair.type.detail.title12"/></h3>
				<p><c:out value="${jobFairInfo.fairDtlExplnNm }" /></p>

				<div class="form_view">
					<div class="view_box have_border">
						<div class="view_form">
							<strong class="title"><spring:message code="mypage.compny.profile.title12"/></strong>
							<p class="cont_box"><c:out value="${jobFairInfo.addrNm }" /></p>
							<div class="margin_t_5">
								<a href="javascript:void(0);" onclick="javascript:fnViewMap('<c:out value="${jobFairInfo.googleMapLink}"/>', 1024, 768, 'MapWin');" class="bbs_btn_map"><spring:message code="jobcenter.list.button1"/></a>
							</div>
						</div>
					</div>
					<!-- //view_box -->

				<div class="view_box">
					<div class="view_form">
						<strong class="title"><spring:message code="jobfair.type.detail.title13"/></strong>
						<p class="cont_box"><c:out value="${jobFairInfo.fairBgnDt }" /> ~ <c:out value="${jobFairInfo.fairEndDt }" /></p>
					</div>
				</div>
				<!-- //view_box -->

				<div class="view_box count2">
					<div class="view_form">
						<strong class="title"><spring:message code="jobfair.type.detail.title14"/></strong>
						<p class="cont_box"><a href="tel:000000000" class="mobile_phone"><c:out value="${jobFairInfo.tel1 }" /></a></p>
					</div>
					<div class="view_form">
						<strong class="title"><spring:message code="login.stop.email"/></strong>
						<p class="cont_box"><c:out value="${jobFairInfo.email }" /></p>
					</div>
				</div>
				<!-- //view_box -->

				<div class="view_box">
					<div class="view_form images_list">
						<strong class="title"><spring:message code="jobfair.type.detail.title15"/></strong>
						<div class="cont_box">
							<span><img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt=" image" /></span>
							<span><img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt=" image" /></span>
							<span><img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt=" image" /></span>
						</div>
					</div>
				</div>
				<!-- //view_box -->

				<div class="view_box">
					<div class="view_form images_list">
						<strong class="title"><spring:message code="jobfair.type.detail.title16"/></strong>
						<div class="cont_box">
							<span><img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt=" image" /></span>
							<span><img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt=" image" /></span>
							<span><img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt=" image" /></span>
						</div>
					</div>
				</div>
				<!-- //view_box -->

				<div class="view_box">
					<div class="view_form images_box">
						<strong class="title"><spring:message code="jobfair.type.detail.title17"/></strong>
						<div class="cont_box">
							<div class="box_img">
								<div class="inner">
									<img src="${pageContext.request.contextPath}/images/template/wait.jpg" alt=" image" />
									<span class="img_zoom"><a href="${pageContext.request.contextPath}/images/template/wait.jpg" target="_blank" title="New window open"><spring:message code="jobfair.type.detail.title18"/></a></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- //view_box -->

				<div class="view_box">
					<div class="view_form type8 type8_2">
						<strong class="title"><spring:message code="jobfair.type.detail.title19"/></strong>
						<p class="cont_box">
							<span><c:out value="${jobFairInfo.fairHashtag }" /></span>
						</p>
					</div>
				</div>
				<!-- //view_box -->
				</div>

				<h3><spring:message code="jobfair.type.detail.title20"/></h3>
				<div class="form_view no_padding">
					<div class="view_box have_border">
						<div class="view_form">
							<strong class="title"><spring:message code="jobfair.type.detail.title21"/></strong>
							<div class="cont_box">
								<a href="" class="booth_view"><spring:message code="jobfair.type.detail.title22"/></a>
							</div>
						</div>
					</div>
					<!-- //view_box -->

				<div class="view_box">
					<div class="view_form">
						<strong class="title"><spring:message code="jobfair.type.detail.title23"/></strong>
						<p class="cont_box">27/09/2109 ~ 27/09/2109 08:00 AM ~ 08:00 PM</p>
					</div>
				</div>
				<!-- //view_box -->

				<div class="view_box">
					<div class="view_form">
						<strong class="title"><spring:message code="jobfair.type.detail.title24"/></strong>
						<div class="cont_box">
							<div class="register_box">
								<ul class="clearfix">
								<li>
									<a href class="register_cont_box">
										<strong class="register_title"><spring:message code="jobfair.type.detail.title26"/></strong>
										<span class="register_cont"><spring:message code="jobfair.type.detail.title27"/></span>
									</a>
								</li>
								<li>
									<a href class="register_cont_box">
										<strong class="register_title"><spring:message code="jobfair.type.detail.title26"/></strong>
										<span class="register_cont"><spring:message code="jobfair.type.detail.title28"/></span>
									</a>
								</li>
								<li>
									<a href class="register_cont_box">
										<strong class="register_title"><spring:message code="jobfair.type.detail.title26"/></strong>
										<span class="register_cont"><spring:message code="jobfair.type.detail.title29"/></span>
									</a>
								</li>
								<li>
									<a href class="register_cont_box">
										<strong class="register_title"><spring:message code="jobfair.type.detail.title26"/></strong>
										<span class="register_cont"><spring:message code="jobfair.type.detail.title30"/></span>
									</a>
								</li>
								</ul>
							</div>
							<div class="booth_shortcut">
								<a href="" class="cont_box">
									<strong class="title"><spring:message code="jobfair.type.detail.title31"/></strong>
									<span class="cont"><spring:message code="jobfair.type.detail.title32"/></span>
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- //view_box -->
				</div>
				<!-- //form_view -->

				</div>
				<!-- //tab_contents1 -->
					</c:otherwise>
				</c:choose>

				<div class="bbs_btn_wrap clearfix">
					<div class="bbs_center">
						<a href="javascript:fnGoBack()" class="bbs_btn list"><spring:message code="button.list"/></a>
					</div>
				</div>
				<!-- //bbs_btn_wrap -->



			</div>
	        <!-- //contents -->
		</article>
	</main>
	<!-- //main.colgroup -->