<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	var addrArr = new Array;
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



			<c:forEach var="data" items="${resultList}" >
				addrArr.push("${data.addrNm}");
			</c:forEach>
			$("#eduTrnngArea").html(addrArr.join(","));

    	});

    </script>
	<main class="colgroup" id="colgroup">
		<article>
     		<header class="sub_head">
            	<div class="sub_title">
					<h2><span><spring:message code="mypage.instt.eduTrnng.title26"/></span></h2>
				</div>
           	</header>
			<div id="contents" class="eduTrnngView">
				<div class="recruitment_title_top">
					<div class="title_box"><h3 class="h0 title">${result.insttNm}</h3></div>
	<!-- 				<div class="cont_box">
						<button type="button" class="cont print">Print</button>
						<button type="button" class="cont pdf">PDF</button>
					</div> -->
				</div>
				<!-- //recruitment_title_top -->

				<div class="recruitment_box type2">
					<div class="contents_wrap">
						<div class="title_box">
							<div class="tit_box">
								<span class="tit">${result.insttNm}</span>
							</div>
							<p class="title">${result.eduTrnngNm} <span class="interest"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.bkmkCnt}" /></span></p>
						</div>
						<div class="contents_box clearfix">
							<div class="tit_box"><spring:message code="mypage.instt.eduTrnng.title27"/></div>
							<div class="cont_box">
								<ul class="clearfix">
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="counsel.msg.member.division"/></strong>
										<span class="con">${result.trnngNatnexpDivNm}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title8"/></strong>
										<span class="con">${result.recurmtBgnDt}~${result.recurmtEndDt}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title28"/></strong>
										<span class="con">${result.programCorsTypeNm}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title9"/></strong>
										<span class="con">${result.eduBgnDt}~${result.eduEndDt}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title12"/></strong>
										<span class="con" id="eduTrnngArea">
										</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title17"/></strong>
										<span class="con">
											<c:choose>
												<c:when test="${result.freePaidYn == 'N'}"><spring:message code="mypage.instt.eduTrnng.msg"/></c:when>
												<c:otherwise>${result.tuition} $</c:otherwise>
											</c:choose>
										</span>
									</div>
								</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="side_box">
						<div class="img_box"><img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt="company logo" /></div>
						<div class="cont_box">
							<ul class="clearfix">
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title29"/></strong>
										<span class="con">${result.insttOwnerNm}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title30"/></strong>
										<span class="con">${result.insttTypeNm}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="member.join.step.two.trnct.msg5"/></strong>
										<span class="con">${result.insttAddrDtl}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="member.join.step.two.compnay.msg15"/></strong>
										<span class="con"><a href="${result.insttWebsite}" target="_blank" title="open new window">${result.insttWebsite}</a></span>
									</div>
								</li>
							</ul>
						</div>
						<div class="put_box">
							<a href="javascript:void(0);" onclick="fnInsttView('${result.insttSeq}');" class="cont add"><spring:message code="mypage.instt.eduTrnng.title32"/></a>
							<span class="cont interest"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.insttBkmkCnt}" /></span>
						</div>
					</div>
				</div>
				<!-- //recruitment_box -->


				<div class="recruitment_btnbox">
					<div class="bbs_center" id="bkmkDiv">
						<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
							<button type="button" id="btnBkmk" onclick="fnBkmk('${result.bkmkSeq}','${result.eduTrnngSeq}',LIKE_CATEGORY_TRNCT, 'bkmkDiv', 'btnBkmk');" class="button save <c:if test="${!empty result.bkmkSeq}">on</c:if>"><spring:message code="mypage.instt.eduTrnng.title31"/></button>
						</sec:authorize>
					</div>
				</div>

				<!-- //recruitment_btnbox -->

				<div class="form_wrap">
					<div class="form_title">
						<h3><spring:message code="mypage.instt.eduTrnng.title3"/></h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title5"/></strong>
								<p class="cont_box">${result.trnngNatnexpDivNm}</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box count2">
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title6"/></strong>
								<p class="cont_box">${result.skillJobProgramCorsNm}</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title7"/></strong>
								<p class="cont_box">${result.highGenrlEduCorsCd}</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box count2">
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title8"/></strong>
								<p class="cont_box">${result.recurmtBgnDt} ~ ${result.recurmtEndDt}</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title9"/></strong>
								<p class="cont_box">${result.eduBgnDt} ~ ${result.eduEndDt}</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title10"/></strong>
								<p class="cont_box">${result.eduDura} <spring:message code="compny.vacancy.msg.title18"/></p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title11"/></strong>
								<div class="cont_box">
									<ul>
										<c:set var="cmt" value="${fn:replace(result.teachHourWeek,crcn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
										<c:out value="${cmt}" escapeXml="false"/>
									</ul>
								</div>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form type8">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title15"/></strong>
								<div class="cont_box">
									<span>${result.major1depthNm}</span>
									<span>${result.major2depthNm}</span>
								</div>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title5"/></strong>
								<p class="cont_box">${result.iscoNm}</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title17"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.freePaidYn == 'Y'}">
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.tuition}" /> $
										</c:when>
										<c:otherwise>
											<spring:message code="mypage.instt.eduTrnng.msg"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>
						<!-- //view_box -->
					</div>
					<!-- //form_view -->
				</div>
				<!-- //form_wrap -->

				<div class="form_wrap">
					<div class="form_title">
						<h3><spring:message code="mypage.instt.eduTrnng.title18"/></h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title19"/></strong>
								<div class="cont_box">${result.eduTarget}</div>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title20"/></strong>
								<div class="cont_box">
									<c:set var="cmt" value="${fn:replace(result.admssCriteria,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									<c:out value="${cmt}" escapeXml="false"/>
								</div>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form type9">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title21"/></strong>
								<div class="cont_box">
							<%-- 		<c:set var="cmt" value="${fn:replace(result.content,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" /> --%>
									<c:out value="${result.content}" escapeXml="false"/>
								</div>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title22"/></strong>
								<div class="cont_box">
									<c:set var="cmt" value="${fn:replace(result.enrolMethod,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									<c:out value="${cmt}" escapeXml="false"/>
								</div>
							</div>
						</div>
						<!-- //view_box -->
					</div>
					<!-- //form_view -->
				</div>
				<!-- //form_wrap -->

				<div class="form_wrap">
					<div class="form_title">
						<h3>Keyword</h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<div class="view_box">
							<div class="view_form type7">
								<div class="cont_box">
									<c:if test="${fn:length(result.eduTrnngKeyword) > 0}">
										<c:forEach items="${fn:split(result.eduTrnngKeyword, ',') }" var="item">
											<span>${item}</span>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
						<!-- //view_box -->
					</div>
					<!-- //form_view -->
				</div>
				<!-- //form_wrap -->

				<div class="form_wrap">
					<div class="form_title">
						<h3><spring:message code="mypage.instt.eduTrnng.title32"/></h3>
					</div>
					<!-- //form_title -->
					<div class="recruitment_bottom margin_t_10">
						<div class="contents_wrap">
							<div class="img_box"><img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt="company logo" /></div>
							<div class="title_box">
								<div class="tit_box">
									<strong class="title">${result.insttNm}</strong>
									<span class="cont_box">
										<a href="javascript:void(0);" onclick="fnInsttView('${result.insttSeq}');" class="cont add"><spring:message code="mypage.instt.eduTrnng.title32"/></a>
										<span class="cont interest"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.insttBkmkCnt}" /></span>
									</span>
								</div>
							</div>
							<div class="contents_box">
								<ul class="clearfix">
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title29"/></strong>
										<span class="con">${result.insttOwnerNm}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title30"/></strong>
										<span class="con">${result.insttTypeNm}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="member.join.step.two.trnct.msg5"/></strong>
										<span class="con">${result.insttAddrDtl}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="member.join.step.two.compnay.msg15"/></strong>
										<span class="con"><a href="${result.insttWebsite}" target="_blank" title="open new window">${result.insttWebsite}</a></span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title33"/></strong>
										<span class="con"><a href="tel:${result.insttOfficeTel}" class="mobile_phone">${result.insttOfficeTel}</a></span>
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
								<button type="button" id="btnBkmk" onclick="fnBkmk('${result.bkmkSeq}','${result.eduTrnngSeq}',LIKE_CATEGORY_TRNCT, 'bkmkDiv', 'btnBkmk');" class="button save <c:if test="${!empty result.bkmkSeq}">on</c:if>"><spring:message code="mypage.instt.eduTrnng.title31"/></button>
							</sec:authorize>
						</div>
					</div>
					<!-- //recruitment_btnbox -->
				</div>
				<!-- //form_wrap -->
        	</div>
       	<!-- //contents -->
		</article>
	</main>
    <!-- //main.colgroup -->