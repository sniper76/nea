<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2><span><spring:message code="auto.matching"/></span></h2>
			</div>
		</header>
    	<div id="contents">

			<div class="search_matching">
				<div class="box_wrap recruitment_list">
					<form>
						<fieldset>
							<legend>Search Auto Matching</legend>
							<c:forEach var="data" items="${resultList}" varStatus="status">
								<c:if test="${status.index == 0}">
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
										<c:if test="${status.index > 0}">
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
							<button type="button" class="submit" onclick="fnSearch()"><spring:message code="mypage.compny.match.auto.msg01" /></button>
						</fieldset>
					</form>
				</div>
			</div>
			<!-- //search_matching -->

			<div class="box type6 auto_matching_box">
			    <div class="box_wrap">
			        <ul class="clearfix">
						<li>
							<div class="cont_box">
								<strong class="tit"><spring:message code="compny.vacancy.msg.title5" /></strong><!-- Occupation -->
								<span class="cont" id="iscoNm"></span>
							</div>
						</li>
						<li>
							<div class="cont_box">
								<strong class="tit"><spring:message code="work.place" /></strong><!-- Place of Work -->
								<span class="cont" id="locNm"></span>
							</div>
						</li>
						<li>
							<div class="cont_box">
								<strong class="tit"><spring:message code="wage" /></strong><!-- Wage -->
								<span class="cont" id="wage"></span>
							</div>
						</li>
						<li>
							<div class="cont_box">
								<strong class="tit"><spring:message code="mypage.compny.profile.title19" /></strong><!-- Education -->
								<span class="cont" id="eduDegree"></span>
							</div>
						</li>
					</ul>
			    </div>
			</div>

			<div class="bbs_info clearfix">
				<div class="bbs_left bbs_count">
					<strong class="currently">1</strong>&nbsp;&nbsp;/
					<span class="total">1</span>
					<span class="order">
<!-- 						<strong class="skip">Change list order</strong> -->
<!-- 						<button type="button">Latest</button> -->
<!-- 						<button type="button">View</button> -->
<!-- 						<button type="button">like</button> -->
					</span>
				</div>
			</div>
			<!-- //bbs_info -->

			<div class="bbs_basic">
				<ul class="recruitment_list talent clearfix"></ul>
			</div>
			<!-- //bbs_basic list -->

			<div class="bbs_empty">
				<p><spring:message code="counsel.msg.no.data" /></p>
			</div>
			<!-- //bbs_empty -->

			<div class="pagination"></div>
			<!--  //pagination -->

		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<form id="frm" name="frm" method="post">
	<input type="hidden" name="currentPageNo" />
</form>

<script>
	var vacancySeq = "";

	$(document).ready(function(e) {
		fnSearch();
	});
	function fnSearch() {
		vacancySeq = $("button.open [name=vacancySeq]").val();
		fnSearchVacancyInfo();
		fnSearchResumeList(1);
	}

	function fnSearchVacancyInfo() {
   		var action = contextPath + "/cpes/compny/match/autoMatchVacancyAjax.do";
   		var param = {
   			"vacancySeq": vacancySeq
   		};

   		$("#iscoNm,#locNm,#wage,#eduDegree").empty();
   		$.ajax({ type: 'post', datatype: 'json', url: action, data: param })
   		.done(function(data) {
   			if (data.result.successYn != "Y") {
   				var msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg11"/>";
   				if(data.result.statCd == "03") {
   					msg = "<spring:message code="errors.ajax.fail"/>";
   				}
   				alertify.alert(msg);
   				return;
   			}
			$("#iscoNm").text(nvl(data.data.iscoNm));
			$("#locNm").text(nvl(data.data.addrFullNm));
			var minSalaryAmt = nvl(data.data.minSalaryAmt);
			var maxSalaryAmt = nvl(data.data.maxSalaryAmt);
			if(minSalaryAmt) minSalaryAmt = "$"+minSalaryAmt;
			if(maxSalaryAmt) maxSalaryAmt = "$"+maxSalaryAmt;
			if(minSalaryAmt && maxSalaryAmt) {
				$("#wage").text(minSalaryAmt + " ~ " + maxSalaryAmt);
			} else {
				$("#wage").text(minSalaryAmt | maxSalaryAmt);
			}
   			$("#eduDegree").text(nvl(data.data.minEduDegreeNm));
		})
		.fail(function(xhr, status, errorThrown) {
			alertify.alert("<spring:message code="errors.ajax.fail"/>");
		});
	}

	function fnSearchResumeList(pageNo) {
		if(pageNo == null || $.trim(pageNo) == '') pageNo = 1;
   		var action = contextPath + "/cpes/compny/match/autoMatchResumeListyAjax.do";
   		var param = {
   			"condSeq": vacancySeq,
   			"currentPageNo": pageNo
   		};

		$(".bbs_basic >ul").empty();
   		$.ajax({ type: 'post', datatype: 'json', url: action, data: param })
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
   			fnPagination(data.paginationInfo, "fnSearchResumeList");

			// Data List
			$(".bbs_basic >ul").empty();
			if(!data.resultList || data.resultList.length == 0) {
				$(".bbs_basic").hide();
				$(".bbs_empty").show();
			} else {
				$(".bbs_basic").show();
				$(".bbs_empty").hide();

				var dataList = "", classNew = "", classBkmk = "", classGender = "", careerYear = "";
				$.each(data.resultList, function(index, item) {
					cnt = index + 1;
					classNew = (item.newYn == 'Y') ? "new" : "";
					classBkmk = (item.bkmkSeq != null && item.bkmkSeq != '') ? "on" : "";
					classGender = (item.genderCd == 'GEN0000000002') ? "female" : "male";
					careerYear = (item.careerYn == 'Y') ? nvl(item.totCareerTermYearCnt,"0")+"year+" : "<spring:message code="eduTrnng.msg4" />";

					dataList += '<li>';
					dataList += '	<div class="contents_wrap '+classGender+'">';
					dataList += '		<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url='+nvl(item.filePath)+'" alt="image" onerror="fnNoImage(this)"/></div>';
					dataList += '		<div class="contents_box">';
					dataList += '			<div class="title_box '+classNew+'">';
					dataList += '				<span class="tit">'+nvl(item.iscoCdListStr)+'</span>';
					dataList += '				<a href="javascript:void(0);" onclick="fnGoCompnyResumeView(\''+nvl(item.resumeSeq)+'\');" class="title">'+nvl(item.resumeTitle)+'</a>';
					dataList += '			</div>';
					dataList += '			<div class="top_box">';
					dataList += '				<span class="name">***</span>';
					dataList += '				<span class="age">';
					dataList += '					(<span>'+nvl(item.genderNm)+'</span> <span>'+nvl(item.age)+'</span>)';
					dataList += '				</span>';
					dataList += '			</div>';
					dataList += '			<div class="cont_box">';
					dataList += '				<span class="con">'+careerYear+'</span>';
					dataList += '				<span class="con">'+nvl(item.eduDegreeNm)+'</span>';
					dataList += '				<span class="con">'+nvl(item.addrNm)+'</span>';
					dataList += '			</div>';
					dataList += '			<div class="other_box">';
					dataList += '				<span class="top_box">';
					dataList += '					<span class="date type2"><strong>'+nvl(item.modDt)+'</strong> <spring:message code="comm.search.lbl09" /></span>'; //updated
					dataList += '					<span id="bkmkSapn_'+cnt+'"><button type="button" id="btnBkmk_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.resumeSeq+'\',LIKE_CATEGORY_RESUME,\'btnBkmk_'+cnt+'\',\'bkmkSapn_'+cnt+'\');" class="interest '+classBkmk+'">interest</button></span>';
					dataList += '				</span>';
					dataList += '			</div>';
					dataList += '		</div>';
					dataList += '	</div>';
					dataList += '</li>';
				});
				$(".bbs_basic >ul").append(dataList);
			}
   		})
   		.fail(function(xhr, status, errorThrown) {
   			alertify.alert("<spring:message code="errors.ajax.fail"/>");
   		});
	}
</script>