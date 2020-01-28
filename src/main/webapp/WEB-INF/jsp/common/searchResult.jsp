<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp"%>

<main class="colgroup" id="colgroup">
<article>
	<header class="sub_head">
		<div class="sub_title">
			<h2>
				<span>
					<spring:message code="comm.search.ttl01" />
					<strong class="keywords">"<c:out value="${fn:trim(param.integratedSearchText)}" />"</strong>
				</span>
			</h2>
		</div>
	</header>
	<div id="contents" class="vacancyIntvwVideoList">

		<div class="tab_menu count6 action">
			<ul class="clearfix">
				<li class="on"><a href="#tab_contents1" onclick="fnSearch('Vacancy')"><spring:message code="comm.search.lbl03" /> <strong class="nums" id="vacancyCnt"></strong></a></li>
				<!-- Job Vacancy -->
				<li><a href="#tab_contents2" onclick="fnSearch('Resume')"><spring:message code="jobfair.type.detail.title29" /> <strong class="nums" id="resumeCnt"></strong></a></li>
				<!-- Employer -->
				<li><a href="#tab_contents3" onclick="fnSearch('JobFair')"><spring:message code="comm.search.lbl04" /> <strong class="nums" id="jobfairCnt"></strong></a></li>
				<!-- Job Fair -->
				<li><a href="#tab_contents4" onclick="fnSearch('Edu')"><spring:message code="comm.search.lbl05" /> <strong class="nums" id="eduCnt"></strong></a></li>
				<!-- Training Program -->
				<li><a href="#tab_contents5" onclick="fnSearch('NEA')"><spring:message code="comm.search.lbl06" /> <strong class="nums" id="neaCnt"></strong></a></li>
				<!-- NEA Training -->
				<li><a href="#tab_contents6" onclick="fnSearch('Instt')"><spring:message code="comm.search.lbl07" /> <strong class="nums" id="insttCnt"></strong></a></li>
				<!-- Related Institution -->
			</ul>
		</div>

		<div id="tab_contents1" class="tab_contents">
			<div class="bbs_basic">
				<ul class="recruitment_list none_border clearfix"></ul>
			</div>
			<!-- //bbs_basic list -->
			<div class="bbs_empty">
				<p>
					<spring:message code="counsel.msg.no.data" />
				</p>
			</div>
			<!-- //bbs_empty -->
			<div class="pagination"></div>
			<!--  //pagination -->
		</div>
		<!-- //tab_contents1 -->

		<div id="tab_contents2" class="tab_contents">
			<div class="bbs_basic">
				<ul class="recruitment_list talent none_border clearfix"></ul>
			</div>
			<!-- //bbs_basic list -->
			<div class="bbs_empty">
				<p>
					<spring:message code="counsel.msg.no.data" />
				</p>
			</div>
			<!-- //bbs_empty -->
			<div class="pagination"></div>
			<!--  //pagination -->
		</div>
		<!-- //tab_contents2 -->

		<div id="tab_contents3" class="tab_contents">
			<div class="bbs_basic">
				<ul class="recruitment_list recruitment none_border clearfix"></ul>
			</div>
			<!-- //bbs_basic list -->
			<div class="bbs_empty">
				<p>
					<spring:message code="counsel.msg.no.data" />
				</p>
			</div>
			<!-- //bbs_empty -->
			<div class="pagination"></div>
			<!--  //pagination -->
		</div>
		<!-- //tab_contents3 -->

		<div id="tab_contents4" class="tab_contents">
			<div class="bbs_basic">
				<ul class="recruitment_list edu none_border clearfix"></ul>
			</div>
			<!-- //bbs_basic list -->
			<div class="bbs_empty">
				<p>
					<spring:message code="counsel.msg.no.data" />
				</p>
			</div>
			<!-- //bbs_empty -->
			<div class="pagination"></div>
			<!--  //pagination -->
		</div>
		<!-- //tab_contents4 -->

		<div id="tab_contents5" class="tab_contents">
			<div class="bbs_basic">
				<ul class="recruitment_list type2 none_border clearfix"></ul>
			</div>
			<!-- //bbs_basic list -->
			<div class="bbs_empty">
				<p>
					<spring:message code="counsel.msg.no.data" />
				</p>
			</div>
			<!-- //bbs_empty -->
			<div class="pagination"></div>
			<!--  //pagination -->
		</div>
		<!-- //tab_contents5 -->

		<div id="tab_contents6" class="tab_contents">
			<div class="bbs_basic">
				<ul class="recruitment_list type2 none_border clearfix"></ul>
			</div>
			<!-- //bbs_basic list -->
			<div class="bbs_empty">
				<p>
					<spring:message code="counsel.msg.no.data" />
				</p>
			</div>
			<!-- //bbs_empty -->
			<div class="pagination"></div>
			<!--  //pagination -->
		</div>
		<!-- //tab_contents6 -->

	</div>
	<!-- //contents -->
</article>
</main>
<!-- //main.colgroup -->

<form name="viewFrm" id="viewFrm" method="post">
	<input type="hidden" name="condSeq" id="condSeq" />
</form>

<script>
	var msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg11"/>";

	var currentPageNo = "1";
	var condSort = "LATEST";
	var condTab = "vacancy";
	var condText = "<c:out value="${fn:trim(param.integratedSearchText)}" />";

	$(document).ready(function() {
		$(".bbs_empty").hide();
		fnSearchVacancy(1);
		fnSearchResume(1);
		fnSearchJobFair(1);
		fnSearchTrainingProgram(1);
		fnSearchNEATraining(1);
		fnSearchRelatedInstitution(1);
	});

	function fnSearch(flag, sort) {
		currentPageNo = "1";
		condTab = flag;
		condSort = sort;

		if(condTab == null || $.trim(condTab) == "") condTab = "Vacancy";
		if(condSort == null || $.trim(condSort) == "") condSort = "LATEST";

		if(condTab == "Vacancy") {
			fnSearchVacancy(currentPageNo);
		} else if(condTab == "Resume") {
			fnSearchResume(currentPageNo);
		} else if(condTab == "JobFair") {
			fnSearchJobFair(currentPageNo);
		} else if(condTab == "Edu") {
			fnSearchTrainingProgram(currentPageNo);
		} else if(condTab == "NEA") {
			fnSearchNEATraining(currentPageNo);
		} else if(condTab == "Instt") {
			fnSearchRelatedInstitution(currentPageNo);
		}
	}

	function fnSearchVacancy(currentPageNo) {
		var divArea = "tab_contents1";
		if(!condText || $.trim(condText) == '') { $("#"+divArea+" .bbs_empty").show(); return; }
		if(currentPageNo == null || $.trim(currentPageNo) == "") currentPageNo = 1;
		$.ajax({
			type: METHOD_POST, dataType: AJAX_DATA_TYPE_JSON,
			url: contextPath + "/searchResultVacancyAjax.do",
			data: {
		   		"condSort": condSort,
		   		"currentPageNo": currentPageNo,
		   		"condText": $.trim(condText)
			},
			success: function(data) {
	   			if (data.result.successYn != "Y") {
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			//$("#"+divArea+" .currently").text(data.paginationInfo.currentPageNo);
	   			//$("#"+divArea+" .total").text(data.paginationInfo.totalPageCount);
	   			$("#vacancyCnt").text(data.paginationInfo.totalRecordCount);
	   			fnPagination(data.paginationInfo, "fnSearchVacancy", "#"+divArea+" .pagination");

				// Data List
				$("#"+divArea+" .bbs_basic >ul").empty();
				if(!data.resultList || data.resultList.length == 0) {
					$("#"+divArea+" .bbs_basic").hide();
					$("#"+divArea+" .bbs_empty").show();
				} else {
					$("#"+divArea+" .bbs_basic").show();
					$("#"+divArea+" .bbs_empty").hide();

					var cnt = 0;
					var dataList = "", classNew = "", classBkmk = "", classRemain="", remainDays= "";
					$.each(data.resultList, function(index, item) {
						cnt = index + 1;
						classNew = (item.newYn == 'Y') ? "new" : "";
						classBkmk = (item.bkmkSeq != null && item.bkmkSeq != '') ? "on" : "";

						classRemain = item.remainDiv;
						if(item.remainDiv == 'hurry' && item.remainDt && parseInt(item.remainDt) < 24) {
							if(parseInt(item.remainDt) == 1) {
								remainDays = item.remainDt+ "Hour";
							} else {
								remainDays = item.remainDt+ "Hours";
							}
						} else {
							remainDays = item.remainDt;
						}

						dataList += '<li>';
						dataList += '	<div class="contents_wrap">';
						dataList += '		<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url='+nvl(item.filePath)+'" alt="image" onerror="fnNoImage(this)" /></div>';
						dataList += '		<div class="contents_box">';
						dataList += '			<div class="title_box '+classNew+'">';
						dataList += '				<span class="tit">'+nvl(item.compnyNm)+'</span>';
						dataList += '				<a href="javascript:void(0);" onclick="fnVacancyView(\''+item.vacancySeq+'\',\'viewFrm\');" class="title">'+nvl(item.vacancyTitle)+'</a>';
						dataList += '			</div>';
						dataList += '			<div class="cont_box">';
						dataList += '				<span class="con">'+nvl(item.employFormNm)+'</span>';
						dataList += '				<span class="con"><spring:message code="compny.vacancy.msg.title8" />&nbsp;:&nbsp;<strong>'+fnNumberWithCommas(nvl(item.recrumtMemb,0))+'</strong></span>'; //모집인원
						dataList += '				<span class="con">'+nvl(item.addrNm)+'</span>';
						dataList += '				<span class="con">$'+fnNumberWithCommas(nvl(item.minSalaryAmt,0))+' ~ $'+fnNumberWithCommas(nvl(item.maxSalaryAmt,0))+'</span>';
						dataList += '			</div>';
						dataList += '			<div class="other_box">';
						dataList += '				<span class="top_box">';
						if(item.vacancyStsCd == 'VCS0000000002') {
						dataList += '					<span class="close">'+nvl(item.vacancyStsNm)+'</span>';
						} else {
						dataList += '					<span class="'+classRemain+'">'+remainDays+'</span>';
						}
						<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
						dataList += '					<span id="bkmkSapnVacancy_'+cnt+'"><button type="button" id="btnBkmkVacancy_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.vacancySeq+'\',LIKE_CATEGORY_VACANCY,\'btnBkmkVacancy_'+cnt+'\',\'bkmkSapnVacancy_'+cnt+'\');" class="interest '+classBkmk+'">interest</button></span>';
						</sec:authorize>
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '		</div>';
						dataList += '	</div>';
						dataList += '</li>';
					});
					$("#"+divArea+" .bbs_basic >ul").append(dataList);
				}
			},
			error: function(xhr, status, error) {
				alertify.alert("error to connecting server");
			}
		});
	}

	function fnSearchResume(currentPageNo) {
		var divArea = "tab_contents2";
		if(!condText || $.trim(condText) == '') { $("#"+divArea+" .bbs_empty").show(); return; }
		if(currentPageNo == null || $.trim(currentPageNo) == "") currentPageNo = 1;
		$.ajax({
			type: METHOD_POST, dataType: AJAX_DATA_TYPE_JSON,
			url: contextPath + "/searchResultResumeAjax.do",
			data: {
		   		"condSort": condSort,
		   		"currentPageNo": currentPageNo,
		   		"condText": $.trim(condText)
			},
			success: function(data) {
	   			if (data.result.successYn != "Y") {
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			//$("#"+divArea+" .currently").text(data.paginationInfo.currentPageNo);
	   			//$("#"+divArea+" .total").text(data.paginationInfo.totalPageCount);
	   			$("#resumeCnt").text(data.paginationInfo.totalRecordCount);
	   			fnPagination(data.paginationInfo, "fnSearchResume", "#"+divArea+" .pagination");

				// Data List
				$("#"+divArea+" .bbs_basic >ul").empty();
				if(!data.resultList || data.resultList.length == 0) {
					$("#"+divArea+" .bbs_basic").hide();
					$("#"+divArea+" .bbs_empty").show();
				} else {
					$("#"+divArea+" .bbs_basic").show();
					$("#"+divArea+" .bbs_empty").hide();

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
						dataList += '			<div class="title_box new">';
						dataList += '				<span class="tit">'+nvl(item.iscoCdListStr)+'</span>';
						dataList += '				<a href="javascript:void(0);" onclick="fnGoCompnyResumeView(\''+item.resumeSeq+'\');" class="title">'+nvl(item.resumeTitle)+'</a>';
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
						<sec:authorize access="hasAnyRole('ROLE_CMPNY')">
						dataList += '					<span id="bkmkSapnResume_'+cnt+'"><button type="button" id="btnBkmkResume_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.resumeSeq+'\',LIKE_CATEGORY_RESUME,\'btnBkmkResume_'+cnt+'\',\'bkmkSapnResume_'+cnt+'\');" class="interest '+classBkmk+'">interest</button></span>';
						</sec:authorize>
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '		</div>';
						dataList += '	</div>';
						dataList += '</li>';
					});
					$("#"+divArea+" .bbs_basic >ul").append(dataList);
				}
			},
			error: function(xhr, status, error) {
				alertify.alert("error to connecting server");
			}
		});
	}

	function fnSearchJobFair(currentPageNo) {
		var divArea = "tab_contents3";
		if(!condText || $.trim(condText) == '') { $("#"+divArea+" .bbs_empty").show(); return; }
		if(currentPageNo == null || $.trim(currentPageNo) == "") currentPageNo = 1;
		$.ajax({
			type: METHOD_POST, dataType: AJAX_DATA_TYPE_JSON,
			url: contextPath + "/searchResultJobFairAjax.do",
			data: {
		   		"condSort": condSort,
		   		"currentPageNo": currentPageNo,
		   		"condText": $.trim(condText)
			},
			success: function(data) {
	   			if (data.result.successYn != "Y") {
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			//$("#"+divArea+" .currently").text(data.paginationInfo.currentPageNo);
	   			//$("#"+divArea+" .total").text(data.paginationInfo.totalPageCount);
	   			$("#jobfairCnt").text(data.paginationInfo.totalRecordCount);
	   			fnPagination(data.paginationInfo, "fnSearchJobFair", "#"+divArea+" .pagination");

				// Data List
				$("#"+divArea+" .bbs_basic >ul").empty();
				if(!data.resultList || data.resultList.length == 0) {
					$("#"+divArea+" .bbs_basic").hide();
					$("#"+divArea+" .bbs_empty").show();
				} else {
					$("#"+divArea+" .bbs_basic").show();
					$("#"+divArea+" .bbs_empty").hide();

					var cnt = 0;
					var dataList = "", classActive = "";
					$.each(data.resultList, function(index, item) {
						cnt = index + 1;
						dataList += '<li>';
						dataList += '	<div class="contents_wrap">';
						dataList += '		<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url='+nvl(item.filePath)+'" alt="image" onerror="fnNoImage(this)" /></div>';
						dataList += '		<div class="contents_box '+fnJobFairDivNm(item.fairDivCd)+'">';
						dataList += '			<div class="title_box '+fnIsNew(item.newYn)+'">';
						dataList += '				<a href="javascript:fnJobFairView(\''+item.fairSeq+'\',\'viewFrm\');" class="title">'+nvl(item.fairNm)+'</a>';
						dataList += '			</div>';
						dataList += '			<div class="cont_box">';
						dataList += '				<span class="cont">';
						dataList += '					<span class="con"><spring:message code="resume.text.addrProvcCd" /> : <strong>'+nvl(item.addrNm)+'</strong></span>'; //지역
						dataList += '				</span>';
						dataList += '				<span class="cont">';
						dataList += '					<span class="con">'+nvl(item.fairBgnDt)+' ~ '+nvl(item.fairEndDt)+'</span>';
						dataList += '				</span>';
						dataList += '				<span class="cont">';
						dataList += '					<span class="con"><a href="tel:'+nvl(item.tel1)+'" class="mobile_phone">'+nvl(item.tel1)+'</a></span>';
						dataList += '					<span class="con"><a href="tel:'+nvl(item.tel2)+'" class="mobile_phone">'+nvl(item.tel2)+'</a></span>';
						dataList += '					<span class="con">'+nvl(item.email)+'</span>';
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '			<div class="other_box">';
						dataList += '				<span class="top_box">';
							if(item.fairStsCd == "FAS0000000001") {        //모집전

							} else if(item.fairStsCd == "FAS0000000002") { //모집중
						dataList += '					<span class="registering"><spring:message code="comm.search.lbl08" /></span>'; //Registering
							} else if(item.fairStsCd == "FAS0000000003") { //행사중
						dataList += '					<span class="date"></span>';
							} else if(item.fairStsCd == "FAS0000000004") { //행사종료
						dataList += '					<span class="close"><spring:message code="mypage.private.jobsk.title31" /></span>'; //Closed
							}
						<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT,ROLE_CMPNY,ROLE_TRNCT')">
						classActive = (item.bkmkSeq) ?  "on" : "";
						dataList += '					<span id="bkmkSapnJobFair_'+cnt+'"><button type="button" id="btnBkmkJobFair_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.fairSeq+'\',LIKE_CATEGORY_FAIR,\'btnBkmkJobFair_'+cnt+'\',\'bkmkSapnJobFair_'+cnt+'\');" class="interest '+classActive+'">interest</button></span>';
						</sec:authorize>
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '		</div>';
						dataList += '	</div>';
						dataList += '</li>';
					});
					$("#"+divArea+" .bbs_basic >ul").append(dataList);
				}
			},
			error: function(xhr, status, error) {
				alertify.alert("error to connecting server");
			}
		});
	}

	function fnSearchTrainingProgram(currentPageNo) {
		var divArea = "tab_contents4";
		if(!condText || $.trim(condText) == '') { $("#"+divArea+" .bbs_empty").show(); return; }
		if(currentPageNo == null || $.trim(currentPageNo) == "") currentPageNo = 1;
		$.ajax({
			type: METHOD_POST, dataType: AJAX_DATA_TYPE_JSON,
			url: contextPath + "/searchResultTrainingProgramAjax.do",
			data: {
		   		"condSort": condSort,
		   		"currentPageNo": currentPageNo,
		   		"condText": $.trim(condText)
			},
			success: function(data) {
	   			if (data.result.successYn != "Y") {
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			//$("#"+divArea+" .currently").text(data.paginationInfo.currentPageNo);
	   			//$("#"+divArea+" .total").text(data.paginationInfo.totalPageCount);
	   			$("#eduCnt").text(data.paginationInfo.totalRecordCount);
	   			fnPagination(data.paginationInfo, "fnSearchTrainingProgram", "#"+divArea+" .pagination");

				// Data List
				$("#"+divArea+" .bbs_basic >ul").empty();
				if(!data.resultList || data.resultList.length == 0) {
					$("#"+divArea+" .bbs_basic").hide();
					$("#"+divArea+" .bbs_empty").show();
				} else {
					$("#"+divArea+" .bbs_basic").show();
					$("#"+divArea+" .bbs_empty").hide();

					var cnt = 0;
					var dataList = "", classActive = "", classNew = "", classBkmk = "", classTrnngNatnexpDiv = "", classRecrumtSts = "", tuition = "";
					$.each(data.resultList, function(index, item) {
						cnt = index + 1;
						classNew = fnIsNew(item.newYn);
						classTrnngNatnexpDiv = (item.trnngNatnexpDivCd == "" ) ? "scholarship" : "training";

						if(item.freePaidYn == "N") {
							tuition = "<spring:message code="mypage.instt.eduTrnng.msg"/>";
						} else {
							if(item.tuition && $.trim(item.tuition) != "") {
								tuition = "$"+fnNumberWithCommas(item.tuition);
							} else {
								tuition = "";
							}
						}

						if(item.recrumtStsCd == "RSC0000000002") { //모집중
							classRecrumtSts = "recruiting";
						} else if(item.recrumtStsCd == "RSC0000000003") { //모집마감
							classRecrumtSts = "close";
						} else {
							classRecrumtSts = "";
						}

						dataList += '<li>';
						dataList += '	<div class="contents_wrap">';
						dataList += '		<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url='+nvl(item.filePath)+'" alt="image" onerror="fnNoImage(this)" /></div>';
						dataList += '		<div class="contents_box '+classTrnngNatnexpDiv+'">';
						dataList += '			<div class="title_box '+classNew+'">';
						dataList += '				<a href="javascript:void(0);" onclick="fnEduTrnngView(\''+nvl(item.eduTrnngSeq)+'\',\'viewFrm\');" class="title">'+nvl(item.eduTrnngNm)+'</a>';
						dataList += '			</div>';
						dataList += '			<div class="cont_box">';
						dataList += '				<span class="cont">';
						dataList += '					<span class="con">'+nvl(item.addrNm)+'</span>';
						dataList += '					<span class="con">'+nvl(item.skillJobProgramCorsNm)+'</span>';
						dataList += '					<span class="con">'+tuition+'</span>';
						dataList += '				</span>';
						dataList += '				<span class="cont">';
						dataList += '					<span class="con"><spring:message code="compny.vacancy.msg.title72" /> <strong>'+nvl(item.recurmtBgnDt)+' ~ '+nvl(item.recurmtEndDt)+'</strong></span>'; //Recruiting
						dataList += '					<span class="con"><spring:message code="comm.search.lbl10" /> <strong>'+nvl(item.eduBgnDt)+' ~ '+nvl(item.eduEndDt)+'</strong></span>'; //Training
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '			<div class="other_box">';
						dataList += '				<span class="top_box">';
						dataList += '				<span class="'+classRecrumtSts+'">'+nvl(item.recrumtStsNm)+'</span>';
						<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
						classActive = (item.bkmkSeq) ?  "on" : "";
						dataList += '					<span id="bkmkSapnEdu_'+cnt+'"><button type="button" id="btnBkmkEdu_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.eduTrnngSeq+'\',LIKE_CATEGORY_TRNCT,\'btnBkmkEdu_'+cnt+'\',\'bkmkSapnEdu_'+cnt+'\');" class="interest '+classActive+'">interest</button></span>';
						</sec:authorize>
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '		</div>';
						dataList += '	</div>';
						dataList += '</li>';
					});
					$("#"+divArea+" .bbs_basic >ul").append(dataList);
				}
			},
			error: function(xhr, status, error) {
				alertify.alert("error to connecting server");
			}
		});
	}

	function fnSearchNEATraining(currentPageNo) {
		var divArea = "tab_contents5";
		if(!condText || $.trim(condText) == '') { $("#"+divArea+" .bbs_empty").show(); return; }
		if(currentPageNo == null || $.trim(currentPageNo) == "") currentPageNo = 1;
		$.ajax({
			type: METHOD_POST, dataType: AJAX_DATA_TYPE_JSON,
			url: contextPath + "/searchResultNEATrainingAjax.do",
			data: {
		   		"condSort": condSort,
		   		"currentPageNo": currentPageNo,
		   		"condText": $.trim(condText)
			},
			success: function(data) {
	   			if (data.result.successYn != "Y") {
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			//$("#"+divArea+" .currently").text(data.paginationInfo.currentPageNo);
	   			//$("#"+divArea+" .total").text(data.paginationInfo.totalPageCount);
	   			$("#neaCnt").text(data.paginationInfo.totalRecordCount);
	   			fnPagination(data.paginationInfo, "fnSearchNEATraining", "#"+divArea+" .pagination");

				// Data List
				$("#"+divArea+" .bbs_basic >ul").empty();
				if(!data.resultList || data.resultList.length == 0) {
					$("#"+divArea+" .bbs_basic").hide();
					$("#"+divArea+" .bbs_empty").show();
				} else {
					$("#"+divArea+" .bbs_basic").show();
					$("#"+divArea+" .bbs_empty").hide();

					var cnt = 0;
					var dataList = "", classActive = "", classNew = "", classBkmk = "", classNeaEduDivCd = "", classRecrumtSts = "", tuition = "";
					$.each(data.resultList, function(index, item) {
						cnt = index + 1;
						classNew = fnIsNew(item.newYn);
						classNeaEduDivCd = (item.neaEduDivCd == "NED0000000001") ? "skill" : "employement";

						if(item.freePaidYn == "N") {
							tuition = "<spring:message code="mypage.instt.eduTrnng.msg"/>";
						} else {
							if(item.tuition && $.trim(item.tuition) != "") {
								tuition = "$"+fnNumberWithCommas(item.tuition);
							} else {
								tuition = "";
							}
						}

						if(item.recrumtStsCd == "RSC0000000002") { //모집중
							classRecrumtSts = "recruiting";
						} else if(item.recrumtStsCd == "RSC0000000003") { //모집마감
							classRecrumtSts = "close";
						} else {
							classRecrumtSts = "";
						}

						dataList += '<li>';
						dataList += '	<div class="contents_wrap">';
						dataList += '		<div class="contents_box '+classNeaEduDivCd+'">';
						dataList += '			<div class="title_box '+classNew+'">';
						dataList += '				<a href="javascript:void(0);" onclick="fnGoNewEduTrnngView(\''+nvl(item.eduTrnngSeq)+'\',\''+classNeaEduDivCd+'\');" class="title">'+nvl(item.eduTrnngNm)+'</a>';
						dataList += '			</div>';
						dataList += '			<div class="cont_box">';
						dataList += '				<span class="cont">';
						dataList += '					<span class="con">'+nvl(item.addrNm)+'</span>';
						dataList += '					<span class="con"><spring:message code="compny.vacancy.msg.title8" /> : <strong>'+nvl(item.recrumtMemb)+'</strong></span>';
						dataList += '				</span>';
						dataList += '				<span class="cont">';
						dataList += '					<span class="con"><spring:message code="instt.eduTrnng.nea.msg2" /> : <strong>'+nvl(item.teachDt)+' '+nvl(item.teachBgnTime)+' ~ '+nvl(item.teachEndTime)+'</strong></span>';
						dataList += '					<span class="con"><spring:message code="mypage.compny.applic.title10" /> : <strong>'+nvl(item.teacherNm1)+'</strong></span>';
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '			<div class="other_box">';
						dataList += '				<span class="top_box">';
						dataList += '					<span class="'+nvl(classRecrumtSts)+'">'+nvl(item.recrumtStsNm)+'</span>';
						<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
						classActive = (item.bkmkSeq) ?  "on" : "";
						dataList += '					<span id="bkmkSapnNea_'+cnt+'"><button type="button" id="btnBkmkNea_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.eduTrnngSeq+'\',LIKE_CATEGORY_NEA_TRNCT,\'btnBkmkNea_'+cnt+'\',\'bkmkSapnNea_'+cnt+'\');" class="interest '+classActive+'">interest</button></span>';
						</sec:authorize>
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '		</div>';
						dataList += '	</div>';
						dataList += '</li>';
					});
					$("#"+divArea+" .bbs_basic >ul").append(dataList);
				}
			},
			error: function(xhr, status, error) {
				alertify.alert("error to connecting server");
			}
		});
	}

	function fnSearchRelatedInstitution(currentPageNo) {
		var divArea = "tab_contents6";
		if(!condText || $.trim(condText) == '') { $("#"+divArea+" .bbs_empty").show(); return; }
		if(currentPageNo == null || $.trim(currentPageNo) == "") currentPageNo = 1;
		$.ajax({
			type: METHOD_POST, dataType: AJAX_DATA_TYPE_JSON,
			url: contextPath + "/searchResultRelatedInstitutionAjax.do",
			data: {
		   		"condSort": condSort,
		   		"currentPageNo": currentPageNo,
		   		"condText": $.trim(condText)
			},
			success: function(data) {
	   			if (data.result.successYn != "Y") {
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			//$("#"+divArea+" .currently").text(data.paginationInfo.currentPageNo);
	   			//$("#"+divArea+" .total").text(data.paginationInfo.totalPageCount);
	   			$("#insttCnt").text(data.paginationInfo.totalRecordCount);
	   			fnPagination(data.paginationInfo, "fnSearchRelatedInstitution", "#"+divArea+" .pagination");

				// Data List
				$("#"+divArea+" .bbs_basic >ul").empty();
				if(!data.resultList || data.resultList.length == 0) {
					$("#"+divArea+" .bbs_basic").hide();
					$("#"+divArea+" .bbs_empty").show();
				} else {
					$("#"+divArea+" .bbs_basic").show();
					$("#"+divArea+" .bbs_empty").hide();

					var cnt = 0;
					var dataList = "", classNew = "", classBkmk = "", classRemain="", remainDays= "";
					$.each(data.resultList, function(index, item) {
						cnt = index + 1;
						classNew = fnIsNew(item.newYn);

						dataList += '<li>';
						dataList += '	<div class="contents_wrap">';
						dataList += '		<div class="contents_box">';
						dataList += '			<div class="title_box">';
						dataList += '				<a href="javascript:fnInsttView(\''+item.insttSeq+'\')" class="title">'+nvl(item.insttNm)+'</a>';
						dataList += '			</div>';
						dataList += '			<div class="cont_box type2">';
						dataList += '				<span class="cont">';
						dataList += '					<span class="con">'+nvl(item.insttProfile)+'</span>';
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '		</div>';
						dataList += '	</div>';
						dataList += '</li>';
					});
					$("#"+divArea+" .bbs_basic >ul").append(dataList);
				}
			},
			error: function(xhr, status, error) {
				alertify.alert("error to connecting server");
			}
		});
	}

</script>