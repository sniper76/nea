<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/mypage/privt/applic/referral.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery/jquery-ui.js"></script>
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


      	function fnReject(seq,seq2) {


      		$("#condSeq").val(seq);
      		$("#condSeq2").val(seq2);

      		$('#dialog').dialog({
      	    	title: '',
      	      	modal: true,
      	      	width: '700',
      	      	height: '300',
      	      	hideCloseButton: true
      		});

      		$(".ui-dialog-titlebar").remove();
/* 			$.ajax({
				url: contextPath + "/cpes/private/applic/referralRejectAjax.do",
				type: 'post',
				datatype: 'html'
			})
			.done(function(data) {
				console.log("===========data="+data);
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			}); */


    	}

      	function fnCloseReject() {
      		$("#dialog").dialog( "close" );
      	}

	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.private.referral.title"/></span>
					</h2>
				</div>
	      	</header>
			<p><spring:message code="mypage.compny.applic.msg7"/></p>
	       	<div id="contents" class="applicReferralList">
				<div class="bbs_info clearfix tab_confirm"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
					<div class="bbs_left bbs_count">
						<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
						<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
					</div>
					<div class="bbs_right bbs_category">
						<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/applic/referralList.do" method="post">
							<input type="hidden" id="currentPageNo" name="currentPageNo" value="${paginationInfo.currentPageNo}"/>
							<input type="hidden" id="condSeq" name="condSeq" value=""/>
							<input type="hidden" id="condSeq2" name="condSeq2" value=""/>
							<fieldset>
								<legend>Posts Search</legend>
								<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
								<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text"><!-- on submit 방지 -->
								<input type="button" onclick="javascript:fnSetPageing('1');" value="Search" class="submit" />
							</fieldset>
						</form>
					</div>
				</div>
				<!-- bbs_info  -->
				<c:if test="${!empty resultList}">
				<div class="bbs_basic">
					<ul class="recruitment_list my talent clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<c:forEach var="data" items="${resultList}" varStatus="status">
						<li>
							<span class="check_box">
								<label for="chk_${status.count}" class="skip">Select</label>
								<input type="checkbox" id="chk_${status.count}" name="chk" value="${data.vacancySeq}_${data.resumeSeq}">
							</span>

							<c:set var="genderCdClass" value="male"/>
							<c:if test="${data.genderCd == 'GEN0000000002'}">
								<c:set var="genderCdClass" value="female"/>
							</c:if>

							<div class="contents_wrap ${genderCdClass}"><!-- 남성일 경우 클래스 male 추가, 여성일 경우 클래스 femail 추가 -->
								<div class="img_box"><img src="${pageContext.request.contextPath}/images/contents/recruitment_dummy.png" alt="image" /></div>
								<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
									<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
										<span class="tit">${data.iscoNm}</span>
										<a href="javascript:void(0);" onclick="fnGoCompnyResumeView('${data.resumeSeq}','${data.vacancySeq}');" class="title">${data.resumeTitle}</a>
									</div>
									<div class="top_box">
										<span class="name">${data.userNm}</span>
										<span class="age">
											(<span>${data.genderNm}</span> <span>${data.age}</span>)
										</span>
									</div>
									<div class="cont_box">
										<span class="con">
											<c:choose>
												<c:when test="${data.careerYn == 'Y'}">${data.totCareerTermYearCnt} year+</c:when>
												<c:otherwise><spring:message code="eduTrnng.msg4"/></c:otherwise>
											</c:choose>
										</span>
										<span class="con">${data.eduDegreeNm}</span>
										<span class="con">${data.addrNm}</span>
									</div>
									<div class="put_box">
										<a href="javascript:void(0);" onclick="fnVacancyView('${data.vacancySeq}','frm');" class="link">${data.vacancyTitle}</a>
									</div>
									<div class="other_box type2">
										<span class="top_box">

										<c:choose>
											<c:when test="${data.referralStsCd == 'RFS0000000001'}"><!-- 보류 -->
												<button type="button" onclick="referral.fnReferralSave('${data.vacancySeq}','${data.resumeSeq}','COMPNY');");" class="bbs_btn type08 small"><spring:message code="mypage.compny.applic.msg3"/></button>
												<button type="button" onclick="fnReject('${data.vacancySeq}','${data.resumeSeq}');" class="bbs_btn type08 small"><spring:message code="mypage.compny.applic.msg4"/></button>
											</c:when>
											<c:when test="${data.referralStsCd == 'RFS0000000002'}"><!-- 거절 -->
												<spring:message code="mypage.compny.applic.msg4"/>
											</c:when>
											<c:when test="${data.referralStsCd == 'RFS0000000003'}"><!-- 수락 -->
												<spring:message code="mypage.compny.applic.msg3"/>
											</c:when>
										</c:choose>
										</span>
										<span class="bottom_box">
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
						<button type="button" onclick="referral.fnDelReferral('COMPNY');" class="bbs_btn delete"><spring:message code="button.delete"/></button>
					</span>
				</div>
				<!--  //bbs_btn_wrap  -->




				<div class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
				</div>
				<!-- //pagination -->


				<div id="dialog" style="display:none" class="bbs_popup"><!-- 팝업 가로, 세로 지정하지 않았습니다. 필요에 딸라 지정해서 사용 -->
					<section class="box_wrap">
						<div class="title_box">
							<h1 class="title">Reason for Rejecting Job Center Referral</h1>
						</div>
						<div class="contents_box">
							<form>
								<fieldset>
									<legend>Reason for Rejecting Job Center Referral</legend>
									<p class="em_blue small">※ Please tell us why you rejected our referral. <br />Your answer will help for us to improve our service.</p>
									<table class="table">
										<caption>Reason for Rejecting Job Center Referral</caption>
										<colgroup>
											<col style="width:30%" />
											<col />
										</colgroup>
										<tbody>
										<tr>
											<th scope="row"><label for="reason">Reason</label></th>
											<td>
												<select id="referralRejectCd" name="referralRejectCd">
										   			<option value=""><spring:message code="member.join.msg.choice"/></option>
										   			<c:forEach var="data" items="${referralRejectCd}" varStatus="status">
										   				<option value="${data.dtlCd}">${data.cdNm}</option>
										   			</c:forEach>
												</select>
											</td>
										</tr>
										</tbody>
									</table>
									<div class="bbs_btn_wrap type2">
										<div class="bbs_center">
											<input type="button" onclick="referral.fnRejectReferral('COMPNY');" value="<spring:message code="login.stop.btn.confirm2"/>" class="bbs_btn type01 small" />
											<button type="button" onclick="fnCloseReject();" class="bbs_btn type02 small"><spring:message code="login.findPwd.btn.cancel"/></button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						<button type="button" onclick="fnCloseReject();" class="close">close of popup</button>
					</section>
				</div>


			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->