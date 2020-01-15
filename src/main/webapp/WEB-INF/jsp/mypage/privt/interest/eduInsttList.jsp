<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}


    	});


      	function fnSetPageing(curPage) {
    		$("#currentPageNo").val(curPage);
    		fnGoList("frm");
    	}

      	function fnInterestInstt() {
    		var seqArr = new Array;

    		if(!$("input:checkbox[name=chk]").is(":checked") == true) {
				alertify.alert("<spring:message code="mypage.compny.applic.errors.msg"/>", function (e){

				});
				return false;
    		}

    		$("input:checkbox[name=chk]:checked").each(function() {
    			seqArr.push($(this).val())
			});

    		fnBkmkDelList(seqArr, 'frm');
      	}

	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.interest.title4"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="interestEduInsttList">
				<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/private/interest/eduInsttList.do" method="post">
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
					</form>
					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
						<span class="order">
							<h3 class="h0 skip"><spring:message code="counsel.msg.sort.change"/></h3>
							<button type="button" onclick="javascript:fnSetSort('LATEST','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.latest"/></button>
							<button type="button" onclick="javascript:fnSetSort('LIKE','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.like"/></button>
						</span>
					</div>
				</div>
				<!-- //bbs_info -->

				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list edu my clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<span class="check_box">
								<label for="chk_${status.count}" class="skip">Select</label>
								<input type="checkbox" id="chk_${status.count}" name="chk" value="${data.bkmkSeq}" />
							</span>
							<div class="contents_wrap">

								<c:set var="insttOwnerCdClass" value="private"/>
								<c:choose>
									<c:when test="${data.insttOwnerCd == 'IOS0000000002'}">
										<c:set var="insttOwnerCdClass" value="ngo"/>
									</c:when>
									<c:when test="${data.insttOwnerCd == 'IOS0000000003'}">
										<c:set var="insttOwnerCdClass" value="government"/>
									</c:when>
								</c:choose>

								<div class="img_box">
									<%-- <c:choose>
										<c:when test="${not empty data.filePath }">
											<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/>
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt="image" />
										</c:otherwise>
									</c:choose> --%>
									<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/>
								</div>
								<div class="contents_box ${insttOwnerCdClass}"><!-- 비정부기관일 경우 클래스 ngo , 정부기관일 경우 클래스 government 추가, 민간기업일 경우 클래스 private 추가 -->
									<div class="title_box"><!-- 새글일 경우 클래스 new 추가 -->
										<a href="javascript:void(0);" onclick="fnInsttView('${data.insttSeq}');" class="title">${data.insttNm}</a>
									</div>
									<div class="cont_box">
										<span class="cont">
											<span class="con">${data.insttTypeNm}</span>
										</span>
										<span class="cont">
											<span class="con">${data.addrNm}</span>
											<span class="con"><a href="tel:${data.tel1}" class="mobile_phone">${data.tel1}</a></span>
										</span>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
				</c:if>
				<!-- //bbs_basic list -->

				<c:if test="${empty resultList}">
				<div class="bbs_empty">
					<p><spring:message code="counsel.msg.no.data"/></p>
					<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
				</div>
				<!-- //bbs_empty -->
				</c:if>

				<div class="bbs_btn_wrap clearfix">
					<span class="bbs_left">

					</span>
					<span class="bbs_right">
						<button type="button" onclick="fnInterestInstt();" class="bbs_btn delete"><spring:message code="button.delete"/></button>
					</span>
				</div>
				<!-- //bbs_btn_wrap -->

				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->



			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->