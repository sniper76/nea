<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2><span><spring:message code="mypage.compny.vacancy.intvw.video.ttl01"/></span></h2>
			</div>
		</header>
    	<div id="contents" class="vacancyIntvwVideoList">

			<div class="search_matching">
				<div class="box_wrap recruitment_list">
						<fieldset>
							<legend>Search Auto Matching</legend>
							<c:forEach var="data" items="${resultList}" varStatus="status">
								<c:if test="${((param.vacancySeq == null || param.vacancySeq == '') && status.index == 0) || param.vacancySeq == data.vacancySeq}">
							<button type="button" class="open">
								<span class="contents_wrap">
									<span class="check_area">
										<label for="checkbox1">Select Recruitment Notice</label>
										<input type="radio" name="checkbox" id="checkbox1" />
									</span>
									<span class="contents_box">
										<span class="title_box">
											<strong class="title"><c:out value="${data.vacancyTitle}" escapeXml="false" /></strong>
											<input type="hidden" name="vacancySeq" value="<c:out value="${data.vacancySeq}" />" />
										</span>
										<span class="cont_box">
											<span class="cont">
												<span class="con"><c:out value="${data.bgnDt}" /> ~ <c:out value="${data.endDt}" /></span>
												<span class="con"><spring:message code="compny.vacancy.msg.title8" /> : <c:out value="${data.recrumtMemb}" /></span>
											</span>
										</span>
										<span class="other_box">
											<span class="top_box">
												<c:choose>
													<c:when test="${data.vacancyStsCd == 'VCS0000000002'}">
												<c:out value="${data.vacancyStsNm}" />
													</c:when>
													<c:otherwise>
												<span class="<c:out value="${data.remainDiv}" />"><c:out value="${data.remainDt}" /><c:if test="${data.remainDiv == 'hurry'}"><c:choose><c:when test="${data.remainDt == 1}">Hours</c:when><c:otherwise>Hours</c:otherwise></c:choose></c:if></span>
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
									<c:forEach var="data" items="${resultList}" varStatus="status">
										<c:if test="${!(((param.vacancySeq == null || param.vacancySeq == '') && status.index == 0) || param.vacancySeq == data.vacancySeq)}">
									<li>
										<span class="contents_wrap">
											<span class="check_area">
												<label for="checkbox2">Select Recruitment Notice</label>
												<input type="radio" name="checkbox" id="checkbox2" />
											</span>
											<span class="contents_box">
												<span class="title_box">
													<strong class="title"><c:out value="${data.vacancyTitle}" escapeXml="false" /></strong>
													<input type="hidden" name="vacancySeq" value="<c:out value="${data.vacancySeq}" />" />
												</span>
												<span class="cont_box">
													<span class="cont">
														<span class="con"><c:out value="${data.bgnDt}" /> ~ <c:out value="${data.endDt}" /></span>
														<span class="con"><spring:message code="compny.vacancy.msg.title8" /> : <c:out value="${data.recrumtMemb}" /></span>
													</span>
												</span>
												<span class="other_box">
													<span class="top_box">
														<c:choose>
															<c:when test="${data.vacancyStsCd == 'VCS0000000002'}">
														<c:out value="${data.vacancyStsNm}" />
															</c:when>
															<c:otherwise>
														<span class="<c:out value="${data.remainDiv}" />"><c:out value="${data.remainDt}" /><c:if test="${data.remainDiv == 'hurry'}"><c:choose><c:when test="${data.remainDt == 1}">Hours</c:when><c:otherwise>Hours</c:otherwise></c:choose></c:if></span>
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
							<button type="button" class="submit" onclick="fnSearch()"><spring:message code="member.join.msg.choice" /></button><!-- Select -->
						</fieldset>

				</div>
			</div>
			<!-- //search_matching -->

			<div class="box type6">
			    <div class="box_wrap">
			        <ul class="bu">
						<li><spring:message code="mypage.compny.vacancy.intvw.video.msg01" /></li>
						<li><spring:message code="mypage.compny.vacancy.intvw.video.msg02" /></li>
						<li><spring:message code="mypage.compny.vacancy.intvw.video.msg03" /></li>
						<li><spring:message code="mypage.compny.vacancy.intvw.video.msg04" /></li>
					</ul>
			    </div>
			</div>

			<div class="cv_search">
				<div class="box_wrap">
					<form name="searchFrm">
						<input type="hidden" name="vacancySeq" />
						<input type="hidden" name="currentPageNo" />
						<input type="hidden" name="intvwSeq" />
						<input type="hidden" name="condUserSeq" />
						<input type="hidden" name="videoIntvwPatcptnSeq" />
						<fieldset>
							<legend>CV Search</legend>
							<ul class="clearfix">
							<li>
								<div class="cont_box">
									<strong class="title"><spring:message code="mypage.compny.vacancy.intvw.video.lbl01" /></strong><!-- Interview Date -->
									<span class="cont">
										<span class="period_box">
											<span class="date_box">
												<label for="intvwBgnDt" class="skip"><spring:message code="mypage.compny.vacancy.intvw.video.lbl05" /></label><!-- start date -->
												<input type="text" id="intvwBgnDt" name="intvwBgnDt" title="Start date Select from calendar" placeholder="DD/MM/YYYY" maxlength="10" value="<c:out value="${param.intvwBgnDt}" />" />
												<button type="button" id="intvwBgnDtCal"><spring:message code="mypage.compny.vacancy.intvw.video.lbl07" /></button><!-- Start date Select from calendar -->
											</span>
											~&nbsp;
											<span class="date_box">
												<label for="intvwEndDt" class="skip"><spring:message code="mypage.compny.vacancy.intvw.video.lbl06" /></label><!-- end date -->
												<input type="text" id="intvwEndDt" name="intvwEndDt" title="End date Select from calendar" placeholder="DD/MM/YYYY" maxlength="10" value="<c:out value="${param.intvwEndDt}" />" />
												<button type="button" id="intvwEndDtCal"><spring:message code="mypage.compny.vacancy.intvw.video.lbl08" /></button><!-- End date Select from calendar -->
											</span>
										</span>
									</span>
								</div>
							</li>
							<li>
								<div class="cont_box type2">
									<strong class="title"><spring:message code="mypage.compny.vacancy.intvw.video.lbl02" /></strong><!-- Job center -->
									<span class="cont">
										<label for="jcCd" class="skip"><spring:message code="mypage.compny.vacancy.intvw.video.lbl02" /></label>
										<select id="jcCd" name="jcCd">
											<option value=""><spring:message code="counsel.msg.all"/></option>
											<c:forEach var="data" items="${jobCenterCdList}">
								   			<option value="${data.jcCd}" <c:if test="${param.jcCd == data.jcCd}">selected="selected"</c:if>>${data.jcNm}</option>
								   			</c:forEach>
										</select>
									</span>
								</div>
								<div class="cont_box type2">
									<strong class="title"><spring:message code="mypage.compny.vacancy.intvw.video.lbl03" /></strong><!-- Online interview -->
									<span class="cont">
										<label for="intvwTypeCd" class="skip"><spring:message code="mypage.compny.vacancy.intvw.video.lbl03" /></label>
										<select id="intvwTypeCd" name="intvwTypeCd">
											<option value=""><spring:message code="counsel.msg.all"/></option>
											<option value="ONL" <c:if test="${param.intvwTypeCd == 'ONL'}">selected="selected"</c:if>><spring:message code="mypage.compny.vacancy.intvw.video.lbl03"/></option>
											<option value="NOA" <c:if test="${param.intvwTypeCd == 'NOA'}">selected="selected"</c:if>><spring:message code="mypage.compny.vacancy.intvw.video.lbl09"/></option>
										</select>
									</span>
								</div>
							</li>
							<li>
								<div class="cont_box">
									<strong class="title"><spring:message code="mypage.compny.vacancy.intvw.video.lbl04" /></strong><!-- Job seeker -->
									<span class="cont">
										<label for="userNm" class="skip"><spring:message code="mypage.compny.vacancy.intvw.video.lbl04" /></label>
										<input type="text" id="userNm" name="userNm" class="con" maxlength="40" value="<c:out value="${param.userNm}" />" />
									</span>
								</div>
							</li>
							</ul>
							<button type="button" class="submit" onclick="fnSearch()"><spring:message code="button.search" /></button><!-- Search -->
						</fieldset>
					</form>
				</div>
			</div>

			<div class="bbs_info clearfix">
				<div class="bbs_left bbs_count">
					<strong class="currently">1</strong>&nbsp;&nbsp;/
					<span class="total">1</span>
					<span class="order">
						<strong class="skip">Change list order</strong>
<%-- 						<button type="button" onclick="fnSearchSort('LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button> --%>
<%-- 						<button type="button" onclick="fnSearchSort('VIEW')"><spring:message code="counsel.msg.sortBy.view"/></button> --%>
<%-- 						<button type="button" onclick="fnSearchSort('LIKE')"><spring:message code="counsel.msg.sortBy.like"/></button> --%>
					</span>
				</div>
			</div>
			<!-- //bbs_info -->

			<table class="bbs_table react_table" data-rwdb="yes">
				<caption><spring:message code="mypage.compny.vacancy.intvw.video.ttl01"/></caption>
				<colgroup>
					<col style="width:6%;" />
					<col style="width:18%;" />
					<col style="width:15%;" />
					<col style="width:15%;" />
					<col style="width:18%;" />
					<col style="width:14%;" />
					<col style="width:14%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><spring:message code="member.join.msg.choice" /></th><!-- 선택 -->
						<th scope="col"><spring:message code="mypage.compny.vacancy.intvw.video.lbl04" /></th><!-- job seeker -->
						<th scope="col"><spring:message code="login.findId.cell" /></th><!-- Phone number -->
						<th scope="col"><spring:message code="mypage.compny.vacancy.intvw.video.lbl02" /></th><!-- Job center -->
						<th scope="col"><spring:message code="mypage.compny.vacancy.intvw.video.lbl03" /></th><!-- Online interview -->
						<th scope="col"><spring:message code="mypage.compny.vacancy.intvw.video.lbl10" /></th><!-- Updated -->
						<th scope="col"><spring:message code="interview" /></th><!-- Interview -->
					</tr>
				</thead>
				<tbody class="text_center" id="data-list"></tbody>
			</table>

			<div class="bbs_btn_wrap clearfix">
				<span class="bbs_left"></span>
				<span class="bbs_right">
					<button type="button" class="bbs_btn delete" onclick="fnIntvwDel()"><spring:message code="button.delete" /></button><!-- Delete -->
				</span>
			</div>
			<!--  //bbs_btn_wrap  -->

			<div class="pagination"></div>
			<!--  //pagination  -->

		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<script>
	var currentPageNo = "<c:out value="${param.currentPageNo}" />"; if(!currentPageNo) currentPageNo= "1";
	var condSort = "LATEST";
	var vacancySeq = "";

	$(document).ready(function() {
		// Interview Date (From)
		$("#intvwBgnDt").datepicker({
			dateFormat: 'dd/mm/yy', //Input Display Format 변경
			showOn: "both",
// 			minDate: "0M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		});
		$("#intvwBgnDtCal").click(function() { $("#intvwBgnDt").datepicker("show"); });
		//$('#intvwBgnDt').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		// Interview Date (End)
		$("#intvwEndDt").datepicker({
			dateFormat: 'dd/mm/yy', //Input Display Format 변경
			showOn: "both",
// 			minDate: "0M", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
// 			maxDate: "3M", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		});
		$("#intvwEndDtCal").click(function() { $("#intvwEndDt").datepicker("show"); });
		//$('#intvwEndDt').datepicker('setDate', '+10D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		// 검색키워드 enter
		$("#userNm").keypress(function( event ) { if( event.which == 13 ) { fnSearch(1); } });
		// 검색
		fnSearch(1);
	});
 	function fnSearch() {
		vacancySeq = $("button.open [name=vacancySeq]").val();

		var param = $("[name=searchFrm]").serializeObject();
		param.vacancySeq = vacancySeq;
		param.currentPageNo = currentPageNo;
		param.orderColumnSort = condSort;

		$.ajax({
			type: 'post', datatype: 'json',
			url: contextPath + "/cpes/compny/vacancy/intvwVideoListAjax.do",
			data:param
		})
		.done(function(data) {
   			if (data.result.successYn != "Y") {
   				var msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg11"/>";
   				if(data.result.statCd == "03") {
   					msg = "<spring:message code="errors.ajax.fail"/>";
   				}
   				alertify.alert(msg);
   				return;
   			}

   			// Pagination
   			$(".currently").text(data.paginationInfo.currentPageNo);
   			$(".total").text(data.paginationInfo.totalPageCount);
   			fnPagination(data.paginationInfo);

			// JobFair List
			$("#data-list").empty();
			if(!data.resultList || data.resultList.length == 0) {
				$("#data-list").append('<tr><td colspan="7"><spring:message code="info.nodata.msg" /></td></tr>');
			} else {
				var dataList = "";
				var cnt = 0;
				var seqAtt = "";
				$.each(data.resultList, function(index, item) {
					cnt = index + 1;
					seqAtt = (item.videoIntvwPatcptnSeq == null || $.trim(item.videoIntvwPatcptnSeq) == "" || item.ableDelYn == "N") ? 'disabled="disabled"' : '';

					dataList += '<tr>';
					dataList += '	<td>';
					dataList += '		<span class="check_box">';
					dataList += '			<label for="#check1" class="skip">Select</label>';
					dataList += '			<input type="checkbox" id="check1" name="videoIntvwPatcptn" value="'+item.videoIntvwPatcptnSeq+'" '+seqAtt+' />';
					dataList += '		</span>';
					dataList += '	</td>';
					dataList += '	<td class="subject"><a href="javascript:fnGoCompnyResumeView(\''+item.resumeSeq+'\')">'+nvl(item.userNm)+'</a></td>';
					dataList += '	<td>'+nvl(item.userCell)+'</td>';
					dataList += '	<td>'+nvl(item.jcNm)+'</td>';
					dataList += '	<td>'+nvl(item.intvwDt)+'</td>';
					dataList += '	<td>'+nvl(item.regDt)+'</td>';

					if(item.videoIntvwPatcptnSeq == null) {
					dataList += '	<td><a href="javascript:fnIntvwApply(\''+item.intvwSeq+'\',\''+item.userSeq+'\')" class="bbs_btn type08 small"><spring:message code="jobfair.booth.apply" /></a></td>'; //Apply
					} else {
					dataList += '	<td><a href="javascript:fnIntvwView(\''+item.videoIntvwPatcptnSeq+'\')" class="bbs_btn small"><spring:message code="mypage.compny.vacancy.intvw.video.lbl19" /></a></td>'; //View
					}

					dataList += '</tr>';
				});
				$("#data-list").append(dataList);
			}
		})
		.fail(function(xhr, status, errorThrown) {
			alertify.alert("<spring:message code="errors.ajax.fail"/>");
		});
 	}
	function fnSearchSort(sort) {
		condSort = sort;
		currentPageNo = "1";
		fnSearch();
	}
	function fnSearchPageNo(pageNo) {
		if(pageNo == null || $.trim(pageNo) == "") pageNo = "1";
		currentPageNo = pageNo;
		fnSearch();
	}
	function fnIntvwApply(intvwSeq, userSeq) {
		var f = $("[name=searchFrm]")[0];
		f.intvwSeq.value = intvwSeq;
		f.condUserSeq.value = userSeq;
		f.vacancySeq.value = vacancySeq;
		f.currentPageNo.value = currentPageNo;
		f.method = "POST";
		f.action = contextPath + "/cpes/compny/vacancy/intvwVideoApply.do";
		f.submit();
	}
	function fnIntvwView(videoIntvwPatcptnSeq) {
		var f = $("[name=searchFrm]")[0];
		f.videoIntvwPatcptnSeq.value = videoIntvwPatcptnSeq;
		f.vacancySeq.value = vacancySeq;
		f.currentPageNo.value = currentPageNo;
		f.method = "POST";
		f.action = contextPath + "/cpes/compny/vacancy/intvwVideoView.do";
		f.submit();
	}
	function fnIntvwDel() {
		var videoIntvwPatcptnArr = [];
		$("[name=videoIntvwPatcptn]:checked").each(function() { videoIntvwPatcptnArr.push($(this).val()); });
		if(videoIntvwPatcptnArr == null || videoIntvwPatcptnArr.length == 0) {
			alertify.alert("<spring:message code="mypage.compny.vacancy.intvw.video.msg05" />");
			return;
		}

		alertify.confirm("<spring:message code="mypage.compny.vacancy.intvw.video.msg16"/>", function (e) {
			if (e) {
				$.ajax({
					type: 'post', datatype: 'json',
					url: contextPath + "/cpes/compny/vacancy/intvwVideoDelAjax.do",
					data: {
						"videoIntvwPatcptnSeq" : videoIntvwPatcptnArr.join(",")
					}
				})
				.done(function(data) {
		   			if (data.result.successYn != "Y") {
		   				var msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg10"/>";
		   				if(data.result.statCd == "03") {
		   					msg = "<spring:message code="errors.ajax.fail"/>";
		   				}
		   				alertify.alert(msg);
		   				return;
		   			}
					alertify.alert("<spring:message code="mypage.compny.vacancy.intvw.video.msg17"/>", function (e){
						document.location.reload();
					});
				})
				.fail(function(xhr, status, errorThrown) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				});
			}
		});
	}
</script>
