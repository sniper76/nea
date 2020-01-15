<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<!-- Auto Matching List -->
				<h2><span><spring:message code="private.matching.auto.ttl01" /></span></h2>
			</div>
		</header>
		<div id="contents">

			<div class="box type2 icon auto_matching">
			    <div class="box_wrap">
					<!-- Auto Matching Result -->
			        <div class="title"><spring:message code="private.matching.auto.ttl01" /></div>
					<!-- the list below are the automatically matched job vacancies for you -->
			        <p><span class="em_point">${cpesUserSession.userNmEn}</span> <br /><spring:message code="private.matching.auto.ttl03" /></p>
			    </div>
			</div>

			<div class="box type6 auto_matching_box">
			    <div class="box_wrap">
			        <ul class="clearfix">
						<li>
							<div class="cont_box">
								<strong class="tit"><spring:message code="compny.vacancy.msg.title5" /></strong><!-- Occupation -->
								<span class="cont">
									<c:out value="${fn:replace(match.iscoNm, ',', '<br/>')}" escapeXml="false" />&nbsp;
								</span>
							</div>
						</li>
						<li>
							<div class="cont_box">
								<strong class="tit"><spring:message code="work.place" /></strong><!-- Place of Work -->
								<span class="cont">
									<c:out value="${fn:replace(match.workLocNm, ',', '<br/>')}" escapeXml="false" />&nbsp;
								</span>
							</div>
						</li>
						<li>
							<div class="cont_box">
								<strong class="tit"><spring:message code="wage" /></strong><!-- Wage -->
								<span class="cont">
									$<fmt:formatNumber type="number" maxFractionDigits="3" value="${match.expctMinSalaryAmt}" /> ~
									$<fmt:formatNumber type="number" maxFractionDigits="3" value="${match.expctMaxSalaryAmt}" />&nbsp;
								</span>
							</div>
						</li>
						<li>
							<div class="cont_box">
								<strong class="tit"><spring:message code="mypage.compny.profile.title19" /></strong><!-- Education -->
								<span class="cont">
									<c:out value="${match.eduDegreeNm}" />&nbsp;
								</span>
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
						<strong class="skip">Change list order</strong>
							<button type="button" onclick="fnSearchBySort('LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button><!-- Latest -->
							<button type="button" onclick="fnSearchBySort('VIEW')"><spring:message code="counsel.msg.sortBy.view"/></button><!-- Views -->
							<button type="button" onclick="fnSearchBySort('LIKE')"><spring:message code="counsel.msg.sortBy.like"/></button><!-- Likes -->
					</span>
				</div>
			</div>
			<!-- //bbs_info -->

			<div class="bbs_basic">
				<ul class="recruitment_list clearfix"></ul>
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
	<input type="hidden" id="condSeq" name="condSeq" />
</form>

<script>
	var currentPageNo = "1";
	var condSort = "LATEST";
	var vacancyCnt = "<spring:message code="compny.vacancy.msg.title8" />"; //모집인원

	$(document).ready(function() {
		$(".bbs_empty").hide();
		fnSearch();
	});

	function fnSearch() {
		$.ajax({
			type: METHOD_POST, dataType: AJAX_DATA_TYPE_JSON,
			url: contextPath + "/cpes/private/matching/autoMatchListAjax.do",
			data: {
		   		"condSort": condSort,
		   		"currentPageNo": currentPageNo
			},
			success: function(data) {
	   			if (data.result.successYn != "Y") {
	   				var msg = "<spring:message code="login.findId.no.data"/>";
// 	   				if(data.result.statCd == "03") {
// 	   					msg = "<spring:message code="errors.ajax.fail"/>";
// 	   				}
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			$(".currently").text(data.paginationInfo.currentPageNo);
	   			$(".total").text(data.paginationInfo.totalPageCount);
	   			fnPagination(data.paginationInfo, "fnSearchByPage", ".pagination");

				// Data List
				$(".bbs_basic >ul").empty();
				if(!data.resultList || data.resultList.length == 0) {
					$(".bbs_basic").hide();
					$(".bbs_empty").show();
				} else {
					$(".bbs_basic").show();
					$(".bbs_empty").hide();

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
						dataList += '		<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url='+item.filePath+'" alt="image" onerror="fnNoImage(this)" /></div>';
						dataList += '		<div class="contents_box">';
						dataList += '			<div class="title_box '+classNew+'">';
						dataList += '				<span class="tit">'+nvl(item.compnyNm)+'</span>';
						dataList += '				<a href="javascript:void(0);" onclick="fnVacancyView(\''+item.vacancySeq+'\',\'frm\');" class="title">'+nvl(item.vacancyTitle)+'</a>';
						dataList += '			</div>';
						dataList += '			<div class="cont_box">';
						dataList += '				<span class="con">'+nvl(item.employFormNm)+'</span>';
						dataList += '				<span class="con">'+vacancyCnt+'&nbsp;:&nbsp;<strong>'+fnNumberWithCommas(nvl(item.recrumtMemb,0))+'</strong></span>';
						dataList += '				<span class="con">'+nvl(item.addrFullNm)+'</span>';
						dataList += '				<span class="con">$'+fnNumberWithCommas(nvl(item.minSalaryAmt,0))+' ~ $'+fnNumberWithCommas(nvl(item.maxSalaryAmt,0))+'</span>';
						dataList += '			</div>';
						dataList += '			<div class="other_box">';
						dataList += '				<span class="top_box">';
						if(item.vacancyStsCd == 'VCS0000000002') {
						dataList += '					<span class="close">'+nvl(item.vacancyStsNm)+'</span>';
						} else {
						dataList += '					<span class="'+classRemain+'">'+nvl(remainDays)+'</span>';
						}
						<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
						dataList += '					<span id="bkmkSapn_'+cnt+'"><button type="button" id="btnBkmk_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.vacancySeq+'\',LIKE_CATEGORY_VACANCY,\'btnBkmk_'+cnt+'\',\'bkmkSapn_'+cnt+'\');" class="interest '+classBkmk+'">interest</button></span>';
						</sec:authorize>
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '		</div>';
						dataList += '	</div>';
						dataList += '</li>';
					});
					$(".bbs_basic >ul").append(dataList);
				}
			},
			error: function(xhr, status, error) {
				alertify.alert("error to connecting server");
			}
		});
	}
	function fnSearchByPage(pageNo) {
		if(pageNo == null || $.trim(pageNo) == '') pageNo ="1";
		currentPageNo = pageNo;
		fnSearch();
	}
	function fnSearchBySort(sort) {
		if(sort == null || $.trim(sort) == '') sort ="LATEST";
		condSort = sort;
		currentPageNo = 1;
		fnSearch();
	}
</script>