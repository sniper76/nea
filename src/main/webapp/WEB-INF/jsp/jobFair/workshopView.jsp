<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
	var addrArr = new Array;
    	$(document).ready(function() {
    	});

    	function fnApply(seq, workshopSeq, workPatcptnSeq, stsCd) {
    		if('WSC0000000002' != stsCd) {
				alertify.alert("<spring:message code="eduTrnng.free.search.title33"/>", function (e){

				});
				return false;
    		}
			alertify.confirm("<spring:message code="eduTrnng.free.search.title32"/>", function (e){

    			if (e) {
    	    		var params = {
    	    				fairSeq : seq,
    	    				fairWorkshopSeq : workshopSeq,
    	    				fairWorkshopPatcptnSeq : workPatcptnSeq,
    	    				cancelYn : 'N',
    	    				delYn : 'N',
    	    		};

    				$.ajax({
    					url: contextPath + '/jobFair/workshopApply.do',
    					type: METHOD_POST,
    					data: params,
    					datatype: AJAX_DATA_TYPE_JSON
    				})
    				.done(function(data) {
    					if (data.result == "Y") {
    						alertify.alert("<spring:message code="counsel.msg.update.ok"/>", function (e){
					    		fnSubmit(seq, workshopSeq, data.seq);
							});
    					}
    				})
    				.fail(function(xhr, status, errorThrown) {
    					alertify.alert("<spring:message code="errors.ajax.fail"/>");
    				});
    			}
			});
    	}

       	function fnSubmit(seq, seq2, seq3) {
    		$("input#condFairSeq").val(seq);
    		$("input#condSeq").val(seq);
    		$("input#newYn").val('N');
    		$("input#condFairWorkshopSeq").val(seq2);
    		$("input#condFairWorkshopPatcptnSeq").val(seq3);
    		$("form#frm").submit();
       	}

    </script>
	<main class="colgroup" id="colgroup">
            <article>
                <header class="sub_head">

                    <div class="sub_title">
						<h2><span><spring:message code="eduTrnng.free.search.title30"/></span></h2>
					</div>
                </header>

                <div id="contents" class="jobFairWorkshopView">
<form id="frm" name="frm" action="${pageContext.request.contextPath}/jobFair/workshopView.do" method="post">
<input type="hidden" id="condSeq" name="condSeq" value="" />
<input type="hidden" id="newYn" name="newYn" value="" />
<input type="hidden" id="condFairSeq" name="condFairSeq" value="" />
<input type="hidden" id="condFairWorkshopSeq" name="condFairWorkshopSeq" value="" />
<input type="hidden" id="condFairWorkshopPatcptnSeq" name="condFairWorkshopPatcptnSeq" value="" />
</form>
					<div class="recruitment_box type3">
						<div class="contents_wrap">
							<div class="title_box">
								<div class="tit_box">
									<span class="tit"><span class="bbs_status type01"><c:out value="${result.workshopStsNm }"/></span></span>
									<span class="${result.remainDiv}">${result.remainDt}<c:if test="${result.remainDiv == 'hurry'}">Hour</c:if></span>
								</div>
								<p class="title">${result.workshopNm}</p>
							</div>
							<div class="contents_box clearfix">
								<div class="cont_box">
									<strong class="title"><spring:message code="eduTrnng.free.search.title34"/></strong>
									<ul class="clearfix">
									<li>
										<div class="cont">
											<strong class="tit"><spring:message code="eduTrnng.free.search.title36"/></strong>
											<span class="con">${result.addrNm }</span>
										</div>
									</li>
									<li>
										<div class="cont">
											<strong class="tit"><spring:message code="eduTrnng.free.search.title37"/></strong>
											<span class="con">${result.lectureRoom }</span>
										</div>
									</li>
									<li>
										<div class="cont">
											<strong class="tit"><spring:message code="eduTrnng.free.search.title35"/></strong>
											<span class="con">${result.fairBgnDt}~${result.fairEndDt}</span>
										</div>
									</li>
									<li>
										<div class="cont">
											<strong class="tit"><spring:message code="compny.vacancy.msg.title8"/></strong>
											<span class="con"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.recurmtManCnt }"/> / <fmt:formatNumber type="number" maxFractionDigits="3" value="${result.recurmtMan }"/></span>
										</div>
									</li>
									<li>
										<div class="cont">
											<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title17"/></strong>
											<span class="con"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.tuition }" /></span>
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
						<c:when test="${empty result.cancelYn or result.cancelYn == 'N' }">
							<c:choose>
							<c:when test="${applyClass == 'on' }">
								<a href="javascript:void(0);" onclick="javascript:fnApply('${result.fairSeq}', '${result.fairWorkshopSeq }', '${result.fairWorkshopPatcptnSeq }', '${result.workshopStsCd }');" class="button apply ${applyClass }"><spring:message code="apply.participate"/></a>
							</c:when>
							<c:otherwise>
								<span class="button apply ${applyClass }"><spring:message code="apply.participate"/></span>
							</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<span class="button"><spring:message code="mypage.compny.applic.msg11"/></span>
						</c:otherwise>
						</c:choose>
						</span>
							<p class="bbs_write_bottom"><spring:message code="eduTrnng.free.search.title31"/></p>
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
														<c:when test="${fn:length(result.expln) > 30}">
															<c:out value="${fn:substring(result.expln,0,30)}"/>...
														</c:when>
														<c:otherwise>
															<c:out value="${result.expln}"/>
														</c:otherwise>
													</c:choose></p>
								</div>
							</div>
							<!-- //view_box -->

							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="eduTrnng.free.search.title35"/></strong>
									<p class="cont_box">${result.fairBgnDt}~${result.fairEndDt}</p>
								</div>
							</div>
							<!-- //view_box -->

							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="mypage.instt.eduTrnng.title12"/></strong>
									<p class="cont_box"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.tuition }" /></p>
								</div>
							</div>
							<!-- //view_box -->

							<div class="view_box">
								<div class="view_form">
									<strong class="title"><spring:message code="eduTrnng.free.search.title36"/></strong>
									<p class="cont_box"><c:out value="${result.workshopAddrFullNm }" escapeXml="false" /></p>
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
									<p class="cont_box">${result.target }</p>
								</div>
								<div class="view_form">
									<strong class="title"><spring:message code="compny.vacancy.msg.title8"/></strong>
									<p class="cont_box"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.recurmtMan }"/></p>
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
												<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${result.teacherFilePath1 }" alt=" image" onerror="fnNoImage(this)" /></div>
												<div class="contents_box">
													<div class="title_box">
														<strong class="title">${result.teacherNm1 }</strong>
													</div>
													<div class="cont_box">
														<div class="cont">
															<%-- <strong class="title"><spring:message code="eduTrnng.free.search.title21"/></strong> --%>
															<span class="con">
										<c:set var="cmt" value="${fn:replace(result.teacherBhist1,crcn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
										<c:out value="${cmt}" escapeXml="false"/></span>
														</div>
													</div>
												</div>
											</div>
										</li>
										</c:if>
										<c:if test="${result.teacherNm2 != null }">
										<li>
											<div class="box_wrap">
												<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${result.teacherFilePath2 }" alt=" image" onerror="fnNoImage(this)" /></div>
												<div class="contents_box">
													<div class="title_box">
														<strong class="title">${result.teacherNm2 }</strong>
													</div>
													<div class="cont_box">
														<div class="cont">
															<%-- <strong class="title"><spring:message code="eduTrnng.free.search.title21"/></strong> --%>
															<span class="con">
										<c:set var="cmt" value="${fn:replace(result.teacherBhist2,crcn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
										<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
										<c:out value="${cmt}" escapeXml="false"/></span>
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
										<c:if test="${result.teachFileGrpSeq != null }">
										<li>
											<div class="img_box">
												<div class="box_img">
													<div class="inner">
														<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${result.teachFileGrpSeq }" alt=" image" onerror="fnNoImage(this)" />
														<span class="img_zoom"><a href="${pageContext.request.contextPath}/common/imgLoading.do?url=${result.teachFileGrpSeq }" target="_blank" title="New window open">View larger image</a></span>
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