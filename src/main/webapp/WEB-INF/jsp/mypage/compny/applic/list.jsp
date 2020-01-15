<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
    	    // 라디오버튼 클릭시 이벤트 발생
    	    $("input:radio[name=rdo]").click(function(){

    	    	//fnVacancyChange();
    	    })


			var $obj = $('input:radio[name="rdo"]:checked'),
			$this=$obj.parents('li'),
			$this_contents=$this.find('.contents_wrap'),
			$this_clone=$this_contents.clone(true),
			$target=$('.search_matching .open'),
			$target_contents=$target.find('.contents_wrap'),
			$target_clone=$target_contents.clone(true);

			if("<c:out value="${param.condSeq}"/>" != null && "<c:out value="${param.condSeq}"/>" != "") {//JobVacancy Management에서 클릭해서온경우만 처리
				$target_contents.remove();
				$this_contents.remove();
				$target.append($this_clone);
				$this.append($target_clone);
			}
			fnVacancyChange();



    	});

    	function fnVacancyChange() {
			$("#currentPageNo").val(1);
			$("#condText").val("");
			$("#condText2").val("");
			$("#condSeq").val($("input:radio[name=rdo]:checked").val());

			fnGetApplicList();
    	}

    	function fnGetApplicList() {
			$.ajax({
				url: contextPath + "/cpes/compny/applic/listAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'html'
			})
			.done(function(data) {
				$("#applicListDiv").html(data);
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			});
    	}


	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.applic.title"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="applicList">
				<div class="search_matching">
					<div class="box_wrap recruitment_list">
						<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/applic/list.do" method="post">
							<input type="hidden" id="currentPageNo" name="currentPageNo" value="1"/>
							<input type="hidden" id="condText" name="condText" value=""/>
							<input type="hidden" id="condApplicProcCd" name="condApplicProcCd" value="${param.condApplicProcCd}"/>
							<input type="hidden" id="condSeq" name="condSeq" value="${param.condSeq}"/>

							<fieldset>
								<legend>Search Auto Matching</legend>

								<c:forEach var="data" items="${resultList2}" varStatus="status">
									<c:if test="${status.count == 1}">
										<button type="button" class="open">
											<span class="contents_wrap">
												<span class="check_area">
													<label for="rdo_${status.count}">Select Recruitment Notice</label>
													<input type="radio" id="rdo_${status.count}" name="rdo" value="${data.vacancySeq}" <c:if test="${param.condSeq == data.vacancySeq}">checked</c:if> />
												</span>
												<span class="contents_box">
													<span class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
														<strong class="title">${data.vacancyTitle}</strong>
													</span>
													<span class="cont_box">
														<span class="cont">
															<span class="con">${data.bgnDt} ~ ${data.endDt}</span>
															<span class="con"><spring:message code="compny.vacancy.msg.title8"/> : <fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></span>
														</span>
													</span>
													<span class="other_box">
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
													</span>
												</span>
											</span>
										</button>
									</c:if>
								</c:forEach>
								<div class="child_box">
									<ul class="clearfix">
									<c:forEach var="data" items="${resultList2}" varStatus="status">
										<c:if test="${status.count > 1}">
											<li>
												<span class="contents_wrap">
													<span class="check_area">
														<label for="rdo_${status.count}">Select Recruitment Notice</label>
														<input type="radio" id="rdo_${status.count}" name="rdo" value="${data.vacancySeq}" <c:if test="${param.condSeq == data.vacancySeq}">checked</c:if>/>
													</span>
													<span class="contents_box">
														<span class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
															<strong class="title">${data.vacancyTitle}</strong>
														</span>
														<span class="cont_box">
															<span class="cont">
																<span class="con">${data.bgnDt} ~ ${data.endDt}</span>
																<span class="con"><spring:message code="compny.vacancy.msg.title8"/> : <fmt:formatNumber type="number" maxFractionDigits="3" value="${data.recrumtMemb}" /></span>
															</span>
														</span>
														<span class="other_box">
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
														</span>
													</span>
												</span>
											</li>
										</c:if>
									</c:forEach>
									</ul>
								</div>
								<button type="button" class="submit" onclick="fnVacancyChange();"><spring:message code="sel"/></button>
							</fieldset>
						</form>
					</div>
				</div>
				<!-- //search_matching -->


				<div id="applicListDiv"></div>



			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->