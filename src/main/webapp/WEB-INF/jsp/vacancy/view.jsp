<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/mypage/compny/vacancy/vacancy.js"></script>
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



	</script>
	<main class="colgroup" id="colgroup">
    	<article>
			<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="compny.vacancy.msg.view.title"/></span></h2>
				</div>
           	</header>
           	 <div id="contents" class="vacancyView">
				<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/vacancy/list.do" method="post">
					<input type="hidden" id="condSeq" name="condSeq" value="${result.vacancySeq}"/>
				</form>

				<div class="recruitment_title_top">
					<div class="title_box"><h3 class="h0 title"><spring:message code="compny.vacancy.msg.title2"/></h3></div>
					<div class="cont_box">
<!-- 						<button type="button" class="cont print">Print</button>
						<button type="button" class="cont pdf">PDF</button> -->
					</div>
				</div>
				<!-- //recruitment_title_top -->

				<div class="recruitment_box">
					<div class="contents_wrap">
						<div class="title_box">
							<div class="tit_box">
								<span class="tit">${result.compnyNm}</span>
								<span class="date">D-${result.remainDt}</span>
							</div>
							<p class="title">${result.vacancyTitle} <span class="interest"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.bkmkCnt}" /></span></p>
						</div>
						<div class="contents_box clearfix">
							<div class="cont_box">
								<strong class="title"><spring:message code="eduTrnng.msg9"/></strong>
								<ul class="clearfix">
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="compny.vacancy.msg.title3"/></strong>
										<span class="con">${result.employFormNm}&nbsp;</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="compny.vacancy.msg.title9"/></strong>
										<span class="con">
											<c:forEach items="${result.vacancyLocBeanList }" var="vacancyLoc" varStatus="stat">
												<c:choose>
													<c:when test="${stat.count eq 1 }">
														${vacancyLoc.addrFullNm}
													</c:when>
													<c:otherwise>
														|${vacancyLoc.addrFullNm}
													</c:otherwise>
												</c:choose>
											</c:forEach>&nbsp;
										</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="compny.vacancy.msg.title5"/></strong>
										<span class="con">${result.iscoNm}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="compny.vacancy.msg.title8"/></strong>
										<span class="con"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.recrumtMemb}" /></span>
									</div>
								</li>
								</ul>
							</div>
							<div class="cont_box">
								<strong class="title"><spring:message code="mypage.compny.profile.title21"/></strong>
								<ul class="clearfix">
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.compny.profile.title19"/></strong>
										<span class="con">${result.minEduDegreeNm}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="compny.vacancy.msg.title15"/></strong>
										<span class="con">${result.employCtrctNm}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.compny.profile.title18"/></strong>
										<span class="con">${result.salaryUnitNm} <fmt:formatNumber type="number" maxFractionDigits="3" value="${result.minSalaryAmt}" />$~<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.maxSalaryAmt}" />$</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="resume.text.career"/></strong>
										<span class="con">
										<c:choose>
											<c:when test="${result.minWorkExpYn == 'N'}"><spring:message code="mypage.compny.profile.title20"/></c:when>
											<c:otherwise>${result.minWorkExp} <spring:message code="member.join.step.two.msg.year"/></c:otherwise>
										</c:choose>

										</span>
									</div>
								</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="side_box">
						<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${result.filePath}" alt="company logo" onerror="fnNoImage(this)" /></div>
						<div class="cont_box">
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
									<span class="con">${result.compnyIsicNm}&nbsp;</span>
								</div>
							</li>
							<li>
								<div class="cont">
									<strong class="tit"><spring:message code="mypage.compny.profile.title12"/></strong>
									<span class="con">${result.compnyAddrDtl}</span>
								</div>
							</li>
							<li>
								<div class="cont">
									<strong class="tit"><spring:message code="member.join.step.two.compnay.msg15"/></strong>
									<span class="con"><a href="${result.compnyWebsite}" target="_blank" title="open new window">${result.compnyWebsite}</a></span>
								</div>
							</li>
							</ul>
						</div>
						<div class="put_box">
							<a href="javascript:void(0);" onclick="fnCompnyView('${result.compnySeq}');" class="cont add"><spring:message code="mypage.compny.profile.title10"/></a>
							<span class="cont interest"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.compnyBmkCnt}" /></span>
						</div>
					</div>
				</div>
				<!-- //recruitment_box -->

				<div class="recruitment_btnbox">
					<div class="bbs_center"><!-- 버튼 활성화 되어야 할 땨 클래스 on 추가 -->
						<sec:authorize access="isAnonymous()">
							<a href="${pageContext.request.contextPath}/login.do?retUrl=${pageContext.request.contextPath}/vacancy/view.do?condSeq=${result.vacancySeq}" class="button apply on"><spring:message code="mypage.compny.profile.title22"/></a>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
							<c:choose>
								<c:when test="${result.vacancyStsCd == 'VCS0000000002'}"><!-- 입사지원했거나 마감인경우 -->
									<span class="button apply"><spring:message code="vacancy.view.msg"/></span>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${empty applicResult and !empty offerResult}"><!-- 입사지원 안했고  입사제의를 한경우-->
											<c:choose>
												<c:when test="${empty offerResult.offerOpenYn or offerResult.offerOpenYn == 'N'}"><!-- 입사제의 열람을 안했을경우-->
													<a href="javascript:void(0);" onclick="fnOfferSave('${offerResult.offerSeq}','${result.vacancySeq}','OK');" class="button apply on"><spring:message code="vacancy.view.msg2"/> </a>
													<a href="javascript:void(0);" onclick="fnOfferSave('${offerResult.offerSeq}','${result.vacancySeq}','REJECT');" class="button apply on"><spring:message code="vacancy.view.msg3"/></a>
												</c:when>
												<c:when test="${offerResult.offerAcptYn == 'N'}"><!-- 입사제의 거절-->
													<span class="button apply"><spring:message code="vacancy.view.msg4"/></span>
												</c:when>
											</c:choose>
										</c:when>
										<c:when test="${!empty applicResult}"><!-- 입사지원했을경우 -->
											<c:choose>
												<c:when test="${applicResult.applicCancelYn == 'Y'}"><!-- 검토중이면서 입사지원 취소한 상태 -->
													<span class="button apply"><spring:message code="vacancy.view.msg5"/></span>
												</c:when>
												<c:when test="${applicResult.applicProcCd == 'APC0000000001' || applicResult.applicProcCd == 'APC0000000002'}"><!-- 검토중 -->
													<a href="javascript:void(0);" onclick="fnApplicCancel('${applicResult.resumeSeq}','${applicResult.vacancySeq}');" class="button apply on"><spring:message code="vacancy.view.msg5"/></a>
												</c:when>
												<c:when test="${applicResult.applicProcCd == 'APC0000000003' and empty intvwResult}"><!-- 서류합격이고 인터뷰가 없을경우 -->
													${applicResult.applicProcNm}
												</c:when>
												<c:when test="${!empty intvwResult and intvwResult.intvwStsCd == 'INS0000000001'}"><!-- 인터뷰요청 상태일 경우 -->
													<a href="javascript:void(0);" onclick="fnOkIntvw('${result.vacancySeq}');" class="button apply on"><spring:message code="vacancy.view.msg2"/></a>
													<a href="javascript:void(0);" onclick="fnRejectIntvw('${result.vacancySeq}');" class="button apply on"><spring:message code="vacancy.view.msg3"/></a>
												</c:when>
												<c:when test="${!empty intvwResult and intvwResult.intvwStsCd != 'INS0000000001'}"><!-- 인터뷰 요청상태가 아닐경우-->
													<c:choose>
														<c:when test="${intvwResult.intvwStsCd == 'INS0000000002'}"><!-- 인터뷰 수락 -->
															<span class="button apply">${intvwResult.intvwStsNm}</span>
<!-- 															<span class="button apply">온라인 인터뷰 상세보기</span> -->
														</c:when>
														<c:otherwise><!-- 인터뷰 거절 -->
															<span class="button apply">${intvwResult.intvwStsNm}</span>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:when test="${applicResult.applicProcCd == 'APC0000000004'}"><!-- 최종합격 -->
													<span class="button apply">${applicResult.applicProcNm}(<spring:message code="vacancy.view.msg6"/>)</span>

												</c:when>
											</c:choose>

										</c:when>
										<c:when test="${empty applicResult}"><!-- 입사지원안했을경우 -->
											<a id="aTagApplic" href="javascript:void(0);" onclick="fnApplicSaveType2('${result.vacancySeq}','','aTagApplic');" class="button apply on"><spring:message code="mypage.compny.profile.title22"/></a>
										</c:when>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<span id="bkmkSpan"><button type="button" id="btnBkmk" onclick="fnBkmk('${result.bkmkSeq}','${result.vacancySeq}',LIKE_CATEGORY_VACANCY, 'bkmkSpan', 'btnBkmk');" class="button save <c:if test="${!empty result.bkmkSeq}">on</c:if>"><spring:message code="mypage.compny.profile.title13"/></button></span>
						</sec:authorize>
					</div>
				</div>
				<!-- //recruitment_btnbox -->

				<div class="form_wrap">
					<div class="form_title">
						<h3><spring:message code="compny.vacancy.msg.title2"/></h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title3"/></strong>
								<p class="cont_box">${result.employFormNm}</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box count2">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title4"/></strong>
								<p class="cont_box">${result.spot}</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title5"/></strong>
								<p class="cont_box">${result.iscoNm}</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box count2">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title6"/></strong>
								<p class="cont_box">${result.workBgnDt}</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title7"/></strong>
								<p class="cont_box">${result.endDt}</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title8"/></strong>
								<p class="cont_box"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.recrumtMemb}" /></p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title9"/></strong>
								<p class="cont_box">
								<c:forEach items="${result.vacancyLocBeanList }" var="vacancyLoc" varStatus="stat">
									<c:choose>
										<c:when test="${stat.count eq 1 }">
											${vacancyLoc.addrFullNm}
										</c:when>
										<c:otherwise>
											, ${vacancyLoc.addrFullNm}
										</c:otherwise>
									</c:choose>
								</c:forEach>&nbsp;
								</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title10"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.recrumtDiffcltYn == 'Y'}">
											<spring:message code="compny.vacancy.msg.title13"/>
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title11"/></strong>
							</div>
						</div>
						<div class="view_child count2">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title15"/></strong>
								<p class="cont_box">${result.employCtrctNm}</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title16"/></strong>
								<p class="cont_box">${result.employCtrctTypeNm}</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title17"/></strong>
								<p class="cont_box">${result.preferEmploymtTypeNm}</p>
							</div>
						</div>
						<!-- //view_child -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title63"/></strong>
							</div>
						</div>
						<div class="view_child count2">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title19"/></strong>
								<p class="cont_box">${result.workMornBgnTime} ~ ${result.workMornEndTime}</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title20"/></strong>
								<p class="cont_box">${result.workAfternnBgnTime} ~ ${result.workAfternnEndTime}</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title21"/></strong>
								<p class="cont_box">${result.dayWorkTime}/<spring:message code="compny.vacancy.msg.title21"/></p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="member.join.msg.required"/></span> <spring:message code="compny.vacancy.msg.title22"/></strong>
								<p class="cont_box">${result.weekWorkDay}/<spring:message code="compny.vacancy.msg.title22"/></p>
							</div>
						</div>
						<!-- //view_child -->
					</div>
					<!-- //form_view -->
				</div>
				<!-- //form_wrap -->

				<div class="form_wrap">
					<div class="form_title">
						<h3><spring:message code="compny.vacancy.msg.title23"/></h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<div class="view_box count4">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title24"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.nightWorkYn == 'Y'}">
											${result.workNightBgnTime} ~ ${result.workNightEndTime}
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title25"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.hldayWorkYn == 'Y'}">
											<spring:message code="compny.vacancy.msg.title13"/>
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title26"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.flexWorkYn == 'Y'}">
											<spring:message code="compny.vacancy.msg.title13"/>
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title26"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.overWorkYn == 'Y'}">
											<spring:message code="compny.vacancy.msg.title13"/>
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box count4">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title28"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.probtYn == 'Y'}">
											${result.probtDura} <spring:message code="compny.vacancy.msg.title18"/>
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title29"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.trnngYn == 'Y'}">
											${result.trnngDura} <spring:message code="compny.vacancy.msg.title33"/>
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title30"/></strong>
								<p class="cont_box">${result.salaryUnitNm} $<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.minSalaryAmt}" /> ~ $<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.maxSalaryAmt}" /></p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title31"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.nssfYn == 'Y'}">
											${result.nssfSpec}
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title32"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.etcInsuYn == 'Y'}">
											${result.etcInsuSpec}
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
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
						<h3><spring:message code="compny.vacancy.msg.title56"/></h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title52"/></strong>
							</div>
						</div>
						<div class="view_child count2">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title52"/></strong>
								<p class="cont_box">${result.minEduDegreeNm}</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title54"/></strong>
								<p class="cont_box">${result.iscedNm} &nbsp;</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title55"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.proLicnsYn == 'Y'}">
											${result.proLicnsNm}
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>
						<!-- //view_child -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title61"/></strong>
							</div>
						</div>
						<div class="view_child count2">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title61"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.minWorkExpYn == 'Y'}">
											${result.minWorkExp} <spring:message code="member.join.step.two.msg.year"/>
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title62"/></strong>
								<p class="cont_box">
									<c:choose>
										<c:when test="${result.minWorkExpYn == 'Y'}">
											${result.isicNm}
										</c:when>
										<c:otherwise>
											<spring:message code="compny.vacancy.msg.title14"/>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>
						<!-- //view_child -->
					</div>
					<!-- //form_view -->
				</div>
				<!-- //form_wrap -->

				<div class="form_wrap">
					<div class="form_title">
						<h3><spring:message code="mypage.compny.profile.title23"/></h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<c:forEach var="langData" items="${result.vacancyLangBeanList}" varStatus="langStatus">
						<div class="view_box count2">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title34"/></strong>
								<p class="cont_box">${langData.langNm}</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title35"/></strong>
								<p class="cont_box">${langData.langLvlNm}</p>
							</div>
						</div>
						</c:forEach>
						<!-- //view_box -->
					</div>
					<!-- //form_view -->
				</div>
				<!-- //form_wrap -->

				<div class="form_wrap">
					<div class="form_title">
						<h3><spring:message code="compny.vacancy.msg.title36"/></h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title38"/> (<spring:message code="compny.vacancy.msg.title39"/>)</strong>
								<p class="cont_box">
									<c:set var="cmt" value="${fn:replace(result.jobDesc,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									<c:out value="${cmt}" escapeXml="false"/>
								</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title40"/> (<spring:message code="compny.vacancy.msg.title41"/>)</strong>
								<p class="cont_box">
									<c:set var="cmt" value="${fn:replace(result.recrumtJobRefKnow,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									<c:out value="${cmt}" escapeXml="false"/>
								</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title42"/> (<spring:message code="compny.vacancy.msg.title43"/>)</strong>
								<p class="cont_box">
									<c:set var="cmt" value="${fn:replace(result.recrumtJobRefBasicSkill,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									<c:out value="${cmt}" escapeXml="false"/>
								</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title44"/> (<spring:message code="compny.vacancy.msg.title45"/>)</strong>
								<p class="cont_box">
									<c:set var="cmt" value="${fn:replace(result.recrumtJobRefWorkNeedItem,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									<c:out value="${cmt}" escapeXml="false"/>
								</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title37"/></strong>
								<p class="cont_box">
									<c:set var="cmt" value="${fn:replace(result.etc,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									<c:out value="${cmt}" escapeXml="false"/>
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
						<h3><spring:message code="compny.vacancy.msg.title46"/></h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="compny.vacancy.msg.title46"/></strong>
								<p class="cont_box">
								<c:forEach var="data" items="${result.vacancyPreferntBeanList}" varStatus="status">
									<c:choose>
										<c:when test="${status.count eq 1 }">
											${data.preferntCondNm}
										</c:when>
										<c:otherwise>
											, ${data.preferntCondNm}
										</c:otherwise>
									</c:choose>
								</c:forEach>&nbsp;
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
						<h3><spring:message code="compny.vacancy.msg.title47"/></h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<div class="view_box">
							<div class="view_form type6">
								<div class="cont_box">
									<c:set var="cmt" value="${fn:replace(result.workExpln,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									<c:out value="${cmt}" escapeXml="false"/>
								</div>
	<%-- 				            <div class="box_img margin_t_10">
					               <div class="inner">
					                  <img src="${pageContext.request.contextPath}/images/template/wait.jpg" alt=" image" />
					                  <span class="img_zoom"><a href="${pageContext.request.contextPath}/images/template/wait.jpg" target="_blank" title="New window open">View larger image</a></span>
					               </div>
					            </div> --%>
							</div>
						</div>
						<!-- //view_box -->
					</div>
					<!-- //form_view -->
				</div>
				<!-- //form_wrap -->

				<div class="form_wrap">
					<div class="form_title">
						<h3><spring:message code="compny.vacancy.msg.title49"/></h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<div class="view_box count2">
							<div class="view_form">
								<strong class="title"><spring:message code="member.join.step.two.compnay.msg11"/></strong>
								<p class="cont_box">${masking:getNmMasking(data.mngerNm, data.displayYn)}</p>
							</div>
							<div class="view_form">
								<strong class="title"><spring:message code="login.stop.email"/></strong>
								<p class="cont_box">${masking:getEmailMasking(data.mngerEmail,data.displayYn)}</p>
							</div>
						</div>
						<!-- //view_box -->

						<div class="view_box">
							<div class="view_form">
								<strong class="title"><spring:message code="login.findId.cell"/></strong>
								<p class="cont_box"><a href="tel:${masking:getPhoneNumberMasking(data.mngerCell,data.displayYn)}" class="mobile_phone">${masking:getPhoneNumberMasking(data.mngerCell,data.displayYn)}</a></p>
							</div>
						</div>
						<!-- //view_box -->
					</div>
					<!-- //form_view -->
				</div>
				<!-- //form_wrap -->

				<div class="form_wrap">
					<div class="form_title">
						<h3><spring:message code="compny.vacancy.msg.title64"/></h3>
					</div>
					<!-- //form_title -->
					<div class="form_view">
						<div class="view_box">
							<div class="view_form type7">
								<div class="cont_box">
								<c:forEach items="${fn:split(result.vacancyKeyword, ',') }" var="item">
									<span>${item}</span>
								</c:forEach>
							</div>
						</div>
						<!-- //view_box -->
					</div>
					<!-- //form_view -->
				</div>
				<!-- //form_wrap -->

				<div class="form_wrap">
					<div class="form_title">
						<h3><spring:message code="mypage.compny.profile.title10"/></h3>
					</div>
					<!-- //form_title -->

					<div class="recruitment_bottom margin_t_10">
						<div class="contents_wrap">
							<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${result.filePath}" alt="company logo" onerror="fnNoImage(this)" /></div>
							<div class="title_box">
								<div class="tit_box">
									<strong class="title">${result.compnyNm}</strong>
									<span class="cont_box">
										<a href="javascript:void(0);" onclick="fnCompnyView('${result.compnySeq}');" class="cont add"><spring:message code="mypage.compny.profile.title10"/></a>
										<span class="cont interest"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.compnyBmkCnt}" /></span>
									</span>
									<span class="other_box"><!-- 버튼 활성화 되어야 할 땨 클래스 on 추가 -->
										<button type="button" class="interest">interested company</button>
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
										<span class="con">${result.compnyIsicNm}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.compny.profile.title12"/></strong>
										<span class="con">${result.compnyAddrDtl}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="member.join.step.two.compnay.msg15"/></strong>
										<span class="con"><a href="${result.compnyWebsite}" target="_blank" title="open new window">${result.compnyWebsite}</a></span>
									</div>
								</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- //recruitment_bottom -->

					<div class="recruitment_btnbox">

						<div class="bbs_center"><!-- 버튼 활성화 되어야 할 땨 클래스 on 추가 -->
							<sec:authorize access="isAnonymous()">
								<a href="${pageContext.request.contextPath}/login.do?retUrl=${pageContext.request.contextPath}/vacancy/view.do?condSeq=${result.vacancySeq}" class="button apply on"><spring:message code="mypage.compny.profile.title22"/></a>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
								<c:choose>
									<c:when test="${result.vacancyStsCd == 'VCS0000000002'}"><!-- 입사지원했거나 마감인경우 -->
										<span class="button apply"><spring:message code="vacancy.view.msg"/></span>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${empty applicResult and !empty offerResult}"><!-- 입사지원 안했고  입사제의를 한경우-->
												<c:choose>
													<c:when test="${empty offerResult.offerOpenYn or offerResult.offerOpenYn == 'N'}"><!-- 입사제의 열람을 안했을경우-->
														<a href="javascript:void(0);" onclick="fnOfferSave('${offerResult.offerSeq}','${result.vacancySeq}','OK');" class="button apply on"><spring:message code="vacancy.view.msg2"/></a>
														<a href="javascript:void(0);" onclick="fnOfferSave('${offerResult.offerSeq}','${result.vacancySeq}','REJECT');" class="button apply on"><spring:message code="vacancy.view.msg3"/></a>
													</c:when>
													<c:when test="${offerResult.offerAcptYn == 'N'}"><!-- 입사제의 거절-->
														<span class="button apply"><spring:message code="vacancy.view.msg4"/></span>
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${!empty applicResult}"><!-- 입사지원했을경우 -->
												<c:choose>
													<c:when test="${applicResult.applicCancelYn == 'Y'}"><!-- 검토중이면서 입사지원 취소한 상태 -->
														<span class="button apply"><spring:message code="vacancy.view.msg5"/></span>
													</c:when>
													<c:when test="${applicResult.applicProcCd == 'APC0000000001' || applicResult.applicProcCd == 'APC0000000002'}"><!-- 검토중 -->
														<a href="javascript:void(0);" onclick="fnApplicCancel('${applicResult.resumeSeq}','${applicResult.vacancySeq}');" class="button apply on"><spring:message code="vacancy.view.msg5"/></a>
													</c:when>
													<c:when test="${applicResult.applicProcCd == 'APC0000000003' and empty intvwResult}"><!-- 서류합격이고 인터뷰가 없을경우 -->
														<span class="button apply">${applicResult.applicProcNm}</span>
													</c:when>
													<c:when test="${!empty intvwResult and intvwResult.intvwStsCd == 'INS0000000001'}"><!-- 인터뷰요청 상태일 경우 -->
														<a href="javascript:void(0);" onclick="fnOkIntvw('${result.vacancySeq}');" class="button apply on"><spring:message code="vacancy.view.msg2"/></a>
														<a href="javascript:void(0);" onclick="fnRejectIntvw('${result.vacancySeq}');" class="button apply on"><spring:message code="vacancy.view.msg3"/></a>
													</c:when>
													<c:when test="${!empty intvwResult and intvwResult.intvwStsCd != 'INS0000000001'}"><!-- 인터뷰 요청상태가 아닐경우-->
														<c:choose>
															<c:when test="${intvwResult.intvwStsCd == 'INS0000000002'}"><!-- 인터뷰 수락 -->
																<span class="button apply">${intvwResult.intvwStsNm}</span>
	<!-- 															<span class="button apply">온라인 인터뷰 상세보기</span> -->
															</c:when>
															<c:otherwise><!-- 인터뷰 거절 -->
																<span class="button apply">${intvwResult.intvwStsNm}</span>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${applicResult.applicProcCd == 'APC0000000004'}"><!-- 최종합격 -->
														<span class="button apply">${applicResult.applicProcNm}(<spring:message code="vacancy.view.msg6"/>)</span>

													</c:when>
												</c:choose>

											</c:when>
											<c:when test="${empty applicResult}"><!-- 입사지원안했을경우 -->
												<a id="aTagApplic2" href="javascript:void(0);" onclick="fnApplicSaveType2('${result.vacancySeq}','','aTagApplic2');" class="button apply on"><spring:message code="mypage.compny.profile.title22"/></a>
											</c:when>
										</c:choose>
									</c:otherwise>
								</c:choose>
								<span id="bkmkSpan2"><button type="button" id="btnBkmk2" onclick="fnBkmk('${result.bkmkSeq}','${result.vacancySeq}',LIKE_CATEGORY_VACANCY, 'bkmkSpan2', 'btnBkmk2');" class="button save <c:if test="${!empty result.bkmkSeq}">on</c:if>"><spring:message code="mypage.compny.profile.title13"/></button></span>
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