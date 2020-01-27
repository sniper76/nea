<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp"%>

<main class="colgroup" id="colgroup">
<article>
	<header class="sub_head">
		<div class="sub_title">
			<h2>
				<span><spring:message code="mypage.private.applic.title" /></span>
			</h2>
		</div>
	</header>
	<div id="contents" class="applicList">

		<div class="box_step count5">
			<ul class="clearfix">
				<li>
					<div class="contents_wrap">
						<a href="javascript:fnGoReload('A0')" class="contents_box">
							<!-- 전체 -->
							<span class="title_box">
								<strong class="title"><spring:message code="counsel.msg.all" /></strong>
							</span>
							<span class="cont_box">
								<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.CNT_0}" /></span>
							</span>
						</a>
					</div>
				</li>
				<li>
					<div class="contents_wrap">
						<a href="javascript:fnGoReload('A1')" class="contents_box">
							<!-- 미열람 -->
							<span class="title_box">
								<strong class="title"><spring:message code="mypage.compny.vacancy.msg2" /></strong>
							</span>
							<span class="cont_box">
								<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.CNT_1}" /></span>
							</span>
						</a>
					</div>
				</li>
				<li>
					<div class="contents_wrap">
						<a href="javascript:fnGoReload('A2')" class="contents_box">
							<!-- 검토중 -->
							<span class="title_box">
								<strong class="title"><spring:message code="mypage.compny.vacancy.msg3" /></strong>
							</span>
							<span class="cont_box">
								<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.CNT_2}" /></span>
							</span>
						</a>
					</div>
				</li>
				<li>
					<div class="contents_wrap">
						<a href="javascript:fnGoReload('A3')" class="contents_box">
							<!-- 면접제의 -->
							<span class="title_box">
								<strong class="title"><spring:message code="offer.interview" /></strong>
							</span>
							<span class="cont_box">
								<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.CNT_5}" /></span>
							</span>
						</a>
					</div>
				</li>
				<li>
					<div class="contents_wrap">
						<a href="javascript:fnGoReload('A4')" class="contents_box">
							<!-- 채용확정 -->
							<span class="title_box">
								<strong class="title"><spring:message code="mypage.compny.vacancy.msg5" /></strong>
							</span>
							<span class="cont_box">
								<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.CNT_4}" /></span>
							</span>
						</a>
					</div>
				</li>
			</ul>
		</div>
		<!-- //box_step -->

		<div class="cv_search">
			<div class="box_wrap">
				<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/private/applic/list.do" method="post">
					<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
					<input type="hidden" id="condSeq" name="condSeq" />
					<input type="hidden" id="cd" name="cd" />

					<fieldset>
						<legend>CV Search</legend>
						<ul class="clearfix">
							<li>
								<div class="cont_box">
									<strong class="title"><spring:message code="application.date" /></strong><!-- 입사지원일 -->
									<span class="cont">
										<span class="period_box">
											<span class="date_box">
												<label for="condBgnDt" class="skip">start date</label>
												<input type="text" id="condBgnDt" name="condBgnDt" title="Start date Select from calendar" placeholder="DD/MM/YYYY" value="<c:out value="${param.condBgnDt}" />" />
												<button type="button" id="condBgnDtCal"><spring:message code="mypage.compny.vacancy.intvw.video.lbl07" /></button>
											</span> ~&nbsp;
											<span class="date_box">
												<label for="condEndDt" class="skip">end date</label>
												<input type="text" id="condEndDt" name="condEndDt" title="End date Select from calendar" placeholder="DD/MM/YYYY" value="<c:out value="${param.condEndDt}" />" />
												<button type="button" id="condEndDtCal"><spring:message code="mypage.compny.vacancy.intvw.video.lbl08" /></button>
											</span>
										</span>
										<span class="period_choose">
											<button type="button" onclick="fnDateAdd('M', -1)">1M</button>
											<button type="button" onclick="fnDateAdd('M', -3)">3M</button>
											<button type="button" onclick="fnDateAdd('Y', -1)">1Y</button>
										</span>
									</span>
								</div>
							</li>
							<li>
								<div class="cont_box type2">
									<strong class="title"><spring:message code="progress.yn" /></strong><!-- 진행여부 -->
									<span class="cont">
										<label for="condStatTypeCd" class="skip"><spring:message code="progress.yn" /></label><!-- 진행여부 -->
										<select id="condStatTypeCd" name="condStatTypeCd">
											<option value=""><spring:message code="counsel.msg.all"/></option>
											<option value="CONTINUE" <c:if test="${param.condStatTypeCd == 'CONTINUE'}">selected</c:if>><spring:message code="compny.vacancy.msg.title72" /></option><!-- 채용중 -->
											<option value="END" <c:if test="${param.condStatTypeCd == 'END'}">selected</c:if>><spring:message code="compny.vacancy.msg.title73" /></option><!-- 채용마감 -->
										</select>
									</span>
								</div>
								<div class="cont_box type2">
									<strong class="title"><spring:message code="recruitment.status" /></strong><!-- 채용상태 -->
									<span class="cont">
										<label for="condStatTypeCd2" class="skip"><spring:message code="recruitment.status" /></label><!-- 채용상태 -->
										<select id="condStatTypeCd2" name="condStatTypeCd2" >
											<option value=""><spring:message code="counsel.msg.all"/></option>
											<option value="NOT_OPEN" <c:if test="${param.condStatTypeCd2 == 'NOT_OPEN'}">selected</c:if>><spring:message code="mypage.compny.vacancy.msg2" /></option><!-- 미열람 -->
											<option value="CHECK" <c:if test="${param.condStatTypeCd2 == 'CHECK'}">selected</c:if>><spring:message code="mypage.compny.vacancy.msg3" /></option><!-- 검토중 -->
											<option value="PAPER" <c:if test="${param.condStatTypeCd2 == 'PAPER'}">selected</c:if>><spring:message code="mypage.compny.vacancy.msg4" /></option><!-- 서류합격 -->
											<option value="INTVW" <c:if test="${param.condStatTypeCd2 == 'INTVW'}">selected</c:if>><spring:message code="offer.interview" /></option><!-- 면접제의 -->
											<option value="PASS" <c:if test="${param.condStatTypeCd2 == 'PASS'}">selected</c:if>><spring:message code="mypage.compny.vacancy.msg5" /></option><!-- 채용확정 -->
										</select>
									</span>
								</div>
							</li>
							<li>
								<div class="cont_box type3">
									<strong class="title"><spring:message code="search.keyword" /></strong><!-- 검색어 입력 -->
									<span class="cont">
										<label for="condTypeCd" class="skip">CV Category</label>
										<select id="condTypeCd" name="condTypeCd" >
											<option value=""><spring:message code="counsel.msg.all"/></option>
											<option value="COMPNY" <c:if test="${param.condTypeCd == 'COMPNY'}">selected</c:if>><spring:message code="compnyNm" /></option><!-- 기업명 -->
											<option value="VACANCY" <c:if test="${param.condTypeCd == 'VACANCY'}">selected</c:if>><spring:message code="recruitment.notice.title" /></option><!-- 채용공고명 -->
										</select>
										<label for="condText" class="skip">CV Title</label>
										<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="con type2" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
										<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text"><!-- on submit 방지 -->
									</span>
								</div>
							</li>
						</ul>
						<button type="submit" class="submit" onclick="fnGoSearch()"><spring:message code="button.search" /></button>
					</fieldset>
				</form>
			</div>
		</div>
		<!-- //cv_search -->

		<div class="bbs_info clearfix">
			<!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
			<div class="bbs_left bbs_count">
				<strong class="currently">${paginationInfo.currentPageNo}</strong> <span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
				<span class="order">
					<strong class="skip">Change list order</strong>
					<!-- Latest -->
					<button type="button"><spring:message code="counsel.msg.sortBy.latest" /></button>
					<!-- View -->
<%-- 					<button type="button"><spring:message code="counsel.msg.sortBy.view" /></button> --%>
					<!-- Like -->
<%-- 					<button type="button"><spring:message code="counsel.msg.sortBy.like" /></button> --%>
				</span>
			</div>
		</div>
		<!-- //bbs_info -->

		<c:if test="${!empty resultList}">
		<div class="bbs_basic">
			<ul class="recruitment_list type2 my clearfix">
				<c:forEach var="data" items="${resultList}" varStatus="status">
				<li>
					<span class="check_box">
						<label for="applicSeq" class="skip">Select</label>
						<input type="checkbox" id="applicSeq" name=applicSeq value="<c:out value="${data.applicSeq}" />" <c:if test="${data.applicCancelYn != 'Y'}">disabled="disabled"</c:if> />
					</span>
					<div class="contents_wrap">
						<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
							<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>">
								<span class="tit"><c:out value="${data.compnyNm}" /></span>
								<a href="javascript:fnVacancyView('${data.vacancySeq}','frm');" class="title">
									<c:if test="${data.applicCancelYn == 'Y'}">(<spring:message code="canceled" />)</c:if>
									<c:out value="${data.vacancyTitle}" />
								</a>
							</div>
							<div class="cont_box">
								<span class="cont">
									<span class="con">
										<span class="em_point"><spring:message code="application.date" /></span>&nbsp;:&nbsp;
										<strong><c:out value="${data.regDt}" /></strong>
									</span>
									<span class="con">
										<c:choose>
											<c:when test="${data.applicProcCd != 'APC0000000001'}">
												<span class="con"><span class="em_point"><spring:message code="viewed" /></span>&nbsp;:&nbsp;<strong><c:out value="${data.resumeOpenDt}" /></strong></span>
											</c:when>
											<c:otherwise>
												<span class="con"><span><spring:message code="mypage.compny.vacancy.msg2" /></span></span>
											</c:otherwise>
										</c:choose>
									</span>
								</span>
								<span class="cont margin_t_10">
									<!-- 지원이력서 보기 -->
									<a href="javascript:void(0);" onclick="javascript:fnResumeView('${data.resumeSeq}','N');" class="bbs_btn small"><spring:message code="my.application" /></a>
								</span>
							</div>
							<div class="other_box type2">
								<c:choose>
									<c:when test="${data.vacancyCloseYn == 'Y'}">
								<span class="top_box"><spring:message code="compny.vacancy.msg.title73" /></span>
									</c:when>
									<c:otherwise>
								<span class="top_box">
									<span class="day"><c:out value="${data.vacancyDaysLeft}" /></span>
									<!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
								</span>
								<c:if test="${data.applicCancelYn != 'Y'}">
								<span class="bottom_box">
									<!-- 취소 -->
									<button type="button" class="bbs_btn small" onclick="fnApplicCancel('${data.resumeSeq}','${data.vacancySeq}');"><spring:message code="login.findPwd.btn.cancel" /></button>
								</span>
								</c:if>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		<!-- //bbs_basic -->
		</c:if>
		<c:if test="${empty resultList}">
			<div class="bbs_empty">
				<p><spring:message code="counsel.msg.no.data"/></p>
				<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
			</div>
			<!-- //bbs_empty -->
		</c:if>

		<c:if test="${!empty resultList}">
		<div class="bbs_btn_wrap clearfix">
			<span class="bbs_left"> </span> <span class="bbs_right">
				<button type="button" class="bbs_btn delete" onclick="fnDelApplication()"><spring:message code="button.delete" /></button>
			</span>
		</div>
		<!-- //bbs_btn_wrap -->
		</c:if>

		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
		</div>
		<!--  //pagination -->

	</div>
	<!-- //contents -->
</article>
</main>
<!-- //main.colgroup -->

   <script>
   	$(document).ready(function() {
		if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
			alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
				fnGoMain();
			});
			return false;
		}
		$("#condBgnDtCal").click(function() { $("#condBgnDt").datepicker("show"); });
		$("#condEndDtCal").click(function() { $("#condEndDt").datepicker("show"); });
		//검색키워드 enter
		$("#condText").keypress(function( event ) {
			if( event.which == 13 ) {
				$("#cd").val("");
				fnSetPageing("1");
			}
		});

   		$("#condEndDt").datepicker({
   			dateFormat: 'dd/mm/yy', //Input Display Format 변경
   			showOn: "both",
   			minDate: "10Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
   			maxDate: "0M"
   		});
		if("${param.condEndDt}" == null || "${param.condEndDt}" == "") {
   			$('#condEndDt').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
   		}

   		$("#condBgnDt").datepicker({
   			dateFormat: 'dd/mm/yy', //Input Display Format 변경
   			showOn: "both",
   			minDate: "-10Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
   			maxDate: "0M"
   		});
		if("${param.condBgnDt}" == null || "${param.condBgnDt}" == "") {
   			$('#condBgnDt').datepicker('setDate', '-1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
   		}
   	});

   	function fnGoSearch() {
   		$("#cd").val("");
   		fnSetPageing(1);
   	}
   	function fnSetPageing(curPage) {
   		$("#currentPageNo").val(curPage);
   		fnGoList("frm");
   	}
	function fnDelApplication() {
		var applicSeqArr = $("[name=applicSeq]:checked").map(function(){ return this.value; });
		if(applicSeqArr == null || applicSeqArr.length == 0) {
			alertify.alert("<spring:message code="application.del" />");
			return;
		}

		// 삭제하시겠습니까?
		alertify.confirm("<spring:message code="compny.vacancy.msg.btn.delete" />", function (e) {
			if (e) {
				$.ajax({
					type: 'post', datatype: 'json',
					url: contextPath + "/cpes/private/applic/deleteApplicationAjax.do",
					data: {
						applicSeq: applicSeqArr.toArray().toString()
					}
				})
				.done(function(data) {
					if (data.result.successYn == "Y") {
						location.reload();
					} else {
						alertify.alert(systemMsg);
					}
				})
				.fail(function(xhr, status, errorThrown) {
					alertify.alert(systemMsg);
				});
			}
		});
	}
	function fnGoReload(flag) {
   		$("#currentPageNo").val(1);
   		$("#cd").val(flag);
   		fnGoList("frm");
	}
   	function fnDateAdd(flag, interval) {
		var d0 = new Date();
   		var d1 = $("#condEndDt").val();
		if(d1) {
			d2 = d1.split("/");
	   		d0 = new Date(d2[2], d2[1]-1, d2[0]);
		}
	    if(flag == "M") { //month
	    	d0.setMonth(d0.getMonth() + interval);
	    } else if(flag == "Y") { //year
	    	d0.setYear(d0.getFullYear() + interval);
	    } else { //date
	    	d0.setDate(d0.getDate() + interval);
	    }

	    var y = d0.getFullYear();
	    var m = d0.getMonth()+1;
	    if(parseInt(m) < 10) m = "0"+m;
	    var d = d0.getDate();
	    if(parseInt(d) < 10) d = "0"+d;

   		var d1 = $("#condBgnDt").val(d+"/"+m+"/"+y);
   	}
</script>