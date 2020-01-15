<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {

    	});


    	function fnSetPageing(curPage) {
    		$("#currentPageNo").val(curPage);
    		fnGoList("frm");
    	}


    	function fnIntvwView(seq) {
			$.ajax({
				url: contextPath + "/cpes/private/applic/intvwViewAjax.do",
				type: 'post',
				data: {
					condSeq : seq,
					condSeq2 : seq2
				},
				datatype: 'html'
			})
			.done(function(data) {
				$('#myModal').html(data);
				$('#myModal').modal('show');

			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});


    	}


    	function fnIntvwOk(seq, seq2) {
    		var url = contextPath + "/cpes/private/applic/intvwOkAjax.do";
    		alertify.confirm("<spring:message code="mypage.private.referral.title2"/>", function (e) {
    			if (e) {
    				$.ajax({
    					url: url,
    					method: METHOD_POST,
    					data: {
    						intvwSeq: seq,
    						applicSeq: seq2
    					},
    					dataType: AJAX_DATA_TYPE_JSON
    				})
    				.done(function(data) {

    					if(data.result.successYn == "Y") {
    						alertify.alert(saveMsg, function (e){
    							location.reload();
    						});

    					} else {
    						alertify.alert(systemMsg);
    					}
    				})
    				.fail(function(xhr, status, errorThrown) {
    					alertify.alert(systemMsg);
    				});
    		    }
    		});
    	}

    	function fnIntvwRejectOpen(seq, seq2) {
    		$("#condSeq").val(seq);
    		$("#condSeq2").val(seq2);

      		$('#dialog').dialog({
      	    	title: '',
      	      	modal: true,
      	      	width: '700',
      	      	height: '300',
      	      	hideCloseButton: true
      		});

      		$(".ui-dialog-titlebar").remove();//다이얼로그 상단 타이틀 제거
    	}

      	function fnCloseReject(id) {
      		$("#"+id).dialog( "close" );
      	}


    	function fnIntvwReject() {
      		if($("#intvwRejectCd").val() == "") {
				alertify.alert("<spring:message code="mypage.compny.fail.reason.msg"/>", function (e){
					$("#intvwRejectCd").focus();
				});
				return false;
      		}

    		alertify.confirm("<spring:message code="mypage.compny.fail.reason.msg2"/>", function (e) {
    			if (e) {

					$.ajax({
						url: contextPath + "/cpes/private/applic/intvwRejectAjax.do",
						type: 'post',
						data: {
							intvwSeq: $("#condSeq").val(),
							applicSeq: $("#condSeq2").val(),
							intvwRejectCd: $("#intvwRejectCd").val()
						},
						datatype: 'json'
					})
					.done(function(data) {
						if (data.result.successYn == "Y") {
							alertify.alert("<spring:message code="mypage.private.jobsk.title21"/>", function (e){
								location.reload();
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
    		});

    	}


    	function fnIntvwRejectView(dataSetId) {
			dataSetObj = document.querySelector('#'+dataSetId);
    		var intvwRejectCd = dataSetObj.dataset.intvwRejectCd;

      		$('#dialog').dialog({
      	    	title: '',
      	      	modal: true,
      	      	width: '700',
      	      	height: '300',
      	      	hideCloseButton: true
      		});

      		$(".ui-dialog-titlebar").remove();//다이얼로그 상단 타이틀 제거


      		$("#dialogBtn").hide();
      		$("#intvwRejectCd").val(intvwRejectCd);
    	}

	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.intvw.title"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="applicIntwList">
				<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/private/applic/intvwList.do" method="post">
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
						<input type="hidden" id="condSeq" name="condSeq" value=""/>
						<input type="hidden" id="condSeq2" name="condSeq2" value=""/>
					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
<!-- 						<span class="order">
							<strong class="skip">Change list order</strong>
							<button type="button">Latest</button>
							<button type="button">View</button>
							<button type="button">like</button>
						</span> -->
					</div>
					</form>
				</div>
				<!-- //bbs_info -->


				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list edu my clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<input type="hidden" id="htmlDataSet_${status.count}" name="htmlDataSet"
							data-intvw-seq="${data.intvwSeq}"
							data-applic-seq="${data.applicSeq}"
							data-intvw-reject-cd="${data.intvwRejectCd}"
						>


						<li>
							<span class="check_box">
								<label for="chk_${status.count}" class="skip">Select</label>
								<input type="checkbox" id="chk_${status.count}" name="chk" value="${data.intvwSeq}_${data.applicSeq}" />
							</span>
							<div class="contents_wrap">
								<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/></div>
								<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>">
										<div class="cont">
											<span>${data.compnyNm}</span>
										</div>
									</div>
									<div class="put_box">
										<a href="javascript:void(0);" onclick="fnVacancyView('${data.vacancySeq}','frm');" class="link">${data.vacancyTitle}</a>
									</div>
									<div class="other_box type2">
										<span class="top_box">
											<span class="day">30</span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
										</span>
										<c:choose>

											<c:when test="${data.vacancyStsCd == 'CS0000000002'}"><!-- 채용공고 마감 -->
												${data.vacancyStsNm}
											</c:when>
											<c:when test="${data.intvwStsCd == 'ITV0000000001'}"><!-- 인터뷰대기 -->
												<span class="bottom_box">
													<button type="button" onclick="fnIntvwOk('${data.intvwSeq}', '${data.applicSeq}');" class="bbs_btn type08 small"><spring:message code="mypage.compny.applic.msg3"/></button>
													<button type="button" onclick="fnIntvwRejectOpen('${data.intvwSeq}', '${data.applicSeq}');" class="bbs_btn small"><spring:message code="mypage.compny.applic.msg4"/></button>
												</span>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${data.intvwStsCd == 'ITV0000000003'}"><!-- 인터뷰 거절-->
														<a href="javascript:void(0);" onclick="fnIntvwRejectView('htmlDataSet_${status.count}');">${data.vacancyStsNm}</a>
													</c:when>
													<c:otherwise>
														${data.intvwStsNm}
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
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
						<button type="button" class="bbs_btn delete">Delete</button>
					</span>
				</div>
				<!-- //bbs_btn_wrap -->

				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->

				<div id="dialog" style="display:none" class="bbs_popup"><!-- 팝업 가로, 세로 지정하지 않았습니다. 필요에 딸라 지정해서 사용 -->
					<section class="box_wrap">
						<div class="title_box">
							<h1 class="title"><spring:message code="mypage.compny.fail.reason.msg10"/></h1>
						</div>
						<div class="contents_box">
							<form>
								<fieldset>
									<legend>Reason for rejection</legend>

									<table class="table">
										<caption>Reason for rejection</caption>
										<colgroup>
											<col style="width:30%" />
											<col />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="intvwRejectCd"><spring:message code="mypage.compny.applic.msg10"/></label></th>
												<td>
													<select id="intvwRejectCd" name="intvwRejectCd">
											   			<option value=""><spring:message code="member.join.msg.choice"/></option>
											   			<c:forEach var="data" items="${intvwRejectCd}" varStatus="status">
											   				<option value="${data.dtlCd}">${data.cdNm}</option>
											   			</c:forEach>
													</select>
												</td>
											</tr>
										</tbody>
									</table>
									<div id="dialogBtn" class="bbs_btn_wrap type2">
										<div class="bbs_center">
											<input type="button" onclick="fnIntvwReject();" value="<spring:message code="login.stop.btn.confirm2"/>" class="bbs_btn type01 small" />
											<button type="button" onclick="fnCloseReject('dialog');" class="bbs_btn type02 small"><spring:message code="login.findPwd.btn.cancel"/></button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						<button type="button" onclick="fnCloseReject('dialog');" class="close">close of popup</button>
					</section>
				</div>

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->