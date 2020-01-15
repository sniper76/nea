<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/CustomFunctionTag.tld" prefix="cFun" %>

<main class="colgroup" id="colgroup">
	<article>
    	<header class="sub_head">
			<div class="sub_title">
				<h2>
					<span><spring:message code="jobfair.apply.list.ttl01"/></span>
				</h2>
			</div>
      	</header>
       	<div id="contents" class="jobFairApplyView">

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

<form name="viewFrm" action="${pageContext.request.contextPath}/jobFair/applyView.do" method="post">
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
   				var msg = "<spring:message code="login.findId.no.data"/>";
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

				var dataList = "";
				$.each(data.resultList, function(index, item) {
					dataList += '<li>';
					dataList += '	<div class="contents_wrap">';
					dataList += '		<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url='+item.filePath+'" alt="image" onerror="fnNoImage(this)" /></div>';
					dataList += '		<div class="contents_box '+locTp(item.fairDivCd)+'">';
					dataList += '			<div class="title_box '+isNew(item.newYn)+'">';
					dataList += '				<a href="javascript:fnGoView(\''+item.fairSeq+'\')" class="title">'+item.fairNm+'</a>';
					dataList += '			</div>';
					dataList += '			<div class="cont_box">';
					dataList += '				<span class="cont">';
					dataList += '					<span class="con">'+loc+' : <strong>'+item.addrNm+'</strong></span>';
					dataList += '				</span>';
					dataList += '				<span class="cont">';
					dataList += '					<span class="con">'+item.fairBgnDt+' ~ '+item.fairEndDt+'</span>';
					dataList += '				</span>';
					dataList += '				<span class="cont">';
					dataList += '					<span class="con"><a href="tel:'+item.tel1+'" class="mobile_phone">'+item.tel1+'</a></span>';
					dataList += '					<span class="con"><a href="tel:'+item.tel2+'" class="mobile_phone">'+item.tel2+'</a></span>';
					dataList += '					<span class="con">'+item.email+'</span>';
					dataList += '				</span>';
					dataList += '			</div>';
					dataList += '			<div class="other_box">';
					dataList += '				<span class="top_box">';
					<c:if test="${loginYn == 'Y'}">
						if(item.fairStsCd == "FAS0000000002" && item.applyCnt == 0) { //접수중 and 미참여
					dataList += '					<button type="button" class="bbs_btn type08 small" onclick="fnGoApply(\''+item.fairSeq+'\')">'+participate+'</button>';
						}
					</c:if>
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

   	function locTp(fairDivCd) {
		var locTp = "";
		if(fairDivCd == 'FDC0000000001') {
			locTp = "ncpf";
		} else if(fairDivCd == 'FDC0000000002') {
			locTp = "pcpf";
		} else if(fairDivCd == 'FDC0000000003') {
			locTp = "ep";
		} else if(fairDivCd == 'FDC0000000004') {
			locTp = "mj";
		} else if(fairDivCd == 'FDC0000000005') {
			locTp = "rf";
		}
		return locTp;
   	}
   	function isNew(newYn) {
		return (newYn == 'Y') ? "new" : "";
   	}
	function fnSetPageing(curPage) {
		currentPageNo = curPage;
		fnSearch();
   	}
	function fnGoView(seq) {
		var f = $("[name=viewFrm]")[0];
   		f.condSeq.value = seq;
   		f.condSort.value = searchCond.condSort;
   		f.currentPageNo.value = searchCond.currentPageNo;
   		f.condFairDivCd.value = searchCond.condFairDivCd;
   		f.condSearchType.value = searchCond.condSearchType;
   		f.condType.value = searchCond.condType;
   		f.condText.value = searchCond.condText;
   		f.submit();
	}
	function fnGoApply(fairSeq) {
		alertify.confirm("<spring:message code="jobfair.apply.view.msg01"/>", function (e) {
			if (e) {
				$.ajax({
					url: contextPath + "/jobFair/applyPatcptnAjax.do",
					data: {
						"fairSeq": fairSeq
					},
					type: 'post',
					datatype: 'json'
				})
				.done(function(data) {
					if (data.result.successYn == "Y") {
						alertify.alert("<spring:message code="jobfair.apply.view.msg02"/>", function (e){
							if(condSearchType == "ADV") {
								fnSearch("[name=searchAdvFrm]");
							} else {
								fnSearch("[name=searchFrm]");
							}
						});
					} else {
		 				var msg = "<spring:message code="errors.ajax.fail"/>";
// 						if(data.result.statCd == "02") {
// 							msg = "<spring:message code="errors.ajax.fail"/>"
// 						}
						alertify.alert(msg);
					}
				})
				.fail(function(xhr, status, errorThrown) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				});
			}
		});
	}
</script>
