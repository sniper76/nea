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
			        <li class="on"><a href="#tab_contents1" onclick="fnSearch('auto')"><spring:message code="auto.matching" /></a></li><!-- Auto Matching -->
			        <li><a href="#tab_contents2" onclick="fnSearch('book')"><spring:message code="mypage.private.interest.title" /></a></li><!-- My Saved -->
			        <li><a href="#tab_contents3" onclick="fnSearch('match')"><spring:message code="lnb.mypage.left.menu1" /></a></li><!-- Tailored Matching -->
			    </ul>
			</div>

			<div id="tab_contents1" class="tab_contents">
				<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<div class="bbs_left bbs_count">
						<strong class="currently">1</strong>&nbsp;&nbsp;/
						<span class="total">1</span>
						<span class="order">
							<strong class="skip">Change list order</strong>
							<button type="button" onclick="fnSearch('auto', 'LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button><!-- Latest -->
							<button type="button" onclick="fnSearch('auto', 'VIEW')"><spring:message code="counsel.msg.sortBy.view"/></button><!-- Views -->
							<button type="button" onclick="fnSearch('auto', 'LIKE')"><spring:message code="counsel.msg.sortBy.like"/></button><!-- Likes -->
						</span>
					</div>
				</div>
				<!-- //bbs_info -->

				<div class="bbs_basic">
					<ul class="recruitment_list clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<li>
						<div class="contents_wrap">
							<div class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></div>
							<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
								<div class="title_box new"><!-- 새글일 경우 클래스 new 추가 -->
									<span class="tit">SAMSUNG Cambodiagy</span>
									<a href="" class="title">Construction Project Planning Manager</a>
								</div>
								<div class="cont_box">
									<span class="con">Part time</span>
									<span class="con">Vacancy&nbsp;:&nbsp;<strong>1</strong></span>
									<span class="con">Phonm Penh</span>
									<span class="con">$300</span>
								</div>
								<div class="other_box">
									<span class="top_box">
										<span class="day">30</span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
										<button type="button" class="interest on">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
									</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="contents_wrap">
							<div class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></div>
							<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
								<div class="title_box"><!-- 새글일 경우 클래스 new 추가 -->
									<span class="tit">SAMSUNG Cambodiagy</span>
									<a href="" class="title">Construction Project Planning Manager</a>
								</div>
								<div class="cont_box">
									<span class="con">Part time</span>
									<span class="con">Vacancy&nbsp;:&nbsp;<strong>1</strong></span>
									<span class="con">Phonm Penh</span>
									<span class="con">$300</span>
								</div>
								<div class="other_box">
									<span class="top_box">
										<span class="hurry">18Hour</span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
										<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
									</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="contents_wrap">
							<div class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></div>
							<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
								<div class="title_box"><!-- 새글일 경우 클래스 new 추가 -->
									<span class="tit">SAMSUNG Cambodiagy</span>
									<a href="" class="title">Construction Project Planning Manager</a>
								</div>
								<div class="cont_box">
									<span class="con">Part time</span>
									<span class="con">Vacancy&nbsp;:&nbsp;<strong>1</strong></span>
									<span class="con">Phonm Penh</span>
									<span class="con">$300</span>
								</div>
								<div class="other_box">
									<span class="top_box">
										<span class="close">Closed</span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
										<button type="button" class="interest close">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
									</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="contents_wrap">
							<div class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></div>
							<div class="contents_box deleted"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
								<div class="title_box"><!-- 새글일 경우 클래스 new 추가 -->
									<span class="tit">SAMSUNG Cambodiagy</span>
									<a href="" class="title">Construction Project Planning Manager</a>
								</div>
								<div class="other_box">
									<span class="top_box">
										<span class="close">Closed</span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
										<button type="button" class="interest close">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
									</span>
								</div>
							</div>
						</div>
					</li>
					</ul>
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

				<div class="pagination">
					<a href="" class="prev_end">First page</a>
					<a href="" class="prev_one">Prev page</a>
					<strong title="Current page">1</strong>
					<a href="" title="Go to page 2">2</a>
					<a href="" title="Go to page 3">3</a>
					<a href="" title="Go to page 4">4</a>
					<a href="" title="Go to page 5">5</a>
					<a href="" title="Go to page 6">6</a>
					<a href="" title="Go to page 7">7</a>
					<a href="" title="Go to page 8">8</a>
					<a href="" title="Go to page 9">9</a>
					<a href="" title="Go to page 10">110</a>
					<a href="" class="next_one">Next page</a>
					<a href="" class="next_end">Last page</a>
				</div>
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
			<!-- //tab_contents2 -->

			<div id="tab_contents3" class="tab_contents">
				<div class="bbs_info clearfix">
					<div class="bbs_left bbs_count">
						<strong class="currently">1</strong>&nbsp;&nbsp;/
						<span class="total">1</span>
						<span class="order">
							<strong class="skip">Change list order</strong>
							<button type="button" onclick="fnSearch('match', 'LATEST')"><spring:message code="counsel.msg.sortBy.latest"/></button><!-- Latest -->
							<button type="button" onclick="fnSearch('match', 'VIEW')"><spring:message code="counsel.msg.sortBy.view"/></button><!-- Views -->
							<button type="button" onclick="fnSearch('match', 'LIKE')"><spring:message code="counsel.msg.sortBy.like"/></button><!-- Likes -->
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
	var condTab = "auto";

	$(document).ready(function() {
		$(".bbs_empty").hide();
	});

	function fnSearch(flag, sort) {
		currentPageNo = "1";
		condTab = flag;
		condSort = sort;

		if(condTab == null || $.trim(condTab) == "") condTab = "auto";
		if(condSort == null || $.trim(condSort) == "") condSort = "LATEST";

		if(condTab == "auto") {
			fnSearchAuto(currentPageNo);
		} else if(condTab == "book") {
			fnSearchInterest(currentPageNo);
		} else if(condTab == "match") {
			fnSearchMatch(currentPageNo);
		}
	}

	function fnSearchAuto(pageNo) {
		if(!pageNo) currentPageNo = 1;

	}
	function fnSearchInterest(pageNo) {
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
	   				var msg = "<spring:message code="login.findId.no.data"/>";
// 	   				if(data.result.statCd == "03") {
// 	   					msg = "<spring:message code="errors.ajax.fail"/>";
// 	   				}
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			$("#tab_contents2 .currently").text(data.paginationInfo.currentPageNo);
	   			$("#tab_contents2 .total").text(data.paginationInfo.totalPageCount);
	   			fnPagination(data.paginationInfo, "fnSearchMatch", "#tab_contents2 .pagination");

				// Data List
				$("#tab_contents2 .bbs_basic >ul").empty();
				if(!data.resultList || data.resultList.length == 0) {
					$("#tab_contents2 .bbs_basic").hide();
					$("#tab_contents2 .bbs_empty").show();
				} else {
					$("#tab_contents2 .bbs_basic").show();
					$("#tab_contents2 .bbs_empty").hide();

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
						//dataList += '					<span id="bkmkSapn_'+cnt+'"><button type="button" id="btnBkmk_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.vacancySeq+'\',LIKE_CATEGORY_VACANCY,\'btnBkmk_'+cnt+'\',\'bkmkSapn_'+cnt+'\');" class="interest '+classBkmk+'">interest</button></span>';
						//</sec:authorize>
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '		</div>';
						dataList += '	</div>';
						dataList += '</li>';
					});
					$("#tab_contents2 .bbs_basic >ul").append(dataList);
				}
			},
			error: function(xhr, status, error) {
				alertify.alert("error to connecting server");
			}
		});
	}

	function fnSearchMatch(pageNo) {
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
	   				var msg = "<spring:message code="login.findId.no.data"/>";
// 	   				if(data.result.statCd == "03") {
// 	   					msg = "<spring:message code="errors.ajax.fail"/>";
// 	   				}
	   				alertify.alert(msg);
	   				return;
	   			}

	   			// Pagination
	   			$("#tab_contents3 .currently").text(data.paginationInfo.currentPageNo);
	   			$("#tab_contents3 .total").text(data.paginationInfo.totalPageCount);
	   			fnPagination(data.paginationInfo, "fnSearchMatch", "#tab_contents3 .pagination");

				// Data List
				$("#tab_contents3 .bbs_basic >ul").empty();

				if(!data.matchSetCnt || parseInt(data.matchSetCnt) < 1) {
					$("#tab_contents3 .bbs_empty.noMatchSet").show();
				} else {
					$("#tab_contents3 .bbs_empty.noMatchSet").hide();
				}

				if(!data.resultList || data.resultList.length == 0) {
					$("#tab_contents3 .bbs_basic").hide();
					$("#tab_contents3 .bbs_empty.data").show();
				} else {
					$("#tab_contents3 .bbs_basic").show();
					$("#tab_contents3 .bbs_empty.data").hide();

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
						dataList += '					<span id="bkmkSapn_'+cnt+'"><button type="button" id="btnBkmk_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.vacancySeq+'\',LIKE_CATEGORY_VACANCY,\'btnBkmk_'+cnt+'\',\'bkmkSapn_'+cnt+'\');" class="interest '+classBkmk+'">interest</button></span>';
						</sec:authorize>
						dataList += '				</span>';
						dataList += '			</div>';
						dataList += '		</div>';
						dataList += '	</div>';
						dataList += '</li>';
					});
					$("#tab_contents3 .bbs_basic >ul").append(dataList);
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
