<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/CustomFunctionTag.tld" prefix="cFun" %>

<style>
	.popup { position: fixed; top: 0; right: 0; bottom: 0; left: 0; z-index: 12; background-color: rgba(0,0,0,0.1); display: none; }
	.popup >div { position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 12; }
</style>
<main class="colgroup" id="colgroup">
	<article>
    	<header class="sub_head">
			<div class="sub_title">
				<h2>
					<span><spring:message code="jobfair.booth.ttl01" /></span>
				</h2>
			</div>
      	</header>
       	<div id="contents" class="jobFairApplyView">

<div class="recruitment_bottom type4">
	<div class="contents_wrap ${cFun:changeFairDivClass(jobFairInfo.fairDivCd)}">
		<div class="title_box">
			<div class="tit_box">
				<strong class="title"><c:out value="${jobFairInfo.fairNm }" escapeXml="false" /></strong>
			</div>
		</div>
		<div class="contents_box">
			<ul class="none_float clearfix">
			<li>
				<div class="cont">
					<strong class="tit"><spring:message code="mypage.compny.profile.title12" /></strong><!-- Venue -->
					<span class="con"><c:out value="${jobFairInfo.addrNm}" /></span>
				</div>
			</li>
			<li>
				<div class="cont">
					<strong class="tit"><spring:message code="jobfair.type.detail.title14" /></strong><!-- Contact -->
					<span class="con">
						<span><a href="tel:<c:out value="${jobFairInfo.boothTel}" />" class="mobile_phone"><c:out value="${jobFairInfo.boothTel}" /></a></span>
					</span>
				</div>
			</li>
			<li>
				<div class="cont">
					<strong class="tit"><spring:message code="login.stop.email" /></strong><!-- E-mail -->
					<span class="con"><c:out value="${jobFairInfo.boothEmail}" /></span>
				</div>
			</li>
			<li>
				<div class="cont">
					<strong class="tit"><spring:message code="jobfair.booth.fee.descr" /></strong><!-- Booth Payment -->
					<span class="con"><span class="em_b_point"><c:out value="${jobFairInfo.boothFeeExpln}" /></span></span>
				</div>
			</li>
			</ul>
			<div class="view_form">
				<strong class="title"><spring:message code="jobfair.booth.layout" /></strong><!-- Booth Layout -->
				<div class="cont_box">
					<c:forEach items="${boothImg}" var="file">
					<a href="javascript:fnImgViewPopup('<spring:message code="jobfair.type.detail.title21" />', '<c:out value="${file.saveFilePath}" />');" class="booth_view"><spring:message code="jobfair.booth.layout" /></a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //recruitment_bottom -->

<h3><spring:message code="jobfair.booth.ttl01" /></h3>
<table class="bbs_table booth_reserve" data-rwdb="yes">
	<caption><spring:message code="jobfair.booth.ttl01" /></caption>
	<colgroup>
		<col style="width:16.6%;" />
		<col style="width:16.6%;" />
		<col style="width:16.6%;" />
		<col style="width:16.6%;" />
		<col style="width:16.6%;" />
		<col style="width:16.6%;" />
	</colgroup>
	<thead>
	<tr>
		<th scope="col"><spring:message code="jobfair.booth.no" /></th>
		<th scope="col"><spring:message code="jobfair.booth.fee" /></th>
		<th scope="col"><spring:message code="jobfair.booth.apply" /></th>
		<th scope="col"><spring:message code="jobfair.booth.no" /></th>
		<th scope="col"><spring:message code="jobfair.booth.fee" /></th>
		<th scope="col"><spring:message code="jobfair.booth.apply" /></th>
	</tr>
	</thead>
	<tbody class="text_center">
	<tr>
		<c:if test="${jobFairBoothList == null || empty jobFairBoothList}">
		<td colspan="6">
			<spring:message code="counsel.msg.no.data"/>
		</td>
		</c:if>

		<c:forEach items="${jobFairBoothList}" var="item" varStatus="status">
		<td>
			<c:out value="${item.boothNm}" />
		</td>
		<td>
			$<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.boothFee}" />
		</td>
		<td>
			<c:choose>
				<c:when test="${item.boothStsCd == 'BSC0000000001'}"><!-- 공석 -->
					<!-- 부스 신청 -->
			<button type="button" class="bbs_btn type08 small" name="boothApplyBtn" onclick="fnBoothReq('<c:out value="${item.boothSeq}" />','<c:out value="${item.fairSeq}" />')"><spring:message code="apply.booth" /></button>
				</c:when>
				<c:otherwise>
					<c:out value="${item.boothStsNm}" />
				</c:otherwise>
			</c:choose>
		</td>
			<c:if test="${status.index > 0 && (status.count % 2) == 0}">
				</tr>
				<tr>
			</c:if>
		</c:forEach>
		<c:if test="${fn:length(jobFairBoothList) % 2 != 0}">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</c:if>
	</tr>
	</tbody>
</table>

<div class="booth_link_box">
	<div class="contents_box">
		<h3><spring:message code="jobfair.booth.apply.ttl01" /></h3><!-- 예약 대기자 신청안내 -->
		<p class="cont"><spring:message code="jobfair.booth.apply.ttl02" /></p>
	</div>
	<c:if test="${jobFairInfo.boothAvailableCnt == null || jobFairInfo.boothAvailableCnt == 0}">
	<!-- 예약 대기자 신청 -->
	<button type="button" name="boothBookingBtn" onclick="fnBoothBooking('<c:out value="${param.condSeq}" />')"><spring:message code="jobfair.booth.apply.btn01" /></button>
	</c:if>
</div>
<div class="booth_link_box type2">
	<div class="contents_box">
		<h3><spring:message code="jobfair.booth.apply.ttl03" /></h3><!-- 예약신청 내역 확인 안내 -->
		<p class="cont"><spring:message code="jobfair.booth.apply.ttl04" /></p>
	</div>
</div>
			<div class="bbs_btn_wrap clearfix">
				<div class="bbs_center">
					<a href="javascript:fnGoList('viewFrm');" class="bbs_btn list"><spring:message code="button.list"/></a>
				</div>
			</div>
		</div>
		<!-- //contents -->
	</article>
</main>
<!-- //main.colgroup -->

<form id="viewFrm" name="viewFrm" action="${pageContext.request.contextPath}/jobFair/applyList.do" method="post">
	<input type="hidden" name="condSeq"        value="<c:out value="${param.condSeq}" />" />
	<input type="hidden" name="condFairDivCd"  value="<c:out value="${param.condFairDivCd}" />" />
	<input type="hidden" name="condType"       value="<c:out value="${param.condType}" />" />
	<input type="hidden" name="condText"       value="<c:out value="${param.condText}" />" />
	<input type="hidden" name="currentPageNo"  value="<c:out value="${param.currentPageNo}" />" />
	<input type="hidden" name="condSort"       value="<c:out value="${param.condSort}" />" />
	<input type="hidden" name="condSearchType" value="<c:out value="${param.condSearchType}" />" />
</form>

<script>
	var boothReqMsg01 = "<spring:message code="jobfair.booth.apply.msg01" />"; //부스신청 하시겠습니까?
	var boothReqMsg02 = "<spring:message code="jobfair.booth.apply.msg02" />"; //부스신청이 완료되었습니다. 3일 이내에 입금해 주시지 않으면 예약이 취소됩니다.
	var boothReqMsg03 = "<spring:message code="jobfair.booth.apply.msg03" />"; //해당 부스가 이미 예약신청되어 있어서 처리할 수 없습니다!
	var boothBookingMsg01 = "<spring:message code="jobfair.booth.booking.msg01" />"; //예약대기 신청 하시겠습니까?
	var boothBookingMsg02 = "<spring:message code="jobfair.booth.booking.msg02" />"; //예약대기 신청이 완료되었습니다. 부스 공석이 발생할 경우, 연락 드리겠습니다.
	var boothBookingMsg03 = "<spring:message code="jobfair.booth.booking.msg03" />"; //이미 예약대기자 신청이 되어 있습니다!

	function fnBoothReq(boothSeq, fairSeq) {
		if($("#boothReqPopup").length == 0) {
			$(document.body).append('<div id="boothReqPopup"></div>');
		}
		var url = "/jobFair/boothReqPopup.do?boothSeq="+boothSeq+"&condSeq="+fairSeq;
		$("#boothReqPopup").load(contextPath+url+" .popup", function(res, stat, xhr) {
			$("#booth-req-popup").show();
			$.getScript(contextPath+"/js/jobFair/boothReqPopup.js");
		});
	}

	function fnBoothBooking(fairSeq) {
		<c:if test="${alreadyResvWait != null && 'Y'.equals(alreadyResvWait)}">
		alertify.alert(boothBookingMsg03);
		return;
		</c:if>
		if($("#boothBookingPopup").length == 0) {
			$(document.body).append('<div id="boothBookingPopup"></div>');
		}
		var url = "/jobFair/boothBookingPopup.do?condSeq="+fairSeq;
		$("#boothBookingPopup").load(contextPath+url+" .popup", function(res, stat, xhr) {
			$("#booth-booking-popup").show();
			$.getScript(contextPath+"/js/jobFair/boothBookingPopup.js");
		});
	}

	function fnGoBoothApplyMng() {
		document.location.href = "${pageContext.request.contextPath}/cpes/compny/fair/boothList.do";
	}
</script>
