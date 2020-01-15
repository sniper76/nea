<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/CustomFunctionTag.tld" prefix="cFun" %>

<div class="popup" id="booth-apply-popup">
	<div class="bbs_popup" style="width: 1000px; height: 800px;">
		<section class="box_wrap">
			<div class="title_box">
				<h1 class="title"><spring:message code="jobfair.booth.ttl01" /></h1>
			</div>
			<div class="contents_box">
				<div class="box type3" style="min-height: 600px;">

<div class="contents_wrap ncpf ${cFun:changeFairDivClass(jobFairInfo.fairDivCd)}">
	<strong class="title"><c:out value="${jobFairInfo.fairNm }" escapeXml="false" /></strong>
</div>

<!-- 행사장정보 -->
<spring:message code="jobfair.booth.info" />
<p><c:out value="${jobFairInfo.fairDtlExplnNm}" escapeXml="false" /></p>

<!-- 안내전화 -->
<spring:message code="jobfair.type.detail.title14" />
<p><c:out value="${jobFairInfo.boothTel}" escapeXml="false" /></p>

<!-- 이메일 -->
<spring:message code="login.stop.email" />
<p>
	<c:out value="${jobFairInfo.boothEmail}" />
</p>

<!-- 부스사용료 입금방법 -->
<spring:message code="jobfair.booth.fee.descr" />
<p>
	<c:out value="${jobFairInfo.boothFeeExpln}" />
</p>
<!-- 부스배치도 -->
<spring:message code="jobfair.booth.layout" />
<p>
	<c:forEach items="${boothImg}" var="file">
	<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${file.saveFilePath}" alt="image" onerror="fnNoImage(this)" />
	</c:forEach>
	<a href="javascript:fnImgViewPopup('<spring:message code="jobfair.type.detail.title21" />', '<c:out value="${file.saveFilePath}" />');" class=""><spring:message code="view.original" /></a>
</p>

<spring:message code="jobfair.booth.ttl01" />
<br/>
<table>
	<thead>
		<tr>
			<th>
				<!-- 부스번호 -->
				<spring:message code="jobfair.booth.no" />
			</th>
			<th>
				<!-- 부스사용료 -->
				<spring:message code="jobfair.booth.fee" />
			</th>
			<th>
				<!-- 신청 -->
				<spring:message code="jobfair.booth.apply" />
			</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${jobFairBoothList}" var="item">
		<tr>
			<td><c:out value="${item.boothNm}" /></td>
			<td>
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.boothFee}" />$
			</td>
			<td>
				<c:choose>
					<c:when test="${item.boothStsCd == 'BSC0000000001'}"><!-- 공석 -->
						<!-- 부스 신청 -->
						<button type="button" name="boothApplyBtn" onclick="fnBoothReq('<c:out value="${item.boothSeq}" />','<c:out value="${item.fairSeq}" />')"><spring:message code="apply.booth" /></button>
					</c:when>
					<c:otherwise>
						<c:out value="${item.boothStsNm}" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<c:if test="${jobFairInfo.boothAvailableCnt == null || jobFairInfo.boothAvailableCnt == 0}">
	<!-- 예약 대기자 신청 -->
	<button type="button" name="boothBookingBtn" class="button offer on" onclick="fnBoothBooking('<c:out value="${param.condSeq}" />')"><spring:message code="jobfair.booth.apply.btn01" /></button>
	<br/>
</c:if>

<!-- 예약 대기자 신청안내 -->
<spring:message code="jobfair.booth.apply.ttl01" />
<br/>

<!-- 예약 대기자로 신청해 주시면, 부스 예약이 취소되었을 경우, 우선적으로 연락드립니다.  -->
<spring:message code="jobfair.booth.apply.ttl02" />
<br/>

<!-- 예약신청 내역 확인 안내 -->
<spring:message code="jobfair.booth.apply.ttl03" />
<br/>

<!-- 예약 신청 내역 및 신청 취소는 마이페이지> 채용행사 신청관리> 부스신청 관리에서 확인하실 수 있습니다.   -->
<spring:message code="jobfair.booth.apply.ttl04" />
<!-- 부스신청 관리 -->
<button type="button" name="boothApplyMngBtn"><spring:message code="jobfair.booth.apply.mng" /></button>
<br/>

				</div>
				<div class="button_box">
					<button type="button" class="bbs_btn cancel small" onclick="closePopup('booth-apply-popup')"><spring:message code="button.close2" /></button>
				</div>
			</div>
			<!-- 닫기 -->
			<button type="button" class="close" onclick="closePopup('booth-apply-popup')"><spring:message code="button.close2" /></button>
		</section>
	</div>
</div>