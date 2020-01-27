<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

<main class="colgroup" id="colgroup">
	<article>
    	<header class="sub_head">
			<div class="sub_title">
				<h2>
					<span><spring:message code="gnb.menu.member.title" /></span>
				</h2>
			</div>
      	</header>
       	<div id="contents" class="privtMain">
			<div class="profile_box">
				<div class="img_box">
					<c:forEach items="${memImgList}" var="file">
					<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${file.saveFilePath}" class="photo" alt="image" onerror="fnNoImage(this)" />
					</c:forEach>
				</div>
				<div class="contents_box">
					<div class="title_box">
						<strong class="title"><c:out value="${result.userNm}" /></strong>
					</div>
					<div class="cont_box">
						<ul class="clearfix">
						<li>
							<div class="cont">
								<strong class="title"><spring:message code="login.stop.email" /></strong>
								<span class="con"><c:out value="${result.userEmail}" /></span>
							</div>
						</li>
						<li>
							<div class="cont">
								<strong class="title"><spring:message code="mypage.instt.eduTrnng.title33" /></strong>
								<span class="con"><c:out value="${result.userCell}" /></span>
							</div>
						</li>
						<li>
							<div class="cont">
								<strong class="title"><spring:message code="mypage.compny.profile.title12" /></strong>
								<span class="con"><address><c:out value="${result.addrFullNm}" /></address></span>
							</div>
						</li>
						<li>
							<div class="cont">
								<a href="javascript:fnGoMoveUrl('frm','${pageContext.request.contextPath}/cpes/private/member/modify.do');" class="btn check noround"><spring:message code="mypage.private.member.title" /></a>
							</div>
						</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //profile_box -->

			<div class="box_step count5">
				<ul class="clearfix">
				<li>
					<div class="contents_wrap">
						<a href="javascript:fnGoMoveUrl('frm','${pageContext.request.contextPath}/cpes/private/applic/list.do')" class="contents_box">
							<span class="title_box">
								<!-- Applied -->
								<strong class="title"><spring:message code="applied" /></strong>
							</span>
							<span class="cont_box">
								<span class="cont"><c:out value="${smry.CNT_1}" /></span>
							</span>
						</a>
					</div>
				</li>
				<li>
					<div class="contents_wrap">
						<a href="javascript:fnGoMoveUrl('frm','${pageContext.request.contextPath}/cpes/private/applic/resumeOpenList.do')" class="contents_box">
							<span class="title_box">
								<!-- Viewed -->
								<strong class="title"><spring:message code="viewed" /> <br /><span><spring:message code="my.cv" /></span></strong>
							</span>
							<span class="cont_box">
								<span class="cont"><c:out value="${smry.CNT_2}" /></span>
							</span>
						</a>
					</div>
				</li>
				<li>
					<div class="contents_wrap">
						<a href="javascript:fnGoMoveUrl('frm','${pageContext.request.contextPath}/cpes/private/applic/offerList.do')" class="contents_box">
							<span class="title_box">
								<!-- Offered -->
								<strong class="title"><spring:message code="offered" /></strong>
							</span>
							<span class="cont_box">
								<span class="cont"><c:out value="${smry.CNT_3}" /></span>
							</span>
						</a>
					</div>
				</li>
				<li>
					<div class="contents_wrap">
						<a href="javascript:fnGoMoveUrl('frm','${pageContext.request.contextPath}/cpes/private/applic/intvwList.do')" class="contents_box">
							<span class="title_box">
								<!-- Offered Interview -->
								<strong class="title"><spring:message code="offered" /> <br/><spring:message code="interview" /></strong>
							</span>
							<span class="cont_box">
								<span class="cont"><c:out value="${smry.CNT_4}" /></span>
							</span>
						</a>
					</div>
				</li>
				<li>
					<div class="contents_wrap">
						<a href="javascript:fnGoMoveUrl('frm','${pageContext.request.contextPath}/cpes/private/interest/vacancyList.do')" class="contents_box">
							<span class="title_box">
								<!-- My Saved -->
								<strong class="title"><spring:message code="my.saved" /></strong>
							</span>
							<span class="cont_box">
								<span class="cont po"><c:out value="${smry.CNT_5}" /></span>
							</span>
						</a>
					</div>
				</li>
				</ul>
			</div>
			<!-- //box_step -->

			<div class="tab_menu count3 action">
			    <ul class="clearfix">
			        <li class="on"><a href="#tab_contents1" onclick="fnSearch('book')"><spring:message code="mypage.private.interest.title" /></a></li><!-- My Saved -->
			        <li><a href="#tab_contents2" onclick="fnSearch('match')"><spring:message code="lnb.mypage.left.menu1" /></a></li><!-- Tailored Matching -->
			        <li><a href="#tab_contents3" onclick="fnSearch('auto')"><spring:message code="auto.matching" /></a></li><!-- Auto Matching -->
			    </ul>
			</div>

			<div id="tab_contents1" class="tab_contents">
				<div class="bbs_info clearfix">
					<div class="bbs_left bbs_count">
						<strong class="currently">1</strong>&nbsp;&nbsp;/
						<span class="total">1</span>
						<span class="order">
							<strong class="skip">Change list order</strong>
							<button type="button" onclick="fnSearch('book', 'LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button><!-- Latest -->
							<button type="button" onclick="fnSearch('book', 'VIEW')"><spring:message code="counsel.msg.sortBy.view"/></button><!-- Views -->
							<button type="button" onclick="fnSearch('book', 'LIKE')"><spring:message code="counsel.msg.sortBy.like"/></button><!-- Likes -->
						</span>
					</div>
				</div>
				<!-- //bbs_info -->

				<div class="bbs_basic">
					<ul class="recruitment_list clearfix"></ul>
				</div>
				<!-- //bbs_basic list -->

				<div class="bbs_empty">
					<p><spring:message code="private.member.main.msg04" /></p>
				</div>
				<!-- //bbs_empty -->

				<div class="pagination"></div>
				<!--  //pagination -->
			</div>
			<!-- //tab_contents1 -->

			<div id="tab_contents2" class="tab_contents">
				<div class="bbs_info clearfix">
					<div class="bbs_left bbs_count">
						<strong class="currently">1</strong>&nbsp;&nbsp;/
						<span class="total">1</span>
						<span class="order">
							<strong class="skip">Change list order</strong>
							<button type="button" onclick="fnSearch('match', 'LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button><!-- Latest -->
							<button type="button" onclick="fnSearch('match', 'VIEW')"><spring:message code="counsel.msg.sortBy.view"/></button><!-- Views -->
							<button type="button" onclick="fnSearch('match', 'POPULAR')"><spring:message code="counsel.msg.sortBy.like"/></button><!-- Likes -->
						</span>
					</div>
				</div>
				<!-- //bbs_info -->

				<div class="bbs_basic">
					<ul class="recruitment_list clearfix"></ul>
				</div>
				<!-- //bbs_basic list -->

				<div class="bbs_empty noMatchSet">
					<p>
						<spring:message code="private.member.main.msg05" /><br/>
						<spring:message code="private.member.main.msg06" />
					</p>
					<div class="bbs_btn_wrap">
						<div class="bbs_center">
							<a href="javascript:fnGoMoveUrl('frm','${pageContext.request.contextPath}/cpes/private/matching/regist.do')" class="bbs_btn type01"><spring:message code="private.member.main.msg07" /></a>
						</div>
					</div>
				</div>

				<div class="bbs_empty data">
					<p>
						<spring:message code="private.member.main.msg08" /><br/>
						<spring:message code="private.member.main.msg09" />
					</p>
					<div class="bbs_btn_wrap">
						<div class="bbs_center">
							<a href="javascript:fnGoMoveUrl('frm','${pageContext.request.contextPath}/cpes/private/matching/regist.do')" class="bbs_btn type01"><spring:message code="private.member.main.msg07" /></a>
						</div>
					</div>
				</div>
				<!-- //bbs_empty -->

				<div class="pagination"></div>
				<!--  //pagination -->
			</div>
			<!-- //tab_contents2 -->

			<div id="tab_contents3" class="tab_contents">
				<div class="bbs_info clearfix">
					<div class="bbs_left bbs_count">
						<strong class="currently">1</strong>&nbsp;&nbsp;/
						<span class="total">1</span>
						<span class="order">
<!-- 							<strong class="skip">Change list order</strong> -->
							<!-- Latest -->
<%-- 							<button type="button" onclick="fnSearch('auto', 'LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button> --%>
							<!-- Views -->
<%-- 							<button type="button" onclick="fnSearch('auto', 'VIEW')"><spring:message code="counsel.msg.sortBy.view"/></button> --%>
							<!-- Likes -->
<%-- 							<button type="button" onclick="fnSearch('auto', 'LIKE')"><spring:message code="counsel.msg.sortBy.like"/></button> --%>
						</span>
					</div>
				</div>
				<!-- //bbs_info -->

				<div class="bbs_basic">
					<ul class="recruitment_list clearfix"></ul>
				</div>
				<!-- //bbs_basic list -->

				<div class="bbs_empty">
					<p>
						<spring:message code="private.member.main.msg01" /><br />
						<spring:message code="private.member.main.msg02" />
					</p>
					<div class="bbs_btn_wrap">
						<div class="bbs_center">
							<a href="" class="bbs_btn type01"><spring:message code="resume.text.resumeInsert" /></a>
						</div>
					</div>
				</div>
				<!-- //bbs_empty -->

				<div class="pagination"></div>
				<!--  //pagination -->

			</div>
			<!-- //tab_contents3 -->

		</div>
    	<!-- //contents -->
    </article>
</main>
<!-- //main.colgroup -->
<form id="frm" name="frm" method="post">
	<input type="hidden" id="condSeq" name="condSeq" />
</form>

<script>
	var vacancyCnt = "<spring:message code="compny.vacancy.msg.title8" />"; //모집인원
	var currentPageNo = "1";
	var condSort = "LATEST";
	var condTab = "book";

	$(document).ready(function() {
		$(".bbs_empty").hide();
		fnSearch(condTab, condSort);
	});

	function fnSearch(flag, sort) {
		currentPageNo = "1";
		condTab = flag;
		condSort = sort;

		if(condTab == null || $.trim(condTab) == "") condTab = "book";
		if(condSort == null || $.trim(condSort) == "") condSort = "LATEST";

		if(condTab == "auto") {
			fnSearchAuto(currentPageNo);
		} else if(condTab == "book") {
			fnSearchInterest(currentPageNo);
		} else if(condTab == "match") {
			fnSearchMatch(currentPageNo);
		}
	}

	function fnSearchInterest(pageNo) {
		var divArea = "tab_contents1";
		if(!pageNo) currentPageNo = 1;
		$.ajax({
			type: METHOD_POST, dataType: AJAX_DATA_TYPE_JSON,
			url: contextPath + "/cpes/private/member/interestListAjax.do",
			data: {
		   		"condSort": condSort,
		   		"currentPageNo": currentPageNo
			},
			success: function(data) {
	   			if (data.result.successYn != "Y") {
	   				var msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg11"/>";
// 	   				if(data.result.statCd == "03") {
// 	   					msg = "<spring:message code="errors.ajax.fail"/>";
// 	   				}
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			$("#"+divArea+" .currently").text(data.paginationInfo.currentPageNo);
	   			$("#"+divArea+" .total").text(data.paginationInfo.totalPageCount);
	   			fnPagination(data.paginationInfo, "fnSearchMatch", "#"+divArea+" .pagination");

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
						dataList += '		<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url='+item.filePath+'" alt="image" onerror="fnNoImage(this)" /></div>';
						dataList += '		<div class="contents_box">';
						dataList += '			<div class="title_box '+classNew+'">';
						dataList += '				<span class="tit">'+nvl(item.compnyNm)+'</span>';
						dataList += '				<a href="javascript:void(0);" onclick="fnVacancyView(\''+item.vacancySeq+'\',\'frm\');" class="title">'+nvl(item.vacancyTitle)+'</a>';
						dataList += '			</div>';
						dataList += '			<div class="cont_box">';
						dataList += '				<span class="con">'+nvl(item.employFormNm)+'</span>';
						dataList += '				<span class="con">'+vacancyCnt+'&nbsp;:&nbsp;<strong>'+fnNumberWithCommas(nvl(item.recrumtMemb,0))+'</strong></span>';
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
						//<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">
						//dataList += '					<span id="bkmkSapnInterest_'+cnt+'"><button type="button" id="btnBkmkInterest_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.vacancySeq+'\',LIKE_CATEGORY_VACANCY,\'btnBkmkInterest_'+cnt+'\',\'bkmkSapnInterest_'+cnt+'\');" class="interest '+classBkmk+'">interest</button></span>';
						//</sec:authorize>
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

	function fnSearchMatch(pageNo) {
		var divArea = "tab_contents2";
		if(!pageNo) currentPageNo = 1;
		$.ajax({
			type: METHOD_POST, dataType: AJAX_DATA_TYPE_JSON,
			url: contextPath + "/cpes/private/member/matchingListAjax.do",
			data: {
		   		"condSort": condSort,
		   		"currentPageNo": currentPageNo
			},
			success: function(data) {
	   			if (data.result.successYn != "Y") {
	   				var msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg11"/>";
// 	   				if(data.result.statCd == "03") {
// 	   					msg = "<spring:message code="errors.ajax.fail"/>";
// 	   				}
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			$("#"+divArea+" .currently").text(data.paginationInfo.currentPageNo);
	   			$("#"+divArea+" .total").text(data.paginationInfo.totalPageCount);
	   			fnPagination(data.paginationInfo, "fnSearchMatch", "#"+divArea+" .pagination");

				// Data List
				$("#"+divArea+" .bbs_basic >ul").empty();

				if(!data.matchSetCnt || parseInt(data.matchSetCnt) < 1) {
					$("#"+divArea+" .bbs_empty.noMatchSet").show();
				} else {
					$("#"+divArea+" .bbs_empty.noMatchSet").hide();
				}

				if(!data.resultList || data.resultList.length == 0) {
					$("#"+divArea+" .bbs_basic").hide();
					$("#"+divArea+" .bbs_empty.data").show();
				} else {
					$("#"+divArea+" .bbs_basic").show();
					$("#"+divArea+" .bbs_empty.data").hide();

					var cnt = 0;
					var dataList = "", classNew = "", classBkmk = "", classRemain="", remainDays= "";
					$.each(data.resultList, function(index, item) {
						cnt = index + 1;
						classNew = (item.newYn == 'Y') ? "new" : "";
						classBkmk = (item.bkmkSeq != null && item.bkmkSeq != '') ? "on" : "";
						if(item.remainHours && parseInt(item.remainHours) < 24) {
							classRemain = "hurry";
							if(parseInt(item.remainHours) == 1) {
								remainDays = item.remainHours+ "Hour";
							} else {
								remainDays = item.remainHours+ "Hours";
							}
						} else {
							classRemain = "day";
							remainDays = item.remainDays;
						}

						dataList += '<li>';
						dataList += '	<div class="contents_wrap">';
						dataList += '		<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url='+item.filePath+'" alt="image" onerror="fnNoImage(this)" /></div>';
						dataList += '		<div class="contents_box">';
						dataList += '			<div class="title_box '+classNew+'">';
						dataList += '				<span class="tit">'+nvl(item.compnyNm)+'</span>';
						dataList += '				<a href="javascript:void(0);" onclick="fnVacancyView(\''+item.vacancySeq+'\',\'frm\');" class="title">'+item.vacancyTitle+'</a>';
						dataList += '			</div>';
						dataList += '			<div class="cont_box">';
						dataList += '				<span class="con">'+nvl(item.preferEmploymtTypeNm)+'</span>';
						dataList += '				<span class="con">'+vacancyCnt+'&nbsp;:&nbsp;<strong>'+fnNumberWithCommas(nvl(item.recrumtMemb,0))+'</strong></span>';
						dataList += '				<span class="con">'+nvl(item.addrFullNm)+'</span>';
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
						dataList += '					<span id="bkmkSapnMatch_'+cnt+'"><button type="button" id="btnBkmkMatch_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.vacancySeq+'\',LIKE_CATEGORY_VACANCY,\'btnBkmkMatch_'+cnt+'\',\'bkmkSapnMatch_'+cnt+'\');" class="interest '+classBkmk+'">interest</button></span>';
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

	function fnSearchAuto(pageNo) {
		var divArea = "tab_contents3";
		if(!pageNo) currentPageNo = 1;
		$.ajax({
			type: METHOD_POST, dataType: AJAX_DATA_TYPE_JSON,
			url: contextPath + "/cpes/private/matching/autoMatchListAjax.do",
			data: {
		   		"condSort": condSort,
		   		"currentPageNo": currentPageNo
			},
			success: function(data) {
	   			if (data.result.successYn != "Y") {
	   				var msg = "<spring:message code="mypage.compny.vacancy.intvw.video.msg11"/>";
// 	   				if(data.result.statCd == "03") {
// 	   					msg = "<spring:message code="errors.ajax.fail"/>";
// 	   				}
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			$("#"+divArea+" .currently").text(data.paginationInfo.currentPageNo);
	   			$("#"+divArea+" .total").text(data.paginationInfo.totalPageCount);
	   			fnPagination(data.paginationInfo, "fnSearchMatch", "#"+divArea+" .pagination");

				// Data List
				$("#"+divArea+" .bbs_basic >ul").empty();

				if(!data.matchSetCnt || parseInt(data.matchSetCnt) < 1) {
					$("#"+divArea+" .bbs_empty.noMatchSet").show();
				} else {
					$("#"+divArea+" .bbs_empty.noMatchSet").hide();
				}

				if(!data.resultList || data.resultList.length == 0) {
					$("#"+divArea+" .bbs_basic").hide();
					$("#"+divArea+" .bbs_empty.data").show();
				} else {
					$("#"+divArea+" .bbs_basic").show();
					$("#"+divArea+" .bbs_empty.data").hide();

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
						dataList += '				<a href="javascript:void(0);" onclick="fnVacancyView(\''+item.vacancySeq+'\',\'frm\');" class="title">'+item.vacancyTitle+'</a>';
						dataList += '			</div>';
						dataList += '			<div class="cont_box">';
						dataList += '				<span class="con">'+nvl(item.preferEmploymtTypeNm)+'</span>';
						dataList += '				<span class="con">'+vacancyCnt+'&nbsp;:&nbsp;<strong>'+fnNumberWithCommas(nvl(item.recrumtMemb,0))+'</strong></span>';
						dataList += '				<span class="con">'+nvl(item.addrFullNm)+'</span>';
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
						dataList += '					<span id="bkmkSapnAuto_'+cnt+'"><button type="button" id="btnBkmkAuto_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.vacancySeq+'\',LIKE_CATEGORY_VACANCY,\'btnBkmkAuto_'+cnt+'\',\'bkmkSapnAuto_'+cnt+'\');" class="interest '+classBkmk+'">interest</button></span>';
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

   	function fnGoMatchView(seq) {
		$("input#condSeq").val(seq);
		$("form#frm").submit();
   	}

</script>
