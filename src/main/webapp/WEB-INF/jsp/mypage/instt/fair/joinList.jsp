<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
			//검색키워드 enter
			$("#condText").keypress(function( event ) {
				if( event.which == 13 ) {
					fnSetPageing("1");
				}
			});
    	});


      	function fnSetPageing(curPage) {
    		$("#currentPageNo").val(curPage);
    		fnGoList("frm");
    	}

      	function fnCancelFair(seq,seq2,frmId) {

    		alertify.confirm("<spring:message code="mypage.private.fair.errors.msg"/>", function (e) {
    			if (e) {
    				$.ajax({
    					url: contextPath + "/cpes/instt/fair/fairCancelProcessAjax.do",
    					type: 'post',
    					data: {
    						condSeq : seq,
    						condSeq2 : seq2
    					},
    					datatype: 'json'
    				})
    				.done(function(data) {
    					if (data.result.successYn == "Y") {
    						alertify.alert("<spring:message code="mypage.private.fair.errors.msg2"/>", function (e){
    							location.reload();
    						});

    					} else {
    		 				var msg = "<spring:message code="login.findId.no.data"/>";
    						if(data.result.statCd == "02") {
    							msg = "<spring:message code="errors.ajax.fail"/>"
    						}
    						alertify.alert(msg);
    					}
    				})
    				.fail(function(xhr, status, errorThrown) {
    					alertify.alert("<spring:message code="errors.ajax.fail"/>");
    				});
    			}
    		});
      	}


      	function fnDelJoinFair(frmId) {
    		var seqArr = new Array;

    		if(!$("input:checkbox[name=chk]").is(":checked") == true) {
				alertify.alert("<spring:message code="mypage.compny.applic.errors.msg"/>", function (e){

				});
				return false;
    		}

    		$("input:checkbox[name=chk]:checked").each(function() {
    			seqArr.push($(this).val())
			});

    		//console.log("==========str="+seqArr.join(","))
    		alertify.confirm("<spring:message code="compny.vacancy.msg.btn.delete"/>", function (e) {
    			if (e) {

					$.ajax({
						url: contextPath + "/cpes/instt/fair/inviteDeleteProcessAjax.do",
						type: 'post',
						data: {
							condSeqStr: seqArr.join(",")
						},
						datatype: 'json'
					})
					.done(function(data) {
						if (data.result.successYn == "Y") {
							alertify.alert("<spring:message code="counsel.msg.delete.success"/>", function (e){
								fnSetPageing("${paginationInfo.currentPageNo}");
							});
						} else {
			 				var msg = "<spring:message code="login.findId.no.data"/>";
							if(data.result.statCd == "02") {
								msg = "<spring:message code="errors.ajax.fail"/>";
							}
							alertify.alert(msg);
						}
					})
					.fail(function(xhr, status, errorThrown) {
						alertify.alert("<spring:message code="errors.ajax.fail"/>");
					});
    			}
    		});;
      	}
	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.compny.fair.title2"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="fairInviteList">
				<div class="bbs_info clearfix tab_confirm"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/instt/fair/joinList.do" method="post">
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
				<!-- bbs_info  -->
				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list recruitment my clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<span class="check_box">
								<label for="chk_${status.count}" class="skip">Select</label>
								<input type="checkbox" id="chk_${status.count}" name="chk" value="${data.insttSeq}_${data.fairSeq}">
							</span>
							<div class="contents_wrap">
								<div class="img_box"><img src="${pageContext.request.contextPath}/${data.imagePath}" onerror="fnNoImage(this)" alt="image"></div>

								<c:set var="fairDivCdClass" value="ncpf"/>
								<c:choose>
									<c:when test="${data.fairDivCd == 'FDC0000000002'}">
										<c:set var="fairDivCdClass" value="pcpf"/>
									</c:when>
									<c:when test="${data.fairDivCd == 'FDC0000000003'}">
										<c:set var="fairDivCdClass" value="ep"/>
									</c:when>
									<c:when test="${data.fairDivCd == 'FDC0000000004'}">
										<c:set var="fairDivCdClass" value="mj"/>
									</c:when>
									<c:when test="${data.fairDivCd == 'FDC0000000005'}">
										<c:set var="fairDivCdClass" value="rf"/>
									</c:when>
								</c:choose>

								<div class="contents_box ${fairDivCdClass}"><!-- 전국일 경우 클래스 ncpf , 지방일 경우 클래스 pcpf 추가, 고용포럼일 경우 클래스 ep 추가, 모바일일 경우 클래스 mj 추가, 관련일 경우 클래스 rf 추가 -->
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
										<a href="javascript:void(0);" onclick="fnJobFairView('${data.fairSeq}','frm');" class="title">${data.fairNm}</a>
									</div>
									<div class="cont_box">
										<span class="cont">
											<span class="con"><spring:message code="resume.text.addrProvcCd"/> : <strong>${data.addrNm}</strong></span>
										</span>
										<span class="cont">
											<span class="con">${data.fairBgnDt} ~ ${data.fairEndDt}</span>
										</span>
										<span class="cont">
											<span class="con"><a href="tel:${data.tel1}" class="mobile_phone">${data.tel1}</a></span>
											<span class="con"><a href="tel:${data.tel2}" class="mobile_phone">${data.tel2}</a></span>
											<span class="con">${data.email}</span>
										</span>
									</div>
									<div class="other_box type2">
										<span class="top_box">
											<c:choose>
												<c:when test="${data.fairStsCd == 'FAS0000000001'}"><!-- 신청 -->
													<span class="registering">${data.fairStsNm}</span>
												</c:when>
												<c:when test="${data.fairStsCd == 'FAS0000000002'}"><!--진행 -->
													<span class="date">${data.fairStsNm}</span>
												</c:when>
												<c:otherwise>
													<span class="close">${data.fairStsNm}</span><!--마감 -->
												</c:otherwise>
											</c:choose>
										</span>
										<span class="bottom_box">
											<c:choose>
												<c:when test="${data.cancelYn == 'Y'}">
													<span class="close"><spring:message code="mypage.compny.applic.msg11"/></span>
												</c:when>
												<c:otherwise>
													<button type="button" onclick="fnCancelFair('${data.insttSeq}','${data.fairSeq}','frm');" class="bbs_btn small"><spring:message code="mypage.compny.applic.msg11"/></button>
												</c:otherwise>
											</c:choose>
										</span>
									</div>
								</div>
							</div>
						</li>

					</c:forEach>
					</ul>
				</div>
				</c:if>
				<!-- //bbs_basic -->

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
						<button type="button" onclick="fnDelJoinFair();" class="bbs_btn delete"><spring:message code="button.delete"/></button>
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