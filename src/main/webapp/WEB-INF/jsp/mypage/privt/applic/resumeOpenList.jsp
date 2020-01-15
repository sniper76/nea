<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
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

    	function fnDelResumeOpen() {

    		var seqArr = new Array;

    		if(!$("input:checkbox[name=chk]").is(":checked") == true) {
				alertify.alert("<spring:message code="mypage.compny.applic.errors.msg"/>", function (e){

				});
				return false;
    		}

    		$("input:checkbox[name=chk]:checked").each(function() {
    			seqArr.push($(this).val())
			});

    		alertify.confirm("<spring:message code="compny.vacancy.msg.btn.delete"/>", function (e) {
    			if (e) {
    				$.ajax({
    					url: contextPath + "/cpes/private/applic/resumeOpenDelProcessAjax.do",
    					type: 'post',
    					data: {
    						condStr : seqArr.join(",")
    					},
    					datatype: 'json'
    				})
    				.done(function(data) {
    					if (data.result.successYn == "Y") {
    						alertify.alert("<spring:message code="counsel.msg.delete.success"/>", function (e){
    							fnSetPageing("1");
    						});

    					} else {
    		 				var msg = noMemberFailMsg;
    						if(data.result.statCd == "02") {
    							msg = systemMsg;
    						}
    						alertify.alert(msg);
    					}
    				})
    				.fail(function(xhr, status, errorThrown) {
    					alertify.alert(systemMsg);
    				});
    			}
    		});
    	}

	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.resumeOpen.title"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="resumeOpenList">
				<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/private/applic/resumeOpenList.do" method="post">
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
						<span class="order">
							<h3 class="h0 skip"><spring:message code="counsel.msg.sort.change"/></h3>
							<button type="button" onclick="javascript:fnSetSort('LATEST','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.latest"/></button>
							<button type="button" onclick="javascript:fnSetSort('LIKE','condSort','frm','currentPageNo')"><spring:message code="counsel.msg.sortBy.like"/></button>
						</span>
					</div>
					</form>
				</div>
				<!-- //bbs_info -->

				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list edu my clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<span class="check_box">
								<label for="chk_${status.count}" class="skip">Select</label>
								<input type="checkbox" id="chk_${status.count}" name="chk" value="${data.resumeOpenCompnySeq}_${data.resumeSeq}"/>
							</span>
							<div class="contents_wrap">
								<%-- <div class="img_box"><img src="${pageContext.request.contextPath}/${data.imagePath}" onerror="fnNoImage(this)" alt="image"></div> --%>
								<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.imagePath}" onerror="fnNoImage(this)" alt="image"></div>
								<div class="contents_box">
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
										<a href="javascript:void(0);" onclick="fnCompnyView('${data.compnySeq}');" class="title">${data.compnyNm}</a>
									</div>
									<div class="cont_box">
										<span class="cont">
											<span class="con">${data.compnyTypeNm}</span>
											<span class="con">${data.addrNm}</span>
											<span class="con">${data.isicNm}</span>
										</span>
										<span class="cont">
											<span class="con"><spring:message code="mypage.private.msg"/> <strong class="em_b_point"><fmt:formatNumber type="number" maxFractionDigits="3" value="${data.vacancyCnt}" /></strong></span>
										</span>
									</div>
									<div class="other_box">
										<span class="top_box">
											<span class="date type3">${data.regDt}</span>
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
						<button type="button" onclick="fnDelResumeOpen();" class="bbs_btn delete"><spring:message code="button.delete"/></button>
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