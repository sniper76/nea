<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {

    		//console.log("==================condDiv=${param.condDiv},condIscoLvlOne=${param.condIscoLvlOne},condIscoLvlTwo=${param.condIscoLvlTwo}");
    		//console.log("==================condIscoLvlThree=${param.condIscoLvlThree},condIscoLvlFour=${param.condIscoLvlFour}");
    		if("<c:out value="${param.condDiv}"/>" == "SEARCH_DTL") {
				$(".detail_area").show();

				if("<c:out value="${param.condIscoLvlOne}"/>" != null && "<c:out value="${param.condIscoLvlOne}"/>" != "") {//isco
					fnIscoCdListType2("${param.condIscoLvlOne}",'1','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',"${param.condIscoLvlTwo}");
				}

				if("<c:out value="${param.condIscoLvlTwo}"/>" != null && "<c:out value="${param.condIscoLvlTwo}"/>" != "") {
					fnIscoCdListType2("${param.condIscoLvlTwo}",'2','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',"${param.condIscoLvlThree}");
				}

				if("<c:out value="${param.condIscoLvlThree}"/>" != null && "<c:out value="${param.condIscoLvlThree}"/>" != "") {
					fnIscoCdListType2("${param.condIscoLvlThree}",'3','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',"${param.condIscoLvlFour}");
				}

				if("<c:out value="${param.condAreaCdLvlOne}"/>" != null && "<c:out value="${param.condAreaCdLvlOne}"/>" != "") {//area
					fnAreaCdList($("#condAreaCdLvlOne"),'1','condAreaCdLvlOne','condAreaCdLvlTwo',CONTRY_CD_CAMBODIA,"${param.condAreaCdLvlTwo}");
				}


				$('input:radio[name=condMinWorkExp]:input[value="${param.condMinWorkExp}"]').attr("checked", true);//career

    		}


			//검색키워드 enter
			$("#condText").keypress(function( event ) {
				if( event.which == 13 ) {
					fnSearch();
				}
			});


    	});

    	function fnSearch() {
    		document.frmSearch.currentPageNo.value = 1;
			fnGoList("frmSearch");
    	}

    	function fnDtlSearch() {
  			document.frmDtlSearch.currentPageNo.value = 1;
			fnGoList("frmDtlSearch");
    	}

      	function fnSetPageing(curPage) {
    		if("<c:out value="${param.condDiv}"/>" == "SEARCH_DTL") {
    			document.frmDtlSearch.currentPageNo.value = curPage;
    			fnGoList("frmDtlSearch");
    		} else {
    			document.frmSearch.currentPageNo.value = curPage;
    			fnGoList("frmSearch");
    		}

    	}



      	function fnSetSortNew(val) {

    		if("<c:out value="${param.condDiv}"/>" == "SEARCH_DTL") {
    			document.frmDtlSearch.currentPageNo.value = "1";
    			document.frmDtlSearch.condSort.value = val;
    			fnGoList("frmDtlSearch");
    		} else {
    			document.frmSearch.currentPageNo.value = "1";
    			document.frmSearch.condSort.value = val;
    			fnGoList("frmSearch");
    		}
      	}

	</script>
	<main class="colgroup" id="colgroup">
    	<article>
			<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="vacancy.search.msg"/></span></h2>
				</div>
           	</header>
           	 <div id="contents" class="vacancyDtlSearch">
				<div class="srch_box">
					<div class="top_area">
						<span class="cont_box">
							<strong class="title"><spring:message code="counsel.msg.all"/></strong>&nbsp;:
							<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalRecordCount}" /></span>
						</span>
						<span class="cont_box">
							<strong class="title"><spring:message code="vacancy.search.msg2"/></strong>&nbsp;:
							<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result}" /></span>
						</span>
					</div>
					<div class="srch_area advanced"><!-- 상세 검색 있을 때 클래스 advanced 추가 -->
						<div class="box_wrap">
							<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/vacancy/dtlSearch.do" method="post">
								<input type="hidden" name="condDiv" value="SEARCH">
								<input type="hidden"name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
								<input type="hidden" name="condSeq" value=""/>
								<input type="hidden" name="condSort" value="${param.condSort}"/>

								<fieldset>
									<legend>Search</legend>
									<div class="contents_box">
										<label for="serch_sel" class="skip">Category Selection</label>
										<select id="condAreaCd" name="condAreaCd" title="Select classification">
											<option value=""><spring:message code="counsel.msg.all"/></option>
											<c:forEach var="data" items="${resultList2}" varStatus="status">
												<option value="${data.lvlCd}" <c:if test="${data.lvlCd == param.condAreaCd}">selected</c:if>>${data.nm}</option>
											</c:forEach>
										</select>
										<label for="condText" class="skip">input the search</label>
										<input type="text" id="condText" name="condText" value="${param.condText}" class="text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
										<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text"><!-- on submit 방지 -->
										<button type="button" onclick="fnSearch();" class="submit"><spring:message code="button.search"/></button>
									</div>
								</fieldset>
							</form>
							<div class="put_box">
								<button type="button" class="advanced_search"><spring:message code="mypage.private.interest.msg6"/></button>
							</div>
						</div>
					</div>
					<div class="detail_area">
						<div class="box_wrap">
							<form id="frmDtlSearch" name="frmDtlSearch" action="${pageContext.request.contextPath}/vacancy/dtlSearch.do" method="post">
								<input type="hidden" name="condDiv" value="SEARCH_DTL">
								<input type="hidden"name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
								<input type="hidden" name="condSeq" value=""/>
								<input type="hidden" name="condSort" value="${param.condSort}"/>

								<fieldset>
									<legend>Detail search</legend>
									<div class="title_box">
										<h3><spring:message code="mypage.private.interest.msg6"/></h3>
									</div>
									<table class="bbs_table">
										<caption>Detail search</caption>
										<colgroup>
											<col style="width:15%;" />
											<col style="width:85%;" />
										</colgroup>
										<tbody>
										<tr>
											<th scope="col"><label for="condDtlText"><spring:message code="compny.vacancy.msg.title64"/></label></th>
											<td>
												<input type="text" id="condDtlText" name="condDtlText" value="${param.condDtlText}" class="text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="mypage.compny.applic.title6"/></th>
											<td>
												<label for="condIscoLvlOne" class="skip">Occupation 1depth</label>
												<select id="condIscoLvlOne" name="condIscoLvlOne" onchange="fnIscoCdList(this,'1','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',null);">
													<option value=""><spring:message code="counsel.msg.all"/></option>
													<c:forEach var="data" items="${resultListIsco}" varStatus="status">
														<option value="${data.cd}" <c:if test="${data.cd == param.condIscoLvlOne}">selected</c:if>>${data.cdNm}</option>
													</c:forEach>
												</select>
												<label for="condIscoLvlTwo" class="skip">Occupation 2depth</label>
												<select id="condIscoLvlTwo" name="condIscoLvlTwo" onchange="fnIscoCdList(this,'2','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',null);">
													<option value=""><spring:message code="counsel.msg.all"/></option>
												</select>
												<label for="condIscoLvlThree" class="skip">Occupation 3depth</label>
												<select id="condIscoLvlThree" name="condIscoLvlThree" onchange="fnIscoCdList(this,'3','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',null);">
													<option value=""><spring:message code="counsel.msg.all"/></option>
												</select>
												<label for="condIscoLvlFour" class="skip">Occupation 4depth</label>
												<select id="condIscoLvlFour" name="condIscoLvlFour">
													<option value=""><spring:message code="counsel.msg.all"/></option>
												</select>
											</td>
										<tr>
											<th scope="col"><spring:message code="resume.text.addrProvcCd"/></th>
											<td>
												<label for="condAreaCdLvlOne" class="skip">Province selection</label>
												<select id="condAreaCdLvlOne" name="condAreaCdLvlOne" onchange="fnAreaCdList(this,'1','condAreaCdLvlOne','condAreaCdLvlTwo',CONTRY_CD_CAMBODIA,null);">
													<option value=""><spring:message code="counsel.msg.all"/></option>
													<c:forEach var="data" items="${resultList2}" varStatus="status">
														<option value="${data.lvlCd}" <c:if test="${data.lvlCd == param.condAreaCdLvlOne}">selected</c:if>>${data.nm}</option>
													</c:forEach>
												</select>
												<label for="condAreaCdLvlTwo" class="skip">District selection</label>
												<select id="condAreaCdLvlTwo" name="condAreaCdLvlTwo">
													<option value=""><spring:message code="counsel.msg.all"/></option>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title3"/></th>
											<td>
												<c:forEach var="data" items="${employFormCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condVacancyTypeCd_${status.count}" name="condVacancyTypeCd"  value="${data.dtlCd}"
															<c:forEach var="data2" items="${paramValues.condVacancyTypeCd}" varStatus="status2">
																<c:if test="${data.dtlCd == data2}">checked</c:if>
															</c:forEach>
														/>
														<label for="condVacancyTypeCd_${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>

											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="mypage.private.interest.msg7"/></th>
											<td>
												$<input id="condSalAmt" name="condSalAmt" type="text" value="${param.condSalAmt}" maxlength="6" style="width:80px;" onKeyPress="return fnCheckNumber(event);" />
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title17"/></th>
											<td>
												<c:forEach var="data" items="${preferEmploymtTypeCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condPreferEmploymtTypeCd_${status.count}" name="condPreferEmploymtTypeCd"  value="${data.dtlCd}"
															<c:forEach var="data2" items="${paramValues.condPreferEmploymtTypeCd}" varStatus="status2">
																<c:if test="${data.dtlCd == data2}">checked</c:if>
															</c:forEach>
														/>
														<label for="condPreferEmploymtTypeCd_${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title15"/></th>
											<td>
												<c:forEach var="data" items="${employCtrctCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condEmployCtrctCd${status.count}" name="condEmployCtrctCd"  value="${data.dtlCd}"
															<c:forEach var="data2" items="${paramValues.condEmployCtrctCd}" varStatus="status2">
																<c:if test="${data.dtlCd == data2}">checked</c:if>
															</c:forEach>
														/>
														<label for="condEmployCtrctCd${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title52"/></th>
											<td>
												<c:forEach var="data" items="${minEduDegreeCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condMinEduDegreeCd${status.count}" name="condMinEduDegreeCd"  value="${data.dtlCd}"
															<c:forEach var="data2" items="${paramValues.condMinEduDegreeCd}" varStatus="status2">
																<c:if test="${data.dtlCd == data2}">checked</c:if>
															</c:forEach>
														/>
														<label for="condMinEduDegreeCd${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title61"/></th>
											<td>
												<span class="bbs_input_box">
													<input type="radio" id="condMinWorkExp_0" name="condMinWorkExp" value="0"/>
													<label for="condMinWorkExp_0">None</label>
												</span>
												<span class="bbs_input_box">
													<input type="radio" id="condMinWorkExp_1" name="condMinWorkExp" value="1"/>
													<label for="condMinWorkExp_1">~ 1 Year</label>
												</span>
												<span class="bbs_input_box">
													<input type="radio" id="condMinWorkExp_2" name="condMinWorkExp" value="2"/>
													<label for="condMinWorkExp_2">1~2 Years</label>
												</span>
												<span class="bbs_input_box">
													<input type="radio" id="condMinWorkExp_3" name="condMinWorkExp" value="3"/>
													<label for="condMinWorkExp_3">2~5 Years</label>
												</span>
												<span class="bbs_input_box">
													<input type="radio" id="condMinWorkExp_4" name="condMinWorkExp" value="4"/>
													<label for="condMinWorkExp_4">More than 5 Years</label>
												</span>

											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title46"/></th>
											<td>
												<c:forEach var="data" items="${preferntCondCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condPreferntCondCd_${status.count}" name="condPreferntCondCd"  value="${data.dtlCd}"
															<c:forEach var="data2" items="${paramValues.condPreferntCondCd}" varStatus="status2">
																<c:if test="${data.dtlCd == data2}">checked</c:if>
															</c:forEach>
														/>
														<label for="condPreferntCondCd_${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="mypage.compny.profile.title23"/></th>
											<td>
												<c:forEach var="data" items="${langCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condlangCd_${status.count}" name="condLangCd"  value="${data.dtlCd}"
															<c:forEach var="data2" items="${paramValues.condLangCd}" varStatus="status2">
																<c:if test="${data.dtlCd == data2}">checked</c:if>
															</c:forEach>
														/>
														<label for="condlangCd_${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>
											</td>
										</tr>
										</tbody>
									</table>
									<div class="put_box">
										<button type="button" onclick="fnDtlSearch();" class="submit"><spring:message code="button.search"/></button>
									</div>
								</fieldset>
							</form>
						</div>
						<button type="button" class="detail_close">Close Detail search</button>
					</div>
				</div>
				<!-- //srch_box -->

				<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
						<span class="order">
							<h3 class="h0 skip"><spring:message code="counsel.msg.sort.change"/></h3>
							<button type="button" onclick="fnSetSortNew('LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button>
							<button type="button" onclick="fnSetSortNew('VIEW')"><spring:message code="counsel.msg.sortBy.view"/></button>
							<button type="button" onclick="fnSetSortNew('LIKE')"><spring:message code="counsel.msg.sortBy.like"/></button>
						</span>
					</div>
				</div>
				<!-- //bbs_info -->

				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
<%-- 						<li>
							<div class="contents_wrap">
								<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/>
								<div class="img_box"><img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt="image" onerror="fnNoImage(this);" /></div>
								<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
										<span class="tit"><a href="javascript:void(0);" onclick="fnCompnyView('${data.compnySeq}');">${data.compnyNm}</a></span>
										<a href="javascript:void(0);" onclick="fnVacancyView('${data.vacancySeq}','frm');" class="title">공고명:${data.vacancyTitle}</a>
									</div
									<div class="cont_box">
										<span class="con">${data.employFormNm}</span>
										<span class="con"><spring:message code="compny.vacancy.msg.title8"/>&nbsp;:&nbsp;<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></strong></span>
										<span class="con">${data.addrNm}</span>
										<span class="con">${data.minSalaryAmt} $ ~ ${data.maxSalaryAmt} $</span>
									</div>
									<div class="other_box">
										<span class="top_box">
											<span class="${data.remainDiv}">${data.remainDt}<c:if test="${data.remainDiv == 'hurry'}">Hour</c:if></span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
											<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
										</span>
									</div>
								</div>
							</div>
						</li> --%>

						<li>
							<div class="contents_wrap">
								<span class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="company logo" onerror="fnNoImage(this)" /></span>
								<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
										<span class="tit">${data.compnyNm}</span>
										<a href="javascript:void(0);" onclick="fnVacancyView2('${data.vacancySeq}');" class="title">${data.vacancyTitle}</a>
									</div>
									<div class="cont_box">
										<span class="con">${data.employFormNm}</span>
										<span class="con"><spring:message code="compny.vacancy.msg.title8"/>&nbsp;:&nbsp;<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></strong></span>
										<span class="con">${data.addrNm}</span>
										<span class="con">$<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.minSalaryAmt}" /> ~ $<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.maxSalaryAmt}" /></span>
									</div>
									<div class="other_box">
										<span class="top_box">
											<span class="${data.remainDiv}">${data.remainDt}<c:if test="${data.remainDiv == 'hurry'}">Hour</c:if></span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
											<span id="bkmkSapn_${status.count}" class="top_box">
												<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
												<button type="button" id="btnBkmk_${status.count}" onclick="fnBkmkType2('${data.bkmkSeq}','${data.vacancySeq}',LIKE_CATEGORY_VACANCY,'btnBkmk_${status.count}','bkmkSapn_${status.count}');" class="interest <c:if test="${!empty data.bkmkSeq and data.bkmkSeq != ''}">on</c:if>"><spring:message code="mypage.compny.profile.title13"/></button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
												</sec:authorize>
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

				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->

        	</div>
        	<!-- //contents -->

		</article>
	</main>
	<!-- //main.colgroup -->