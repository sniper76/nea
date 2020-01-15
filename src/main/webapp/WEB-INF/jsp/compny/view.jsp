<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
			if("<c:out value="${connYn}"/>" == "N") {//잘못된 접근
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}

			if("<c:out value="${dataExistYn}"/>" == "N") {//데이터없음
				alertify.alert("<spring:message code="counsel.msg.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}

    	});

      	function fnSetPageing(curPage) {
      		if(curPage != null) {
      			$("#currentPageNo").val(curPage);
      		}
      		fnContinueVacancyList("${param.condSeq}","tab_contents2",$("#currentPageNo").val());

    	}


    </script>
	<main class="colgroup" id="colgroup">
   		<article>
        	<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="mypage.compny.profile.title10"/></span></h2>
				</div>
			</header>

           	<div id="contents" class="compnyView">

				<div class="recruitment_title_top type2">
					<div class="title_box"><h3 class="h0 title">COMPANY INFO</h3></div>
<!-- 					<div class="cont_box">
						<button type="button" class="cont print">Print</button>
						<button type="button" class="cont pdf">PDF</button>
					</div> -->
				</div>
				<!-- //recruitment_title_top -->

				<div class="recruitment_bottom">
					<div class="contents_wrap">
						<div class="img_box">
							<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${result.filePath}" alt="image" onerror="fnNoImage(this)"/>
						</div>
						<div class="title_box">
							<div class="tit_box">
								<strong class="title">${result.compnyNm}</strong>
								<span class="cont_box">
									<span class="cont interest"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.bkmkCnt}" /></span>
								</span>
							</div>
						</div>
						<div class="contents_box">
							<ul class="clearfix">
							<li>
								<div class="cont">
									<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title30"/></strong>
									<span class="con">${result.compnyTypeNm}</span>
								</div>
							</li>
							<li>
								<div class="cont">
									<strong class="tit"><spring:message code="mypage.compny.profile.title11"/></strong>
									<span class="con">${result.isicNm}&nbsp;</span>
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
									<strong class="tit"><spring:message code="member.join.step.two.compnay.msg15"/></strong>
									<span class="con"><a href="${result.compnyWebsite}" target="_blank" title="open new window" class="em_blue">${result.compnyWebsite}</a></span>
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
							<button type="button" id="btnBkmk" onclick="fnBkmk('${result.bkmkSeq}','${result.compnySeq}',LIKE_CATEGORY_COMPNY, 'bkmkDiv', 'btnBkmk');" class="button save <c:if test="${!empty result.bkmkSeq}">on</c:if>"><spring:message code="mypage.compny.profile.title13"/></button>
						</sec:authorize>
					</div>
				</div>


				<div class="tab_menu action count2 margin_t_40 margin_b_0">
				    <ul class="clearfix">
				        <li class="on"><a href="#tab_contents1"><spring:message code="mypage.compny.profile.title14"/></a></li>
				        <li><a href="#tab_contents2" onclick="fnContinueVacancyList('${result.compnySeq}','tab_contents2','1');"><spring:message code="mypage.compny.profile.title15"/> <span class="nums"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totCnt}" /></span></a></li>
				    </ul>
				</div>

				<div id="tab_contents1" class="tab_contents">

					<h3><spring:message code="mypage.compny.profile.title2"/></h3>
					<p>
						<c:set var="cmt" value="${fn:replace(result.profile,crcn,br)}" />
						<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
						<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
						<c:out value="${cmt}" escapeXml="false"/>
					</p>

					<h3>General information</h3>
					<div class="form_view no_padding">
						<div class="view_box have_border count2">
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.compny.profile.title5"/></strong>
								<p class="cont_box"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.employeeTotCnt}" /></p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.compny.profile.title6"/></strong>
								<p class="cont_box"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.femaleEmployeeTotCnt}" /></p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box count2">
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.compny.profile.title7"/></strong>
								<p class="cont_box"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.disablEmployeeTotCnt}" /></p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.compny.profile.title8"/></strong>
								<p class="cont_box"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.forgnerTotCnt}" /></p>
							</div>
						</div>
						<!-- //view_box -->
					</div>
					<!-- //form_view -->

					<h3>Photo</h3>
					<div class="form_photo">
						<ul class="padding_t_0 clearfix">
							<c:forEach items="${result.fileList }" var="file">
								<li>
									<div class="img_box"><!-- 이미지 등록되었을 경우 이미지 노출 -->
										<div class="box_img">
											<div class="inner">
												<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${file.saveFilePath}" alt="image" onerror="fnNoImage(this);" />
												<span class="img_zoom"><a href="${pageContext.request.contextPath}/common/imgLoading.do?url=${file.saveFilePath}" target="_blank" title="New window open">View larger image</a></span>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- //form_photo -->

					<h3><spring:message code="mypage.compny.profile.title16"/></h3>
					<p>${result.addrDtl}</p>
					<div class="margin_t_5">
						<a href="${result.googleMapLink}" target="_blank" class="bbs_btn_map"><spring:message code="mypage.compny.profile.title17"/></a>
					</div>

				</div>
				<!-- //tab_contents1 -->

				<div id="tab_contents2" class="tab_contents">



				</div>
				<!-- //tab_contents2 -->


			</div>
			<!-- //contents -->
		</article>
	</main>
   	<!-- //main.colgroup -->
