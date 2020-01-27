<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/CustomFunctionTag.tld" prefix="cFun" %>

<main class="colgroup" id="colgroup">
	<article>
    	<header class="sub_head">
			<div class="sub_title">
				<h2>
					<span><spring:message code="menu.jobfair"/></span>
				</h2>
			</div>
      	</header>
       	<div id="contents" class="jobFairApplyList">

			<div class="box_calendar">
			    <div class="calendar_tab">
			        <a href="javascript:void(0)" class="list on">List</a>
			        <a href="javascript:fnGoCalendar()" class="cal">Calendar</a>
			    </div>
				<!-- //calendar_tab -->
			</div>
			<!-- //box_calendar -->

			<div class="srch_box">
				<div class="srch_area advanced">
					<div class="box_wrap">
						<form name="searchFrm">
							<input type="hidden" name="condSeq" />
							<fieldset>
								<legend>Search</legend>
								<div class="contents_box">
									<label for="serch_sel" class="skip">Category Selection</label>
									<select id="serch_sel" name="condType">
										<option value=""><spring:message code="resume.text.addrProvcCd"/></option>
										<c:forEach var="data" items="${locCdList}" varStatus="status">
							   			<option value="${data.lvlCd}" <c:if test="${param.condSearchType != 'ADV' && param.condType == data.lvlCd}">selected</c:if>>${data.nm}</option>
							   			</c:forEach>
									</select>
									<label for="serch_text" class="skip">input the search</label>
									<input type="text" id="serch_text" name="condText" class="text" value="<c:if test="${param.condSearchType != 'ADV'}"><c:out value="${param.condText}" /></c:if>" placeholder="<spring:message code="compny.vacancy.msg.title64" />" maxlength="100" />
									<button type="button" name="searchBtn" class="submit"><spring:message code="button.search"/></button>
								</div>
							</fieldset>
						</form>
						<div class="put_box">
							<button type="button" class="advanced_search"><spring:message code="eduTrnng.free.search.title3" /></button>
						</div>
					</div>
				</div>
				<div class="detail_area">
					<div class="box_wrap">
						<form name="searchAdvFrm">
							<input type="hidden" name="condSeq" />
							<fieldset>
								<legend>Detail search</legend>
								<div class="title_box">
									<h3><spring:message code="eduTrnng.free.search.title3" /></h3>
								</div>
								<table class="bbs_table">
									<caption>Detail search</caption>
									<colgroup>
										<col style="width:30%;" />
										<col style="width:70%;" />
									</colgroup>
									<tbody>
									<tr>
										<th scope="col"><spring:message code="resume.text.addrProvcCd"/></th>
										<td>
											<select name="condType">
												<option value=""><spring:message code="counsel.msg.all"/></option>
												<c:forEach var="data" items="${locCdList}" varStatus="status">
									   			<option value="${data.lvlCd}" <c:if test="${param.condSearchType == 'ADV' && param.condType == data.lvlCd}">selected</c:if>>${data.nm}</option>
									   			</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="col">Category</th>
										<td>
											<select name="condFairDivCd">
												<option value=""><spring:message code="counsel.msg.all"/></option>
												<c:forEach var="data" items="${fairDivCdList}" varStatus="status">
									   			<option value="${data.dtlCd}" <c:if test="${param.condSearchType == 'ADV' && param.condFairDivCd == data.dtlCd}">selected</c:if>>${data.cdNm}</option>
									   			</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="col"><spring:message code="compny.vacancy.msg.title64"/></th>
										<td>
											<input type="text" name="condText" maxlength="100" style="width:100%;" value="<c:if test="${param.condSearchType == 'ADV'}"><c:out value="${param.condText}" /></c:if>" />
										</td>
									</tr>
									</tbody>
								</table>
								<div class="put_box">
									<button type="button" name="searchAdvBtn" class="submit"><spring:message code="button.search"/></button>
								</div>
							</fieldset>
						</form>
					</div>
					<button type="button" class="detail_close">Close Detail search</button>
				</div>
			</div>
			<!-- //srch_box -->

			<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
				<div class="bbs_left bbs_count">
					<strong class="currently">1</strong>/<span class="total">&nbsp;1</span>
					<span class="order">
						<h3 class="h0 skip">Change list order</h3>
						<button type="button" name="latestBtn"><spring:message code="counsel.msg.sortBy.latest"/></button>
						<button type="button" name="likeBtn"><spring:message code="counsel.msg.sortBy.like"/></button>
					</span>
				</div>

			</div>
			<!-- //bbs_info -->

			<div class="bbs_basic">
				<ul class="recruitment_list recruitment clearfix" id="data-list"></ul>
			</div>
			<!-- //bbs_basic list -->

			<div class="bbs_empty">
				<p><spring:message code="counsel.msg.no.data"/></p>
			</div>
			<!-- //bbs_empty -->

			<div class="pagination"></div>
			<!--  //pagination -->

		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<form name="viewFrm" action="${pageContext.request.contextPath}/jobFair/view.do" method="post">
	<input type="hidden" name="returnUrl" />
	<input type="hidden" name="condSeq" />
	<input type="hidden" name="currentPageNo"  value="<c:out value="${param.currentPageNo}" />" />
	<input type="hidden" name="condSort"       value="<c:out value="${param.condSort}" />" />
	<input type="hidden" name="condSearchType" value="<c:out value="${param.condSearchType}" />" />
	<input type="hidden" name="condFairDivCd"  value="<c:out value="${param.condFairDivCd}" />" />
	<input type="hidden" name="condType"       value="<c:out value="${param.condType}" />" />
	<input type="hidden" name="condText"       value="<c:out value="${param.condText}" />" />
</form>

<script>
	var resumeInsertErrorMsg = '<spring:message code="resume.write.insert.error"/>';
	var loc = '<spring:message code="resume.text.addrProvcCd" />';
	var participate = '<spring:message code="apply.participate" />';

	var searchCond = {};
	var condSort = "LATEST";
	var currentPageNo = "1";
	var condSearchType = "";

   	$(document).ready(function() {
		$('div#contents .tab_menu .clearfix li').removeClass('on');
		$('div#contents .tab_menu .clearfix li:eq(${tabNo})').addClass('on');

		$("[name=searchBtn]").click(function() {
			currentPageNo = "1";
			condSearchType = "";
			fnSearch("[name=searchFrm]");
		});
		$("[name=searchAdvBtn]").click(function() {
			currentPageNo = "1";
			condSearchType = "ADV";
			fnSearch("[name=searchAdvFrm]");
		});
		$("[name=latestBtn]").click(function() {
			currentPageNo = "1";
			condSort = "LATEST";
			fnSearch();
		});
		$("[name=likeBtn]").click(function() {
			currentPageNo = "1";
			condSort = "LIKE";
			fnSearch();
		});

		<c:if test="${param.condSort       != null}">condSort       = "<c:out value="${param.condSort}" />";</c:if>
		<c:if test="${param.currentPageNo  != null}">currentPageNo  = "<c:out value="${param.currentPageNo}" />";</c:if>
		<c:if test="${param.condSearchType != null}">condSearchType = "<c:out value="${param.condSearchType}" />";</c:if>

		<c:choose>
			<c:when test="${param.condSearchType == 'ADV'}">
		$('.advanced_search').trigger("click");
		fnSearch("[name=searchAdvFrm]");
			</c:when>
			<c:otherwise>
		fnSearch("[name=searchFrm]");
			</c:otherwise>
		</c:choose>
	});

   	function fnSearch(frmName) {
   		var action = contextPath + "/jobFair/applyListAjax.do";
   		var param = null;

   		if(frmName) {
   			param = searchCond = $(frmName).serializeObject();
   		} else {
   			param = searchCond;
   		}
   		param.condSort = condSort;
   		param.currentPageNo = currentPageNo;
   		param.condSearchType = condSearchType;

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
   			fnPagination(data.paginationInfo);

			// JobFair List
			$("#data-list").empty();
			if(!data.resultList || data.resultList.length == 0) {
				$(".bbs_basic").hide();
				$(".bbs_empty").show();
			} else {
				$(".bbs_basic").show();
				$(".bbs_empty").hide();

				var cnt = 0;
				var dataList = "", classActive = "", classFairSts = "";
				$.each(data.resultList, function(index, item) {
					cnt = index + 1;

					if(item.fairStsCd == "FAS0000000003") { //행사중
						classFairSts = "date";
					} else if(item.fairStsCd == "FAS0000000004") { //행사종료
						classFairSts = "close";
					}

					dataList += '<li>';
					dataList += '	<div class="contents_wrap">';
					dataList += '		<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url='+nvl(item.filePath)+'" alt="image" onerror="fnNoImage(this)" /></div>';
					dataList += '		<div class="contents_box '+fnJobFairDivNm(item.fairDivCd)+'">';
					dataList += '			<div class="title_box '+fnIsNew(item.newYn)+'">';
					dataList += '				<a href="javascript:fnGoView(\''+nvl(item.fairSeq)+'\')" class="title">'+nvl(item.fairNm)+'</a>';
					dataList += '			</div>';
					dataList += '			<div class="cont_box">';
					dataList += '				<span class="cont">';
					dataList += '					<span class="con">'+loc+' : <strong>'+nvl(item.addrNm)+'</strong></span>';
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
					dataList += '					<span class="'+classFairSts+'">'+nvl(item.fairStsNm)+'</span>';

					<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT,ROLE_CMPNY,ROLE_TRNCT')">
					classActive = (item.bkmkSeq) ?  "on" : "";
					dataList += '					<span id="bkmkSapn_'+cnt+'"><button type="button" id="btnBkmk_'+cnt+'" onclick="fnBkmkType2(\''+((item.bkmkSeq) ? item.bkmkSeq : "")+'\',\''+item.fairSeq+'\',LIKE_CATEGORY_FAIR,\'btnBkmk_'+cnt+'\',\'bkmkSapn_'+cnt+'\');" class="interest '+classActive+'">interest</button></span>';
					</sec:authorize>

					dataList += '				</span>';
					dataList += '			</div>';
					dataList += '		</div>';
					dataList += '	</div>';
					dataList += '</li>';
				});
				$("#data-list").append(dataList);
			}
   		})
   		.fail(function(xhr, status, errorThrown) {
   			alertify.alert("<spring:message code="errors.ajax.fail"/>");
   		});
   	}
	function fnSetPageing(curPage) {
		currentPageNo = curPage;
		fnSearch();
   	}
	function fnGoView(seq) {
		var f = $("[name=viewFrm]")[0];
		f.returnUrl.value = "${pageContext.request.contextPath}/jobFair/jobFairList.do";
   		f.condSeq.value = seq;
   		f.condSort.value = searchCond.condSort;
   		f.currentPageNo.value = searchCond.currentPageNo;
   		f.condFairDivCd.value = searchCond.condFairDivCd;
   		f.condSearchType.value = searchCond.condSearchType;
   		f.condType.value = searchCond.condType;
   		f.condText.value = searchCond.condText;
   		f.submit();
	}
	function fnGoCalendar() {
		document.location.href = contextPath+"/jobFair/jobFairCalendar.do";
	}
</script>
