<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}
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


    	function fnDelOffer(seq, seq2) {
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
    					url: contextPath + "/cpes/compny/applic/offerDelProcessAjax.do",
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
						<span><spring:message code="mypage.compny.applic.title"/></span>
					</h2>
				</div>
	      	</header>
			<p><spring:message code="mypage.compny.applic.msg6"/></p>
	       	<div id="contents" class="applicOfferList">
				<div class="bbs_info clearfix tab_confirm"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
					</div>
					<div class="bbs_right bbs_category">
						<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/applic/offerList.do" method="post">
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
				<!-- bbs_info  -->
				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list my talent clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<span class="check_box">
								<label for="chk_${status.count}" class="skip">Select</label>
								<input type="checkbox" id="chk_${status.count}" name="chk" value="${data.offerSeq}_${data.vacancySeq}">
							</span>

							<c:set var="genderCdClass" value="male"/>
							<c:if test="${data.genderCd == 'GEN0000000002'}">
								<c:set var="genderCdClass" value="female"/>
							</c:if>

							<div class="contents_wrap ${genderCdClass}"><!-- 남성일 경우 클래스 male 추가, 여성일 경우 클래스 female 추가 -->
								<div class="img_box">
									<c:if test="${data.displayYn == 'Y'}">
									<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/>
									</c:if>
								</div>
								<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
										<span class="tit">${data.iscoNm}</span>
										<a href="javascript:void(0);" onclick="fnGoCompnyResumeView('${data.resumeSeq}','${data.vacancySeq}');" class="title">${data.resumeTitle}</a>
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
									</div>
									<div class="put_box">
										<a href="javascript:void(0);" onclick="fnVacancyView('${data.vacancySeq}','frm');" class="link">${data.vacancyTitle}</a>
									</div>

									<div class="other_box type2">
										<span class="top_box">
											<span class="accept">
												<c:choose>
													<c:when test="${data.offerAcptYn == 'Y'}"><spring:message code="mypage.compny.applic.msg3"/></c:when>
													<c:when test="${data.offerAcptYn == 'N'}"><spring:message code="mypage.compny.applic.msg4"/></c:when>
													<c:when test="${empty data.offerOpenDt}"><spring:message code="mypage.compny.applic.msg5"/></c:when>
												</c:choose>
											</span>
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

				<div class="bbs_btn_wrap clearfix">
					<span class="bbs_left">

					</span>
					<span class="bbs_right">
						<button type="button" onclick="fnDelOffer();" class="bbs_btn delete"><spring:message code="button.delete"/></button>
					</span>
				</div>
				<!--  //bbs_btn_wrap  -->

				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->



			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->