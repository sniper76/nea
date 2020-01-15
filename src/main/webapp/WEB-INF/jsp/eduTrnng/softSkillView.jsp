<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
	var addrArr = new Array;
    	$(document).ready(function() {
			<c:forEach var="data" items="${resultList}" >
				addrArr.push("${data.addrNm}");
			</c:forEach>
			$("#eduTrnngArea").html(addrArr.join(","));
    	});

    	function fnApply(seq, stsCd) {
    		if('RSC0000000003' == stsCd) {
				alertify.alert("<spring:message code="mypage.instt.eduTrnng.title25"/>", function (e){

				});
				return false;
    		}
    		fnSubmit(seq);
    	}

       	function fnSubmit(seq) {
    		$("input#condSeq").val(seq);
    		$("input#condCateCd").val('${result.jcAgreeStsCd }');
    		$("form#frm").submit();
       	}

    </script>
	<main class="colgroup" id="colgroup">
            <article>
                <header class="sub_head">

                    <div class="sub_title">
						<h2><span><spring:message code="eduTrnng.free.search.title24"/></span></h2>
					</div>
                </header>

                <div id="contents" class="eduTrnngSoftSkillView">
<form id="frm" name="frm" action="${pageContext.request.contextPath}/eduTrnng/apply.do" method="post">
<input type="hidden" id="condSeq" name="condSeq" value="" />
<input type="hidden" id="condCateCd" name="condCateCd" value="" />
</form>
					<div class="recruitment_box type3">
						<div class="contents_wrap">
							<div class="title_box">
								<div class="tit_box">
									<span class="tit"><span class="bbs_status type01"><c:out value="${result.recrumtStsNm }"/></span></span>
									<span class="${result.remainDiv}">${result.remainDt}<c:if test="${result.remainDiv == 'hurry'}">Hour</c:if></span>
								</div>
								<p class="title">${result.eduTrnngNm} <span class="interest"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.bkmkCnt}" /></span></p>
							</div>
							<div class="contents_box clearfix">
								<div class="cont_box">
									<strong class="title"><spring:message code="eduTrnng.free.search.title10"/></strong>
									<ul class="clearfix">
									<li>
										<div class="cont">
											<strong class="tit"><spring:message code="counsel.msg.member.division"/></strong>
											<span class="con">${result.trnngNatnexpDivNm}</span>
										</div>
									</li>
									<li>
										<div class="cont">
											<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title9"/></strong>
											<span class="con">${result.recurmtBgnDt}~${result.recurmtEndDt}</span>
										</div>
									</li>
									<li>
										<div class="cont">
											<strong class="tit"><spring:message code="eduTrnng.free.search.title11"/></strong>
											<span class="con">${result.addrNm }</span>
										</div>
									</li>
									<li>
										<div class="cont">
											<strong class="tit"><spring:message code="compny.vacancy.msg.title8"/></strong>
											<span class="con">${result.recrumtMemb }</span>
										</div>
									</li>
									<li>
										<div class="cont">
											<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title12"/></strong>
											<span class="con" id="eduTrnngArea"></span>
										</div>
									</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- //recruitment_box -->

					<div class="recruitment_btnbox">
						<div class="bbs_center"><sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
						<span>
						<c:choose>
						<c:when test="${applyClass == 'on' }">
							<a href="javascript:void(0);" onclick="javascript:fnApply('${result.eduTrnngSeq}', '${result.recrumtStsCd }');" class="button apply ${applyClass }"><spring:message code="eduTrnng.free.search.title12"/></a>
						</c:when>
						<c:otherwise>
							<span class="button apply ${applyClass }"><spring:message code="eduTrnng.free.search.title12"/></span>
						</c:otherwise>
						</c:choose>
						</span>
						<span id="bkmkDiv">
							<button type="button" id="btnBkmk" class="button save <c:if test="${!empty result.bkmkSeq and result.bkmkSeq != ''}">on</c:if>" onclick="fnBkmk('${result.bkmkSeq}','${result.eduTrnngSeq}', LIKE_CATEGORY_NEA_TRNCT, 'bkmkDiv', 'btnBkmk');"><spring:message code="eduTrnng.free.search.title13"/></button>
						</span>
							<p class="bbs_write_bottom"><spring:message code="eduTrnng.free.search.title14"/></p>
							</sec:authorize>
						</div>
					</div>
					<!-- //recruitment_btnbox -->

					<div class="form_wrap">
						<div class="form_title">
							<h3><spring:message code="eduTrnng.free.search.title28"/></h3>
						</div>
						<!-- //form_title -->
						<div class="form_view">
							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="title.sample.description"/></strong>
									<p class="cont_box"><c:choose>
														<c:when test="${fn:length(result.content) > 30}">
															<c:out value="${fn:substring(result.content,0,30)}"/>...
														</c:when>
														<c:otherwise>
															<c:out value="${result.content}"/>
														</c:otherwise>
													</c:choose></p>
								</div>
							</div>
							<!-- //view_box -->

							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="eduTrnng.free.search.title15"/></strong>
									<p class="cont_box">${result.curricl }</p>
								</div>
							</div>
							<!-- //view_box -->

							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="eduTrnng.free.search.title16"/></strong>
									<p class="cont_box">${result.matr }</p>
								</div>
							</div>
							<!-- //view_box -->

							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="mypage.instt.eduTrnng.title9"/></strong>
									<p class="cont_box">${result.eduBgnDt} ~ ${result.eduEndDt}</p>
								</div>
							</div>
							<!-- //view_box -->

							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="mypage.instt.eduTrnng.title12"/></strong>
									<p class="cont_box" id="eduTrnngArea2"></p>
								</div>
							</div>
							<!-- //view_box -->

							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="mypage.compny.profile.title12"/></strong>
									<p class="cont_box">${result.addrFullNm }</p>
									<div class="margin_t_5">
										<a href="javascript:void(0);" onclick="javascript:fnViewMap('<c:out value="${result.googleMapLink}"/>', 1024, 768, 'MapWin');" class="bbs_btn_map"><spring:message code="jobcenter.list.button1"/></a>
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
							<h3><spring:message code="eduTrnng.free.search.title17"/></h3>
						</div>
						<!-- //form_title -->
						<div class="form_view">
							<div class="view_box count2">
								<div class="view_form">
									<strong class="title"><spring:message code="eduTrnng.free.search.title18"/></strong>
									<p class="cont_box">${result.eduTarget }</p>
								</div>
								<div class="view_form">
									<strong class="title"><spring:message code="compny.vacancy.msg.title8"/></strong>
									<p class="cont_box">${result.recrumtMemb }</p>
								</div>
							</div>
							<!-- //view_box -->

							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="eduTrnng.free.search.title19"/></strong>
									<div class="form_person">
										<ul class="clearfix">
										<c:if test="${result.teacherNm1 != null }">
										<li>
											<div class="box_wrap">
												<div class="img_box"><img src="${pageContext.request.contextPath}${result.teacherPhotoPath1 }/${result.teacherPhotoNm1 }" alt=" image" onerror="fnNoImage(this)" /></div>
												<div class="contents_box">
													<div class="title_box">
														<strong class="title">${result.teacherNm1 }</strong>
													</div>
													<div class="cont_box">
														<div class="cont">
															<strong class="title"><spring:message code="eduTrnng.free.search.title20"/></strong>
															<span class="con">${result.majorDepthNm1 }</span>
														</div>
														<div class="cont">
															<strong class="title"><spring:message code="eduTrnng.free.search.title21"/></strong>
															<span class="con">${result.teacherCareer1 }</span>
														</div>
													</div>
												</div>
											</div>
										</li>
										</c:if>
										<c:if test="${result.teacherNm2 != null }">
										<li>
											<div class="box_wrap">
												<div class="img_box"><img src="${pageContext.request.contextPath}${result.teacherPhotoPath2 }/${result.teacherPhotoNm2 }" alt=" image" onerror="fnNoImage(this)" /></div>
												<div class="contents_box">
													<div class="title_box">
														<strong class="title">${result.teacherNm2 }</strong>
													</div>
													<div class="cont_box">
														<div class="cont">
															<strong class="title"><spring:message code="eduTrnng.free.search.title20"/></strong>
															<span class="con">${result.majorDepthNm2 }</span>
														</div>
														<div class="cont">
															<strong class="title"><spring:message code="eduTrnng.free.search.title21"/></strong>
															<span class="con">${result.teacherCareer2 }</span>
														</div>
													</div>
												</div>
											</div>
										</li>
										</c:if>
										</ul>
									</div>
								</div>
							</div>
							<!-- //view_box -->

							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="eduTrnng.free.search.title22"/></strong>
									<div class="form_photo type2">
										<ul class="clearfix">
										<c:if test="${result.lecturePhotoNm }">
										<li>
											<div class="img_box">
												<div class="box_img">
													<div class="inner">
														<img src="${pageContext.request.contextPath}${result.lecturePhotoPath }/${result.lecturePhotoNm }" alt=" image" onerror="fnNoImage(this)" />
														<span class="img_zoom"><a href="${pageContext.request.contextPath}${result.lecturePhotoPath }/${result.lecturePhotoNm }" target="_blank" title="New window open">View larger image</a></span>
													</div>
												</div>
											</div>
										</li>
										</c:if>
										</ul>
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
							<h3><spring:message code="compny.vacancy.msg.title64"/></h3>
						</div>
						<!-- //form_title -->
						<div class="form_view">
							<div class="view_box">
								<div class="view_form type7">
									<div class="cont_box">
										<span>${result.eduTrnngKeyword }</span>
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
							<h3><spring:message code="eduTrnng.free.search.title23"/></h3>
						</div>
						<!-- //form_title -->
						<div class="form_view">
							<div class="view_box count2">
								<div class="view_form">
									<strong class="title"><spring:message code="member.join.step.two.compnay.msg11"/></strong>
									<p class="cont_box">${result.mngerNm }</p>
								</div>
								<div class="view_form">
									<strong class="title"><spring:message code="login.stop.email"/></strong>
									<p class="cont_box">${result.email }</p>
								</div>
							</div>
							<!-- //view_box -->

							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="login.findId.cell"/></strong>
									<p class="cont_box"><a href="tel:0000000000" class="mobile_phone">${result.cell }</a></p>
								</div>
							</div>
							<!-- //view_box -->
						</div>
						<!-- //form_view -->
					</div>
					<!-- //form_wrap -->
                </div>
                <!-- //contents -->
            </article>
	</main>
    <!-- //main.colgroup -->