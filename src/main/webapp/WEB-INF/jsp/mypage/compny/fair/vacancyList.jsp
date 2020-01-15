<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {


    	});

    	function fnDelFairVacancy() {
    		var seqArr = new Array;

    		if(!$("input:checkbox[name=chk]").is(":checked") == true) {
				alertify.alert("<spring:message code="mypage.compny.applic.errors.msg"/>", function (e){

				});
				return false;
    		}

    		$("input:checkbox[name=chk]:checked").each(function() {
    			seqArr.push($(this).val())
			});

    		//console.log("==========str="+seqArr.join(","))
    		alertify.confirm("<spring:message code="compny.vacancy.msg.btn.delete"/>", function (e) {
    			if (e) {

					$.ajax({
						url: contextPath + "/cpes/compny/fair/deleteFairVacancyMultiAjax.do",
						type: 'post',
						data: {
							condSeqStr: seqArr.join(",")
						},
						datatype: 'json'
					})
					.done(function(data) {
						if (data.result.successYn == "Y") {
							alertify.alert("<spring:message code="counsel.msg.delete.success"/>", function (e){
								location.reload();
							});
						} else {
			 				var msg = "<spring:message code="login.findId.no.data"/>";
							if(data.result.statCd == "02") {
								msg = "<spring:message code="errors.ajax.fail"/>";
							}
							alertify.alert(msg);
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
						<span><spring:message code="mypage.compny.fair.title2"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="fairVacancyList">
				<div class="recruitment_bottom type3 margin_b_20">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/fair/vacancyList.do" method="post">
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
					</form>

					<c:set var="fairDivCdClass" value="ncpf"/>
					<c:choose>
						<c:when test="${result.fairDivCd == 'FDC0000000002'}">
							<c:set var="fairDivCdClass" value="pcpf"/>
						</c:when>
						<c:when test="${result.fairDivCd == 'FDC0000000003'}">
							<c:set var="fairDivCdClass" value="ep"/>
						</c:when>
						<c:when test="${result.fairDivCd == 'FDC0000000004'}">
							<c:set var="fairDivCdClass" value="mj"/>
						</c:when>
						<c:when test="${result.fairDivCd == 'FDC0000000005'}">
							<c:set var="fairDivCdClass" value="rf"/>
						</c:when>
					</c:choose>

					<div class="contents_wrap ${fairDivCdClass}"><!-- 전국일 경우 클래스 ncpf , 지방일 경우 클래스 pcpf 추가, 고용포럼일 경우 클래스 ep 추가, 모바일일 경우 클래스 mj 추가, 관련일 경우 클래스 rf 추가 -->
						<div class="img_box"><img src="${pageContext.request.contextPath}/${data.imagePath}" onerror="fnNoImage(this)" alt="image"></div>
						<div class="title_box">
							<div class="tit_box">
								<strong class="title"><a href="javascript:void(0);" onclick="fnJobFairView('${result.fairSeq}','frm');">${result.fairNm}</a></strong>
							</div>
						</div>
						<div class="contents_box">
							<ul class="none_float clearfix">
							<li>
								<div class="cont">
									<strong class="tit"><spring:message code="jobfair.type.detail.title2"/></strong>
									<span class="con">${result.fairBgnDt} ~${result.fairEndDt}</span>
								</div>
							</li>
							<li>
								<div class="cont">
									<strong class="tit"><spring:message code="mypage.compny.profile.title12"/></strong>
									<span class="con">${result.addrDtl}</span>
								</div>
							</li>
							<li>
								<div class="cont">
									<strong class="tit">Contact</strong>
									<span class="con">
										<span><a href="tel:${result.tel1}" class="mobile_phone">${result.tel1}</a></span>
										<span><a href="tel:${result.tel2}" class="mobile_phone">${result.tel1}</a></span>
									</span>
								</div>
							</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- //recruitment_bottom -->

				<div class="bbs_info clearfix tab_confirm"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
				</div>
				<!-- bbs_info  -->

				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list type2 my clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<span class="check_box">
								<label for="chk_${status.count}" class="skip">Select</label>
								<input type="checkbox" id="chk_${status.count}" name="chk" value="${data.vacancySeq}_${data.fairSeq}" />
							</span>
							<div class="contents_wrap">
								<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
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
						<button type="button" onclick="fnDelFairVacancy();" class="bbs_btn delete"><spring:message code="button.delete"/></button>
						<a href="javascript:fnGoWrite('frm','${pageContext.request.contextPath}/cpes/compny/vacancy/write.do');" class="bbs_btn write"><spring:message code="compny.vacancy.msg.title70"/></a>
					</span>
				</div>
				<!--  //bbs_btn_wrap  -->



			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->